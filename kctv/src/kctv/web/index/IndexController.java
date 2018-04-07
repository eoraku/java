package kctv.web.index;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import kctv.web.schedule.Schedule;
import kctv.web.session.Session;
import kctv.web.vod.Vod;
import kctv.web.vod.VodParameter;
import kctv.web.common.Common;
import kctv.web.common.Popup;
import kctv.web.board.Board;
import kctv.web.news.*;
import kctv.xml.XPathVodWeb;

/**
 * <pre>
 * kctv.web.index
 * IndexController.java
 * </pre>
 * <pre>
 * 메인 페이지 URL 컨트롤러 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
@Controller
public class IndexController {
	@Value("#{config['serverType']}") String serverType;
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	String menu="index";
	ModelAndView mav;
	HttpSession session;
	
	/**
	 * @function : 뉴스, 영어뉴스, 중국어 뉴스 URL 리다이렉트
	 * @process  : 
	 * 
	 * @MethodName : index
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/index.htm")
	public ModelAndView index(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getServerName().equals("news.kctvjeju.com"))
			response.sendRedirect("http://www.kctvjeju.com/news/");
		else if(request.getServerName().equals("eng.kctvjeju.com"))
			response.sendRedirect("http://www.kctvjeju.com/eng/");
		else if(request.getServerName().equals("cn.kctvjeju.com"))
			response.sendRedirect("http://www.kctvjeju.com/cn/");
		
		this.session = session;
		mav = new ModelAndView("index");
		mav.addObject("ctxRoot",ctxRoot);
		mav.addObject("menu",menu);
		
		/* 버전 체크에 문제가 있어 일시 중단
		String userAgent = request.getHeader("User-Agent");
		if(userAgent != null && userAgent.indexOf("MSIE 6")>0)
			mav.addObject("IE6",true);
		*/
		
		addListBannerText();
		addListNotice();
		addSchedule();
		addListHotVod();
		addListNews();
		addListVodNew();
		addListVodTop();
		addListPopup(request);
		
		Session.chkLogin(session, mav);
		
		return mav;
	}
	
	/**
	 * @function : 메인이미지 프레임 최근 뉴스 2건
	 * @process  : 
	 * 
	 * @MethodName : addListBannerText
	 */
	@SuppressWarnings("unchecked")
	public void addListBannerText(){
		VodParameter vodParameter;
		
		vodParameter = new VodParameter(1,"0001","0101","name","종합뉴스",2);
		mav.addObject("listIndexNews", (ArrayList<Vod>)sqlMapClientTemplate.queryForList("listVod",vodParameter));
		
		/*vodParameter = new VodParameter(1,"0008","55","","",5);
		mav.addObject("listIndexSam", (ArrayList<Vod>)sqlMapClientTemplate.queryForList("listVod",vodParameter));*/
	}
	
	/**
	 * @function : 메인페이지 공지사항 리스트 5
	 * @process  : 
	 * 
	 * @MethodName : addListNotice
	 */
	@SuppressWarnings("unchecked")
	public void addListNotice(){
		mav.addObject("listNotice", cutStrNotice((ArrayList<Board>)sqlMapClientTemplate.queryForList("indexListNotice",5)));
	}
	
	/**
	 * @function : 오늘의 편성표
	 * @process  : 
	 * 
	 * @MethodName : addSchedule
	 */
	public void addSchedule(){
		Calendar today = Calendar.getInstance();
		Calendar current = Calendar.getInstance();
		String scheduleDate;
		String scheduleContents;
		boolean isYesterdaySchedule = false;
		
		if(today.get(Calendar.HOUR_OF_DAY)<7) {// 07시 이전이라면 어제로...
			isYesterdaySchedule = true;
			Calendar tmp = Calendar.getInstance();
			tmp.add(Calendar.DATE, -1);
			current.add(Calendar.DATE, -1);
			scheduleDate = getDateStr(tmp);
		}else scheduleDate = getDateStr(today);
		
		//System.out.println(scheduleDate);
		scheduleContents = (String)sqlMapClientTemplate.queryForObject("getSchedule",scheduleDate);
		
		// scheduleContents(편성표글) -> schedule_arr(편성표목록) -> item_arr(시간#프로그램) -> time_arr(time_hour:time_mint)
		if(scheduleContents!=null && scheduleContents.length()>0){
			String[] schedule_arr = scheduleContents.split("\n");
			if(schedule_arr.length>1){
				ArrayList<Schedule> listSchedule = new ArrayList<Schedule>();
				boolean isYesterday = false;
				String[] item_arr;
				String[] time_arr;
				int time_hour;
				int time_mint;
				int i=0;
				int begin=-1;
				int end=-1;
				for(String item:schedule_arr){
					item_arr = item.split("#");
					
					if(item_arr.length>1){
						time_arr = item_arr[0].split(":");
						time_hour = toInt(time_arr[0]);
						time_mint = toInt(time_arr[1]);
						if(isYesterdaySchedule && !isYesterday && time_hour<7){
							current.add(Calendar.DATE, 1);
							isYesterday = true;
						}
						current.set(Calendar.HOUR_OF_DAY, time_hour);
						current.set(Calendar.MINUTE, time_mint);
						listSchedule.add(new Schedule(item_arr[0],item_arr[1]));

						if(begin==-1 && today.before(current)){
							begin=i-1;
							end=begin+7;
							if(end>=schedule_arr.length)
								end = schedule_arr.length-1;
						}
						i++;
					}
				}
				//System.out.println(begin+","+end);
				mav.addObject("sch_begin",begin);
				mav.addObject("sch_end",end);
				mav.addObject("listSchedule",listSchedule);
			}else{
				mav.addObject("sch_begin",-1);
			}
		}
	}
	
	/**
	 * @function : 메인페이지 화제의 영상
	 * @process  : 
	 * 
	 * @MethodName : addListHotVod
	 */
	@SuppressWarnings("unchecked")
	public void addListHotVod(){
		ArrayList<Vod> listVod = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("indexListHotVod");
		if(listVod != null){
			for(Vod item:listVod){
				if(item.getPhoto_url() != null && item.getPhoto_url().length()>0)
					item.setPhoto_url(ctxRoot+"upload/vod/"+item.getPhoto_url());
				else
					item.setPhoto_url(ctxRoot+"images/vod/default.gif");
			}
			mav.addObject("listHotVod", listVod);
		}
	}
	
	/**
	 * @function : 메인페이지 kctv최신뉴스
	 * @process  : 
	 * 
	 * @MethodName : addListNews
	 */
	@SuppressWarnings("unchecked")
	public void addListNews(){
		if(!serverType.equals("testHome")){
			//이미지를 포함한 뉴스들 검색
			mav.addObject("listNews1_img",(News)sqlMapClientTemplate.queryForObject("indexListLatestNewsImg", "'1','5'"));
			mav.addObject("listNews2_img",(News)sqlMapClientTemplate.queryForObject("indexListLatestNewsImg", "'2','6'"));
			mav.addObject("listNews3_img",(News)sqlMapClientTemplate.queryForObject("indexListLatestNewsImg", "'3','7'"));
			mav.addObject("listNews4_img",(News)sqlMapClientTemplate.queryForObject("indexListLatestNewsImg", "'4','8'"));
			mav.addObject("listNews5_img",(News)sqlMapClientTemplate.queryForObject("indexListLatestNewsImgEng"));
			mav.addObject("listNews6_img",(News)sqlMapClientTemplate.queryForObject("indexListLatestNewsImgChi"));
			
			//이미지 없이 리스트 검색
			mav.addObject("listNews1",cutStrNews((ArrayList<News>)sqlMapClientTemplate.queryForList("indexListLatestNews","'1','5'"),27));
			mav.addObject("listNews2",cutStrNews((ArrayList<News>)sqlMapClientTemplate.queryForList("indexListLatestNews","'2','6'"),27));
			mav.addObject("listNews3",cutStrNews((ArrayList<News>)sqlMapClientTemplate.queryForList("indexListLatestNews","'3','7'"),27));
			mav.addObject("listNews4",cutStrNews((ArrayList<News>)sqlMapClientTemplate.queryForList("indexListLatestNews","'4','8'"),27));
			mav.addObject("listNews5",cutStrNews((ArrayList<News>)sqlMapClientTemplate.queryForList("indexListLatestNewsEng"),44));
			mav.addObject("listNews6",cutStrNews((ArrayList<News>)sqlMapClientTemplate.queryForList("indexListLatestNewsChi"),52));
		}
	}
	
	/**
	 * @function : 메인페이지 신작 VOD
	 * @process  : 
	 * 
	 * @MethodName : addListVodNew
	 */
	public void addListVodNew(){
		XPathVodWeb xvw;
		@SuppressWarnings("rawtypes")
		ArrayList list = new ArrayList();
		//신작 VOD
		xvw = new XPathVodWeb("http://www.hchoice.co.kr/vod_xml/vod_xml.asp?gbn=1");
		list = xvw.getListCnt(5);
		mav.addObject("listVodNew",list);
	}
	
	/**
	 * @function : 메인페이지 TOP10 VOD
	 * @process  : 
	 * 
	 * @MethodName : addListVodTop
	 */
	public void addListVodTop(){
		XPathVodWeb xvw;
		@SuppressWarnings("rawtypes")
		ArrayList list = new ArrayList();
		//Top 10 VOD
		xvw = new XPathVodWeb("http://www.hchoice.co.kr/vod_xml/vod_xml.asp?gbn=5");
		list = xvw.getListCnt(5);
		mav.addObject("listVodTop",list);
	}
	
	/**
	 * @function : 팝업
	 * @process  : DB에서 설정된 팝업 리스트 가져온 후에 쿠키 체크를 하여 팝업창 정보 전달
	 * 
	 * @MethodName : addListPopup
	 * @param request
	 */
	@SuppressWarnings("unchecked")
	public void addListPopup(HttpServletRequest request){
		ArrayList<Popup> listPopup = (ArrayList<Popup>)sqlMapClientTemplate.queryForList("indexListPopup");
		if(ctxRoot.equals("/") && listPopup != null && listPopup.size()>0){
			ArrayList<Popup> listReal = new ArrayList<Popup>();
			boolean isExists;
			
			Cookie[] cookies = request.getCookies();
			
			if(cookies != null){
				for(Popup item:listPopup){
					isExists = false;
					for(Cookie cookie:cookies){
						//System.out.println(item.getPu_uid()+" : "+cookie.getName()+" : "+cookie.getValue());
						if(cookie.getName().equals("popup_cookie_"+item.getPu_uid()) && cookie.getValue().equals("1")){
							isExists = true;
						}
					}
					if(!isExists)
						listReal.add(item);
				}
			}
			
			mav.addObject("listPopup",listReal);
			mav.addObject("totalPopup",listReal.size());
		}
	}
	
	/**
	 * @function : 공지사항란 말줄임
	 * @process  : 
	 * 
	 * @MethodName : cutStrNotice
	 * @param list
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public ArrayList cutStrNotice(ArrayList<Board> list){
		String title;
		int maxLen=18;
		
		if(list != null){
			for(Board item:list){
				title=item.getBoard_title();
				if(title.length()>maxLen){
					item.setBoard_title(Common.cutStr(title, null, maxLen, 0, true, true));
				}
			}
			return list;
		}else
			return null;
	}
	
	/**
	 * @function : 뉴스란 말줄임
	 * @process  : 
	 * 
	 * @MethodName : cutStrNews
	 * @param list
	 * @param maxLen
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public ArrayList cutStrNews(ArrayList<News> list, int maxLen){
		String title;
		
		if(list != null){
			for(int i=0;i<list.size(); i++){
				title=((News)list.get(i)).getTitle();
				if(title.length()>maxLen){
					((News)list.get(i)).setTitle(Common.cutStr(title, null, maxLen, 0, true, true));
				}
			}
			return list;
		}else
			return null;
	}
	
	/**
	 * @function : 오늘 날짜를 String형식으로 처리
	 * @process  : 
	 * 
	 * @MethodName : getDateStr
	 * @param cal
	 * @return
	 */
	private String getDateStr(Calendar cal){
		return String.format("%04d-%02d-%02d",
				cal.get(Calendar.YEAR),
				cal.get(Calendar.MONTH)+1,
				cal.get(Calendar.DATE));
	}
	
	/**
	 * @function : 문자열 중 Integer값 파싱
	 * @process  : 
	 * 
	 * @MethodName : toInt
	 * @param str
	 * @return
	 */
	private int toInt(String str){
		return Integer.parseInt(str.replace(System.getProperty("line.separator"), ""));
	}
}
