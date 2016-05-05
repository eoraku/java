package kctv.web.news;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

import kctv.web.board.Board;
import kctv.web.board.BoardPaging;
import kctv.web.common.Common;
import kctv.web.common.CountUpdate;
import kctv.web.common.FileRenameTime;
import kctv.web.session.Session;
import kctv.web.vod.Vod;
import kctv.web.vod.VodParameter;
import kctv.web.weather.AreaSimple;

/**
 * <pre>
 * kctv.web.news
 * NewsController.java
 * </pre>
 * <pre>
 * kctvjeju.com/news
 * 뉴스 페이지 컨트롤러
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 17.
 * @version: 
 */
@Controller
@RequestMapping("/news")
public class NewsController {
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Value("#{config['uploadPath']}") String uploadPath;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplateWeather;
	
	ModelAndView mav;
	HttpSession session;
	int pageNo;
	int pageSize;
	int pageView;
	int guid;
	int nuid;
	String schType;
	String schText;
	String leftPage;
	String rightPage;
	String urlQuery;
	
	boolean isLogin = false;
	boolean isListWeather = false;
	
	/**
	 * @function :페이지 이동 메서드 
	 * @process  : 
	 * 
	 * @MethodName : common
	 * @param page
	 */
	private void common(String page){
		mav = new ModelAndView("news/"+page);
		mav.addObject("ctxRoot",ctxRoot);
	}
	
	/**
	 * @function : 사이드 메뉴 호출
	 * @process  : 
	 * 
	 * @MethodName : common
	 * @param session
	 * @param guid
	 * @param mainPage
	 */
	private void common(HttpSession session,int guid,String mainPage){
		if(guid==9 || guid==16)
			mav = new ModelAndView("news/layouteng");
		else if(guid==10 || guid==17)
			mav = new ModelAndView("news/layoutchi");
		else if(mainPage.equals("weather"))
			mav = new ModelAndView("news/weather");
		else
			mav = new ModelAndView("news/layout");
		
		mav.addObject("mainPage","/news/"+guid+"/"+mainPage+".htm");
		mav.addObject("ctxRoot",ctxRoot);
		
		isLogin=Session.chkLogin(session, mav);
	}
	
	/**
	 * @function : index 페이지 호출
	 * @process  : 
	 * 
	 * @MethodName : index
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/index.htm")
	public ModelAndView index(HttpSession session) throws Exception {
		common("index");
		isLogin=Session.chkLogin(session, mav);
		
		addListNewsHot();
		addListNewsTop();
		addListNews();
		addWeatherFlv();
		addListInvite();
		
		return mav;
	}
	
	/**
	 * @function : 전체기사 리스트 페이지
	 * @process  : 
	 * 
	 * @MethodName : list
	 * @param guid
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list.htm")
	public ModelAndView list(@RequestParam(value="guid",required=false,defaultValue="0") int guid, HttpServletRequest request) throws Exception {
		common(request.getSession(),guid,"list");
		setRequestParameter(request);
		setLayoutContent(guid);
		
		return mav;
	}
	
	/**
	 * @function : 뉴스기사 view페이지
	 * @process  : 
	 * 
	 * @MethodName : view
	 * @param guid
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/view.htm")
	public ModelAndView view(@RequestParam(value="guid",required=false,defaultValue="0") int guid, HttpServletRequest request) throws Exception {
		common(request.getSession(),guid,"view");
		setRequestParameter(request);
		setLayoutContent(guid);
		
		if(guid == 3 || guid == 7){
			String flv = (String)sqlMapClientTemplate.queryForObject("isListWeather", nuid);
			if(flv != null && flv.length()>1){
				ArrayList<News> listWeather = (ArrayList<News>)sqlMapClientTemplate.queryForList("listWeather");
				if(listWeather != null)
					mav.addObject("listWeather", listWeather);
			}
		}
		
		return mav;
	}
	
	/**
	 * @function : 뉴스 VOD 다시보기 페이지
	 * @process  : 
	 * 
	 * @MethodName : vod
	 * @param guid
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/vod.htm")
	public ModelAndView vod(@RequestParam(value="guid",required=false,defaultValue="0") int guid, HttpServletRequest request) throws Exception {
		common(request.getSession(),guid,"vod");
		setRequestParameter(request);
		setLayoutContent(guid);
		
		return mav;
	}
	
	/**
	 * @function : 뉴스 검색
	 * @process  : 
	 * 
	 * @MethodName : search
	 * @param guid
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/search.htm")
	public ModelAndView search(@RequestParam(value="guid",required=false,defaultValue="0") int guid, HttpServletRequest request) throws Exception {
		common(request.getSession(),guid,"search");
		setRequestParameter(request);
		setLayoutContent(guid);
		
		NewsParameter newsParameter = new NewsParameter(pageNo, pageSize, guid, schType, schText);
		
		String tmp;
		String date1,date2;
		String order;
		
		tmp = request.getParameter("date1");
		if(tmp == null || tmp == "")
			date1 = "";
		else
			date1 = tmp;
		mav.addObject("date1",date1);
		
		tmp = request.getParameter("date2");
		if(tmp == null || tmp == "")
			date2 = "";
		else
			date2 = tmp;
		mav.addObject("date2",date2);
		
		if(date1.length()>=8 && date2.length()>=8){
			newsParameter.andWhere += " and (ldate >= '"+date1.replace("-", "")+"' and ldate <= '"+date2.replace("-", "")+"')";
		}
		
		tmp = request.getParameter("order");
		if(tmp == null || tmp == "")
			order = "";
		else
			order = tmp;
		mav.addObject("order",order);
		
		ArrayList<News> listNews;
		BoardPaging newsPaging;
		
		if(schText.length()>0){
			listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("listNews",newsParameter);
			
			if(listNews != null) remapSearch(listNews,schType);
			
			int listTotal = (Integer)sqlMapClientTemplate.queryForObject("newsCnt",newsParameter);
			newsPaging = new BoardPaging(pageNo,listTotal);
			
			mav.addObject("listNews",listNews);
			mav.addObject("listTotal",listTotal);
			mav.addObject("newsPaging",newsPaging);
		}else
			mav.addObject("listTotal",0);
		
		mav.addObject("isSearch",true);
		mav.addObject("page","search");
		
		return mav;
	}
	
	/**
	 * @function : 날씨 페이지
	 * @process  : 
	 * 
	 * @MethodName : weather
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/weather.htm")
	public ModelAndView weather(HttpServletRequest request) throws Exception {
		common(request.getSession(),3,"weather");
		
		ArrayList<AreaSimple> listArea;
		listArea = (ArrayList<AreaSimple>)sqlMapClientTemplateWeather.queryForList("listAllAreaSimple");
		
		mav.addObject("listArea", listArea);

		guid=3;
		return mav;
	}
	
	/**
	 * @function : 좌측 서브메뉴 호출
	 * @process  : 
	 * 
	 * @MethodName : leftmenu
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/leftmenu.htm")
	public ModelAndView leftmenu() throws Exception {
		if(guid==9 || guid==16)
			common("leftmenueng");
		else if(guid==10 || guid==17)
			common("leftmenuchi");
		else
			common("leftmenu");
		
		mav.addObject("guid", guid);
		return mav;
	}
	
	/**
	 * @function : 분야별 뉴스 리스트 페이지
	 * @process  : 
	 * 
	 * @MethodName : listNews
	 * @param guid
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/{guid}/list.htm",method=RequestMethod.GET)
	public ModelAndView listNews(@PathVariable("guid") int guid) throws Exception {
		if(guid==9 || guid==16)
			common("listeng");
		else if(guid==10 || guid==17)
			common("listchi");
		else
			common("list");
		
		ArrayList<News> listNews;
		BoardPaging newsPaging;
		
		NewsParameter newsParameter = new NewsParameter(pageNo, pageSize, guid, schType, schText);
		listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("listNews",newsParameter);
		remapNews(listNews,isSearch());
		
		int total = (Integer)sqlMapClientTemplate.queryForObject("newsCnt",newsParameter);
		newsPaging = new BoardPaging(pageNo,total);
		
		mav.addObject("listNews",listNews);
		mav.addObject("listTotal",total);
		mav.addObject("newsPaging",newsPaging);
		
		return mav;
	}
	
	/**
	 * @function : 분야별 뉴스 보기
	 * @process  : 
	 * 
	 * @MethodName : viewNews
	 * @param guid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{guid}/view.htm",method=RequestMethod.GET)
	public ModelAndView viewNews(@PathVariable("guid") int guid) throws Exception {
		if(guid==9 || guid==16)
			common("vieweng");
		else if(guid==10 || guid==17)
			common("viewchi");
		else
			common("view");
		
		News viewNews = (News)sqlMapClientTemplate.queryForObject("viewNews",nuid);
		
		if(viewNews != null){
			viewNews.setContent_clob(Common.replaceLineToBR(viewNews.getContent_clob()));
			if(viewNews.viewFlv()){
				if(viewNews.getSvrfile2() != null && viewNews.getSvrfile2().length()>1)
					viewNews.setSvrfile2("/upload/news/"+viewNews.getSvrfile2());
				else
					viewNews.setSvrfile2("/images/vod/default.gif");
			}
		}
		
		CountUpdate countUpdate = new CountUpdate("jctv_news2","news_hit","num="+nuid);
		sqlMapClientTemplate.update("cntUpdate",countUpdate);
		
		mav.addObject("viewNews",viewNews);
		
		return mav;
	}
	
	/**
	 * @function : vod 분류별 보기
	 * @process  : 
	 * 
	 * @MethodName : vodNews
	 * @param guid
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/{guid}/vod.htm",method=RequestMethod.GET)
	public ModelAndView vodNews(@PathVariable("guid") int guid) throws Exception {
		common("vod");
		
		VodParameter vodParameter;
		ArrayList<Vod> listVod;
		BoardPaging vodPaging;
		int total;
		
		if(guid==16){
			mav.setViewName("news/vodeng");
			vodParameter=new VodParameter(pageNo,"0001","238",schType,Common.replaceQuote(schText),7);
		}else if(guid==17){
			mav.setViewName("news/vodchi");
			vodParameter=new VodParameter(pageNo,"0001","312",schType,Common.replaceQuote(schText),7);
		}else if(guid==18){
			vodParameter=new VodParameter(pageNo,"0005","0501",schType,Common.replaceQuote(schText),7);
		}else if(guid==19){
			vodParameter=new VodParameter(pageNo,"0010","1001",schType,Common.replaceQuote(schText),7);
		}else{
			vodParameter=new VodParameter(pageNo,"0001","0101",schType,Common.replaceQuote(schText),7);
		}
		
		if(guid==16 || guid==17) listVod = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("listVodFlv",vodParameter);
		else listVod = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("listVod",vodParameter);
		
		total = (Integer)sqlMapClientTemplate.queryForObject("cntVod",vodParameter);
		remapVod(listVod);
		
		vodPaging = new BoardPaging(pageNo,total,10);
		
		mav.addObject("listVod",listVod);
		mav.addObject("vodTotal",total);
		mav.addObject("vodPaging",vodPaging);
		
		return mav;
	}
	
	/**
	 * @function : 분야별 뉴스 검색
	 * @process  : 
	 * 
	 * @MethodName : searchNews
	 * @param guid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{guid}/search.htm",method=RequestMethod.GET)
	public ModelAndView searchNews(@PathVariable("guid") int guid) throws Exception {
		common("search");
		
		return mav;
	}
	
	/**
	 * @function : 뉴스 편성표 페이지
	 * @process  : 
	 * 
	 * @MethodName : schedule
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/schedule.htm")
	public ModelAndView schedule() throws Exception {
		common("schedule");
		guid = -2;
		mav.addObject("page","schedule");
		return mav;
	}
	
	/**
	 * @function : 뉴스 제보 페이지
	 * @process  : 
	 * 
	 * @MethodName : report
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/report.htm")
	public ModelAndView report(HttpSession session) throws Exception {
		common("report");
		isLogin=Session.chkLogin(session, mav);
		
		guid = -2;
		
		mav.addObject("newsCategory", Common.newsCategory);
		
		return mav;
	}
	
	/**
	 * @function : 뉴스 제보 등록
	 * @process  : bd_idea , bd_idea_pds 에 데이터 인서트
	 * 
	 * @MethodName : report_run
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/report_run.htm")
	public ModelAndView report_run(HttpSession session, HttpServletRequest request) throws Exception {
		common("report");
		isLogin=Session.chkLogin(session, mav);
		
		String boardId = "bd_idea";
		
		int boardNextUid;
		int boardNextFid;
		int maxFileSize = 0;
		int maxSumFileSize = 0;
		String folerName = "";
		String realPath = "";
		
		
		boardNextUid = (Integer)sqlMapClientTemplate.queryForObject("boardNextUid",boardId);
		boardNextFid = (Integer)sqlMapClientTemplate.queryForObject("boardNextFid",boardId);
		
		maxFileSize = 2*1024*1024;
		maxSumFileSize = maxFileSize*1;
		folerName = boardId + "/" + Common.getDate() + "/";
		realPath = uploadPath + folerName;
		
		Common.makeDir(realPath);
		
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSumFileSize, "euc-kr", new FileRenameTime());
		
		mav.setViewName("include/common_receive");
		
		Board board=new Board();
		board.setBoard_id(boardId);
		board.setBoard_uid(boardNextUid);
		board.setBoard_fid(boardNextFid);
		
		if(isLogin){
			board.setBoard_userid(session.getAttribute("userid").toString());
		}
		else{
			board.setBoard_userid(null);
		}
		
		board.setBoard_name(multi.getParameter("name"));
		board.setBoard_email(multi.getParameter("email"));
		board.setBoard_homepage(multi.getParameter("tel"));
		board.setBoard_title(multi.getParameter("title"));
		board.setBoard_contents(multi.getParameter("contents"));
		board.setBoard_ip(request.getRemoteAddr());
		board.setBoard_cate_uid(Integer.parseInt(multi.getParameter("category")));
		//board_is_notice에 값이 없어 오류 발생으로 인한 default value 0 추가 2013.12.17 by kang
		board.setBoard_is_notice("0");
		
		sqlMapClientTemplate.insert("boardInsert",board);
		
		Common.pdsInsert(sqlMapClientTemplate, multi, boardNextUid, boardId, folerName);
		
		mav.addObject("msg","제보되었습니다.\\n감사합니다.");
		mav.addObject("go_url",ctxRoot+"news/report.htm");
		
		return mav;
	}
	
	/**
	 * @function : 기자소개 페이지
	 * @process  : 
	 * 
	 * @MethodName : profile
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/profile.htm")
	public ModelAndView profile() throws Exception {
		common("profile");
		
		guid = -2;
		
		return mav;
	}
	
	/**
	 * @function : 프린트하기 페이지
	 * @process  : 
	 * 
	 * @MethodName : print_window
	 * @param nuid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/print_window.htm", method=RequestMethod.GET)
	public ModelAndView print_window(@RequestParam(value="nuid",required=true,defaultValue="0") int nuid) throws Exception {
		common("print");
		
		News viewNews = (News)sqlMapClientTemplate.queryForObject("viewNews",nuid);
		
		if(viewNews != null){
			viewNews.setContent_clob(Common.replaceLineToBR(viewNews.getContent_clob()));
			if(viewNews.viewFlv()){
				if(viewNews.getSvrfile2() != null && viewNews.getSvrfile2().length()>1)
					viewNews.setSvrfile2("/upload/news/"+viewNews.getSvrfile2());
				else
					viewNews.setSvrfile2("/images/vod/default.gif");
			}
		}
		
		mav.addObject("viewNews",viewNews);
		
		return mav;
	}
	
	/**
	 * @function : 프린트하기 페이지
	 * @process  : 
	 * 
	 * @MethodName : print_iframe
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/print_iframe.htm")
	public ModelAndView print_iframe() throws Exception {
		common("print");
		return mav;
	}
	
	/**
	 * @function : 메인페이지 주요 뉴스
	 * @process  : 
	 * 
	 * @MethodName : addListNewsHot
	 */
	@SuppressWarnings("unchecked")
	private void addListNewsHot(){
		ArrayList<News> listNews;
		listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsHot");
		remapNews(listNews,false);
		mav.addObject("listNewsHot", listNews);
	}
	
	/**
	 * @function : 많이 본 뉴스 리스팅
	 * @process  : 
	 * 
	 * @MethodName : addListNewsTop
	 */
	@SuppressWarnings("unchecked")
	private void addListNewsTop(){
		mav.addObject("indexNewsTop0", cutStrNews((ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsTopAll"),24,true));
		mav.addObject("indexNewsTop1", cutStrNews((ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsTop", "'1','5'"),27,false));
		mav.addObject("indexNewsTop2", cutStrNews((ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsTop", "'2','6'"),27,false));
		mav.addObject("indexNewsTop3", cutStrNews((ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsTop", "'3','7'"),27,false));
		mav.addObject("indexNewsTop4", cutStrNews((ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsTop", "'4','8'"),27,false));
	}
	
	/**
	 * @function : 분야별 뉴스 리스팅
	 * @process  : 
	 * 
	 * @MethodName : addListNews
	 */
	@SuppressWarnings("unchecked")
	private void addListNews(){
		ArrayList<News> listNews;
		
		listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsGroup", "'1','5'");
		remapNews(listNews,false);
		mav.addObject("listNews1",listNews);
		
		listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsGroup", "'2','6'");
		remapNews(listNews,false);
		mav.addObject("listNews2",listNews);
		
		listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsGroup", "'3','7'");
		remapNews(listNews,false);
		mav.addObject("listNews3",listNews);
		
		listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsGroup", "'4','8'");
		remapNews(listNews,false);
		mav.addObject("listNews4",listNews);
	}
	
	/**
	 * @function : 날씨영상 추가
	 * @process  : DB 에 날씨 영상 정보가 있을 경우 표시하고 없을 경우 처리하지않음
	 * 
	 * @MethodName : addWeatherFlv
	 */
	private void addWeatherFlv(){
		News weatherFlv;
		weatherFlv = (News)sqlMapClientTemplate.queryForObject("getWeatherFlv");
		//날씨 영상 존재 유무 확인
		if(weatherFlv != null){
			if(weatherFlv.getSvrfile2() != null && weatherFlv.getSvrfile2().length()>1)
				weatherFlv.setSvrfile2("/upload/news/"+weatherFlv.getSvrfile2());
			else
				weatherFlv.setSvrfile2("/images/vod/default.gif");
			
			String dateStr = " - <strong>";
			dateStr += weatherFlv.getLdate().substring(0, 4) + "년 ";
			dateStr += weatherFlv.getLdate().substring(4, 6) + "월 ";
			dateStr += weatherFlv.getLdate().substring(6) + "일</strong>";
			weatherFlv.setLdate(dateStr);
			
			mav.addObject("weatherFlv",weatherFlv);
		}
	}
	
	@SuppressWarnings("unchecked")
	private void addListInvite(){
		/*ArrayList<Vod> invList;
		invList = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("indexInvite");
		remapVod(invList);
		mav.addObject("invList",invList);*/
	}
	
	/**
	 * @function : 영어 뉴스 페이지 탑 뉴스 영역 리스팅
	 * @process  : 
	 * 
	 * @MethodName : addListNewsTopEng
	 */
	@SuppressWarnings("unchecked")
	private void addListNewsTopEng(){
		mav.addObject("listNews",(ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsEng"));
	}
	
	/**
	 * @function : 영어뉴스 VOD 리스팅
	 * @process  : 
	 * 
	 * @MethodName : addListVodEng
	 */
	@SuppressWarnings("unchecked")
	private void addListVodEng(){
		ArrayList<Vod> listVod;
		listVod = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("indexVodEng");
		remapVod(listVod);
		mav.addObject("listVod",listVod);
	}	
	/**
	 * @function : 중국어 뉴스 페이지 탑 뉴스 영역 리스팅
	 * @process  : 
	 * 
	 * @MethodName : addListNewsTopChi
	 */
	@SuppressWarnings("unchecked")
	private void addListNewsTopChi(){
		mav.addObject("listNews",(ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsChi"));
	}
	
	/**
	 * @function : 중국어 뉴스 VOD 리스팅
	 * @process  : 
	 * 
	 * @MethodName : addListVodChi
	 */
	@SuppressWarnings("unchecked")
	private void addListVodChi(){
		ArrayList<Vod> listVod;
		listVod = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("indexVodChi");
		remapVod(listVod);
		mav.addObject("listVod",listVod);
	}
	
	/**
	 * @function : 문자열 자르기
	 * @process  : 
	 * 
	 * @MethodName : cutStrNews
	 * @param list
	 * @param maxLen
	 * @param setGroup
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	private ArrayList cutStrNews(ArrayList<News> list, int maxLen, boolean setGroup){
		String title;
		//int maxLen=20;
		
		for(News item:list){
			title=item.getTitle();
			item.setMaincd(Common.newsCategory[Integer.parseInt(item.getGroup_flag())]);
			if(setGroup)
				item.setSubcd(Common.newsGroup[Integer.parseInt(item.getGroup_flag())]);
			if(title.length()>maxLen){
				item.setTitle(Common.cutStr(title, null, maxLen, 0, true, true));
			}
		}
		
		return list;
	}
	
	/**
	 * @function : 파라미터 값 설정
	 * @process  : 
	 * 
	 * @MethodName : setRequestParameter
	 * @param request
	 * @throws Exception
	 */
	private void setRequestParameter(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("euc-kr");
		urlQuery="";
		
		this.guid = Common.strToInt(request.getParameter("guid"));
		mav.addObject("guid", this.guid);
		urlQuery=urlQuery+"?guid="+this.guid;
		
		this.nuid = Common.strToInt(request.getParameter("nuid"));
		mav.addObject("nuid",this.nuid);
		urlQuery=urlQuery+"&nuid="+this.nuid;
		
		this.pageNo = Common.strToInt(request.getParameter("pageNo"), 1);
		//urlQuery=urlQuery+"&pageNo="+this.pageNo;
		
		this.pageSize = Common.strToInt(request.getParameter("pageSize"), 10);
		urlQuery=urlQuery+"&pageSize="+this.pageSize;
		
		this.pageView = Common.strToInt(request.getParameter("pageView"), 10);
		urlQuery=urlQuery+"&pageView="+this.pageView;
		
		this.schType = Common.strToStr(request.getParameter("schType"));
		mav.addObject("schType",this.schType);
		urlQuery=urlQuery+"&schType="+this.schType;
		
		this.schText = Common.toEUCKR(Common.strToStr(request.getParameter("schText")));
		mav.addObject("schText",this.schText);
		urlQuery=urlQuery+"&schText="+this.schText;
		
		mav.addObject("urlQuery",urlQuery);
	}
	
	/**
	 * @function : 검색 판별
	 * @process  : 
	 * 
	 * @MethodName : isSearch
	 * @return
	 */
	private boolean isSearch(){
		if(schType.length()>0 && schText.length()>0)
			return true;
		else
			return false;
	}
	
	/**
	 * @function : 검색된 뉴스 리스트 재정렬
	 * @process  : 
	 * 
	 * @MethodName : remapNews
	 * @param list
	 * @param isSearch
	 */
	private void remapNews(ArrayList<News> list, boolean isSearch){
		String imageUrl;
		for(News item:list){
			if(item.getGroup_flag() != null && item.getGroup_flag().length()>0){
				item.setMaincd(Common.newsCategory[Integer.parseInt(item.getGroup_flag())]);
				item.setSubcd(Common.newsGroup[Integer.parseInt(item.getGroup_flag())]);
			}
			
			if(isSearch){
				if(schType.equals("title"))
					item.setTitle(replaceSchText(schText,item.getTitle()));
				else if(schType.equals("content"))
					item.setContent(replaceSchText(schText,item.getContent()));
			}
			
			if(item.getContent() != null){
				item.setContent(Common.replacePtoNone(item.getContent()));
				item.setContent(Common.replaceBRtoSpace(item.getContent()));
			}

			imageUrl = item.getSvrfile2();
			if(imageUrl != null && !imageUrl.equals("0") && imageUrl.length()>1){
				item.setSvrfile2(ctxRoot+Common.uploadFolder+"news/"+imageUrl);
			}
		}
	}
	
	/**
	 * @function : 검색된 뉴스 VOD 재정렬
	 * @process  : 
	 * 
	 * @MethodName : remapVod
	 * @param list
	 */
	private void remapVod(ArrayList<Vod> list){
		for(Vod item:list){
			if(item.getPhoto_url() != null && item.getPhoto_url().length()>0)
				item.setPhoto_url(ctxRoot+"upload/vod/"+item.getPhoto_url());
			else
				item.setPhoto_url(ctxRoot+"images/vod/default.gif");
		}
	}
	
	/**
	 * @function : 검색 결과 재정렬
	 * @process  : 
	 * 
	 * @MethodName : remapSearch
	 * @param list
	 * @param schType
	 */
	private void remapSearch(ArrayList<News> list, String schType){
		String imageUrl;
		for(News item:list){
			if(item.getGroup_flag() == null) item.setMaincd(Common.newsCategory[0]);
			else item.setMaincd(Common.newsCategory[Integer.parseInt(item.getGroup_flag())]);
			//item.setSubcd(Common.newsGroup[Integer.parseInt(item.getGroup_flag())]);
			if(schType.equals("title"))
				item.setTitle(replaceSchText(schText,item.getTitle()));
			else if(schType.equals("content"))
				item.setContent(replaceSchText(schText,item.getContent()));
			if(item.getContent() != null)
				item.setContent(Common.replaceBRtoSpace(item.getContent()));
			//item.setContent(replaceSchText(schText,item.getContent()));
			imageUrl = item.getSvrfile2();
			if(imageUrl != null && !imageUrl.equals("0") && imageUrl.length()>1){
				item.setSvrfile2(ctxRoot+Common.uploadFolder+"news/"+imageUrl);
			}
		}
	}
	
	/**
	 * @function : 검색 결과 단어 강조
	 * @process  : 
	 * 
	 * @MethodName : replaceSchText
	 * @param schText
	 * @param str
	 * @return
	 */
	private String replaceSchText(String schText, String str){
		return str.replace(schText,"<strong>"+schText+"</strong>");
	}
	
	/**
	 * @function : 사이드 메뉴 컨텐츠 등록을 위한 DB 검색 컨트롤
	 * @process  : 
	 * 
	 * @MethodName : setLayoutContent
	 * @param guid
	 */
	private void setLayoutContent(int guid){
		if(guid==9 || guid==16){
			addListNewsTopEng();
			addListVodEng();
		}else if(guid==10 || guid==17){
			addListNewsTopChi();
			addListVodChi();
		}else if(guid==3){
			addListNewsTop();
		}else{
			addListNewsTop();
			addListInvite();
		}
		
		mav.addObject("guid",guid);
	}
}
