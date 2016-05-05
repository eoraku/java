package kctv.web.news;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kctv.web.board.BoardPaging;
import kctv.web.common.Common;
import kctv.web.common.CountUpdate;
import kctv.web.session.Session;
import kctv.web.vod.Vod;
import kctv.web.vod.VodParameter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * <pre>
 * kctv.web.news
 * ChiController.java
 * </pre>
 * <pre>
 * 중국어 뉴스 페이지 컨트롤러 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 17.
 * @version: 
 */
@Controller
@RequestMapping("/cn")
public class ChiController {
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	ModelAndView mav;
	boolean isIndex = false;
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
	
	/**
	 * @function : 페이지 요청 처리 
	 * @process  : 
	 * 
	 * @MethodName : common
	 * @param session
	 * @param mainPage
	 * @param isMain
	 */
	private void common(HttpSession session,String mainPage,boolean isMain){
		if(isMain){
			mav = new ModelAndView("news/layoutchi");
			isLogin=Session.chkLogin(session, mav);
		}else{
			mav = new ModelAndView("news/"+mainPage);
		}
		
		mav.addObject("mainPage",mainPage);
		mav.addObject("ctxRoot",ctxRoot);
	}
	
	/**
	 * @function : 메인 페이지 
	 * @process  : 
	 * 
	 * @MethodName : index
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/index.htm")
	public ModelAndView index(HttpServletRequest request) throws Exception {
		common(request.getSession(),"listchi",true);
		setRequestParameter(request);
		
		//addListTopSearch();
		addListNewsHotChi();
		addListNewsTopChi();
		addListVodChi(5);
		
		return mav;
	}
	
	/**
	 * @function : 중국어 뉴스 메인 5개
	 * @process  : 
	 * 
	 * @MethodName : listhot
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/listhot.htm")
	public ModelAndView listhot(HttpServletRequest request) throws Exception {
		common(request.getSession(),"listhotchi",true);
		setRequestParameter(request);
		
		isIndex = false;
		//addListTopSearch();
		addListNewsTopChi();
		addListVodChi(4);
		
		return mav;
	}
	
	/**
	 * @function :중국어 뉴스 메인 밑 리스트 
	 * @process  : 
	 * 
	 * @MethodName : list
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list.htm")
	public ModelAndView list(HttpServletRequest request) throws Exception {
		common(request.getSession(),"listchi",true);
		setRequestParameter(request);
		
		isIndex = false;
		//addListTopSearch();
		addListNewsTopChi();
		addListVodChi(4);
		
		return mav;
	}
	
	/**
	 * @function : 중국어 뉴스 읽기
	 * @process  : 
	 * 
	 * @MethodName : view
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/view.htm")
	public ModelAndView view(HttpServletRequest request) throws Exception {
		common(request.getSession(),"viewchi",true);
		setRequestParameter(request);
		
		isIndex = false;
		//addListTopSearch();
		addListNewsTopChi();
		addListVodChi(4);
		
		return mav;
	}
	
	/**
	 * @function : 중국어 뉴스 리스트
	 * @process  : 
	 * 
	 * @MethodName : vod
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/vod.htm")
	public ModelAndView vod(HttpServletRequest request) throws Exception {
		common(request.getSession(),"vodchi",true);
		setRequestParameter(request);
		
		isIndex = false;
		//addListTopSearch();
		addListNewsTopChi();
		//addListVodChi();
		
		mav.addObject("hideVOD",true);
		
		return mav;
	}
	
	/**
	 * @function : 중국어 뉴스 리스트
	 * @process  : 
	 * 
	 * @MethodName : listchi
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/listchi.htm")
	public ModelAndView listchi() throws Exception {
		common(null,"listchi",false);
		
		ArrayList<News> listNews;
		int total;
		BoardPaging newsPaging;
		
		NewsParameter newsParameter = new NewsParameter(pageNo, pageSize, 10, schType, schText);
		newsParameter.setLengthContent(360);
		listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("listNews",newsParameter);
		remapNews(listNews,isSearch());
		
		if(!isIndex){
			total = (Integer)sqlMapClientTemplate.queryForObject("newsCnt",newsParameter);
			
			newsPaging = new BoardPaging(pageNo,total);
			mav.addObject("newsPaging",newsPaging);
		}else{
			total = listNews.size();
		}
		
		mav.addObject("listNews",listNews);
		mav.addObject("listTotal",total);
		
		return mav;
	}
	
	/**
	 * @function : 중국어 탑 뉴스 리스트
	 * @process  : 
	 * 
	 * @MethodName : listhotchi
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/listhotchi.htm")
	public ModelAndView listhotchi() throws Exception {
		common(null,"listhotchi",false);
		
		ArrayList<News> listNews;
		BoardPaging newsPaging;
		
		NewsParameter newsParameter = new NewsParameter(pageNo, pageSize, 10, schType, schText, true);
		listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("listNews",newsParameter);
		remapNews(listNews,isSearch());
		
		if(!isIndex){
			int total = (Integer)sqlMapClientTemplate.queryForObject("newsCnt",newsParameter);
			newsPaging = new BoardPaging(pageNo,total);
			mav.addObject("newsPaging",newsPaging);
		}
		
		mav.addObject("listNews",listNews);
		
		return mav;
	}
	
	/**
	 * @function : 뉴스 카운트 증가
	 * @process  : 
	 * 
	 * @MethodName : viewchi
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/viewchi.htm")
	public ModelAndView viewchi() throws Exception {
		common(null,"viewchi",false);
		
		News viewNews = (News)sqlMapClientTemplate.queryForObject("viewNews",nuid);
		viewNews.setContent_clob(Common.replaceLineToBR(viewNews.getContent_clob()));
		
		CountUpdate countUpdate = new CountUpdate("jctv_news2","news_hit","num="+nuid);
		sqlMapClientTemplate.update("cntUpdate",countUpdate);
		
		mav.addObject("viewNews",viewNews);
		
		return mav;
	}
	
	/**
	 * @function : VOD 카운트 증가
	 * @process  : 
	 * 
	 * @MethodName : vodchi
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/vodchi.htm")
	public ModelAndView vodchi() throws Exception {
		common(null,"vodchi",false);
		
		VodParameter vodParameter=new VodParameter(pageNo,"0001","312",schType,Common.replaceQuote(schText),7);
		
		ArrayList<Vod> listVod = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("listVodFlv",vodParameter);
		int total = (Integer)sqlMapClientTemplate.queryForObject("cntVodFlv",vodParameter);
		
		remapVod(listVod);
		
		BoardPaging vodPaging = new BoardPaging(pageNo,total,10);
		
		mav.addObject("listVod",listVod);
		mav.addObject("vodTotal",total);
		mav.addObject("vodPaging",vodPaging);
		
		return mav;
	}
	
	/**
	 * @function : 프린트하기
	 * @process  : 
	 * 
	 * @MethodName : print_window
	 * @param nuid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/print_window.htm", method=RequestMethod.GET)
	public ModelAndView print_window(@RequestParam(value="nuid",required=true,defaultValue="0") int nuid) throws Exception {
		common(null,"printchi",false);
		
		News viewNews = (News)sqlMapClientTemplate.queryForObject("viewNews",nuid);
		viewNews.setContent_clob(Common.replaceLineToBR(viewNews.getContent_clob()));
		
		mav.addObject("viewNews",viewNews);
		
		return mav;
	}
	
	/**
	 * @function : 프린트하기
	 * @process  : 
	 * 
	 * @MethodName : print_iframe
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/print_iframe.htm")
	public ModelAndView print_iframe() throws Exception {
		common(null,"chi_print",false);
		return mav;
	}
	
	/**
	 * @function : 중국어뉴스 인기 8
	 * @process  : 
	 * 
	 * @MethodName : addListNewsTopChi
	 */
	@SuppressWarnings("unchecked")
	private void addListNewsTopChi(){
		mav.addObject("listNews",(ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsChi"));
	}
	
	/**
	 * @function : 중국어 뉴스 Top 리스팅
	 * @process  : 
	 * 
	 * @MethodName : addListNewsHotChi
	 */
	@SuppressWarnings("unchecked")
	private void addListNewsHotChi(){
		this.isIndex = true;
		mav.addObject("listNewsHot",(ArrayList<News>)sqlMapClientTemplate.queryForList("indexNewsHotChi"));
		mav.addObject("isIndex",isIndex);
	}
	
	/**
	 * @function : 중국어 뉴스 VOD
	 * @process  : 
	 * 
	 * @MethodName : addListVodChi
	 * @param cnt
	 */
	@SuppressWarnings("unchecked")
	private void addListVodChi(int cnt){
		ArrayList<Vod> listVod;
		listVod = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("indexVodChi",cnt);
		remapVod(listVod);
		mav.addObject("listVod",listVod);
	}
	
	/**
	 * @function : 검색 파라미터 세터
	 * @process  : 
	 * 
	 * @MethodName : setRequestParameter
	 * @param request
	 * @throws Exception
	 */
	private void setRequestParameter(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
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
	 * @function : 중국어 뉴스 정렬
	 * @process  : 
	 * 
	 * @MethodName : remapNews
	 * @param list
	 * @param isSearch
	 */
	private void remapNews(ArrayList<News> list, boolean isSearch){
		String imageUrl;
		for(News item:list){
			//item.setMaincd(Common.newsCategory[Integer.parseInt(item.getGroup_flag())]);
			//item.setSubcd(Common.newsGroup[Integer.parseInt(item.getGroup_flag())]);
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
	 * @function : 중국어 뉴스 VOD 정렬
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
	 * @function :검색 결과 강조 
	 * @process  : 
	 * 
	 * @MethodName : replaceSchText
	 * @param schText
	 * @param str
	 * @return
	 */
	private String replaceSchText(String schText, String str){
		return str.replace(schText,"<span class='sch_text'>"+schText+"</span>");
	}
}
