package kctv.web.search;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kctv.web.board.Board;
import kctv.web.board.BoardPaging;
import kctv.web.common.Common;
import kctv.web.news.News;
import kctv.web.vod.Vod;
import kctv.xml.DocRssBlog;
import kctv.xml.DocRssWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * <pre>
 * kctv.web.search
 * SearchController.java
 * </pre>
 * <pre>
 * 클래스 작성은 전임자가 작성. 홈페이지 검색 부분 컨트롤러
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 11.
 * @version: 
 */
@Controller
@RequestMapping("/search")
public class SearchController {
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Value("#{config['uploadPath']}") String uploadPath;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	ModelAndView mav;
	HttpSession session;
	SearchParameter searchParameter;
	BoardPaging searchPaging;
	String urlQuery;
	String schText;
	String subMenu;
	int board;
	int pageNo;
	
	/**
	 * @function : 페이지 호출
	 * @process  : 검색 결과 화면 처리에 대한 페이지 ModelAndView에 ctxRoot, menu오브젝트 설정
	 * 
	 * @MethodName : common
	 * @param session
	 *    세션 정보 인자
	 * @param page
	 *    url 호출 페이지 인자
	 */
	private void common(HttpSession session, String page){
		this.session = session;
		
		mav = new ModelAndView("search/"+page);
		mav.addObject("ctxRoot",ctxRoot);
		mav.addObject("menu","search");
	}
	
	/**
	 * @function : index 페이지 호출
	 * @process  : 캐릭터셋 euc-kr 설정, schText 인자를 받아 검색어 설정한 후 SEARCH_TEXT 필드에서 검색어 추가 또는 카운트 증가시킴.
	 * 이후 검색어를 url 리다이렉트시킴 
	 * 
	 * @MethodName : index
	 * @param response
	 *     HttpServeletResponse
	 * @param request
	 *     HttpServeletRequest
	 * @throws Exception
	 */
	@RequestMapping("/index.htm")
	public void index(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("euc-kr");
		schText = request.getParameter("schText");
		
		if(schText == null || schText.length()<1){
			response.sendRedirect(ctxRoot);
		}else{
			SearchValue searchValue = new SearchValue();
			searchValue.setText_real(schText);
			searchValue.setText_view(schText);
			
			if((Integer)sqlMapClientTemplate.queryForObject("searchTextSelect",searchValue)>0)
				sqlMapClientTemplate.update("searchTextUpdate",searchValue);
			else{
				searchValue.setReferer(request.getHeader("REFERER"));
				searchValue.setIp(request.getRemoteAddr());
				sqlMapClientTemplate.insert("searchTextInsert",searchValue);
			}
			
			String subMenu = request.getParameter("subMenu");
			
			schText = Common.enURLK(schText);
			
			if(subMenu == null || subMenu.length()<1)
				response.sendRedirect("search.htm?schText="+schText);
			else
				response.sendRedirect("search.htm?schText="+schText+"&subMenu="+subMenu);
		}
	}
	
	/**
	 * @function :  검색결과창 호출
	 * @process  : search.jsp 호출, 서브메뉴에 선택된 값에따라 검색결과 출력 옵션을 리턴
	 * 
	 * @MethodName : search
	 * @param request
	 * 	HttpServletRequest
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/search.htm")
	public ModelAndView search(HttpServletRequest request) throws Exception {
		common(request.getSession(),"search");
		setRequestParameter(request);
		
		if(schText.indexOf("약관")>-1 || schText.indexOf("이용약관")>-1)
			mav.addObject("termView",true);
		
		if(subMenu.equals("main")){
			// 0:존재유무, 1:메인리스트, 2:페이징리스트
			setSearchProgram(schText,1,1);
			setSearchNews(schText,1,1);
			setSearchVod(schText,1,1);
			setSearchBoard(schText,1,1,0);
//			setSearchBlog(schText,1,1);
//			setSearchWeb(schText,1,1);
		}else if(subMenu.equals("program")){
			setSearchProgram(schText,pageNo,2);
			setSearchNews(schText,1,0);
			setSearchVod(schText,1,0);
			setSearchBoard(schText,1,0,0);
//			setSearchBlog(schText,1,0);
//			setSearchWeb(schText,1,0);
		}else if(subMenu.equals("news")){
			setSearchProgram(schText,1,0);
			setSearchNews(schText,pageNo,2);
			setSearchVod(schText,1,0);
			setSearchBoard(schText,1,0,0);
//			setSearchBlog(schText,1,0);
//			setSearchWeb(schText,1,0);
		}else if(subMenu.equals("vod")){
			setSearchProgram(schText,1,0);
			setSearchNews(schText,1,0);
			setSearchVod(schText,pageNo,2);
			setSearchBoard(schText,1,0,0);
//			setSearchBlog(schText,1,0);
//			setSearchWeb(schText,1,0);
		}
		else if(subMenu.equals("board")){
			setSearchProgram(schText,1,0);
			setSearchNews(schText,1,0);
			setSearchVod(schText,1,0);
			setSearchBoard(schText,pageNo,2,board);
//			setSearchBlog(schText,1,0);
//			setSearchWeb(schText,1,0);
		}
/*
		else if(subMenu.equals("web")){
			setSearchProgram(schText,1,0);
			setSearchNews(schText,1,0);
			setSearchVod(schText,1,0);
			setSearchBoard(schText,1,0,0);
			setSearchBlog(schText,1,0);
			setSearchWeb(schText,pageNo,2);
		}else if(subMenu.equals("blog")){
			setSearchProgram(schText,1,0);
			setSearchNews(schText,1,0);
			setSearchVod(schText,1,0);
			setSearchBoard(schText,1,0,0);
			setSearchBlog(schText,pageNo,2);
			setSearchWeb(schText,1,0);
		}
*/		
		return mav;
	}
	
	@RequestMapping("/leftmenu.htm")
	public ModelAndView leftmenu(HttpSession session) throws Exception {
		common(session,"leftmenu");
		return mav;
	}
	
	@RequestMapping("/main.htm")
	public ModelAndView search_main(HttpSession session) throws Exception {
		common(session,"search_main");
		return mav;
	}
	
	@RequestMapping("/program.htm")
	public ModelAndView search_program(HttpSession session) throws Exception {
		common(session,"search_program");
		return mav;
	}
	
	@RequestMapping("/news.htm")
	public ModelAndView search_news(HttpSession session) throws Exception {
		common(session,"search_news");
		return mav;
	}
	
	@RequestMapping("/vod.htm")
	public ModelAndView search_vod(HttpSession session) throws Exception {
		common(session,"search_vod");
		return mav;
	}
	
	@RequestMapping("/board.htm")
	public ModelAndView search_board(HttpSession session) throws Exception {
		common(session,"search_board");
		return mav;
	}
	
	@RequestMapping("/web.htm")
	public ModelAndView search_web(HttpSession session) throws Exception {
		common(session,"search_web");
		return mav;
	}
	
	@RequestMapping("/blog.htm")
	public ModelAndView search_blog(HttpSession session) throws Exception {
		common(session,"search_blog");
		return mav;
	}
	
	@RequestMapping("/paging.htm")
	public ModelAndView paging(HttpSession session) throws Exception {
		common(session,"paging");
		return mav;
	}
	
	/**
	 * @function : 프로그램 검색결과 설정
	 * @process  : arrayList를 이용하여 검색결과 프로그램이 존재한다면 전달받은 타입에 따라 데이터를 ModelAndView객체에 넣는다.
	 * 
	 * @MethodName : setSearchProgram
	 * @param schText
	 * 	검색어
	 * @param pageNo
	 * 	현재페이지 번호
	 * @param type
	 * 	검색결과 타입
	 */
	@SuppressWarnings("unchecked")
	public void setSearchProgram(String schText,int pageNo,int type){
		ArrayList<Vod> proList = null;
		int proTotal = 0;
		
		if(type==0){//존재유무
			searchParameter = new SearchParameter(schText,1,1);
			if(sqlMapClientTemplate.queryForObject("searchExisProgram",searchParameter) != null)
				proTotal = 1;
		}else if(type==1){//메인리스트
			searchParameter = new SearchParameter(schText,1,8);
			proList = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("searchListProgram",searchParameter);
			proTotal = (Integer)sqlMapClientTemplate.queryForObject("searchCntProgram",searchParameter);
			remapProgram(proList);
		}else if(type==2){//페이징리스트
			searchParameter = new SearchParameter(schText,pageNo,20);
			proList = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("searchListProgram",searchParameter);
			proTotal = (Integer)sqlMapClientTemplate.queryForObject("searchCntProgram",searchParameter);
			remapProgram(proList);
			
			searchPaging = new BoardPaging(pageNo,proTotal,20);
			mav.addObject("searchPaging",searchPaging);
		}
		
		mav.addObject("programList",proList);
		mav.addObject("programTotal",proTotal);
	}
	
	/**
	 * @function : 뉴스 검색결과 설정
	 * @process  : arrayList를 이용하여 검색결과 뉴스가 존재한다면 전달받은 타입에 따라 데이터를 ModelAndView객체에 넣는다. 
	 * 
	 * @MethodName : setSearchNews
	 * @param schText
	 * 	검색어
	 * @param pageNo
	 * 	현재 페이지 번호
	 * @param type
	 * 	결과 타입
	 */
	@SuppressWarnings("unchecked")
	public void setSearchNews(String schText,int pageNo,int type){
		ArrayList<News> newsList = null;
		int newsTotal = 0;
		
		if(type==0){//존재유무
			searchParameter = new SearchParameter(schText,1,1);
			if(sqlMapClientTemplate.queryForObject("searchExisNews",searchParameter) != null)
				newsTotal = 1;
		}else if(type==1){//메인리스트
			searchParameter = new SearchParameter(schText,1,8);
			searchParameter.setnSearchDate(Common.getDateFromDay("yyyyMMdd", -92));
			
			newsList = (ArrayList<News>)sqlMapClientTemplate.queryForList("searchListNews2",searchParameter);
			newsTotal = (Integer)sqlMapClientTemplate.queryForObject("searchCntNews2",searchParameter);
			remapNews(newsList);
		}else if(type==2){//페이징리스트
			searchParameter = new SearchParameter(schText,pageNo,20);
			newsList = (ArrayList<News>)sqlMapClientTemplate.queryForList("searchListNews",searchParameter);
			newsTotal = (Integer)sqlMapClientTemplate.queryForObject("searchCntNews",searchParameter);
			remapNews(newsList);
			
			searchPaging = new BoardPaging(pageNo,newsTotal);
			mav.addObject("searchPaging",searchPaging);
		}
		
		mav.addObject("newsList",newsList);
		mav.addObject("newsTotal",newsTotal);
	}
	
	/**
	 * @function : VOD 검색 결과를 설정
	 * @process  : arrayList를 이용하여 검색결과 VOD가 존재한다면 전달받은 타입에 따라 데이터를 ModelAndView객체에 넣는다.
	 * 
	 * @MethodName : setSearchVod
	 * @param schText
	 * 	검색어
	 * @param pageNo
	 * 	현재페이지번호
	 * @param type
	 * 	결과 타입
	 */
	@SuppressWarnings("unchecked")
	public void setSearchVod(String schText,int pageNo,int type){
		ArrayList<Vod> vodList = null;
		int vodTotal = 0;
		
		if(type==0){//존재유무
			searchParameter = new SearchParameter(schText,1,1);
			if(sqlMapClientTemplate.queryForObject("searchExisVod",searchParameter) != null)
				vodTotal = 1;
		}else if(type==1){//메인리스트
			searchParameter = new SearchParameter(schText,1,8);
			vodList = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("searchListVod",searchParameter);
			vodTotal = (Integer)sqlMapClientTemplate.queryForObject("searchCntVod",searchParameter);
			remapVod(vodList);
		}else if(type==2){//페이징리스트
			searchParameter = new SearchParameter(schText,pageNo,20);
			vodList = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("searchListVod",searchParameter);
			vodTotal = (Integer)sqlMapClientTemplate.queryForObject("searchCntVod",searchParameter);
			remapVod(vodList);
			
			searchPaging = new BoardPaging(pageNo,vodTotal);
			mav.addObject("searchPaging",searchPaging);
		}
		
		mav.addObject("vodList",vodList);
		mav.addObject("vodTotal",vodTotal);
	}
	
	/**
	 * @function : 게시판 검색 결과를 설정
	 * @process  : arrayList를 이용하여 검색결과 가 존재한다면 전달받은 타입에 따라 데이터를 ModelAndView객체에 넣는다.
	 * 
	 * @MethodName : setSearchBoard
	 * @param schText
	 * @param pageNo
	 * @param type
	 * @param board
	 */
	@SuppressWarnings("unchecked")
	public void setSearchBoard(String schText,int pageNo,int type,int board){
		int boardTotal[] = {0,0,0,0,0,0,0};
		
		if(type==0){//존재유무
			searchParameter = new SearchParameter(schText,1,1);
			searchParameter.setnSearchDate(Common.getDateFromDay("yyyy-MM-dd", -366));
			for(int i=2; i<=6; i++){
				if(sqlMapClientTemplate.queryForObject("searchExisBoard"+i,searchParameter) != null){
					boardTotal[i] = 1;
					boardTotal[0] += 1;
				}
			}
		}else if(type==1){//메인리스트
			searchParameter = new SearchParameter(schText,1,3);
			searchParameter.setnSearchDate(Common.getDateFromDay("yyyy-MM-dd", -366));
			
			ArrayList<Board> boardList1 = null;
			ArrayList<Board> boardList2 = null;
			ArrayList<Board> boardList3 = null;
			ArrayList<Board> boardList4 = null;
			ArrayList<Board> boardList5 = null;
			ArrayList<Board> boardList6 = null;
			
//			boardList1 = (ArrayList<Board>)sqlMapClientTemplate.queryForList("searchListBoard1",searchParameter);
//			remapBoard(boardList1,1);
			
			boardList2 = (ArrayList<Board>)sqlMapClientTemplate.queryForList("searchListBoard2",searchParameter);
			remapBoard(boardList2,2);
			
			boardList3 = (ArrayList<Board>)sqlMapClientTemplate.queryForList("searchListBoard3",searchParameter);
			remapBoard(boardList3,3);
			
			boardList4 = (ArrayList<Board>)sqlMapClientTemplate.queryForList("searchListBoard4",searchParameter);
			remapBoard(boardList4,4);
			
			boardList5 = (ArrayList<Board>)sqlMapClientTemplate.queryForList("searchListBoard5",searchParameter);
			remapBoard(boardList5,5);
			
			boardList6 = (ArrayList<Board>)sqlMapClientTemplate.queryForList("searchListBoard6",searchParameter);
			remapBoard(boardList6,6);
			
			for(int i=2; i<=6; i++){
				if(sqlMapClientTemplate.queryForObject("searchExisBoard"+i,searchParameter) != null){
					boardTotal[i] = 1;
					boardTotal[0] += 1;
				}
			}
			
			mav.addObject("boardList1",boardList1);
			mav.addObject("boardList2",boardList2);
			mav.addObject("boardList3",boardList3);
			mav.addObject("boardList4",boardList4);
			mav.addObject("boardList5",boardList5);
			mav.addObject("boardList6",boardList6);
		}else if(type==2){//페이징리스트
			searchParameter = new SearchParameter(schText,pageNo,20);
			searchParameter.setnSearchDate(Common.getDateFromDay("yyyy-MM-dd", -366));
			ArrayList<Board> boardList = null;
			
			boardList = (ArrayList<Board>)sqlMapClientTemplate.queryForList("searchListBoard"+board,searchParameter);
			boardTotal[board] = (Integer)sqlMapClientTemplate.queryForObject("searchCntBoard"+board,searchParameter);
			remapBoard(boardList,board);
			searchPaging = new BoardPaging(pageNo,boardTotal[board]);
			mav.addObject("searchPaging",searchPaging);
			
			for(int i=2; i<=6; i++)
				if(i!=board && sqlMapClientTemplate.queryForObject("searchExisBoard"+i,searchParameter) != null)
					boardTotal[i] = 1;
			
			mav.addObject("boardList",boardList);
		}
		
		mav.addObject("boardName",Common.boardName);
		mav.addObject("boardTotal",boardTotal);
	}
	
	public void setSearchBlog(String schText,int pageNo,int type) throws Exception {
		int display=0;
		if(type==0){//존재유무
			display = 1;
		}else if(type==1){//메인리스트
			display = 5;
		}else if(type==2){//페이징리스트
			display = 20;
		}
		
		DocRssBlog items = new DocRssBlog(schText,display,pageNo);
		mav.addObject("blogList",items.getList());
		mav.addObject("blogTotal",items.getTotal());
		
		if(type==2){
			searchPaging = new BoardPaging(pageNo,items.getTotal());
			mav.addObject("searchPaging",searchPaging);
		}
	}
	
	/**
	 * @function : 웹 검색 결과를 설정
	 * @process  : DocRssWeb 을 이용하여 네이버 API로 검색을 하여 웹 검색 결과를 받아옴
	 * 
	 * @MethodName : setSearchWeb
	 * @param schText
	 *  검색어
	 * @param pageNo
	 * 현재 페이지 정보
	 * @param type
	 * 결과 타입
	 * @throws Exception
	 */
	public void setSearchWeb(String schText,int pageNo,int type) throws Exception {
		int display=0;
		if(type==0){//존재유무
			display = 1;
		}else if(type==1){//메인리스트
			display = 5;
		}else if(type==2){//페이징리스트
			display = 20;
		}
		
		DocRssWeb items = new DocRssWeb(schText,display,pageNo);
		mav.addObject("webList",items.getList());
		mav.addObject("webTotal",items.getTotal());
		
		if(type==2){
			searchPaging = new BoardPaging(pageNo,items.getTotal());
			mav.addObject("searchPaging",searchPaging);
		}
	}

	/**
	 * @function : 검색어와 검색페이지 url을 인코드
	 * @process  : url과 검색어를 캐릭터셋 euc-kr로 설정 후 euc-kr로 url인코드하고 서브메뉴 값과 게시판 값을 붙여 ModelAndView에 오브젝트 추가 
	 * 
	 * @MethodName : setRequestParameter
	 * @param request
	 * @throws Exception
	 */
	private void setRequestParameter(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("euc-kr");
		
		urlQuery = "search.htm";
		
		this.schText = Common.toEUCKR(Common.strToStr(request.getParameter("schText")));
		mav.addObject("schText", this.schText);
		mav.addObject("enSchText", Common.enURLK(this.schText));
		urlQuery=urlQuery+"?schText="+Common.enURLK(this.schText);
		
		this.subMenu = Common.strToStr(request.getParameter("subMenu"), "main");
		mav.addObject("subMenu",this.subMenu);
		urlQuery=urlQuery+"&subMenu="+subMenu;
		
		this.board = Common.strToInt(request.getParameter("board"));
		mav.addObject("board",this.board);
		urlQuery=urlQuery+"&board="+board;
		
		this.pageNo = Common.strToInt(request.getParameter("pageNo"), 1);
		//urlQuery=urlQuery+"&pageNo="+pageNo;
		
		mav.addObject("urlQuery",urlQuery);
	}
	
	/**
	 * @function : 프로그램 검색결과 하이라이트 및 썸네일 이미지 리매핑
	 * @process  : 전달받은 프로그램 리스트 중 검색어와 매칭되는 텍스트를 리플레이스 시킴. 이후 리스트를 루프돌며 이미지 설정해줌. 이미지 url이 있을 경우에 해당 url 없을경우 default.gif 로 매핑
	 * 
	 * @MethodName : remapProgram
	 * @param list
	 * 프로그램 리스트 인자
	 */
	private void remapProgram(ArrayList<Vod> list){
		String imageUrl;
		for(Vod item:list){
			item.setCode_name(replaceSchText(schText,item.getCode_name()));
			imageUrl = item.getPhoto_url();
			if(imageUrl == null || imageUrl.length()<1){
				item.setPhoto_url(ctxRoot+"images/search/default.gif");
			}else{
				item.setPhoto_url(ctxRoot+Common.uploadFolder+"vod/"+imageUrl);
			}
		}
	}
	
	/**
	 * @function : 뉴스 검색결과 하이라이트 처리
	 * @process  : 전달받은 뉴스 리스트를 루프돌며 타이틀과 콘텐츠에 맞는 부분을 하이라이트 시킴.
	 * 
	 * @MethodName : remapNews
	 * @param list
	 */
	private void remapNews(ArrayList<News> list){
		String imageUrl;
		for(News item:list){
			item.setMaincd(Common.newsCategory[Integer.parseInt(item.getGroup_flag())]);
			item.setSubcd(Common.newsGroup[Integer.parseInt(item.getGroup_flag())]);
			item.setTitle(replaceSchText(schText,item.getTitle()));
			item.setContent(Common.replaceBRtoSpace(item.getContent()));
			item.setContent(replaceSchText(schText,item.getContent()));
			imageUrl = item.getSvrfile2();
			if(imageUrl == null || imageUrl.length()<1){
				item.setSvrfile2("");
			}else{
				item.setSvrfile2(ctxRoot+Common.uploadFolder+"news/"+imageUrl);
			}
		}
	}
	
	/**
	 * @function : vod 검색 결과 하이라이트 및 썸네일 리매핑
	 * @process  : 전달받은 vod 리스트 중 검색어와 매칭되는 텍스트를 리플레이스 시킴. 이후 리스트를 루프돌며 이미지 설정해줌. 이미지 url이 있을 경우에 해당 url 없을경우 default.gif 로 매핑
	 * 
	 * @MethodName : remapVod
	 * @param list
	 */
	private void remapVod(ArrayList<Vod> list){
		String imageUrl;
		for(Vod item:list){
			item.setVodname(replaceSchText(schText,item.getVodname()));
			imageUrl = item.getPhoto_url();
			if(imageUrl == null || imageUrl.length()<1){
				item.setPhoto_url(ctxRoot+"images/search/default.gif");
			}else{
				item.setPhoto_url(ctxRoot+Common.uploadFolder+"vod/"+imageUrl);
			}
		}
	}
	
	/**
	 * @function : 게시판 검색 결과 하이라이트 처리 및 링크 처리  
	 * @process  : 게시판 검색 결과 리스트를 루프돌며 링크 매핑 후 매칭되는 텍스트 하이라이트 
	 * 
	 * @MethodName : remapBoard
	 * @param list
	 * @param board
	 */
	private void remapBoard(ArrayList<Board> list, int board){
		//String boardId = Common.boardId[board];
		String viewHref = ctxRoot+"contents/"+Common.boardMenu[board]+".htm?muid="+Common.boardMuid[board]+"&pageSize=20&pageView=10&cuid=0&guid=&schType=&schText=&pageNo=1&mode=view&buid=";
		for(Board item:list){
			if(board==3)
				item.setViewHref(ctxRoot+"contents/program.htm?muid="+item.getBoard_cate_uid()+"&pageSize=20&pageView=10&cuid=0&guid="+item.getBoard_group_id()+"&schType=&schText=&pageNo=1&mode=view&buid="+item.getBoard_uid());
			else
				item.setViewHref(viewHref+item.getBoard_uid());
			item.setBoard_title(replaceSchText(schText,item.getBoard_title()));
			item.setBoard_contents(replaceSchText(schText,item.getBoard_contents()));
			item.setBoard_regdate(item.getBoard_regdate().substring(0, 10));
		}
	}
	
	/**
	 * @function : 검색결과 검색어 하이라이트 처리
	 * @process  : 검색결과에 매칭되는 텍스트들을 replace 시켜span영역으로 설정 후 하이라이트를 처리하여줌. 
	 * 
	 * @MethodName : replaceSchText
	 * @param schText
	 * 검색어
	 * @param str
	 * 검색결과 단어
	 * @return
	 */
	private String replaceSchText(String schText, String str){
		return str.replace(schText,"<span class=\"sch_text\">"+schText+"</span>");
	}
}
