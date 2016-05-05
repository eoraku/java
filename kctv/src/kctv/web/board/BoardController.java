package kctv.web.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kctv.exception.ErrorMsg;
import kctv.web.session.Session;
import kctv.web.common.Common;
import kctv.web.common.CountUpdate;
import kctv.web.common.FileRenameTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

/**
 * <pre>
 * kctv.web.board
 * BoardController.java
 * </pre>
 * <pre>
 * 게시판 동작과 관한 컨트롤러
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 30.
 * @version: 
 */
@Controller
@RequestMapping("/board")
public class BoardController {
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Value("#{config['uploadPath']}") String uploadPath;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	ModelAndView mav;
	HttpSession session;
	BoardConfig boardConfig;
	BoardParameter boardParameter;
	
	int muid;
	int buid;
	int cuid;
	String guid;
	int pageNo;
	int pageSize;
	int pageView;
	int total;
	
	String schType;
	String schText;
	String urlQuery="";
	
	boolean isLogin=false;
	boolean isAdmin=false;
	boolean isPgBoard=false;
	boolean isAdminPage=false;
	
	private void common(HttpSession session, boolean isLeftMenu,String boardId,String page) throws Exception {
		this.session = session;
		
		//게시판 설정 정보 가져오기 PG_Board 와 BD_Board
		if(boardId.length()>7 && boardId.substring(0,7).equals("pgBoard")){
			isPgBoard=true;
			this.guid=boardId.substring(8);
			boardConfig = (BoardConfig)sqlMapClientTemplate.queryForObject("getPgBoardConfig",guid);
			boardConfig.setCfg_board_table("pg_board");
			boardConfig.setCfg_is_category("0");
			boardConfig.setCfg_is_group("1");
			boardConfig.setCfg_is_file("1");
			/*boardConfig=new BoardConfig();
			boardConfig.setCfg_board_name("pg_board");
			boardConfig.setCfg_board_table("pg_board");
			boardConfig.setCfg_is_memberboard("1");
			boardConfig.setCfg_is_category("0");
			boardConfig.setCfg_is_comment("1");
			boardConfig.setCfg_skin_list("list_pg");
			boardConfig.setCfg_skin_read("read_pg");
			boardConfig.setCfg_skin_write("write_pg");
			boardConfig.setCfg_skin_pwd("pwd_pg");
			boardConfig.setCfg_skin_comment("comment_pg");*/
			//System.out.println("pdBoard");
		}
		else{
			isPgBoard=false;
			boardConfig = (BoardConfig)sqlMapClientTemplate.queryForObject("getBoardConfig",boardId);
		}
		
		String skin="";
		
		if(page.equals("list"))
			skin=boardConfig.getCfg_skin_list();
		else if(page.equals("view"))
			skin=boardConfig.getCfg_skin_read();
		else if(page.equals("write") || page.equals("reply") || page.equals("edit"))
			skin=boardConfig.getCfg_skin_write();
		else if(page.equals("pwd"))
			skin=boardConfig.getCfg_skin_pwd();
		else if(page.equals("comment"))
			skin=boardConfig.getCfg_skin_comment();
		
		skin=skin.replace(".asp", "");
		skin=skin.replace(".html", "");
		
		if(page.equals(""))
			mav = new ModelAndView("include/common_receive");
		else
			mav = new ModelAndView("board/"+page+"/"+skin);
		
		isLogin=Session.chkLogin(session, mav);
		isAdmin=Session.chkAdmin(session, mav);
	}
	
	/**
	 * @function : 게시판 상단 영역 설정
	 * @process  : 
	 * 
	 * @MethodName : contents_top
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/content_top.htm")
	public ModelAndView contents_top() throws Exception {
		mav = new ModelAndView("board/content_top");
		return mav;
	}
	
	/**
	 * @function : 게시글 작성
	 * @process  : 
	 * 
	 * @MethodName : board_write
	 * @param request
	 * @param boardId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{boardId}/write.htm",method=RequestMethod.GET)
	public ModelAndView board_write(HttpServletRequest request,@PathVariable("boardId") String boardId) throws Exception {
		common(request.getSession(),false,boardId,"write");
		if(chkBoardRight("write")){
			setRequestParameter(request);
			setCategoryList();
			
			int maxFileSize = 0;
			int maxFileCnt = 0;
			int maxSumFileSize = 0;
			
			//파일 사용 여부 체크
			if(boardConfig.isFile()){
				maxFileSize = boardConfig.getCfg_max_filesize();
				//maxFileCnt = boardConfig.getCfg_max_file_cnt();
				maxFileCnt = 1;
				maxSumFileSize = maxFileSize*maxFileCnt;
				mav.addObject("isFile",true);
			}
			
			//게시판 설정값 추가
			mav.addObject("pageTitle","글 쓰 기");
			mav.addObject("allowFile",boardConfig.getCfg_allow_file());
			mav.addObject("maxFileSize",maxFileSize);
			mav.addObject("maxFileMB",(int)Math.floor(maxFileSize/1024/1024));
			mav.addObject("maxFileCnt",maxFileCnt);
			mav.addObject("maxSumFileSize",maxSumFileSize);
			
			//공지사항 사용 여부 확인
			if(isAdmin && boardConfig.getCfg_is_notice()!=null && boardConfig.getCfg_is_notice().equals("1")){
				mav.addObject("isNotice",true);
			}
			
			mav.addObject("muid",muid);
			mav.addObject("guid",guid);
			
			setSubmitURL(boardId,"write_run");
			setBoardParameter("write");
		}else{
			goMsgRoot("글 쓰기 권한이 없습니다.");
		}
		return mav;
	}
	
	/**
	 * @function : 게시글 등록
	 * @process  : 
	 * 
	 * @MethodName : board_write_run
	 * @param request
	 * @param boardId
	 * @return
	 * @throws Exception
	 */
	@Transactional
	@RequestMapping(value="/{boardId}/write_run.htm",method=RequestMethod.POST)
	public ModelAndView board_write_run(HttpServletRequest request,@PathVariable("boardId") String boardId) throws Exception {
		board_process("write",request,boardId);
		
		return mav;
	}
	
	/**
	 * @function : 답글 달기
	 * @process  : 
	 * 
	 * @MethodName : board_reply
	 * @param request
	 * @param boardId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{boardId}/reply.htm",method=RequestMethod.GET)
	public ModelAndView board_reply(HttpServletRequest request,@PathVariable("boardId") String boardId) throws Exception {
		common(request.getSession(),false,boardId,"write");
		if(chkBoardRight("reply")){
			setRequestParameter(request);
			setCategoryList();
			
			int maxFileSize = 0;
			int maxFileCnt = 0;
			int maxSumFileSize = 0;
			
			//파일 사용여부 체크
			if(boardConfig.isFile()){
				maxFileSize = boardConfig.getCfg_max_filesize();
				//maxFileCnt = boardConfig.getCfg_max_file_cnt();
				maxFileCnt = 1;
				maxSumFileSize = maxFileSize*maxFileCnt;
				mav.addObject("isFile",true);
			}
			
			boardParameter = new BoardParameter(boardConfig.getCfg_board_table(),buid,schType,schText);
			Board boardView = (Board)sqlMapClientTemplate.queryForObject("boardReply",boardParameter);
			boardView.setBoard_title("[re]"+boardView.getBoard_title());
			mav.addObject("boardView",boardView);
			mav.addObject("isReply",true);
			
			mav.addObject("pageTitle","답변하기");
			mav.addObject("allowFile",boardConfig.getCfg_allow_file());
			mav.addObject("maxFileSize",maxFileSize);
			mav.addObject("maxFileMB",(int)Math.floor(maxFileSize/1024/1024));
			mav.addObject("maxFileCnt",maxFileCnt);
			mav.addObject("maxSumFileSize",maxSumFileSize);
			
			mav.addObject("muid",muid);
			mav.addObject("guid",guid);
			
			setSubmitURL(boardId,"reply_run");
			setBoardParameter("reply");
		}
		else{
			goMsgRoot("답변 권한이 없습니다.");
		}
		return mav;
	}
	
	/**
	 * @function : 답글 등록
	 * @process  : 
	 * 
	 * @MethodName : board_reply_run
	 * @param request
	 * @param boardId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{boardId}/reply_run.htm",method=RequestMethod.POST)
	public ModelAndView board_reply_run(HttpServletRequest request,@PathVariable("boardId") String boardId) throws Exception {
		board_process("reply",request,boardId);
		
		return mav;
	}
	
	/**
	 * @function : 게시글 리스팅
	 * @process  : 
	 * 
	 * @MethodName : board_list
	 * @param request
	 * @param boardId
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/{boardId}/list.htm",method=RequestMethod.GET)
	public ModelAndView board_list(HttpServletRequest request,@PathVariable("boardId") String boardId) throws Exception {
		common(request.getSession(),false,boardId,"list");
		if(chkBoardRight("list")){
			setRequestParameter(request);
			
			ArrayList<Board> boardList;
			BoardPaging boardPaging;
			
			if(boardConfig.isCategory())
				setCategoryList();
			
			//게시판 설정 정보 세팅
			boardParameter = new BoardParameter(boardConfig.getCfg_board_table(),boardConfig.isCategory(),cuid,boardConfig.isGroup(),guid,boardConfig.isFile(),pageNo,pageSize,schType,schText);
			
			boardList = (ArrayList<Board>)sqlMapClientTemplate.queryForList("boardList",boardParameter);
			total = (Integer)sqlMapClientTemplate.queryForObject("boardCnt",boardParameter);
			
			setBoardParameter("list");
			
			for(Board item:boardList){
				if(item.getBoard_step()>0){
					item.setLeftSpace(" style=\"padding-left:"+item.getBoard_depth()*15+"px;\"");
				}
				if(boardParameter.viewBtnView){
					item.setViewHref(urlQuery+"&pageNo="+pageNo+"&mode=view&buid="+item.getBoard_uid());
				}
				else{
					item.setViewHref("#\" onclick=\"msgView('view');");
				}
				if(boardConfig.isComment()){
					item.setComments(" ("+item.board_comment_cnt+")");
				}
				
				if(boardConfig.isFile() && item.getPds_uid()>0){
					item.setFileLink("<img src=\""+ctxRoot+"images/board/file.gif\""+" width=\"14\" height=\"13\"/>");
				}
				
				if(item.getBoard_is_notice().equals("1")){
					item.setBoard_title("<strong>[공지]"+item.getBoard_title()+"</strong>");
				}
				
				if(item.getNew_icon() != null && item.getNew_icon().equals("1"))
					item.setNew_icon(" <span style=\'color:red;\'>[New]</span>");
				else
					item.setNew_icon("");
			}
			
			boardPaging = new BoardPaging(pageNo,total);
			
			mav.addObject("boardList",boardList);
			mav.addObject("total",total);
			mav.addObject("boardPaging",boardPaging);
		}else{
			goMsgRoot("접근 권한이 없습니다.");
		}
		
		return mav;
	}
	
	/**
	 * @function : 게시글 보기
	 * @process  : 
	 * 
	 * @MethodName : board_view
	 * @param request
	 * @param boardId
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/{boardId}/view.htm",method=RequestMethod.GET)
	public ModelAndView board_view(HttpServletRequest request,@PathVariable("boardId") String boardId) throws Exception {
		common(request.getSession(),false,boardId,"view");
		if(chkBoardRight("view")){
			setRequestParameter(request);
			
			Board boardView;
			
			boardParameter = new BoardParameter(boardConfig.getCfg_board_table(),buid,schType,schText);
			if(boardConfig.isFile())
				boardView = (Board)sqlMapClientTemplate.queryForObject("boardView2",boardParameter);
			else
				boardView = (Board)sqlMapClientTemplate.queryForObject("boardView1",boardParameter);
			mav.addObject("boardView",boardView);
			
			if(boardConfig.isCategory())
				setCategoryName(boardConfig.getCfg_board_table(),boardView.getBoard_cate_uid());
			
			if(chkBoardRightEdit(boardView.getBoard_userid())){
				boardParameter.setViewBtnEdit(true);
				boardParameter.setViewBtnDel(true);
			}
			
			if(boardConfig.isFile() && boardView.getPds_uid()>0){
				mav.addObject("isFile",true);
				Pds pds = (Pds)sqlMapClientTemplate.queryForObject("getPds",boardParameter);
				mav.addObject("pds",pds);
			}
			
			if(boardConfig.isComment()){
				mav.addObject("isComment",true);
				ArrayList<Comment> listComment = (ArrayList<Comment>)sqlMapClientTemplate.queryForList("listComment",boardParameter);
				for(Comment item:listComment){
					item.setComment_contents(Common.replaceLineToBR(item.getComment_contents()));
					if(isAdmin)
						item.viewDel = true;
					else if(isLogin)
						item.setViewDel(session.getAttribute("userid").toString());
				}
				mav.addObject("listComment",listComment);
				mav.addObject("listTotal",listComment.size());
				
				setSubmitURL(boardId,"comment");
			}
			
			CountUpdate countUpdate = new CountUpdate(boardConfig.getCfg_board_table(),"board_hit","board_uid="+buid);
			sqlMapClientTemplate.update("cntUpdate",countUpdate);
			
			setBoardParameter("view");
		}else{
			goMsgRoot("글 보기 권한이 없습니다.");
		}
		
		return mav;
	}
	
	/**
	 * @function : 댓글 추가
	 * @process  : 
	 * 
	 * @MethodName : board_comment
	 * @param boardId
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{boardId}/comment.htm",method=RequestMethod.POST)
	public ModelAndView board_comment(@PathVariable("boardId") String boardId, HttpServletRequest request) throws Exception {
		common(request.getSession(),false,boardId,"");
		request.setCharacterEncoding("euc-kr");
		
		String mode = request.getParameter("mode");
		if(mode == null || mode.length()<1) mode = "new";
		int board_uid = Integer.parseInt(request.getParameter("buid"));
		
		Comment comment = new Comment();
		comment.setBoardId(boardParameter.getBoardId());
		
		CountUpdate countUpdate = new CountUpdate(boardParameter.getBoardId(), "board_comment_cnt", "board_uid="+board_uid);
		
		if(mode.equals("new")){
			String userid;
			String name;
			if(isAdmin){
				userid = session.getAttribute("adminId").toString();
				name = session.getAttribute("adminName").toString();
			}else{
				userid = session.getAttribute("userid").toString();
				name = session.getAttribute("name").toString();
			}
			
			String contents = request.getParameter("contents");
			
			comment.setComment_board_uid(board_uid);
			comment.setComment_userid(userid);
			comment.setComment_name(name);
			comment.setComment_contents(contents);
			comment.setComment_ip(request.getRemoteAddr());
			sqlMapClientTemplate.insert("insertComment",comment);
			sqlMapClientTemplate.update("cntUpdate",countUpdate);
			mav.addObject("msg","댓글이 추가되었습니다.");
		}else if(mode.equals("del")){
			int comment_uid = Integer.parseInt(request.getParameter("cuid"));
			comment.setComment_uid(comment_uid);
			sqlMapClientTemplate.insert("deleteComment",comment);
			sqlMapClientTemplate.update("cntUpdateM",countUpdate);
			mav.addObject("msg","댓글이 삭제되었습니다.");
		}
		
		setWriteNextPage(request.getParameter("menu"), request.getParameter("muid"), request.getParameter("guid"), request.getParameter("isAdminPage"),board_uid);
		
		return mav;
	}
	
	/**
	 * @function : 게시글 수정
	 * @process  : 
	 * 
	 * @MethodName : board_edit
	 * @param request
	 * @param boardId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{boardId}/edit.htm",method=RequestMethod.GET)
	public ModelAndView board_edit(HttpServletRequest request,@PathVariable("boardId") String boardId) throws Exception {
		common(request.getSession(),false,boardId,"write");
		
		boardParameter = new BoardParameter(boardConfig.getCfg_board_table(),buid,schType,schText);
		String boardUserid = (String)sqlMapClientTemplate.queryForObject("boardUserid",boardParameter);
		
		if(chkBoardRightEdit(boardUserid)){		//게시글 작성자인지 확인
			setRequestParameter(request);
			setCategoryList();
			
			Board boardView;
			if(boardConfig.isFile())
				boardView = (Board)sqlMapClientTemplate.queryForObject("boardView2",boardParameter);
			else
				boardView = (Board)sqlMapClientTemplate.queryForObject("boardView1",boardParameter);
			
			int maxFileSize = 0;
			int maxFileCnt = 0;
			int maxSumFileSize = 0;
			
			if(boardConfig.isFile()){
				maxFileSize = boardConfig.getCfg_max_filesize();
				//maxFileCnt = boardConfig.getCfg_max_file_cnt();
				maxFileCnt = 1;
				maxSumFileSize = maxFileSize*maxFileCnt;
				mav.addObject("isFile",true);
				
				if(boardView.getPds_uid()>0){
					Pds pds = (Pds)sqlMapClientTemplate.queryForObject("getPds",boardParameter);
					mav.addObject("pds",pds);
				}
			}
			
			mav.addObject("boardView",boardView);
			mav.addObject("pageTitle","수정하기");
			mav.addObject("allowFile",boardConfig.getCfg_allow_file());
			mav.addObject("maxFileSize",maxFileSize);
			mav.addObject("maxFileMB",(int)Math.floor(maxFileSize/1024/1024));
			mav.addObject("maxFileCnt",maxFileCnt);
			mav.addObject("maxSumFileSize",maxSumFileSize);
			
			mav.addObject("muid",muid);
			mav.addObject("guid",guid);
			
			setSubmitURL(boardId,"edit_run");
			setBoardParameter("write");
		}else{
			goMsgRoot("글 수정 권한이 없습니다.");
		}
		return mav;
	}
	
	/**
	 * @function : 게시글 수정 등록 
	 * @process  : 
	 * 
	 * @MethodName : board_edit_run
	 * @param request
	 * @param boardId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{boardId}/edit_run.htm",method=RequestMethod.POST)
	public ModelAndView board_edit_run(HttpServletRequest request,@PathVariable("boardId") String boardId) throws Exception {
		board_process("edit",request,boardId);
		
		return mav;
	}
	
	/**
	 * @function : 게시글 삭제
	 * @process  : 
	 * 
	 * @MethodName : board_del
	 * @param request
	 * @param boardId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/{boardId}/del.htm","/{boardId}/delFile.htm"},method=RequestMethod.GET)
	public ModelAndView board_del(HttpServletRequest request,@PathVariable("boardId") String boardId) throws Exception {
		common(request.getSession(),false,boardId,"");
		
		String mode = request.getParameter("mode");
		
		boardParameter = new BoardParameter(boardConfig.getCfg_board_table(),buid,schType,schText);
		String boardUserid = (String)sqlMapClientTemplate.queryForObject("boardUserid",boardParameter);
		
		if(chkBoardRightEdit(boardUserid)){
			
			if(boardConfig.isFile()){
				//첨부파일 정보 있을경우 삭제
				Pds pds = (Pds)sqlMapClientTemplate.queryForObject("getPds",boardParameter);
				if(pds != null){
					sqlMapClientTemplate.delete("pdsDelete",boardParameter);
					Common.deleteFile(uploadPath+pds.getPds_dir()+pds.getPds_file_name1());
				}
			}
			
			if(mode.equals("del"))
				sqlMapClientTemplate.delete("boardDelete",boardParameter);
			
			mav.addObject("msg","삭제되었습니다.");
			if(mode.equals("del"))
				mav.addObject("go_url",ctxRoot+"contents/"+request.getParameter("menu")+".htm?muid="+request.getParameter("muid")+"&guid="+request.getParameter("guid")+"&mode=list");
			else
				mav.addObject("go_url",ctxRoot+"contents/"+request.getParameter("menu")+".htm?muid="+request.getParameter("muid")+"&guid="+request.getParameter("guid")+"&mode=view&buid="+buid);
		}else{
			goMsgRoot("삭제 권한이 없습니다.");
		}
		return mav;
	}
	
	/**
	 * @function : 파일 다운로드
	 * @process  : 
	 * 
	 * @MethodName : board_download
	 * @param request
	 * @param response
	 * @param boardId
	 * @throws Exception
	 */
	@RequestMapping(value="/{boardId}/download.htm",method=RequestMethod.GET)
	public void board_download(HttpServletRequest request, HttpServletResponse response, @PathVariable("boardId") String boardId) throws Exception {
		int buid = Common.strToInt(request.getParameter("buid"),0);
		common(request.getSession(),false,boardId,"");
		String pdsTable;
		
		if(boardId.length()>7 && boardId.substring(0,7).equals("pgBoard")){
			pdsTable = "pg_board_pds";
			boardParameter = new BoardParameter("pg_board",buid,"","");
		}else{
			pdsTable = "bd_"+boardId+"_pds";
			boardParameter = new BoardParameter(boardConfig.getCfg_board_table(),buid,"","");
		}
		
		Pds pds = (Pds)sqlMapClientTemplate.queryForObject("getPds", boardParameter);
		
		String filePath = uploadPath+pds.getPds_dir().trim()+pds.getPds_file_name1();
		File file = new File(filePath);
		
		if(file.exists()){
			// 파일 다운로드를 위한 컨텐트 타입 설정.
			response.setContentType("application/octet-stream");
			// 다운로드 되는 파일의 크기 설정.
			response.setContentLength((int)file.length());
			// Content-Disposition 헤더를 이용해서 전송되는 파일의 이름 명시.
			String header = request.getHeader("User-Agent");
			String fileName;
			if(header.indexOf("MSIE") > -1){
				//fileName = URLEncoder.encode(pds.getPds_file_name2(),"8859_1");
				fileName = new String(pds.getPds_file_name2().getBytes("euc-kr"),"8859_1");
			}else{
				fileName = new String(pds.getPds_file_name2().getBytes("euc-kr"),"8859_1");
			}
			//fileName.replace("+", "_");
			response.setHeader("Content-Disposition", "attachment;fileName=\"" + fileName + "\";");
			// 전송되는 데이터의 인코딩이 바이너리 타입이라는 것을 명시.
			response.setHeader("Content-Transfer-Encoding", "binary");
			// 헤더 설정 후 response의 OutputStream에 파일을 전송.
			OutputStream out = response.getOutputStream();
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(file);
				FileCopyUtils.copy(fis, out);
			} finally {
				
				CountUpdate countUpdate = new CountUpdate(pdsTable,"pds_hit","pds_board_uid="+buid);
				sqlMapClientTemplate.update("cntUpdate",countUpdate);
				if (fis != null) {
					try {
						fis.close();
					} catch (IOException ex) {
					}
				}
			}
			// response의 OutputStream의 버퍼에 저장된 데이터를 전송.
			out.flush();
		}else{
			throw new ErrorMsg(new String("파일이 존재하지 않습니다."));
		}
	}
	
	/**
	 * @function : 실제 게시글 등록 / 수정 답글 동작
	 * @process  : 
	 * 
	 * @MethodName : board_process
	 * @param mode
	 * @param request
	 * @param boardId
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@Transactional
	private void board_process(String mode, HttpServletRequest request,String boardId) throws Exception {
		common(request.getSession(),false,boardId,"");
		
		/*System.out.println(request.getRemoteAddr());
		System.out.println(request.getHeader("WL-Proxy-Client-IP"));
		System.out.println(request.getHeader("Proxy-Client-IP"));
		System.out.println(request.getHeader("X-Forwarded-For"));*/
		
		int boardNextUid;
		int boardNextFid;
		int maxFileSize = 0;
		int maxSumFileSize = 0;
		String folerName = "";
		String realPath = "";
		
		boardParameter = new BoardParameter(boardConfig.getCfg_board_table());
		
		if(boardConfig.isFile()){
			maxFileSize = boardConfig.getCfg_max_filesize();
			maxSumFileSize = maxFileSize*boardConfig.getCfg_max_file_cnt();
			folerName = boardParameter.getBoardId() + "/" + Common.getDate() + "/";
			realPath = uploadPath + folerName;
			
			Common.makeDir(realPath);
		}
		
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSumFileSize, "euc-kr", new FileRenameTime());
		
		Board board=new Board();
		
		//System.out.println(mode);
		
		if(mode.equals("write")){
			boardNextUid = (Integer)sqlMapClientTemplate.queryForObject("boardNextUid",boardParameter.getBoardId());
			boardNextFid = (Integer)sqlMapClientTemplate.queryForObject("boardNextFid",boardParameter.getBoardId());
			board.setBoard_uid(boardNextUid);
			board.setBoard_fid(boardNextFid);
			board.setBoard_step(0);
			board.setBoard_depth(0);
		}else if(mode.equals("reply")){
			boardNextUid = (Integer)sqlMapClientTemplate.queryForObject("boardNextUid",boardParameter.getBoardId());
			board.setBoard_uid(boardNextUid);
			board.setBoard_fid(Integer.parseInt(multi.getParameter("fid")));
			board.setBoard_step(Integer.parseInt(multi.getParameter("step"))+1);
			board.setBoard_depth(Integer.parseInt(multi.getParameter("depth"))+1);
		}else{
			boardNextUid = Integer.parseInt(multi.getParameter("buid"));
			board.setBoard_uid(boardNextUid);
		}
		
		if(isLogin){
			board.setBoard_userid(session.getAttribute("userid").toString());
			board.setBoard_name(session.getAttribute("name").toString());
			board.setBoard_email(session.getAttribute("email").toString());
		}else if(isAdmin){
			board.setBoard_userid(session.getAttribute("adminId").toString());
			board.setBoard_name(session.getAttribute("adminName").toString());
			board.setBoard_email(multi.getParameter("email"));
		}else{
			board.setBoard_userid(null);
			board.setBoard_name(multi.getParameter("name"));
			board.setBoard_email(multi.getParameter("email"));
		}
		
		board.setBoard_title(multi.getParameter("title"));
		board.setBoard_contents(multi.getParameter("contents"));
		board.setBoard_ip(request.getRemoteAddr());
		
		if(isPgBoard) board.setBoard_group_id(multi.getParameter("guid"));
		
		if(boardConfig.isCategory()) board.setBoard_cate_uid(Integer.parseInt(multi.getParameter("category")));
		else board.setBoard_cate_uid(0);
		
		/*System.out.println(board.getBoard_uid());
		System.out.println(board.getBoard_fid());
		System.out.println(board.getBoard_step());
		System.out.println(board.getBoard_depth());
		System.out.println(board.getBoard_name());
		System.out.println(board.getBoard_email());
		System.out.println(board.getBoard_title());
		System.out.println(board.getBoard_ip());
		System.out.println(board.getBoard_hit());
		System.out.println(board.getBoard_vote());
		System.out.println(board.getBoard_comment_cnt());
		System.out.println(board.getBoard_cate_uid());
		System.out.println(board.getBoard_userid());
		System.out.println(board.getBoard_group_id());
		System.out.println(board.getBoard_is_secret());
		System.out.println(board.getBoard_is_file());
		System.out.println(board.getBoard_is_html());
		System.out.println(board.getBoard_is_notice());*/
		
		board.setBoard_id(boardParameter.getBoardId());
		
		board.setBoard_is_notice(Common.strToStr(multi.getParameter("isNotice"),"0"));

		if(mode.equals("write") || mode.equals("reply"))
			sqlMapClientTemplate.insert("boardInsert",board);
		else{
			sqlMapClientTemplate.update("boardUpdate",board);
		}

		if(boardConfig.isFile()){
			if(mode.equals("edit")){
				Enumeration efiles = multi.getFileNames();
				String fileName;
				String newFileName;
				long fileLength = 0;
				
				while(efiles.hasMoreElements()){
					fileName = (String)efiles.nextElement();
					newFileName = multi.getFilesystemName(fileName);
					if(newFileName != null){
						fileLength = ((File)multi.getFile(fileName)).length();
					}
				}
				
				if(fileLength>0){
					boardParameter.setBuid(boardNextUid);
					Pds pds = (Pds)sqlMapClientTemplate.queryForObject("getPds",boardParameter);
					if(pds != null){
						sqlMapClientTemplate.delete("pdsDelete",boardParameter);
						Common.deleteFile(uploadPath+pds.getPds_dir()+pds.getPds_file_name1());
					}
				}
			}
			Common.pdsInsert(sqlMapClientTemplate, multi, boardNextUid, boardParameter.getBoardId(), folerName);
		}
		
		setWriteNextPage(multi.getParameter("menu"), multi.getParameter("muid"), multi.getParameter("guid"), multi.getParameter("isAdminPage"),0);
		
		/*if(isPgBoard)
			mav.addObject("go_url",ctxRoot+"contents/"+multi.getParameter("menu")+".htm?muid="+muid+"&guid="+multi.getParameter("guid"));
		else if(multi.getParameter("isAdminPage")!=null && multi.getParameter("isAdminPage").equals("1"))
			mav.addObject("go_url",ctxRoot+"admin/board/"+boardConfig.getCfg_board_id()+"/board.asp");
		else
			mav.addObject("go_url",ctxRoot+"contents/"+multi.getParameter("menu")+".htm?muid="+multi.getParameter("muid"));*/
	}
	
	/**
	 * @function : 게시글 등록 후 이동할 url 설정
	 * @process  : 
	 * 
	 * @MethodName : setWriteNextPage
	 * @param menu
	 * @param muid
	 * @param guid
	 * @param isAdminPage
	 * @param buid
	 */
	private void setWriteNextPage(String menu, String muid, String guid, String isAdminPage, int buid){
		String view;
		if(buid>0)
			view = "&mode=view&buid="+buid;
		else
			view = "";
		
		if(isPgBoard)
			mav.addObject("go_url",ctxRoot+"contents/"+menu+".htm?muid="+muid+"&guid="+guid+view);
		else if(isAdminPage!=null && isAdminPage.equals("1"))
			mav.addObject("go_url",ctxRoot+"admin/board/"+boardConfig.getCfg_board_id()+"/board.asp"+view);
		else
			mav.addObject("go_url",ctxRoot+"contents/"+menu+".htm?muid="+muid+view);
	}
	
	/**
	 * @function : 에러 메시지 표시 
	 * @process  : 
	 * 
	 * @MethodName : goMsgRoot
	 * @param Msg
	 */
	private void goMsgRoot(String Msg){
		throw new ErrorMsg(new String(Msg+"|"+ctxRoot));
	}
	
	/**
	 * @function : 홈페이지 Request 정보 setter로 url 정보 설정
	 * @process  : 
	 * 
	 * @MethodName : setRequestParameter
	 * @param request
	 * @throws Exception
	 */
	private void setRequestParameter(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("euc-kr");
		urlQuery="";
		
		this.muid = Common.strToInt(request.getParameter("muid"),1);
		urlQuery=urlQuery+"?muid="+muid;
		
		this.pageNo = Common.strToInt(request.getParameter("pageNo"),1);
		//urlQuery=urlQuery+"&pageNo="+this.pageNo;
		
		this.pageSize = Common.strToInt(request.getParameter("pageSize"),20);
		urlQuery=urlQuery+"&pageSize="+this.pageSize;
		
		this.pageView = Common.strToInt(request.getParameter("pageView"),10);
		urlQuery=urlQuery+"&pageView="+this.pageView;
		
		this.buid = Common.strToInt(request.getParameter("buid"));
		//urlQuery=urlQuery+"&buid="+this.buid;
		
		this.cuid = Common.strToInt(request.getParameter("cuid"));
		urlQuery=urlQuery+"&cuid="+this.cuid;
		
		if(!isPgBoard)
			this.guid = Common.strToStr(request.getParameter("guid"));
		urlQuery=urlQuery+"&guid="+this.guid;
		
		this.schType = Common.strToStr(request.getParameter("schType"));
		urlQuery=urlQuery+"&schType="+this.schType;
		
		this.schText = Common.strToStr(request.getParameter("schText"));
		this.schText = Common.toEUCKR(this.schText);
		//System.out.println(this.schText);
		urlQuery=urlQuery+"&schText="+this.schText;
		
		String tmp = request.getParameter("isAdminPage");
		if(tmp != null || tmp == "1"){
			urlQuery=urlQuery+"&schText="+schText+"&isAdminPage=1";
			mav.addObject("isAdminPage", true);
		}else
			urlQuery=urlQuery+"&schText="+schText;
		
		urlQuery=urlQuery+"&schText="+schText;
		
		mav.addObject("urlQuery",urlQuery);
	}
	
	/**
	 * @function : 글쓰기 답글 등 버튼에 대한 권한 확인 후 파라미터 설정
	 * @process  : 
	 * 
	 * @MethodName : setBoardParameter
	 * @param page
	 * @throws Exception
	 */
	private void setBoardParameter(String page) throws Exception {
		if(page.equals("list") && chkBoardRight("view")){
			boardParameter.setViewBtnView(true);
		}
		if(page.equals("list") && chkBoardRight("write")){
			boardParameter.setViewBtnWrite(true);
		}
		if(page.equals("view") && chkBoardRight("reply")){
			boardParameter.setViewBtnReply(true);
		}
		if(page.equals("view") && chkBoardRight("comment")){
			boardParameter.setViewBtnComment(true);
		}
		
		mav.addObject("boardConfig",boardConfig);
		mav.addObject("boardParameter",boardParameter);
	}
	
	/**
	 * @function : 게시판 권한 확인
	 * @process  : 
	 * 
	 * @MethodName : chkBoardRight
	 * @param mode
	 * @return
	 */
	private boolean chkBoardRight(String mode){
		boolean result = false;
		
		if(mode.equals("list")){
			if(isAdmin
					|| boardConfig.getCfg_grant_list()==0 
					|| (boardConfig.getCfg_grant_list()==2 && isLogin)
					|| (boardConfig.getCfg_grant_list()==1 && isAdmin)){
				result = true;
			}else
				result = false;
		}else if(mode.equals("view")){
			if(isAdmin
					|| boardConfig.getCfg_grant_read()==0 
					|| (boardConfig.getCfg_grant_read()==2 && isLogin)
					|| (boardConfig.getCfg_grant_read()==1 && isAdmin)){
				result = true;
			}else
				result = false;
		}else if(mode.equals("write") || mode.equals("reply") || mode.equals("edit")){
			if(isAdmin
					|| boardConfig.getCfg_grant_write()==0 
					|| (boardConfig.getCfg_grant_write()==2 && isLogin)
					|| (boardConfig.getCfg_grant_write()==1 && isAdmin)){
				result = true;
			}else
				result = false;
		}else if(mode.equals("comment")){
			if(isAdmin
					|| boardConfig.getCfg_grant_comment()==0 
					|| (boardConfig.getCfg_grant_comment()==2 && isLogin)
					|| (boardConfig.getCfg_grant_comment()==1 && isAdmin)){
				result = true;
			}else
				result = false;
		}else{
			result = false;
		}
		
		return result;
	}
	
	/**
	 * @function : 세션의 userid와 파람 userid 가 동일한지 체크 
	 * @process  : 
	 * 
	 * @MethodName : chkBoardRightEdit
	 * @param userid
	 * @return
	 */
	private boolean chkBoardRightEdit(String userid){
		//if(boardConfig.getCfg_is_memberboard().equals("0")){
		if(isAdmin){
			return true;
		}
		else{
			if(session.getAttribute("userid")!=null && session.getAttribute("userid").toString().equals(userid))
				return true;
			else
				return false;
		}
	}
	
	/**
	 * @function : 게시판 카테고리 설정
	 * @process  : 
	 * 
	 * @MethodName : setCategoryList
	 */
	private void setCategoryList(){
		if(boardConfig.isCategory())
		{
			@SuppressWarnings("unchecked")
			ArrayList<BoardCategory> cateList = (ArrayList<BoardCategory>)sqlMapClientTemplate.queryForList("boardCategoryList",boardConfig.getCfg_board_table());
			mav.addObject("cateList",cateList);
		}
	}
	
	/**
	 * @function : 카테고리 이름 설정
	 * @process  : 
	 * 
	 * @MethodName : setCategoryName
	 * @param boardId
	 * @param cate_uid
	 */
	private void setCategoryName(String boardId, int cate_uid){
		BoardCategory boardCategory = new BoardCategory(); 
		boardCategory.setBoardId(boardId);
		boardCategory.setCate_uid(cate_uid);
		
		String categoryName=(String)sqlMapClientTemplate.queryForObject("getCategoryName",boardCategory);
		mav.addObject("categoryName"," ["+categoryName+"]");
	}
	
	/**
	 * @function : 
	 * @process  : 
	 * 
	 * @MethodName : setSubmitURL
	 * @param boardId
	 * @param pageName
	 */
	private void setSubmitURL(String boardId,String pageName){
		mav.addObject("submitURL",ctxRoot+"board/"+boardId+"/"+pageName+".htm");
	}
}
