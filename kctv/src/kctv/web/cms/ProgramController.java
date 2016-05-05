package kctv.web.cms;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kctv.web.common.Common;
import kctv.web.schedule.Schedule;

/**
 * <pre>
 * kctv.web.cms
 * ProgramController.java
 * </pre>
 * <pre>
 * 홈페이지 프로그램 메뉴 컨트롤러 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 31.
 * @version: 
 */
@Controller
@RequestMapping("/program")
public class ProgramController {
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	int muid;
	String menu;
	String program;
	ModelAndView mav;
	HttpSession session;
	String maincd;
	String subcd;
	String subPage;
	
	/**
	 * @function : 페이지 이동 처리 및 사이드 메뉴
	 * @process  : 
	 * 
	 * @MethodName : common
	 * @param session
	 * @param isLeftMenu
	 * @param muid
	 */
	private void common(HttpSession session, boolean isLeftMenu,int muid){
		this.session = session;
		
		mav = new ModelAndView("program/"+muid);
		
		mav.addObject("isLeftMenu",isLeftMenu);
	}
	
	/**
	 * @function : 서브페이지를 포함한 페이지 이동
	 * @process  : 
	 * 
	 * @MethodName : common
	 * @param session
	 * @param isLeftMenu
	 * @param muid
	 * @param subPage
	 */
	private void common(HttpSession session, boolean isLeftMenu,int muid,String subPage){
		this.session = session;
		
		if(muid==365){
			program="bicycle/";
		}else if(muid==73){
			program="fishing/";
		}else if(muid==54){
			program="sam/";
		}else if(muid==517){
			program="impd/";
		}else if(muid==525){
			program="booltuk/";
		}else if(muid==529){
			program="solbit/";
		}else{
			program="";
		}
		
		mav = new ModelAndView("program/"+program+subPage);
		
		mav.addObject("isLeftMenu",isLeftMenu);
	}
	
	/**
	 * @function : 컨텐츠 상단 메뉴 설정
	 * @process  : 
	 * 
	 * @MethodName : contents_top
	 * @param session
	 * @param muid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/content_top.htm")
	public ModelAndView contents_top(HttpSession session,@RequestParam("muid") int muid) throws Exception {
		mav = new ModelAndView("program/content_top");
		mav.addObject("menuName",(String)sqlMapClientTemplate.queryForObject("getMenuName",muid));
		return mav;
	}
	
	@RequestMapping("/index.htm")
	public ModelAndView index(HttpServletRequest request,@RequestParam("muid") int muid) throws Exception {
		common(request.getSession(),true,muid);
		setRequestParameter(request);
		
		if(muid==235){//CH7편성표
			Calendar cc= Calendar.getInstance();
			String schedule;
			String pk_date;
			String sch_date;
			
			String tmp = request.getParameter("curDay");
			if(tmp == null || tmp == ""){
				Calendar today= Calendar.getInstance();
				pk_date = today.get(Calendar.YEAR)+"-"+(today.get(Calendar.MONTH)+1)+"-"+today.get(Calendar.DATE);
				sch_date = getDateStr(today.get(Calendar.YEAR), today.get(Calendar.MONTH)+1, today.get(Calendar.DATE));
			}
			else{
				pk_date=tmp;
				String[] cur_arr = pk_date.split("-");
				cc.set(Integer.parseInt(cur_arr[0]), Integer.parseInt(cur_arr[1])-1,Integer.parseInt(cur_arr[2]));
				sch_date = getDateStr(Integer.parseInt(cur_arr[0]), Integer.parseInt(cur_arr[1]), Integer.parseInt(cur_arr[2]));
			}
			
			int week = cc.get(Calendar.DAY_OF_WEEK)-1;
			
			ArrayList<String> date_arr = new ArrayList<String>();
			
			cc.add(Calendar.DATE, -week);
			
			for(int i=0; i<7; i++){
				if(week==i)
					date_arr.add("<li class=\"current\"><strong>"+Common.weeks[i]+"</strong>("+(cc.get(Calendar.MONTH)+1)+"월"+cc.get(Calendar.DATE)+"일)</li>");
				else
					date_arr.add("<li><a href=\"?muid="+muid+"&curDay="+cc.get(Calendar.YEAR)+"-"+(cc.get(Calendar.MONTH)+1)+"-"+cc.get(Calendar.DATE)+"\"><strong>"+Common.weeks[i]+"</strong>("+(cc.get(Calendar.MONTH)+1)+"월"+cc.get(Calendar.DATE)+"일)</a></li>");
				cc.add(Calendar.DATE, 1);
			}
			schedule = (String)sqlMapClientTemplate.queryForObject("getSchedule",sch_date);
			
			if(schedule!=null && schedule.length()>0){
				String[] sch_arr = schedule.split("\n");
				
				if(sch_arr.length>1)
				{
					ArrayList<Schedule> sch_list = new ArrayList<Schedule>();
					
					for(String item:sch_arr){
						String[] item_arr = item.split("#");
						if(item_arr.length>1){
							sch_list.add(new Schedule(pk_date,item_arr[0],item_arr[1]));
						}
					}
					mav.addObject("totalSchedule",sch_arr.length);
					mav.addObject("listSchedule",sch_list);
				}
			}else{
				mav.addObject("totalSchedule",0);
			}
			
			mav.addObject("listDay",date_arr);
		}
		
		return mav;
	}
	
	@RequestMapping("/intro.htm")
	public ModelAndView intro(HttpSession session,@RequestParam("muid") int muid,@RequestParam(value="guid",required=false,defaultValue="0") int guid) throws Exception {
		common(session,true,muid,"intro");
		setSubContent("intro",muid,guid);
		
		return mav;
	}
	
	@RequestMapping("/vod.htm")
	public ModelAndView vod(HttpSession session,@RequestParam("muid") int muid,@RequestParam(value="guid",required=false,defaultValue="0") int guid) throws Exception {
		common(session,true,muid,"vod");
		setSubContent("vod",muid,guid);
		
		return mav;
	}
	
	@RequestMapping("/board.htm")
	public ModelAndView board(HttpServletRequest request, @RequestParam("muid") int muid, @RequestParam(value="guid",required=false,defaultValue="0") int guid) throws Exception {
		common(request.getSession(),true,muid,"board");
		setRequestParameter(request);
		
		return mav;
	}
	
	/**
	 * @function :CM으로 관리되는 컨텐츠 상단/메뉴 내용 및 하위메뉴 조회 설정 
	 * @process  : 
	 * 
	 * @MethodName : setSubContent
	 * @param subPage
	 * @param muid
	 * @param guid
	 */
	@SuppressWarnings("unchecked")
	public void setSubContent(String subPage, int muid, int guid){
		if(guid==0){
			guid=muid;
			mav.addObject("guid",guid);
		}
		
		if(program.equals("")){
			if(subPage.equals("intro"))
				mav.addObject("subContent",(CmContent)sqlMapClientTemplate.queryForObject("getCmContentIntro",guid));
			else{
				mav.addObject("subContent",(String)sqlMapClientTemplate.queryForObject("getCmContentAhead",guid));
				
				if(guid==525)
					mav.addObject("cmct_exefile",(String)sqlMapClientTemplate.queryForObject("getCmContentExefile",guid));
				else
					mav.addObject("cmct_exefile",guid);
			}
		}
		
		mav.addObject("cmSubMenu",(ArrayList<CmSubMenu>)sqlMapClientTemplate.queryForList("getCmSubMenu",guid));
	}
	
	public String getDateStr(int year, int month, int day){
		return String.format("%04d",year)+"-"+String.format("%02d",month)+"-"+String.format("%02d",day);
	}
	
	private void setRequestParameter(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("euc-kr");
		
		//this.muid = Common.strToInt(request.getParameter("muid"));
		this.maincd = Common.strToStr(request.getParameter("maincd"),"0");
		this.subcd = Common.strToStr(request.getParameter("subcd"),"0");
		this.subPage = Common.strToStr(request.getParameter("subPage"),"index");
		
		mav.addObject("maincd",this.maincd);
		mav.addObject("subcd",this.subcd);
		mav.addObject("subPage",this.subPage);
	}
}
