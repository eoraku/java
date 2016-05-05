package kctv.web.admin;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kctv.web.board.Board;
import kctv.web.board.BoardConfig;
import kctv.web.board.BoardPaging;
import kctv.web.board.BoardParameter;
import kctv.web.common.Common;
import kctv.web.common.CommonDelete;
import kctv.web.common.CommonUpdate;
import kctv.web.common.CountUpdate;
import kctv.web.common.FileInfo;
import kctv.web.common.FileRenameTime;
import kctv.web.common.Popup;
import kctv.web.common.PopupParameter;
import kctv.web.session.Session;
import kctv.web.user.User;
import kctv.web.vod.Vod;
import kctv.web.vod.VodCode;
import kctv.web.vod.VodParameter;
import kctv.web.vod.VodWeek;
import kctv.xml.BodoXml;
import kctv.xml.XPathBodo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

/**
 * <pre>
 * kctv.web.admin
 * AdminController.java
 * </pre>
 * <pre>
 * kctvjeju 관리자 페이지 컨트롤러 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 17.
 * @version: 
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Value("#{config['domain']}") String domain;
	@Value("#{config['uploadPath']}") String uploadPath;
	@Value("#{config['bodoXmlPath']}") String bodoXmlPath;
	@Value("#{config['asxPath']}") String asxPath;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	@Autowired private PlatformTransactionManager transactionManager;
	
	String serverUrl;
	String menu;
	String menuList[] = {"AD", "MM", "CD", "NE", "VO", "BD", "CA", "CL", "CM", "MA", "CF", "LG", "ET", "JA"};
	String program;
	String newsCategory[] = {"미정","정치","경제","사회","문화","행정","관광","교육","체육"};
	ModelAndView mav;
	HttpSession session;
	Admin admin;
	
	boolean isAdmin;
	
	/**
	 * @function : 관리 페이지 호출 처리 및 권한 확인
	 * @process  : 
	 * 
	 * @MethodName : common
	 * @param session
	 * @param page
	 * @param menuCode
	 */
	private void common(HttpSession session, String page, String menuCode){
		this.session = session;
		
		mav = new ModelAndView("admin/"+page);
		
		isAdmin = Session.chkAdmin(session, mav);
		
		if(session.getAttribute("adminId") != null && session.getAttribute("adminId").toString().length()>0)
			if(menuCode != null && admin.getAdad_level() != 1 && admin.getAdad_auth_menu().indexOf(menuCode) < 0)
				errMsgGoMain("접근 권한이 없습니다.", ctxRoot+"admin/main.asp");
		
		mav.addObject("ctxRoot",ctxRoot);
		
		if(!page.equals("login") && !page.equals("login_run"))
			chkAdminLogin();
		
		serverUrl = "http://"+domain+ctxRoot;
	}
	
	/**
	 * @function : 관리자 index
	 * @process  : 
	 * 
	 * @MethodName : index
	 * @param session
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/index.htm","/index.asp","/index_admin.asp","/admin_login.asp","/admin_login_su.asp"},method=RequestMethod.GET)
	public ModelAndView index(HttpSession session, HttpServletResponse response) throws Exception {
		common(session, "index", null);
		response.sendRedirect("admin_su.asp");
		return mav;
	}
	
	/**
	 * @function : 관리자 index
	 * @process  : 
	 * 
	 * @MethodName : admin_su
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin_su.asp",method=RequestMethod.GET)
	public ModelAndView admin_su(HttpSession session) throws Exception {
		common(session, "index", null);
		
		return mav;
	}
	
	/**
	 * @function : 로그인 페이지
	 * @process  : 
	 * 
	 * @MethodName : login
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login.asp",method=RequestMethod.GET)
	public ModelAndView login(HttpSession session) throws Exception {
		common(session, "login", null);
		session.invalidate();
		
		return mav;
	}
	
	/**
	 * @function : 로그인 처리
	 * @process  : 접근 경로 확인 후 유효한 경우 DB 조회 후 권한처리
	 * 
	 * @MethodName : login_run
	 * @param session
	 * @param request
	 * @param txt_adminId
	 * @param txt_passwd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login_run.asp",method=RequestMethod.POST)
	public ModelAndView login_run(HttpSession session
			,HttpServletRequest request
			,@RequestParam(value="txt_adminId",required=true,defaultValue="") String txt_adminId
			,@RequestParam(value="txt_passwd",required=true,defaultValue="") String txt_passwd
			) throws Exception {
		common(session, "login", null);
		
		if((txt_adminId.length()<1 || txt_passwd.length()<1) && !request.getHeader("REFERER").equals(serverUrl+"admin/login.asp")){
			errMsgGo("잘못된접근입니다.","login.asp");
			return mav;
		}else{
			Admin adminChk = new Admin(txt_adminId,txt_passwd);
			Admin adminInfo = (Admin)sqlMapClientTemplate.queryForObject("getAdminInfo",adminChk);
			
			if(adminInfo == null){
				errMsgGo("아이디 혹은 비밀번호가 잘못되었습니다.","login.asp");
				return mav;
			}else{
				session.setAttribute("adminId", adminInfo.getAdad_id());
				session.setAttribute("adminName", adminInfo.getAdad_name());
				session.setAttribute("adminLevel", adminInfo.getAdad_level());
				session.setAttribute("adminMenus", adminInfo.getAdad_auth_menu());
				session.setAttribute("adminEmail", adminInfo.getAdde_email());
				
				CountUpdate countUpdate = new CountUpdate("ad_admin_detail","adde_hit","adde_adad_id='"+adminInfo.getAdad_id()+"'");
				sqlMapClientTemplate.update("cntUpdate",countUpdate);
				
				/*
				 AD : 관리자
				 MM : 회원
				 CD : 코드
				 NE : 뉴스
				 VO : VOD
				 BD : 게시판
				 CA : 편성표
				 CM : 메뉴/컨텐츠
				 MA :
				 CF : 
				 LG : 
				 ET : 기타
				 JA : 자막뉴스
				 */
				
				/*System.out.println("****************************************");
				System.out.println(session.getAttribute("adminId"));
				System.out.println(session.getAttribute("adminName"));
				System.out.println(session.getAttribute("adminLevel"));
				System.out.println(session.getAttribute("adminMenus"));
				System.out.println(session.getAttribute("adminEmail"));
				System.out.println("****************************************");*/
				
				errMsgGo("","admin_su.asp");
				
				return mav;
			}
		}
	}
	
	/**
	 * @function : 관리자 리스트 조회
	 * @process  : 
	 * 
	 * @MethodName : admin_list
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param schType
	 * @param schText
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/admin/list.asp",method=RequestMethod.GET)
	public ModelAndView admin_list(HttpSession session
			,@RequestParam(value="pageNo",required=false,defaultValue="1") int pageNo
			,@RequestParam(value="pageSize",required=false,defaultValue="20") int pageSize
			,@RequestParam(value="schType",required=false,defaultValue="") String schType
			,@RequestParam(value="schText",required=false,defaultValue="") String schText) throws Exception {
		common(session, "admin/list", "AD");
		
		schText = Common.toEUCKR(schText);
		
		AdminParameter adminParameter = new AdminParameter(pageNo, pageSize, schType, schText);
		
		ArrayList<AdminList> adminList = (ArrayList<AdminList>)sqlMapClientTemplate.queryForList("listAdmin",adminParameter);
		int listTotal = (Integer)sqlMapClientTemplate.queryForObject("cntAdmin",adminParameter);
		BoardPaging listPaging = new BoardPaging(pageNo,listTotal,pageSize);
		
		mav.addObject("pageNo", pageNo);
		mav.addObject("pageSize", pageSize);
		mav.addObject("schType", schType);
		mav.addObject("schText", schText);
		mav.addObject("listAdmin",adminList);
		mav.addObject("listTotal",listTotal);
		mav.addObject("listPaging",listPaging);
		mav.addObject("urlQuery","?pageSize="+pageSize+"&schType="+schType+"&schText="+schText);
		
		return mav;
	}
	
	/**
	 * @function : 관리자 정보 조회
	 * @process  : 
	 * 
	 * @MethodName : admin_view
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/admin/view.asp",method=RequestMethod.GET)
	public ModelAndView admin_view(HttpSession session
			,@RequestParam(value="id",required=false,defaultValue="") String id){
		common(session, "admin/view", "AD");
		
		String adminId;
		boolean isMine;
		
		if(id.equals("")){
			adminId = session.getAttribute("adminId").toString();
			isMine = true;
		}else{
			adminId = id;
			if(session.getAttribute("adminId").toString().equals(id))
				isMine = true;
			else
				isMine = false;
		}
		
		mav.addObject("isMine",isMine);
		
		Admin admin;
		admin = (Admin)sqlMapClientTemplate.queryForObject("getAdmin", adminId);
		mav.addObject("admin",admin);
		
		for(String menu:menuList){
			if(admin.getAdad_auth_menu() != null && admin.getAdad_auth_menu().indexOf(menu) > -1){
				mav.addObject("auth_"+menu, true);
			}else{
				mav.addObject("auth_"+menu, false);
			}
		}
		
		AdminDetail detail;
		detail = (AdminDetail)sqlMapClientTemplate.queryForObject("getAdminDetail", adminId);
		mav.addObject("detail",detail);
		
		return mav;
	}
	
	/**
	 * @function : 관리자 개인 정보 업데이트
	 * @process  : 
	 * 
	 * @MethodName : admin_update
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/update.asp",method=RequestMethod.POST)
	public ModelAndView admin_update(HttpSession session, HttpServletRequest request) throws Exception {
		common(session, "admin/view", "AD");
		
		request.setCharacterEncoding("euc-kr");
		
		String mode = request.getParameter("mode");
		String id = Common.strToStr(request.getParameter("id"));
		String name = Common.strToStr(request.getParameter("name"));
		String dept = Common.strToStr(request.getParameter("dept"));
		String position = Common.strToStr(request.getParameter("position"));
		String email = Common.strToStr(request.getParameter("email"));
		String phone = Common.strToStr(request.getParameter("phone"));
		String o_phone = Common.strToStr(request.getParameter("o_phone"));
		String o_address = Common.strToStr(request.getParameter("o_address"));
		String passwd = Common.strToStr(request.getParameter("passwd"));
		
		if(mode == null) mode = "basic";
		
		Admin admin = new Admin();
		AdminDetail detail = new AdminDetail();
		
		if(mode.equals("basic")){
			admin.setAdad_id(id);
			admin.setAdad_name(name);
			
			detail.setAdde_adad_id(id);
			detail.setAdde_dept(dept);
			detail.setAdde_position(position);
			detail.setAdde_email(email);
			detail.setAdde_phone(phone);
			detail.setAdde_o_phone(o_phone);
			detail.setAdde_o_address(o_address);
			
			sqlMapClientTemplate.update("updateAdmin",admin);
			sqlMapClientTemplate.update("updateAdminDetail",detail);
		}else if(mode.equals("passwd")){
			admin.setAdad_id(id);
			admin.setAdad_passwd(passwd);
			
			sqlMapClientTemplate.update("updateAdminPw",admin);
		}else if(mode.equals("authMenu")){
			admin.setAdad_id(id);
			
			String authMenu = "";
			for(int i=0; i<menuList.length; i++){
				if(Common.strToInt(request.getParameter("auth_"+menuList[i]))>0){
					authMenu += "|"+menuList[i];
				}
			}
			admin.setAdad_auth_menu(authMenu);
			
			sqlMapClientTemplate.update("updateAdminAuthMenu",admin);
		}
		
		errMsgGoMain("수정완료","view.asp?id="+id);
		
		return mav;
	}
	
	/**
	 * @function : 관리페이지 회원 리스트
	 * @process  : 
	 * 
	 * @MethodName : member_list
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param schType
	 * @param schText
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/member/list.asp",method=RequestMethod.GET)
	public ModelAndView member_list(HttpSession session
			,@RequestParam(value="pageNo",required=false,defaultValue="1") int pageNo
			,@RequestParam(value="pageSize",required=false,defaultValue="20") int pageSize
			,@RequestParam(value="schType",required=false,defaultValue="") String schType
			,@RequestParam(value="schText",required=false,defaultValue="") String schText) throws Exception {
		common(session, "member/list", "MM");
		
		schText = Common.toEUCKR(schText);
		
		UserParameter userParameter = new UserParameter(pageNo,pageSize,schType,schText,false);
		
		ArrayList<User> listUser = (ArrayList<User>)sqlMapClientTemplate.queryForList("listUser",userParameter);
		int listTotal = (Integer)sqlMapClientTemplate.queryForObject("cntUser",userParameter);
		BoardPaging listPaging = new BoardPaging(pageNo,listTotal,pageSize);
		
		mav.addObject("pageNo", pageNo);
		mav.addObject("pageSize", pageSize);
		mav.addObject("schType", schType);
		mav.addObject("schText", schText);
		mav.addObject("listUser", listUser);
		mav.addObject("listTotal",listTotal);
		mav.addObject("listPaging",listPaging);
		mav.addObject("urlQuery","?pageSize="+pageSize+"&schType="+schType+"&schText="+schText);
		
		return mav;
	}
	
	/**
	 * @function : 회원 정보 조회 
	 * @process  : 
	 * 
	 * @MethodName : member_view
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/member/view.asp",method=RequestMethod.GET)
	public ModelAndView member_view(HttpSession session
			,@RequestParam(value="id",required=false,defaultValue="") String id){
		common(session, "member/view", "MM");
		
		User user = (User)sqlMapClientTemplate.queryForObject("getUser",id);
		mav.addObject("user", user);
		
		return mav;
	}
	
	/**
	 * @function : 회원 정보 수정
	 * @process  : 
	 * 
	 * @MethodName : member_update
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/member/update.asp",method=RequestMethod.POST)
	public ModelAndView member_update(HttpSession session, HttpServletRequest request) throws Exception {
		common(session, "member/view", "MM");
		
		request.setCharacterEncoding("euc-kr");
		
		String mode = request.getParameter("mode");
		String id = Common.strToStr(request.getParameter("id"));
		String passwd = Common.strToStr(request.getParameter("passwd"));
		String name = Common.strToStr(request.getParameter("name"));
		String zipcode = Common.strToStr(request.getParameter("zipcode"));
		String address1 = Common.strToStr(request.getParameter("address1"));
		String address2 = Common.strToStr(request.getParameter("address2"));
		String phone = Common.strToStr(request.getParameter("phone"));
		String cellphone = Common.strToStr(request.getParameter("cellphone"));
		String email = Common.strToStr(request.getParameter("email"));
		int mailing = Common.strToInt(request.getParameter("mailing"));
		int status = Common.strToInt(request.getParameter("status"));
		String group = Common.strToStr(request.getParameter("group"));
		
		if(mode == null) mode = "basic";
		
		User user = new User();
		
		if(mode.equals("basic")){
			user.setId(id);
			user.setName(name);
			user.setZipcode(zipcode);
			user.setAddress1(address1);
			user.setAddress2(address2);
			user.setPhone(phone);
			user.setCellphone(cellphone);
			user.setEmail(email);
			user.setMailing(mailing);
			user.setStatus(status);
			user.setGroup(group);
			
			sqlMapClientTemplate.update("updateUserBasic",user);
		}else if(mode.equals("passwd")){
			user.setId(id);
			user.setPasswd(passwd);
			
			sqlMapClientTemplate.update("updateUserPasswd",user);
		}
		
		errMsgGoMain("수정 완료","view.asp?id="+id);
		
		return mav;
	}
	
	/**
	 * @function : 탈퇴회원 리스트
	 * @process  : 
	 * 
	 * @MethodName : member_listSecede
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param schType
	 * @param schText
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/member/listSecede.asp",method=RequestMethod.GET)
	public ModelAndView member_listSecede(HttpSession session
			,@RequestParam(value="pageNo",required=false,defaultValue="1") int pageNo
			,@RequestParam(value="pageSize",required=false,defaultValue="20") int pageSize
			,@RequestParam(value="schType",required=false,defaultValue="") String schType
			,@RequestParam(value="schText",required=false,defaultValue="") String schText) throws Exception {
		common(session, "member/listSecede", "MM");
		
		schText = Common.toEUCKR(schText);
		
		UserParameter userParameter = new UserParameter(pageNo,pageSize,schType,schText,true);
		
		ArrayList<User> listUser = (ArrayList<User>)sqlMapClientTemplate.queryForList("listSecede",userParameter);
		int listTotal = (Integer)sqlMapClientTemplate.queryForObject("cntSecede",userParameter);
		BoardPaging listPaging = new BoardPaging(pageNo,listTotal,pageSize);
		
		mav.addObject("pageNo", pageNo);
		mav.addObject("pageSize", pageSize);
		mav.addObject("schType", schType);
		mav.addObject("schText", schText);
		mav.addObject("listUser", listUser);
		mav.addObject("listTotal",listTotal);
		mav.addObject("listPaging",listPaging);
		mav.addObject("urlQuery","?pageSize="+pageSize+"&schType="+schType+"&schText="+schText);
		
		return mav;
	}
	
	/**
	 * @function : 코드관리 리스트 조회
	 * @process  : 
	 * 
	 * @MethodName : code_list
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/code/list.asp",method=RequestMethod.GET)
	public ModelAndView code_list(HttpServletRequest request) throws Exception {
		common(request.getSession(), "code/list", "CD");
		
		Code code;
		int code_uid = Common.strToInt(request.getParameter("code_uid"));
		if(code_uid > 0){
			code = (Code)sqlMapClientTemplate.queryForObject("getCode",code_uid);
			if(code != null){
				if(code.getCode_depth() == 2){
					Code parent = (Code)sqlMapClientTemplate.queryForObject("getCode",code.getCode_parent());
					if(parent != null)
						code.setCode_name("root < "+parent.getCode_name()+" < "+code.getCode_name());
				}else
					code.setCode_name("root < "+code.getCode_name());
			}
		}else{
			code = new Code();
			code.setCode_uid(0);
			code.setCode_name("root");
			code.setCode_depth(0);
			code.setCode_parent(0);
			code.setCode_d1(0);
			code.setCode_d2(0);
			code.setCode_d3(0);
			code.setCode_d4(0);
			code.setCode_d5(0);
		}
		mav.addObject("code",code);
		mav.addObject("code_uid",code_uid);
		
		ArrayList<Code> listCode = (ArrayList<Code>)sqlMapClientTemplate.queryForList("listCode");
		mav.addObject("listCode",listCode);
		
		return mav;
	}
	
	/**
	 * @function : 코드 등록
	 * @process  : 
	 * 
	 * @MethodName : code_insert
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/code/insert.asp",method=RequestMethod.POST)
	public ModelAndView code_insert(HttpServletRequest request) throws Exception {
		common(request.getSession(),"code/list", "CD");
		request.setCharacterEncoding("euc-kr");
		
		int code_uid = Common.strToInt(request.getParameter("code_uid"));
		String code_name = Common.strToStr(request.getParameter("code_name"));
		int code_depth = Common.strToInt(request.getParameter("code_depth"));
		//int code_parent = Common.strToInt(request.getParameter("code_parent"));
		int code_d1 = Common.strToInt(request.getParameter("code_d1"));
		int code_d2 = Common.strToInt(request.getParameter("code_d2"));
		int code_d3 = Common.strToInt(request.getParameter("code_d3"));
		int code_d4 = Common.strToInt(request.getParameter("code_d4"));
		int code_d5 = Common.strToInt(request.getParameter("code_d5"));
		int code_is_view = Common.strToInt(request.getParameter("code_is_view"));
		String code_number = Common.strToStr(request.getParameter("code_number"));
		
		code_depth++;
		
		if(code_name.length()>0 && code_number.length()>0){
			if(code_depth == 1){
				code_d1 = (Integer)sqlMapClientTemplate.queryForObject("getCodeD1",code_uid);
			}else if(code_depth == 2){
				code_d2 = (Integer)sqlMapClientTemplate.queryForObject("getCodeD2",code_uid);
			}else if(code_depth == 3){
				code_d3 = (Integer)sqlMapClientTemplate.queryForObject("getCodeD3",code_uid);
			}else if(code_depth == 4){
				code_d4 = (Integer)sqlMapClientTemplate.queryForObject("getCodeD4",code_uid);
			}else if(code_depth == 5){
				code_d5 = (Integer)sqlMapClientTemplate.queryForObject("getCodeD5",code_uid);
			}
			
			Code code = new Code();
			code.setCode_name(code_name);
			code.setCode_depth(code_depth);
			code.setCode_parent(code_uid);
			code.setCode_d1(code_d1);
			code.setCode_d2(code_d2);
			code.setCode_d3(code_d3);
			code.setCode_d4(code_d4);
			code.setCode_d5(code_d5);
			code.setCode_is_view(code_is_view);
			code.setCode_number(code_number);
			
			sqlMapClientTemplate.insert("insertCode",code);
		}
		
		errMsgGoMain("추가되었습니다.","list.asp");
		return mav;
	}
	
	/**
	 * @function : 메뉴/콘텐츠 관리 리스트 조회
	 * @process  : 
	 * 
	 * @MethodName : cms_list
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/cms/list.asp",method=RequestMethod.GET)
	public ModelAndView cms_list(HttpServletRequest request) throws Exception {
		common(request.getSession(), "cms/list", "CM");
		
		Menu menu;
		Menu parent;
		int cmme_uid = Common.strToInt(request.getParameter("cmme_uid"));
		if(cmme_uid > 0){
			menu = (Menu)sqlMapClientTemplate.queryForObject("getMenu",cmme_uid);
			if(menu != null){
				if(menu.getCmme_depth() == 1){
					menu.setCmme_name("root < "+menu.getCmme_name());
				}else{
					parent = (Menu)sqlMapClientTemplate.queryForObject("getMenu",menu.getCmme_parent());
					if(parent != null){
						menu.setCmme_name("... < "+parent.getCmme_name()+" < "+menu.getCmme_name());
					}
				}
			}
		}else{
			menu = new Menu();
			menu.setCmme_uid(0);
			menu.setCmme_name("root");
			menu.setCmme_depth(0);
			menu.setCmme_parent(0);
			menu.setCmme_d1(0);
			menu.setCmme_d2(0);
			menu.setCmme_d3(0);
			menu.setCmme_d4(0);
			menu.setCmme_d5(0);
		}
		
		mav.addObject("menu",menu);
		mav.addObject("cmme_uid",cmme_uid);
		
		if(menu.getCmme_depth()==4){
			ArrayList<Menu> listMenu = (ArrayList<Menu>)sqlMapClientTemplate.queryForList("listMenuD3",menu.getCmme_parent());
			mav.addObject("listMenu",listMenu);
		}else if(menu.getCmme_depth()<4){
			ArrayList<Menu> listMenu = (ArrayList<Menu>)sqlMapClientTemplate.queryForList("listMenuD"+menu.getCmme_depth(),cmme_uid);
			mav.addObject("listMenu",listMenu);
		}
		
		return mav;
	}
	
	/**
	 * @function : 새메뉴 등록
	 * @process  : 
	 * 
	 * @MethodName : cms_insert
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cms/insert.asp",method=RequestMethod.POST)
	public ModelAndView cms_insert(HttpServletRequest request) throws Exception {
		common(request.getSession(), "cms/list", "CM");
		request.setCharacterEncoding("euc-kr");
		
		int cmme_uid = Common.strToInt(request.getParameter("cmme_uid"));
		String cmme_name = Common.strToStr(request.getParameter("cmme_name"));
		int cmme_depth = Common.strToInt(request.getParameter("cmme_depth"));
		//int cmme_parent = Common.strToInt(request.getParameter("cmme_parent"));
		int cmme_d1 = Common.strToInt(request.getParameter("cmme_d1"));
		int cmme_d2 = Common.strToInt(request.getParameter("cmme_d2"));
		int cmme_d3 = Common.strToInt(request.getParameter("cmme_d3"));
		int cmme_d4 = Common.strToInt(request.getParameter("cmme_d4"));
		int cmme_d5 = Common.strToInt(request.getParameter("cmme_d5"));
		String cmme_link = Common.strToStr(request.getParameter("cmme_link"));
		String cmme_link_target = Common.strToStr(request.getParameter("cmme_link_target"));
		int cmme_is_view = Common.strToInt(request.getParameter("cmme_is_view"));
		int cmme_direct_uid = Common.strToInt(request.getParameter("cmme_direct_uid"));
		String radio_uidOrlink = Common.strToStr(request.getParameter("radio_uidOrlink"));
		
		if(radio_uidOrlink.equals("uid")){
			cmme_link = null;
		}else if(radio_uidOrlink.equals("link")){
			cmme_direct_uid = 0;
		}else{
			cmme_link = null;
			cmme_direct_uid = 0;
		}
		
		cmme_depth++;
		
		if(cmme_name.length()>0){
			if(cmme_depth == 1){
				cmme_d1 = (Integer)sqlMapClientTemplate.queryForObject("getMenuD1",cmme_uid);
			}else if(cmme_depth == 2){
				cmme_d2 = (Integer)sqlMapClientTemplate.queryForObject("getMenuD2",cmme_uid);
			}else if(cmme_depth == 3){
				cmme_d3 = (Integer)sqlMapClientTemplate.queryForObject("getMenuD3",cmme_uid);
			}else if(cmme_depth == 4){
				cmme_d4 = (Integer)sqlMapClientTemplate.queryForObject("getMenuD4",cmme_uid);
			}else if(cmme_depth == 5){
				cmme_d5 = (Integer)sqlMapClientTemplate.queryForObject("getMenuD5",cmme_uid);
			}
			
			Menu menu = new Menu();
			menu.setCmme_name(cmme_name);
			menu.setCmme_depth(cmme_depth);
			menu.setCmme_parent(cmme_uid);
			menu.setCmme_d1(cmme_d1);
			menu.setCmme_d2(cmme_d2);
			menu.setCmme_d3(cmme_d3);
			menu.setCmme_d4(cmme_d4);
			menu.setCmme_d5(cmme_d5);
			menu.setCmme_link(cmme_link);
			menu.setCmme_link_target(cmme_link_target);
			menu.setCmme_is_view(cmme_is_view);
			menu.setCmme_direct_uid(cmme_direct_uid);
			
			sqlMapClientTemplate.insert("insertMenu",menu);
		}
		
		errMsgGoMain("추가되었습니다.","list.asp");
		return mav;
	}
	
	/**
	 * @function : 기사작성1차 리스트 조회
	 * @process  : 
	 * 
	 * @MethodName : news_list1
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/news/list1.asp",method=RequestMethod.GET)
	public ModelAndView news_list1(HttpSession session) throws Exception {
		common(session, "news/list1", "NE");
		
		ArrayList<JctvNews1> listNews1 = (ArrayList<JctvNews1>)sqlMapClientTemplate.queryForList("listJctvNews1");
		
		for(JctvNews1 item:listNews1){
			item.setGroup_flag(newsCategory[Common.strToInt(item.getGroup_flag())]);
			if(item.getContent().length()>500){
				item.setContent(item.getContent().substring(0,500));
			}
			
			item.setContent(Common.replaceBRtoSpace(item.getContent()));
		}
		mav.addObject("listNews", listNews1);
		mav.addObject("listSize",listNews1.size());
		return mav;
	}
	
	/**
	 * @function : 기사작성2차 리스트 조회
	 * @process  : 
	 * 
	 * @MethodName : news_list2
	 * @param session
	 * @param s_year
	 * @param s_month
	 * @param s_day
	 * @param e_year
	 * @param e_month
	 * @param e_day
	 * @param pageNo
	 * @param pageSize
	 * @param guid
	 * @param eng
	 * @param chi
	 * @param schType
	 * @param schText
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/news/list2.asp",method=RequestMethod.GET)
	public ModelAndView news_list2(HttpSession session
			,@RequestParam(value="s_year",required=false,defaultValue="0") int s_year
			,@RequestParam(value="s_month",required=false,defaultValue="0") int s_month
			,@RequestParam(value="s_day",required=false,defaultValue="0") int s_day
			,@RequestParam(value="e_year",required=false,defaultValue="0") int e_year
			,@RequestParam(value="e_month",required=false,defaultValue="0") int e_month
			,@RequestParam(value="e_day",required=false,defaultValue="0") int e_day
			,@RequestParam(value="pageNo",required=false,defaultValue="1") int pageNo
			,@RequestParam(value="pageSize",required=false,defaultValue="30") int pageSize
			,@RequestParam(value="guid",required=false,defaultValue="0") int guid
			,@RequestParam(value="eng",required=false,defaultValue="0") int eng
			,@RequestParam(value="chi",required=false,defaultValue="0") int chi
			,@RequestParam(value="schType",required=false,defaultValue="") String schType
			,@RequestParam(value="schText",required=false,defaultValue="") String schText) throws Exception {
		common(session, "news/list2", "NE");
		
		schText = Common.toEUCKR(schText);
		
		String s_date;
		String e_date;
		
		Calendar today = Calendar.getInstance();
		
		if(s_year>0 && s_month>0 && s_day>0 && e_year>0 && e_month>0 && e_day>0){
			s_date = String.format("%02d%02d%02d", s_year, s_month, s_day);
			e_date = String.format("%02d%02d%02d", e_year, e_month, e_day);
		}else{
			s_year = e_year = today.get(Calendar.YEAR);
			s_month = e_month = today.get(Calendar.MONTH)+1;
			s_day = e_day = today.get(Calendar.DATE);
			s_date = e_date = s_year+String.format("%02d",s_month)+String.format("%02d",s_day);
			//s_date = e_date = "20130228";
		}
		
		mav.addObject("newsCategory", newsCategory);
		mav.addObject("guid", guid);
		mav.addObject("eng", eng);
		mav.addObject("chi", chi);
		mav.addObject("max_year", 2014);
		mav.addObject("s_year",s_year);
		mav.addObject("s_month",s_month);
		mav.addObject("s_day",s_day);
		mav.addObject("e_year",e_year);
		mav.addObject("e_month",e_month);
		mav.addObject("e_day",e_day);
		mav.addObject("pageNo",pageNo);
		mav.addObject("pageSize",pageSize);
		mav.addObject("guid",guid);
		mav.addObject("schType",schType);
		mav.addObject("schText",schText);
		mav.addObject("urlQuery",
				"?s_year="+s_year
				+"&s_month="+s_month
				+"&s_day="+s_day
				+"&e_year="+e_year
				+"&e_month="+e_month
				+"&e_day="+e_day
				+"&pageSize="+pageSize
				+"&guid="+guid
				+"&schType="+schType
				+"&schText="+schText);
		
		//System.out.println(s_date+" ~ "+e_date);
		
		NewsParameter newsParameter = new NewsParameter(pageNo, pageSize, guid, schType, schText, s_date, e_date);
		
		if(eng==1 && chi==0) newsParameter.andWhere += " and eng is not null";
		else if(eng==0 && chi==1) newsParameter.andWhere += " and chi is not null";
		else if(eng==1 && chi==1) newsParameter.andWhere += " and (eng is not null or chi is not null)";
		
		ArrayList<JctvNews2> listNews2 = (ArrayList<JctvNews2>)sqlMapClientTemplate.queryForList("listJctvNews2",newsParameter);
		int listTotal = (Integer)sqlMapClientTemplate.queryForObject("cntJctvNews2",newsParameter);
		BoardPaging listPaging = new BoardPaging(pageNo,listTotal,pageSize);
		
		for(JctvNews2 item:listNews2){
			item.setWeb_view(setChecked(item.getWeb_view()));
			item.setHot_flag(setChecked(item.getHot_flag()));
			item.setEng(setChecked(item.getEng()));
			item.setChi(setChecked(item.getChi()));
			if(item.getFlv() != null && item.getFlv().length()>0) item.setFlv(" checked=\"checked\"");
			else item.setFlv("");
			item.setLdate(item.getSendtime().substring(0,4)+"/"+item.getSendtime().substring(4,6)+"/"+item.getSendtime().substring(6,8));
		}
		mav.addObject("listSize",listNews2.size());
		mav.addObject("listNews", listNews2);
		mav.addObject("listTotal",listTotal);
		mav.addObject("listPaging",listPaging);
		
		return mav;
	}
	
	/**
	 * @function : 기사작성 1차 글쓰기/수정 페이지
	 * @process  : 
	 * 
	 * @MethodName : news_write1
	 * @param session
	 * @param mode
	 * @param num
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/news/write1.asp",method=RequestMethod.GET)
	public ModelAndView news_write1(HttpSession session
			,@RequestParam(value="mode",required=false,defaultValue="write") String mode
			,@RequestParam(value="num",required=false,defaultValue="0") int num) throws Exception {
		common(session, "news/write1", "NE");
		
		JctvNews1 item;
		if(mode.equals("edit") && num>0){
			item = (JctvNews1)sqlMapClientTemplate.queryForObject("getJctvNews1",num);
		}else{
			item = new JctvNews1();
			item.setName(session.getAttribute("adminName").toString());
		}
		
		mav.addObject("mode", mode);
		mav.addObject("item",item);
		return mav;
	}
	
	/**
	 * @function : 기사작성 2차 글쓰기/수정 페이지
	 * @process  : 
	 * 
	 * @MethodName : news_write2
	 * @param session
	 * @param mode
	 * @param num
	 * @param s_year
	 * @param s_month
	 * @param s_day
	 * @param e_year
	 * @param e_month
	 * @param e_day
	 * @param schType
	 * @param schText
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/news/write2.asp",method=RequestMethod.GET)
	public ModelAndView news_write2(HttpSession session
			,@RequestParam(value="mode",required=false,defaultValue="write") String mode
			,@RequestParam(value="num",required=false,defaultValue="0") int num
			,@RequestParam(value="s_year",required=false,defaultValue="0") int s_year
			,@RequestParam(value="s_month",required=false,defaultValue="0") int s_month
			,@RequestParam(value="s_day",required=false,defaultValue="0") int s_day
			,@RequestParam(value="e_year",required=false,defaultValue="0") int e_year
			,@RequestParam(value="e_month",required=false,defaultValue="0") int e_month
			,@RequestParam(value="e_day",required=false,defaultValue="0") int e_day
			,@RequestParam(value="schType",required=false,defaultValue="") String schType
			,@RequestParam(value="schText",required=false,defaultValue="") String schText
			,@RequestParam(value="pageNo",required=false,defaultValue="1") int pageNo
			,@RequestParam(value="pageSize",required=false,defaultValue="30") int pageSize) throws Exception {
		common(session, "news/write2", "NE");
		
		schText = Common.toEUCKR(schText);
		
		JctvNews2 item;
		if(mode.equals("edit") && num>0){
			item = (JctvNews2)sqlMapClientTemplate.queryForObject("getJctvNews2",num);
		}else{
			item = new JctvNews2();
			item.setName(session.getAttribute("adminName").toString());
		}
		
		if(item.getWeb_view() !=null && item.getWeb_view().equals("1")) item.setWeb_view(" checked=\"checked\"");
		else item.setWeb_view("");
		
		if(item.getFlv() == null){
			item.setFlv("weather/"+item.getLdate().substring(2)+"w3.flv");
			mav.addObject("isFlv",false);
		}else{
			mav.addObject("isFlv",true);
		}
		
		mav.addObject("mode", mode);
		mav.addObject("s_year",s_year);
		mav.addObject("s_month",s_month);
		mav.addObject("s_day",s_day);
		mav.addObject("e_year",e_year);
		mav.addObject("e_month",e_month);
		mav.addObject("e_day",e_day);
		mav.addObject("schType",schType);
		mav.addObject("schText",schText);
		mav.addObject("pageNo",pageNo);
		mav.addObject("pageSize",pageSize);
		
		String url = "list2.asp";
		url += "?s_year="+s_year;
		url += "&s_month="+s_month;
		url += "&s_day="+s_day;
		url += "&e_year="+e_year;
		url += "&e_month="+e_month;
		url += "&e_day="+e_day;
		url += "&schType="+schType;
		url += "&schText="+schText;
		url += "&pageNo="+pageNo;
		url += "&pageSize="+pageSize;
		mav.addObject("url",url);
		
		mav.addObject("item",item);
		return mav;
	}
	
	/**
	 * @function : 2차기사 작성자 정보 설정
	 * @process  : 
	 * 
	 * @MethodName : news_update2
	 * @param session
	 * @param mode
	 * @param num
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/news/update2.asp",method=RequestMethod.POST)
	public ModelAndView news_update2(HttpSession session
			,@RequestParam(value="mode",required=false,defaultValue="write") String mode
			,@RequestParam(value="num",required=false,defaultValue="0") int num) throws Exception {
		common(session, "news/write2", "NE");
		
		JctvNews2 item;
		if(mode.equals("edit") && num>0){
			item = (JctvNews2)sqlMapClientTemplate.queryForObject("getJctvNews2",num);
		}else{
			item = new JctvNews2();
			item.setName(session.getAttribute("adminName").toString());
		}
		
		mav.addObject("mode", mode);
		mav.addObject("item",item);
		return mav;
	}
	
	/**
	 * @function : 1차 기사작성 인서트/업데이트
	 * @process  : 
	 * 
	 * @MethodName : news_insert1
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/news/insert1.asp",method=RequestMethod.POST)
	public ModelAndView news_insert1(HttpSession session, HttpServletRequest request) throws Exception {
		common(session, "news/write", "NE");
		
		JctvNews1 news1;
		int jctvNews1Num = (Integer)sqlMapClientTemplate.queryForObject("getNextNumJctvNews1");	//다음 인서트 될 uid 얻기
		
		String newsFolder = "news";
		String folerName = Common.getDate();
		String realPath = uploadPath + newsFolder + "/" + folerName;
		int maxSumFileSize=2*1024*1024;
		
		Common.makeDir(realPath);
		
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSumFileSize, "euc-kr", new FileRenameTime());
		
		String mode = multi.getParameter("mode").toString();
		String num = multi.getParameter("num").toString();
		
		FileInfo fileInfo = Common.getUploadedFileInfo(multi);
		
		String writerId = session.getAttribute("adminId").toString();
		String writerName = multi.getParameter("name");
		String title = multi.getParameter("title");
		String content = multi.getParameter("contents");
		String dateTime = Common.getDateTime();
		String newFileName = null;
		String groupFlag = multi.getParameter("groupFlag");
		String eng_chi = multi.getParameter("eng_chi");
		String vcr = multi.getParameter("p_vcr");
		String sound = multi.getParameter("p_sound");
		String newsGoal = multi.getParameter("p_news_goal");
		
		if(mode.equals("edit") && !num.equals("") && !num.equals("0")){
			if(fileInfo.getLength()>0){
				String svrfile2 = (String)sqlMapClientTemplate.queryForObject("getJctvNews1Img",Common.strToInt(num));
				Common.deleteFile(uploadPath + "news/" + svrfile2);
				newFileName = folerName + "/" + fileInfo.getNewFileName();
			}else
				newFileName = multi.getParameter("orgFile");
			news1 = new JctvNews1(Common.strToInt(num), writerId, writerName, title, content, dateTime, newFileName, groupFlag, eng_chi, vcr, sound, newsGoal);
			sqlMapClientTemplate.update("updateJctvNews1",news1);
			errMsgGoMain("수정 완료","list1.asp");
		}else if(mode.equals("write")){
			if(fileInfo.getLength()>0)
				newFileName = folerName + "/" + fileInfo.getNewFileName();
			news1 = new JctvNews1(jctvNews1Num, writerId, writerName, title, content, dateTime, newFileName, groupFlag, eng_chi, vcr, sound, newsGoal);
			sqlMapClientTemplate.insert("insertJctvNews1",news1);
			errMsgGoMain("등록 완료","list1.asp");
		}else if(mode.equals("deleteImg")){
			String svrfile2 = (String)sqlMapClientTemplate.queryForObject("getJctvNews1Img",Common.strToInt(num));
			Common.deleteFile(uploadPath + "news/" + svrfile2);
			sqlMapClientTemplate.update("updateJctvNews1Img",Common.strToInt(num));
			errMsgGoMain("이미지 삭제 완료","write1.asp?mode=edit&num="+num);
		}
		
		return mav;
	}
	
	/**
	 * @function : 2차 기사작성 인서트/업데이트
	 * @process  : 
	 * 
	 * @MethodName : news_insert2
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/news/insert2.asp",method=RequestMethod.POST)
	public ModelAndView news_insert2(HttpSession session, HttpServletRequest request) throws Exception {
		common(session, "news/write", "NE");
		
		JctvNews2 news2 = new JctvNews2();
		
		String newsFolder = "news";
		String folerName = Common.getDate();
		String realPath = uploadPath + newsFolder + "/" + folerName;
		int maxSumFileSize=2*1024*1024;
		
		Common.makeDir(realPath);
		
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSumFileSize, "euc-kr", new FileRenameTime());
		
		int num = Common.strToInt(multi.getParameter("num"));
		String url = "";
		
		if(multi.getParameter("mode").equals("deleteImg")){	//이미지 첨부파일 삭제
			String svrfile2 = (String)sqlMapClientTemplate.queryForObject("getJctvNews2Img",num);
			Common.deleteFile(uploadPath + "news/" + svrfile2);
			sqlMapClientTemplate.update("updateJctvNews2Img",num);
			url = "write2.asp?mode=edit&num="+num;
		}else if(multi.getParameter("mode").equals("edit")){	//게시글 수정
			FileInfo fileInfo = Common.getUploadedFileInfo(multi);
			
			String name = multi.getParameter("name");
			String title = multi.getParameter("title");
			String content;
			
			if(multi.getParameter("contents").length()>400) content = multi.getParameter("contents").substring(0,400);
			else content = multi.getParameter("contents");
			String flv = null;
			
			if(multi.getParameter("isFlv") != null && multi.getParameter("isFlv").equals("1") && multi.getParameter("flv") != null && multi.getParameter("flv").length()>0)
				flv = multi.getParameter("flv");
			String svrfile2 = null;
			
			if(fileInfo.getLength()>0){
				svrfile2 = (String)sqlMapClientTemplate.queryForObject("getJctvNews2Img",num);
				Common.deleteFile(uploadPath + "news/" + svrfile2);
				svrfile2 = folerName + "/" + fileInfo.getNewFileName();
			}else{
				svrfile2 = (String)sqlMapClientTemplate.queryForObject("getJctvNews2Img",num);
			}
			String news_goal = multi.getParameter("news_goal");
			String vcr = multi.getParameter("p_vcr");
			String sound = multi.getParameter("p_sound");
			String web_view = multi.getParameter("web_view");
			if(web_view != null && web_view.equals("1")) web_view = "1";
			else web_view = null;
			String group_flag = multi.getParameter("groupFlag");
			String eng_chi = multi.getParameter("eng_chi");
			String eng,chi;
			if(eng_chi.equals("eng")){
				eng = "1";
				chi = null;
			}else if(eng_chi.equals("chi")){
				eng = null;
				chi = "1";
			}else{
				eng = null;
				chi = null;
			}
			String content_clob = multi.getParameter("contents");
			
			news2.setNum(num);
			news2.setName(name);
			news2.setTitle(title);
			news2.setContent(content);
			news2.setFlv(flv);
			news2.setSvrfile2(svrfile2);
			news2.setNews_goal(news_goal);
			news2.setVcr(vcr);
			news2.setSound(sound);
			news2.setWeb_view(web_view);
			news2.setGroup_flag(group_flag);
			news2.setEng(eng);
			news2.setChi(chi);
			news2.setContent_clob(content_clob);
			
			sqlMapClientTemplate.insert("updateJctvNews2",news2);
			
			url = "list2.asp?mode=";
		}
		
		url += "&s_year="+multi.getParameter("s_year");
		url += "&s_month="+multi.getParameter("s_month");
		url += "&s_day="+multi.getParameter("s_day");
		url += "&e_year="+multi.getParameter("e_year");
		url += "&e_month="+multi.getParameter("e_month");
		url += "&e_day="+multi.getParameter("e_day");
		url += "&schType="+multi.getParameter("schType");
		url += "&schText="+multi.getParameter("schText");
		url += "&pageNo="+multi.getParameter("pageNo");
		url += "&pageSize="+multi.getParameter("pageSize");
		
		if(multi.getParameter("mode").equals("deleteImg"))
			errMsgGoMain("이미지 삭제 완료",url);
		else if(multi.getParameter("mode").equals("edit"))
			errMsgGoMain("수정 완료",url);
		
		return mav;
	}
	
	/**
	 * @function : 1차 기사작성 확정
	 * @process  : 1차기사 내용 2차기사로 인서트 후 1차기사 내용 삭제
	 * 
	 * @MethodName : news_confirm1
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/news/confirm1.asp",method=RequestMethod.POST)
	public ModelAndView news_confirm1(HttpSession session,HttpServletRequest request) throws Exception {
		common(session, "news/list1", "NE");
		
		String mode = request.getParameter("mode");
		int listSize = Common.strToInt(request.getParameter("listSize"));
		
		if(mode.equals("confirm")){
			if(request.getParameterValues("check") == null){
				errMsgGoMain("선택값이 없습니다.","list1.asp");
				return mav;
			}
			
			String[] chkbox = request.getParameterValues("check");
			String where = "where num in (";
			int chkLen = chkbox.length;
			
			JctvNews2 news2;
			int jctvNews2Num;
			
			for( int i = 0; i < chkLen; i++ ){
				if(i==(chkLen-1))
					where += chkbox[i] + ")";
				else
					where += chkbox[i] + ",";
			}
			
			ArrayList<JctvNews1> listNews1 = (ArrayList<JctvNews1>)sqlMapClientTemplate.queryForList("listJctvNews1",where);
			
			for(JctvNews1 item:listNews1){
				jctvNews2Num = (Integer)sqlMapClientTemplate.queryForObject("getNextNumJctvNews2");
				news2 = new JctvNews2(
						jctvNews2Num,
						item.getUserid(),
						item.getName(),
						item.getTitle(),
						item.getContent(),
						item.getNews_goal(),
						item.getSendtime(),
						item.getReceivetime(),
						item.getSvrfile2(),
						item.getLdate(),
						item.getGroup_flag(),
						item.getMaincd(),
						item.getVcr(),
						item.getSound());
				
				sqlMapClientTemplate.insert("insertJctvNews2", news2);
				sqlMapClientTemplate.delete("deleteJctvNews1",item.getNum());
			}
			errMsgGoMain("확정 완료","list1.asp");
		}else if(mode.equals("delete")){
			for(int i=0; i<listSize; i++){
				delCheckValue(request,"jctv_news1",i);
			}
			errMsgGoMain("삭제 완료","list1.asp");
		}
		
		return mav;
	}
	
	/**
	 * @function : 2차기사 확정
	 * @process  : 
	 * 
	 * @MethodName : news_confirm2
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/news/confirm2.asp",method=RequestMethod.POST)
	public ModelAndView news_confirm2(HttpSession session, HttpServletRequest request) throws Exception {
		common(session, "news/list2", "NE");
		
		request.setCharacterEncoding("euc-kr");
		
		String mode = request.getParameter("mode");
		int listSize = Common.strToInt(request.getParameter("listSize"));
		
		if(mode.equals("confirm")){
			for(int i=0; i<listSize; i++){
				setCheckValue(request,"jctv_news2","web_view",i);
				setCheckValue(request,"jctv_news2","hot_flag",i);
				//setCheckValue(request,"jctv_news2","flv",i);
				setCheckValue(request,"jctv_news2","eng",i);
				setCheckValue(request,"jctv_news2","chi",i);
			}
		}else if(mode.equals("delete")){
			for(int i=0; i<listSize; i++){
				delCheckValue(request,"jctv_news2",i);
			}
		}
		
		String query="";
		query += "?s_year="+request.getParameter("s_year");
		query += "&s_month="+request.getParameter("s_month");
		query += "&s_day="+request.getParameter("s_day");
		query += "&e_year="+request.getParameter("e_year");
		query += "&e_month="+request.getParameter("e_month");
		query += "&e_day="+request.getParameter("e_day");
		query += "&schType="+request.getParameter("schType");
		query += "&schText="+request.getParameter("schText");

		if(mode.equals("confirm")){
			errMsgGoMain("확정 완료","list2.asp"+query);
		}else if(mode.equals("delete")){
			errMsgGoMain("삭제 완료","list2.asp"+query);
		}
		
		return mav;
	}
	
	/**
	 * @function : 보도정보시스템기사등록
	 * @process  : 
	 * 
	 * @MethodName : news_bodo_xml
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/news/bodo_xml.asp",method=RequestMethod.GET)
	public ModelAndView news_bodo_xml(HttpSession session) throws Exception {
		common(session, "news/bodo_xml", "NE");
		String curDate = "";
		Calendar today = Calendar.getInstance();
		curDate = today.get(Calendar.YEAR)+"-"+String.format("%02d",(today.get(Calendar.MONTH)+1))+"-"+String.format("%02d",today.get(Calendar.DATE));
		mav.addObject("curDate",curDate);
		
		return mav;
	}
	
	/**
	 * @function : 보도정보시스템 뉴스 기사 등록
	 * @process  : 
	 * 
	 * @MethodName : news_bodo_xml_insert
	 * @param session
	 * @param search_date
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/news/bodo_xml_insert.asp",method=RequestMethod.POST)
	public ModelAndView news_bodo_xml_insert(HttpSession session, 
			@RequestParam(value="search_date",required=true,defaultValue="") String search_date) throws Exception {
		common(session, "news/bodo_xml", "NE");
		
		XPathBodo bodoXml = new XPathBodo(bodoXmlPath+search_date+".xml");
		ArrayList<BodoXml> list = new ArrayList<BodoXml>();
		list = bodoXml.getList();
		
		JctvNews1 news1;
		JctvNews1 tmp1;
		JctvNews2 tmp2;
		
		int jctvNews1Num;
		int tmp1Cnt;
		int tmp2Cnt;
		
		String maincd = "";
		
		for(BodoXml item:list){
			item.setTitle(Common.replaceTrim(item.getTitle()));
			if(item.getWriterId().equals("sarah"))
				maincd = "eng";
			else
				maincd = "";
			
			if(item.getTpName().equals("리포트")){
				if(maincd.equals("eng"))
					item.setTitle(item.getTitle()+"[Report]");
				else
					item.setTitle(item.getTitle()+"[리포트]");
			}
			
			tmp1 = new JctvNews1(item.getTitle(),item.getMakeDateTime().replace("-", "").substring(0,8));
			tmp1Cnt = (Integer)sqlMapClientTemplate.queryForObject("getCntJctvNews1",tmp1);
			
			tmp2 = new JctvNews2(item.getTitle(),item.getMakeDateTime().replace("-", "").substring(0,8));
			tmp2Cnt = (Integer)sqlMapClientTemplate.queryForObject("getCntJctvNews2",tmp2);
			
			if(tmp1Cnt==0 && tmp2Cnt==0){
				jctvNews1Num = (Integer)sqlMapClientTemplate.queryForObject("getNextNumJctvNews1");
				item.setContent(Common.replaceLineToBR(item.getContent().trim()));
				news1 = new JctvNews1(
						jctvNews1Num,
						item.getWriterId(),
						item.getWriterName(),
						item.getTitle(),
						item.getContent(),
						item.getMakeDateTime(),
						item.getWmv(),
						item.getCategory(),
						maincd
						);
				sqlMapClientTemplate.insert("insertJctvNews1",news1);
			}
		}
		
		errMsgGoMain("","list1.asp");
		
		return mav;
	}
	
	/**
	 * @function : 뉴스제보 리스트
	 * @process  : 
	 * 
	 * @MethodName : news_listReport
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param guid
	 * @param schType
	 * @param schText
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/news/listReport.asp",method=RequestMethod.GET)
	public ModelAndView news_listReport(HttpSession session
			,@RequestParam(value="pageNo",required=false,defaultValue="1") int pageNo
			,@RequestParam(value="pageSize",required=false,defaultValue="20") int pageSize
			,@RequestParam(value="guid",required=false,defaultValue="0") String guid
			,@RequestParam(value="schType",required=false,defaultValue="") String schType
			,@RequestParam(value="schText",required=false,defaultValue="") String schText) throws Exception {
		common(session, "news/listReport", "NE");
		
		schText = Common.toEUCKR(schText);
		
		String boardId = "bd_idea";
		BoardParameter boardParameter;
		ArrayList<Board> listReport;
		BoardPaging listPaging;
		int listTotal;
		
		boardParameter = new BoardParameter(boardId,false,0,false,guid,true,pageNo,pageSize,schType,schText);
		
		listReport = (ArrayList<Board>)sqlMapClientTemplate.queryForList("listReport",boardParameter);
		listTotal = (Integer)sqlMapClientTemplate.queryForObject("cntReport",boardParameter);
		
		listPaging = new BoardPaging(pageNo,listTotal);
		
		mav.addObject("listReport",listReport);
		mav.addObject("listTotal",listTotal);
		mav.addObject("listPaging",listPaging);
		mav.addObject("newsCategory",Common.newsCategory);
		
		return mav;
	}
	
	/**
	 * @function : 뉴스 제보 내역 상세조회
	 * @process  : 
	 * 
	 * @MethodName : news_viewReport
	 * @param session
	 * @param uid
	 * @return
	 */
	@RequestMapping(value="/news/viewReport.asp",method=RequestMethod.GET)
	public ModelAndView news_viewReport(HttpSession session
			,@RequestParam(value="uid",required=false,defaultValue="0") int uid){
		common(session, "news/viewReport", "NE");
		
		Board item = null;
		
		if(uid>0){
			item = (Board)sqlMapClientTemplate.queryForObject("getReport",uid);
			item.setBoard_group_id(Common.newsCategory[item.getBoard_cate_uid()]);
			if(item.getPds_file_name2() != null && !item.getPds_file_name2().equals(""))
				item.setPds_file_name2(ctxRoot+"upload/"+item.getPds_file_name2());
			else
				item.setPds_file_name2("");
		}
		mav.addObject("item",item);
		return mav;
	}
	
	/**
	 * @function : VOD관리(등록)
	 * @process  : 
	 * 
	 * @MethodName : vod_list
	 * @param session
	 * @param pageNo
	 * @param maincd
	 * @param subcd
	 * @param schType
	 * @param schText
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/vod/list.asp",method=RequestMethod.GET)
	public ModelAndView vod_list(HttpSession session
			,@RequestParam(value="pageNo",required=false,defaultValue="1") int pageNo
			,@RequestParam(value="maincd",required=false,defaultValue="0") String maincd
			,@RequestParam(value="subcd",required=false,defaultValue="0") String subcd
			,@RequestParam(value="schType",required=false,defaultValue="") String schType
			,@RequestParam(value="schText",required=false,defaultValue="") String schText) throws Exception {
		common(session, "vod/list", "VO");
		
		schText = Common.toEUCKR(schText);
		
		mav.addObject("listMainCd",(ArrayList<VodCode>)sqlMapClientTemplate.queryForList("getMainCd"));
		if(maincd.length()>1)
			mav.addObject("listSubCd",(ArrayList<VodCode>)sqlMapClientTemplate.queryForList("getSubCd",Common.strToInt(maincd)));
		
		ArrayList<Vod> vodList;
		int total;
		
		VodParameter vodParameter=new VodParameter(pageNo,maincd,subcd,schType,Common.replaceQuote(schText),20);
		
		vodList = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("listVod",vodParameter);
		total = (Integer)sqlMapClientTemplate.queryForObject("cntVod",vodParameter);
		
		for(Vod item:vodList){
			item.setWeb_view(setChecked(item.getWeb_view()));
			item.setFlv(setChecked(item.getFlv()));
			item.setHotvod(setChecked(item.getHotvod()));
		}
		
		BoardPaging vodPaging = new BoardPaging(pageNo,total,10);
		
		mav.addObject("maincd",maincd);
		mav.addObject("subcd",subcd);
		mav.addObject("schType",schType);
		mav.addObject("schText",schText);
		mav.addObject("urlQuery","list.asp?schType="+schType+"&schText="+schText);
		mav.addObject("listVod",vodList);
		mav.addObject("listTotal",total);
		mav.addObject("listPaging",vodPaging);
		mav.addObject("listSize",vodList.size());
		
		return mav;
	}
	
	/**
	 * @function : VOD 등록/변경 확정/삭제
	 * @process  : 
	 * 
	 * @MethodName : vod_confirm
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/vod/confirm.asp",method=RequestMethod.GET)
	public ModelAndView vod_confirm(HttpSession session, HttpServletRequest request) throws Exception {
		common(session, "vod/list", "VO");
		
		String mode = request.getParameter("mode");
		int listSize = Common.strToInt(request.getParameter("listSize"));
		
		if(mode.equals("confirm")){
			for(int i=0; i<listSize; i++){
				setCheckValue(request,"vodlist","web_view",i);
				setCheckValue(request,"vodlist","flv",i);
				setCheckValue(request,"vodlist","hotvod",i);
			}
		}else if(mode.equals("delete")){
			for(int i=0; i<listSize; i++){
				delCheckValue(request,"vodlist",i);
			}
		}
		
		String query="";
		query += "?maincd="+request.getParameter("maincd");
		query += "&subcd="+request.getParameter("subcd");
		query += "&schType="+request.getParameter("schType");
		query += "&schText="+Common.toEUCKR(request.getParameter("schText"));

		if(mode.equals("confirm")){
			errMsgGoMain("확정 완료","list.asp"+query);
		}else if(mode.equals("delete")){
			errMsgGoMain("삭제 완료","list.asp"+query);
		}
		
		return mav;
	}
	
	/**
	 * @function : VOD 등록/수정
	 * @process  : 
	 * 
	 * @MethodName : vod_new
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/vod/new.asp",method=RequestMethod.GET)
	public ModelAndView vod_new(HttpSession session, HttpServletRequest request) throws Exception {
		common(session, "vod/new", "VO");
		
		request.setCharacterEncoding("euc-kr");
		
		String mode = request.getParameter("mode");
		int num = Common.strToInt(request.getParameter("num"));
		String maincd = Common.strToStr(request.getParameter("maincd"));
		String subcd = Common.strToStr(request.getParameter("subcd"));
		String newsType = Common.strToStr(request.getParameter("newsType"),"1");
		String writer = Common.strToStr(request.getParameter("writer"));
		String runTime = Common.strToStr(request.getParameter("runTime"));
		String title = Common.strToStr(request.getParameter("title"));
		String vodFile = Common.strToStr(request.getParameter("vodFile"));
		int year = Common.strToInt(request.getParameter("year"));
		int month = Common.strToInt(request.getParameter("month"));
		int day = Common.strToInt(request.getParameter("day"));
		String character = Common.strToStr(request.getParameter("character"));
		String goal = Common.strToStr(request.getParameter("goal"));
		String flv = Common.strToStr(request.getParameter("flv"),"0");
		String web_view = Common.strToStr(request.getParameter("web_view"),"0");
		String content = Common.strToStr(request.getParameter("content"));
		
		if(mode == null) mode = "new";
		
		Calendar today = Calendar.getInstance();
		
		if(mode.equals("edit") && num>0){
			Vod editVod = (Vod)sqlMapClientTemplate.queryForObject("getVod", num);
			maincd = editVod.getMaincd().trim();
			subcd = editVod.getSubcd().trim();
			writer = editVod.getPd();
			runTime = editVod.getRun_time();
			title = editVod.getTitle();
			vodFile = editVod.getUrlfile();
			year = Common.strToInt(editVod.getFirstdt().substring(0,4));
			month = Common.strToInt(editVod.getFirstdt().substring(4, 6));
			day = Common.strToInt(editVod.getFirstdt().substring(6, 8));
			character = editVod.getCharacter();
			goal = editVod.getGoal();
			flv = editVod.getFlv();
			web_view = editVod.getWeb_view();
			content = editVod.getContent();
		}else{
			if(year==0 && month==0 && day==0){
				year = today.get(Calendar.YEAR);
				month = today.get(Calendar.MONTH)+1;
				day = today.get(Calendar.DATE);
			}else{
				today.set(year, month-1, day);
			}
			String asx_suffix;
			if(subcd.equals("0101")){
				String dateStr = String.format("%02d/%02d/%s요일", month, day, Common.weeks[today.get(Calendar.DAY_OF_WEEK)-1]);
				if(newsType.equals("1")){
					title = "KCTV 뉴스("+dateStr+"/아침)";
					character = "신소영";
					asx_suffix = "n1";
				}else if(newsType.equals("2")){
					title = "KCTV 뉴스현장&시시각각("+dateStr+"/낮)";
					character = "김연송";
					asx_suffix = "n2";
				}else if(newsType.equals("4")){
					title = "KCTV 뉴스("+dateStr+"/오후5시)";
					character = "박세영";
					asx_suffix = "n4";
				}else if(newsType.equals("3")){
					title = "KCTV 종합뉴스("+dateStr+"/저녁)";
					character = "오유진, 신소영";
					asx_suffix = "n3";
				}
				else if(newsType.equals("0")){
					title = "KCTV 주말뉴스("+dateStr+"/저녁)";
					character = "";
					asx_suffix = "n3";
				}else{
					title = "";
					character = "";
					asx_suffix = "";
				}
			}else if(subcd.equals("238")){
				asx_suffix="n5";
				title = "KCTV English News";
				character = "G. Nikitas Brountas";
			}else if(subcd.equals("312")){
				asx_suffix="n7";
				title = "";
				character = "";
				title = "KCTV 中文新&#38395;";
				character = "王&#33395;";
			}else if(subcd.equals("87")){ // 문화예술
				asx_suffix="rel";
				title = "";
				character = "";
			}else if(subcd.equals("74")){ // 관광여행
				asx_suffix="sea";
				title = "";
				character = "";
			}else if(subcd.equals("366")){
				asx_suffix="bic";
				title = "";
				character = "";
			}else if(subcd.equals("372")){
				asx_suffix="ins";
			}else if(subcd.equals("103")){ // 시사.교양.교육
				asx_suffix="eng";
				title = "국제자유도시 생활영어 Hi jeju()";
				character = "홍미선, Wojcieh";
			}else if(subcd.equals("111")){
				asx_suffix="jap";
				title = "국제자유도시 생활일본어 곤니찌와 제주()";
				character = "한효심, 카야유카리";
			}else if(subcd.equals("107")){
				asx_suffix="chi";
				title = "국제자유도시 생활중국어 니하오 제주()";
				character = "김행철, 의쿤";
			}else if(subcd.equals("214")){
				asx_suffix="chall";
				title = "";
				character = "박세영, Isaac Durst";
			}else if(subcd.equals("0515")){
				asx_suffix="glo";
				title = "";
				character = "";
			}else if(subcd.equals("0508")){
				asx_suffix="wnj";
			}else if(subcd.equals("0501")){
				asx_suffix="inv";
				title = "";
				character = "김의근";
			}else if(subcd.equals("0516")){
				asx_suffix="sot";
				title = "";
				character = "";
			}else if(subcd.equals("265")){ // 스포츠.건강
				asx_suffix="spo";
				title = "";
				character = "";
			}else if(subcd.equals("59")){
				asx_suffix="rep";
				title = "";
				character = "이민재 아나운서, 조복현 해설위원";
			}else if(subcd.equals("82")){
				asx_suffix="cli";
				title = "";
				character = "이민재, 신소영";
			}else if(subcd.equals("55")){ // 엔터테인먼트
				asx_suffix="sam";
				title = "";
				character = "김지환, 구해영";
			}else if(subcd.equals("330")){
				asx_suffix="vod";
				title = "추천! VOD가 좋다";
				character = "";
			}else if(subcd.equals("1001")){
				asx_suffix="ch5";
				title = "";
				character = "";
			}else if(subcd.equals("1007")){
				asx_suffix="lov";
				title = "";
				character = "";
			}else if(subcd.equals("1008")){
				asx_suffix="do";
				title = "";
				character = "";
			}else if(subcd.equals("1009")){
				asx_suffix="dol";
				title = "";
				character = "";
			}else if(subcd.equals("518")){
				asx_suffix="pd";
				title = "";
				character = "";
			}else if(subcd.equals("531")){
				asx_suffix="sol";
				title = "";
				character = "";
			}else if(subcd.equals("521")){
				asx_suffix="sisa";
				title = "";
				character = "";
			}else if(subcd.equals("1010")){
				asx_suffix="tuk";
				title = "";
				character = "";
			}else{
				asx_suffix="";
				title = "";
				character = "";
			}
			vodFile = "http://www.kctvjeju.com/a/"+year+String.format("%02d", month)+"/"+String.format("%4d",year).substring(2, 4)+String.format("%02d", month)+String.format("%02d", day)+asx_suffix+".asx";
		}
		
		mav.addObject("listMainCd",(ArrayList<VodCode>)sqlMapClientTemplate.queryForList("getMainCd"));
		if(maincd.length()>1)
			mav.addObject("listSubCd",(ArrayList<VodCode>)sqlMapClientTemplate.queryForList("getSubCd",Common.strToInt(maincd)));
		if(writer.equals(""))
			writer = session.getAttribute("adminName").toString();
		mav.addObject("mode",mode);
		mav.addObject("num",num);
		mav.addObject("maincd",maincd);
		mav.addObject("subcd",subcd);
		mav.addObject("newsType",newsType);
		mav.addObject("writer",writer);
		mav.addObject("runTime",runTime);
		mav.addObject("title",title);
		mav.addObject("vodFile",vodFile);
		mav.addObject("max_year", 2014);
		mav.addObject("year",year);
		mav.addObject("month",month);
		mav.addObject("day",day);
		mav.addObject("character",character);
		mav.addObject("goal",goal);
		mav.addObject("flv",flv);
		mav.addObject("web_view",web_view);
		mav.addObject("content",content);

		return mav;
	}
	
	/**
	 * @function : VOD 글쓰기 확정
	 * @process  : 
	 * 
	 * @MethodName : vod_insert
	 * @param session
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/vod/insert.asp",method=RequestMethod.POST)
	public ModelAndView vod_insert(HttpSession session, HttpServletRequest request) throws IOException {
		common(session, "include/common_receive", "VO");
		
		// 이미지 업로드
		String vodFolder = "vod";
		String folerName = Common.getDate();
		String realPath = uploadPath + vodFolder + "/" + folerName;
		int maxSumFileSize=2*1024*1024;
		Common.makeDir(realPath);
		
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSumFileSize, "euc-kr", new FileRenameTime());
		
		String year = multi.getParameter("year");
		String month = multi.getParameter("month");
		String day = multi.getParameter("day");
		String title = multi.getParameter("title");
		String maincd = multi.getParameter("maincd");
		String subcd = multi.getParameter("subcd");
		String firstdt = String.format("%04d%02d%02d", Common.strToInt(year), Common.strToInt(month), Common.strToInt(day));
		String goal = multi.getParameter("goal");
		String character = multi.getParameter("character");
		String runTime = multi.getParameter("runTime");
		String writer = multi.getParameter("writer");
		String vodFile = multi.getParameter("vodFile");
		String speed1 = multi.getParameter("speed1");
		String flv = multi.getParameter("flv");
		String web_view = multi.getParameter("web_view");
		String photo_url = null;
		String content = multi.getParameter("content");
		
		// asx 파일 생성
		String asxFile = multi.getParameter("vodFile").substring(multi.getParameter("vodFile").lastIndexOf("/")+1);
		//String asxFolder = Common.getYearMonth();
		String asxFolder = firstdt.substring(0,6);
		String asxRealPath = asxPath + asxFolder;
		Common.makeDir(asxRealPath);
		
		Common.createAsxFile(asxRealPath,asxFile,title);
		
		FileInfo fileInfo = Common.getUploadedFileInfo(multi);
		
		String mode = multi.getParameter("mode");
		int vodNum;
		if(mode.equals("new")){
			vodNum = (Integer)sqlMapClientTemplate.queryForObject("getNextNumVod");
			if(fileInfo.getLength()>0)
				photo_url = folerName + "/" + fileInfo.getNewFileName();
		}else{
			vodNum = Common.strToInt(multi.getParameter("num"));
			CommonDelete commonDelete = new CommonDelete();
			commonDelete.setWhere("num="+vodNum);
			photo_url = (String)sqlMapClientTemplate.queryForObject("getVodImage",commonDelete);
			if(fileInfo.getLength()>0){
				Common.deleteFile(uploadPath + "vod/" + photo_url);
				photo_url = folerName + "/" + fileInfo.getNewFileName();
			}
		}
		
		Vod vod = new Vod(vodNum,maincd,subcd,firstdt,title,goal,character,runTime,writer,vodFile,speed1,photo_url,content);
		vod.setFlv(flv);
		vod.setWeb_view(web_view);
/*		
		System.out.println("캐릭터셋 테스트");
		System.out.println(vod.getTitle());
		System.out.println(vod.getContent());
		System.out.println(vod.getGoal());
		*/
		if(mode.equals("new")){
			sqlMapClientTemplate.insert("insertVod",vod);
			errMsgGoMain("VOD 추가 완료.","list.asp");
		}else{
			sqlMapClientTemplate.insert("updateVod",vod);
			errMsgGoMain("VOD 수정 완료.","list.asp");
		}
		
		return mav;
	}
	
	/**
	 * @function : 게시판 목록
	 * @process  : 
	 * 
	 * @MethodName : board_list
	 * @param session
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/board/list.asp",method=RequestMethod.GET)
	public ModelAndView board_list(HttpSession session, HttpServletRequest request) throws IOException {
		common(session, "board/list", "BD");
		
		ArrayList<BoardConfig> listBoard = (ArrayList<BoardConfig>)sqlMapClientTemplate.queryForList("listBoard");
		int cntBoard;
		
		for(BoardConfig item:listBoard){
			cntBoard = (Integer)sqlMapClientTemplate.queryForObject("cntBoard",item.getCfg_board_table());
			item.setCfg_limit_new(cntBoard);
		}
		
		mav.addObject("listBoard", listBoard);
		mav.addObject("listTotal",listBoard.size());
		
		return mav;
	}
	
	/**
	 * @function : 게시판 생성
	 * @process  : 
	 * 
	 * @MethodName : board_new
	 * @param session
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/board/new.asp",method=RequestMethod.GET)
	public ModelAndView board_new(HttpSession session, HttpServletRequest request) throws IOException{
		common(session, "board/new", "BD");
		
		return mav;
	}
	
	/**
	 * @function : 게시판 삭제
	 * @process  : 
	 * 
	 * @MethodName : board_deleteBoard
	 * @param session
	 * @param boardId
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/board/deleteBoard.asp",method=RequestMethod.GET)
	public ModelAndView board_deleteBoard(HttpSession session
			,@RequestParam(value="boardId",required=false,defaultValue="") String boardId) throws IOException{
		common(session, "board/list", "BD");
		
		//sqlMapClientTemplate.delete("dropTable", boardId+"_pds");
		
		errMsgGoMain("삭제 완료","list.asp");
		
		return mav;
	}
	
	/**
	 * @function : 게시판 보기
	 * @process  : 
	 * 
	 * @MethodName : board_frame
	 * @param session
	 * @param boardId
	 * @param mode
	 * @return
	 */
	@RequestMapping(value="/board/{boardId}/board.asp",method=RequestMethod.GET)
	public ModelAndView board_frame(HttpSession session
			,@PathVariable("boardId") String boardId
			,@RequestParam(value="mode",required=false,defaultValue="list") String mode){
		common(session, "board/board", "BD");
		
		mav.addObject("boardId", boardId);
		mav.addObject("mode", mode);
		mav.addObject("menu", "board");
		
		//System.out.println(boardId);
		//System.out.println(mode);
		
		return mav;
	}
	
	/**
	 * @function : 팝업창관리  리스트
	 * @process  : 
	 * 
	 * @MethodName : etc_listPopup
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param schType
	 * @param schText
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/etc/listPopup.asp",method=RequestMethod.GET)
	public ModelAndView etc_listPopup(HttpSession session
			,@RequestParam(value="pageNo",required=false,defaultValue="1") int pageNo
			,@RequestParam(value="pageSize",required=false,defaultValue="20") int pageSize
			,@RequestParam(value="schType",required=false,defaultValue="") String schType
			,@RequestParam(value="schText",required=false,defaultValue="") String schText) throws IOException{
		common(session, "etc/listPopup", "ET");
		
		schText = Common.toEUCKR(schText);
		
		PopupParameter popupParameter = new PopupParameter(pageNo, pageSize, schType, schText);
		ArrayList<Popup> listPopup = (ArrayList<Popup>)sqlMapClientTemplate.queryForList("listPopup",popupParameter);
		int listTotal = (Integer)sqlMapClientTemplate.queryForObject("cntPopup", popupParameter);
		BoardPaging listPaging = new BoardPaging(pageNo,listTotal,pageSize);
		
		mav.addObject("pageNo", pageNo);
		mav.addObject("pageSize", pageSize);
		mav.addObject("schType", schType);
		mav.addObject("schText", schText);
		
		mav.addObject("listPopup", listPopup);
		mav.addObject("listTotal",listTotal);
		mav.addObject("listPaging",listPaging);
		mav.addObject("urlQuery","?pageSize="+pageSize+"&schType="+schType+"&schText="+schText);
		
		return mav;
	}
	
	/**
	 * @function : 팝업 등록/수정 폼
	 * @process  : 
	 * 
	 * @MethodName : etc_newPopup
	 * @param session
	 * @param mode
	 * @param uid
	 * @return
	 */
	@RequestMapping(value="/etc/newPopup.asp",method=RequestMethod.GET)
	public ModelAndView etc_newPopup(HttpSession session
			,@RequestParam(value="mode",required=false,defaultValue="new") String mode
			,@RequestParam(value="uid",required=false,defaultValue="0") int uid){
		common(session, "etc/newPopup", "ET");
		
		Popup popup;
		
		if(mode.equals("edit")){
			popup = (Popup)sqlMapClientTemplate.queryForObject("getPopup", uid);
			mav.addObject("item", popup);
			mav.addObject("uid",uid);
		}
		
		mav.addObject("mode", mode);
		
		return mav;
	}
	
	/**
	 * @function : 팝업 등록
	 * @process  : 
	 * 
	 * @MethodName : etc_insertPopup
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/etc/insertPopup.asp",method=RequestMethod.POST)
	public ModelAndView etc_insertPopup(HttpSession session, HttpServletRequest request) throws Exception {
		common(session, "etc/newPopup", "ET");
		
		String popFolder = "popup/";
		String folerName = Common.getDate();
		String realPath = uploadPath + popFolder + folerName;
		int maxSumFileSize=5*1024*1024;
		
		Common.makeDir(realPath);
		
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSumFileSize, "euc-kr", new FileRenameTime());
		
		String mode = multi.getParameter("mode");
		int uid = Common.strToInt(multi.getParameter("uid"));
		String title = Common.strToStr(multi.getParameter("title"));
		int left = 0;
		int top = 0;
		int width = Common.strToInt(multi.getParameter("txt_width"));
		int height = Common.strToInt(multi.getParameter("txt_height"));
		int isActive = Common.strToInt(multi.getParameter("isActive"));
		String dateStart = Common.strToStr(multi.getParameter("dateStart"));
		String dateEnd = Common.strToStr(multi.getParameter("dateEnd"));
		String linkTarget = Common.strToStr(multi.getParameter("linkTarget"));
		String skinBackgroundColor = Common.strToStr(multi.getParameter("skinBackgroundColor"));
		String bgColor = null;
		int popType = Common.strToInt(multi.getParameter("popType"));
		int isHtml = Common.strToInt(multi.getParameter("isHtml"));
		String contents = Common.strToStr(multi.getParameter("contents"));
		
		FileInfo fileInfo = Common.getUploadedFileInfo(multi);
		
		if(fileInfo.getLength()>0){
			if(popType == 0){// 이미지 링크
				contents = "<a href='"+contents+"' target='"+linkTarget+"'><img src='"+ctxRoot+"upload/popup/"+folerName+"/"+fileInfo.getNewFileName()+"' width='"+width+"' height='"+height+"' border='0'/></a>";
				isHtml = 0;
			}else if(popType == 1){// Skin 적용
				bgColor = skinBackgroundColor;
			}else if(popType == 2){// 이미지맵 링크
				contents = "<img src='"+ctxRoot+"upload/popup/"+folerName+"/"+fileInfo.getNewFileName()+"' width='"+width+"' height='"+height+"' border='0' usemap='#Map'/>\n"+contents;
				isHtml = 0;
			}
		}
		
		Popup popup = new Popup();
		popup.setPu_uid(uid);
		popup.setPu_adad_id(session.getAttribute("adminId").toString());
		popup.setPu_title(title);
		popup.setPu_left(left);
		popup.setPu_top(top);
		popup.setPu_width(width);
		popup.setPu_height(height);
		popup.setPu_is_active(isActive);
		popup.setPu_start(dateStart);
		popup.setPu_end(dateEnd);
		popup.setPu_bgcolor(bgColor);
		popup.setPu_is_skin(popType);
		popup.setPu_is_html(isHtml);
		popup.setPu_contents(contents);
		
		if(mode.equals("edit")){
			sqlMapClientTemplate.insert("updatePopup",popup);
			errMsgGoMain("팝업 수정 완료","listPopup.asp");
		}else{
			sqlMapClientTemplate.insert("insertPopup",popup);
			errMsgGoMain("팝업 등록 완료","listPopup.asp");
		}
		
		return mav;
	}
	
	/**
	 * @function : 팝업 삭제
	 * @process  : 
	 * 
	 * @MethodName : etc_deletePopup
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/etc/deletePopup.asp",method=RequestMethod.GET)
	public ModelAndView etc_deletePopup(HttpSession session, HttpServletRequest request) throws Exception {
		common(session, "include/common_receive", "ET");
		
		int pu_uid = Common.strToInt(request.getParameter("num"));
		
		sqlMapClientTemplate.delete("deletePopup",pu_uid);
		
		errMsgGoMain("삭제되었습니다.","listPopup.asp");
		return mav;
	}
	
	/**
	 * @function : VOD주관지 관리
	 * @process  : 
	 * 
	 * @MethodName : etc_listVodWeek
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/etc/listVodWeek.asp",method=RequestMethod.GET)
	public ModelAndView etc_listVodWeek(HttpSession session) throws IOException{
		common(session, "etc/listVodWeek", "ET");
		
		ArrayList<VodWeek> listVodWeek = (ArrayList<VodWeek>)sqlMapClientTemplate.queryForList("listVodWeek");
		mav.addObject("listVodWeek", listVodWeek);
		
		return mav;
	}
	
	@RequestMapping(value="/etc/insertVodWeek.asp",method=RequestMethod.POST)
	public ModelAndView etc_insertVodWeek(HttpSession session, HttpServletRequest request) throws IOException{
		common(session, "etc/listVodWeek", "ET");
		
		String ymd = Common.getDate();
		String vodWeekFolder = "vodWeek";
		String folerName = ymd.substring(0,6);
		String realPath = uploadPath + vodWeekFolder + "/" + folerName;
		int maxSumFileSize=10*1024*1024;
		
		Common.makeDir(realPath);
		
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSumFileSize, "euc-kr", new FileRenameTime());
		FileInfo fileInfo = Common.getUploadedFileInfo(multi);
		
		VodWeek vodWeek = new VodWeek();
		String ldate = ymd.substring(0,4)+"-"+ymd.substring(4,6)+"-"+ymd.substring(6,8);
		String title = multi.getParameter("title");;
		String image_url = folerName + "/" + fileInfo.getNewFileName();
		
		System.out.println(ldate);
		
		vodWeek.setLdate(ldate);
		vodWeek.setTitle(title);
		vodWeek.setImage_url(image_url);
		
		sqlMapClientTemplate.insert("insertVodWeek",vodWeek);
		
		errMsgGoMain("VOD주간지 등록 완료.","listVodWeek.asp");
		
		return mav;
	}
	
	/**
	 * @function : VOD 주간지 삭제
	 * @process  : 
	 * 
	 * @MethodName : etc_deleteVodWeek
	 * @param session
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/etc/deleteVodWeek.asp",method=RequestMethod.GET)
	public ModelAndView etc_deleteVodWeek(HttpSession session, HttpServletRequest request) throws IOException{
		common(session, "etc/listVodWeek", "ET");
		
		String ldate = request.getParameter("ldate");
		
		System.out.println(ldate);
		
		if(ldate != null && ldate.length()>0)
			sqlMapClientTemplate.delete("deleteVodWeek",ldate);
		
		errMsgGoMain("VOD주간지 삭제 완료.","listVodWeek.asp");
		
		return mav;
	}
	
	/**
	 * @function : CH7 편성표
	 * @process  : 
	 * 
	 * @MethodName : schedule_list
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param schType
	 * @param schText
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/schedule/list.asp",method=RequestMethod.GET)
	public ModelAndView schedule_list(HttpSession session
			,@RequestParam(value="pageNo",required=false,defaultValue="1") int pageNo
			,@RequestParam(value="pageSize",required=false,defaultValue="20") int pageSize
			,@RequestParam(value="schType",required=false,defaultValue="") String schType
			,@RequestParam(value="schText",required=false,defaultValue="") String schText) throws Exception {
		common(session, "schedule/list", "CA");
		
		schText = Common.toEUCKR(schText);
		
		ScheduleParameter scheduleParameter = new ScheduleParameter(pageNo, pageSize, schType, schText);
		ArrayList<Schedule> listSchedule = (ArrayList<Schedule>)sqlMapClientTemplate.queryForList("listSchedule",scheduleParameter);
		int listTotal = (Integer)sqlMapClientTemplate.queryForObject("cntSchedule", scheduleParameter);
		BoardPaging listPaging = new BoardPaging(pageNo,listTotal,pageSize);
		
		mav.addObject("pageNo", pageNo);
		mav.addObject("pageSize", pageSize);
		mav.addObject("schType", schType);
		mav.addObject("schText", schText);
		
		mav.addObject("listSize",listSchedule.size());
		mav.addObject("listSchedule", listSchedule);
		mav.addObject("listTotal",listTotal);
		mav.addObject("listPaging",listPaging);
		mav.addObject("urlQuery","?pageSize="+pageSize+"&schType="+schType+"&schText="+schText);
		
		return mav;
	}
	
	/**
	 * @function : 편성표 작성
	 * @process  : 
	 * 
	 * @MethodName : schedule_new
	 * @param session
	 * @param mode
	 * @param firstdt
	 * @param year
	 * @param month
	 * @param day
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/schedule/new.asp",method=RequestMethod.GET)
	public ModelAndView schedule_new(HttpSession session
			,@RequestParam(value="mode",required=false,defaultValue="new") String mode
			,@RequestParam(value="firstdt",required=false,defaultValue="") String firstdt
			,@RequestParam(value="year",required=false,defaultValue="0") int year
			,@RequestParam(value="month",required=false,defaultValue="0") int month
			,@RequestParam(value="day",required=false,defaultValue="0") int day) throws Exception {
		common(session, "schedule/new", "CA");
		
		Calendar today = Calendar.getInstance();
		
		String writer = "KCTV";
		String title;
		String content;
		if(mode.equals("view") && firstdt.length()==10){
			year = Common.strToInt(firstdt.substring(0,4));
			month = Common.strToInt(firstdt.substring(5,7));
			day = Common.strToInt(firstdt.substring(8,10));
			
			today.set(Calendar.YEAR, year);
			today.set(Calendar.MONTH, month-1);
			today.set(Calendar.DATE, day);
			
			title = String.format("%04d년 %02d월 %02d일 %s요일 편성표", year, month, day, Common.weeks[today.get(Calendar.DAY_OF_WEEK)-1]);
			content = (String)sqlMapClientTemplate.queryForObject("getSchedule", firstdt);
		}else{
			if(year==0 && month==0 && day==0){
				String maxDate = (String)sqlMapClientTemplate.queryForObject("getScheduleMaxDate");
				year = Common.strToInt(maxDate.substring(0,4));
				month = Common.strToInt(maxDate.substring(5,7));
				day = Common.strToInt(maxDate.substring(8,10));
				Calendar tmp = Calendar.getInstance();
				tmp.set(Calendar.YEAR, year);
				tmp.set(Calendar.MONTH, month-1);
				tmp.set(Calendar.DATE, day+1);
				year = tmp.get(Calendar.YEAR);
				month = tmp.get(Calendar.MONTH)+1;
				day = tmp.get(Calendar.DATE);
			}
			today.set(Calendar.YEAR, year);
			today.set(Calendar.MONTH, month-1);
			today.set(Calendar.DATE, day);
			
			firstdt = String.format("%04d-%02d-%02d", year, month, day);
			
			Calendar prev = Calendar.getInstance();
			prev.set(Calendar.YEAR, year);
			prev.set(Calendar.MONTH, month-1);
			prev.set(Calendar.DATE, day);
			prev.add(Calendar.DATE, -7);
			String prevWeek = String.format("%04d-%02d-%02d", prev.get(Calendar.YEAR), prev.get(Calendar.MONTH)+1, prev.get(Calendar.DATE));
			title = String.format("%04d년 %02d월 %02d일 %s요일 편성표", year, month, day, Common.weeks[today.get(Calendar.DAY_OF_WEEK)-1]);
			content = (String)sqlMapClientTemplate.queryForObject("getSchedule", prevWeek);
			//content = Common.toEUCKR(content);
		}
		
		//System.out.println(prevWeek);
		mav.addObject("mode", mode);
		mav.addObject("writer", writer);
		mav.addObject("year",year);
		mav.addObject("month",month);
		mav.addObject("day",day);
		mav.addObject("firstdt",firstdt);
		mav.addObject("title",title);
		mav.addObject("content",content);
		return mav;
	}
	
	/**
	 * @function : 편성표 등록
	 * @process  : 
	 * 
	 * @MethodName : schedule_insert
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/schedule/insert.asp",method=RequestMethod.POST, produces="text/html; charset=utf-8")
	public ModelAndView schedule_insert(HttpSession session, HttpServletRequest request) throws Exception {
		common(session, "schedule/new", "CA");
		
		//request.setCharacterEncoding("euc-kr");
		
		String mode = request.getParameter("mode");
		String writer = Common.strToStr(request.getParameter("writer"));
		String title = Common.strToStr(URLDecoder.decode(request.getParameter("title"), "UTF-8"));
		int year = Common.strToInt(request.getParameter("year"));
		int month = Common.strToInt(request.getParameter("month"));
		int day = Common.strToInt(request.getParameter("day"));
		String firstdt = Common.strToStr(request.getParameter("firstdt"));
		String content = Common.strToStr(URLDecoder.decode(request.getParameter("content"), "UTF-8"));
		
		if(mode == null ) mode = "new";
		Schedule schedule;
		
		/*
		 * System.out.println("################편성표 등록#################");
		System.out.println("타이틀 원 : " + request.getParameter("title"));
		System.out.println(URLDecoder.decode(request.getParameter("title"), "UTF-8"));
		
		System.out.println("콘텐츠 원 : " + request.getParameter("content"));
		System.out.println(URLDecoder.decode(request.getParameter("content"), "UTF-8"));
		*/
		
		if(mode.equals("view")){
			schedule = new Schedule(writer, title, firstdt, content);
			sqlMapClientTemplate.insert("updateSchedule",schedule);
			errMsgGoMain("편성표 수정 완료","list.asp");
		}else{
			firstdt = String.format("%04d-%02d-%02d", year, month, day);
			schedule = new Schedule(writer, title, firstdt, content);
			if(sqlMapClientTemplate.queryForObject("getSchedule", firstdt) == null){
				sqlMapClientTemplate.insert("insertSchedule",schedule);
				errMsgGoMain("편성표 등록 완료","list.asp");
			}else{
				errMsgGoMain("이미 등록된 편성표가 있습니다","list.asp");
			}
		}
		
		return mav;
	}
	
	/**
	 * @function : 편성표 삭제
	 * @process  : 
	 * 
	 * @MethodName : schedule_delete
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/schedule/delete.asp",method=RequestMethod.POST)
	public ModelAndView schedule_delete(HttpSession session,HttpServletRequest request){
		common(session, "schedule/list", "CA");
		
		int listSize = Common.strToInt(request.getParameter("listSize"));
		for(int i=0; i<listSize; i++){
			delCheckValue(request,"sch_list",i);
		}
		
		return mav;
	}
	
	/**
	 * @function : 자막뉴스
	 * @process  : 
	 * 
	 * @MethodName : lineNews_view
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/lineNews/view.asp",method=RequestMethod.GET)
	public ModelAndView lineNews_view(HttpSession session){
		common(session, "lineNews/view", "NE");
		
		LineNews liseNews = (LineNews)sqlMapClientTemplate.queryForObject("getLineNews");
		mav.addObject("content",liseNews.getBd_contents());
		
		return mav;
	}
	
	/**
	 * @function : 자막뉴스 수정 작성
	 * @process  : 
	 * 
	 * @MethodName : lineNews_edit
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/lineNews/edit.asp",method=RequestMethod.GET)
	public ModelAndView lineNews_edit(HttpSession session){
		common(session,"lineNews/edit", "NE");
		
		LineNews liseNews = (LineNews)sqlMapClientTemplate.queryForObject("getLineNews");
		mav.addObject("content",liseNews.getBd_contents());
		
		return mav;
	}
	
	/**
	 * @function : 자막뉴스 등록
	 * @process  : 
	 * 
	 * @MethodName : lineNews_update
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@Transactional
	@RequestMapping(value="/lineNews/update.asp",method=RequestMethod.POST)
	public ModelAndView lineNews_update(HttpSession session, HttpServletRequest request) throws Exception {
		common(session,"lineNews/edit", "JA");
		
		request.setCharacterEncoding("euc-kr");
		
		String contents = request.getParameter("contents");
		
		LineNews lineNews = new LineNews("kctv",contents);
//		System.out.println("캐릭터셋 테스트");
//		System.out.println(lineNews.getBd_contents());
		sqlMapClientTemplate.update("updateLineNews",lineNews);
		
		/*TransactionStatus status = this.transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try{
			sqlMapClientTemplate.update("updateLineNews",lineNews);
			this.transactionManager.commit(status);
		} catch (RuntimeException e) {
			this.transactionManager.rollback(status);
			throw e;
		}*/
		
		errMsgGoMain("수정 완료","view.asp");
		
		return mav;
	}
	
	/**
	 * @function : 관리페이지 상단
	 * @process  : 
	 * 
	 * @MethodName : top_menu
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/top_menu.asp")
	public ModelAndView top_menu(HttpSession session) throws Exception {
		common(session, "top_menu", null);
		
		mav.addObject("adminId",session.getAttribute("adminId"));
		mav.addObject("adminName",session.getAttribute("adminName"));
		mav.addObject("adminLevel",session.getAttribute("adminLevel"));
		
		return mav;
	}
	
	/**
	 * @function : 관리페이지 사이드메뉴
	 * @process  : 
	 * 
	 * @MethodName : left_menu
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/left_menu.asp")
	public ModelAndView left_menu(HttpSession session) throws Exception {
		common(session,"left_menu", null);
		setAdminInfo();
		
		if(admin.getAdad_level()==1 || admin.getAdad_auth_menu().indexOf("AD")>-1) // 관리자
			mav.addObject("menuAD",true);
		
		if(admin.getAdad_level()==1 || admin.getAdad_auth_menu().indexOf("MM")>-1) // 회원
			mav.addObject("menuMM",true);
		
		if(admin.getAdad_level()==1 || admin.getAdad_auth_menu().indexOf("CD")>-1) // 코드
			mav.addObject("menuCD",true);
		
		if(admin.getAdad_level()==1 || admin.getAdad_auth_menu().indexOf("NE")>-1) // 뉴스
			mav.addObject("menuNE",true);
		
		if(admin.getAdad_level()==1 || admin.getAdad_auth_menu().indexOf("VO")>-1) // VOD
			mav.addObject("menuVO",true);
		
		if(admin.getAdad_level()==1 || admin.getAdad_auth_menu().indexOf("BD")>-1) // 게시판
			mav.addObject("menuBD",true);
		
		if(admin.getAdad_level()==1 || admin.getAdad_auth_menu().indexOf("CA")>-1) // 편성표
			mav.addObject("menuCA",true);
		
		if(admin.getAdad_level()==1 || admin.getAdad_auth_menu().indexOf("CM")>-1) // 메뉴/컨텐츠
			mav.addObject("menuCM",true);
		
		if(admin.getAdad_level()==1 || admin.getAdad_auth_menu().indexOf("ET")>-1) // 기타
			mav.addObject("menuET",true);
		
		if(admin.getAdad_level()==1 || admin.getAdad_auth_menu().indexOf("JA")>-1) // 자막뉴스
			mav.addObject("menuJA",true);
		
		//ArrayList<AdminMenu> listMenu = (ArrayList<AdminMenu>)sqlMapClientTemplate.queryForList("getAdminMenu", admin);
		//mav.addObject("adminMenu",listMenu);
		
		return mav;
	}
	
	/**
	 * @function : 관리페이지 메인
	 * @process  : 
	 * 
	 * @MethodName : main
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/main.asp")
	public ModelAndView main(HttpSession session, HttpServletRequest request) throws Exception {
		common(session,"main", null);
		
		mav.addObject("adminId",session.getAttribute("adminId"));
		mav.addObject("adminName",session.getAttribute("adminName"));
		mav.addObject("adminLevel",session.getAttribute("adminLevel"));
		mav.addObject("adminIp",request.getRemoteAddr());
		
		return mav;
	}
	
	/**
	 * @function : 관리페이지 카피라이트
	 * @process  : 
	 * 
	 * @MethodName : copyright
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/copyright.asp")
	public ModelAndView copyright(HttpSession session) throws Exception {
		common(session,"copyright", null);
		
		return mav;
	}
	
	/**
	 * @function : 관리자 여부 체크
	 * @process  : 
	 * 
	 * @MethodName : chkAdminLogin
	 */
	private void chkAdminLogin(){
		if(session.getAttribute("adminId") == null || session.getAttribute("adminId").toString().length()<0)
			errMsgGo("", "login.asp");
	}
	
	/**
	 * @function : 관리자 정보 설정
	 * @process  : 
	 * 
	 * @MethodName : setAdminInfo
	 */
	private void setAdminInfo(){
		this.admin = new Admin(
				session.getAttribute("adminId").toString(),
				session.getAttribute("adminName").toString(),
				Common.strToInt(session.getAttribute("adminLevel").toString()),
				session.getAttribute("adminMenus").toString()
			);
	}
	
	/**
	 * @function : 공통 업데이트 메서드 
	 * @process  : 
	 * 
	 * @MethodName : setCheckValue
	 * @param request
	 * @param table
	 * @param field
	 * @param i
	 */
	private void setCheckValue(HttpServletRequest request,String table,String field,int i){
		CommonUpdate commonUpdate;
		if(request.getParameter("chk_"+field+"_"+i) == null){
			commonUpdate = new CommonUpdate(table,field,"num="+request.getParameter("chk_val_"+i),null);
			sqlMapClientTemplate.update("updateCommon",commonUpdate);
		}else{
			commonUpdate = new CommonUpdate(table,field,"num="+request.getParameter("chk_val_"+i),"1");
			sqlMapClientTemplate.update("updateCommon",commonUpdate);
		}
	}
	
	/**
	 * @function : 파일 삭제
	 * @process  : 
	 * 
	 * @MethodName : delCheckValue
	 * @param request
	 * @param table
	 * @param i
	 */
	private void delCheckValue(HttpServletRequest request,String table, int i){
		CommonDelete commonDelete;
		if(request.getParameter("chk_del_"+i) != null && request.getParameter("chk_del_"+i).equals(request.getParameter("chk_val_"+i))){
			commonDelete = new CommonDelete(table,"num="+request.getParameter("chk_val_"+i));
			String imageFile;
			if(table.equals("vodlist")){
				imageFile = (String)sqlMapClientTemplate.queryForObject("getVodImage", commonDelete);
				if(imageFile != null){
					Common.deleteFile(uploadPath + "vod/" + imageFile);
				}
			}else{
				imageFile = (String)sqlMapClientTemplate.queryForObject("getJctvNewsImage", commonDelete);
				if(imageFile != null){
					Common.deleteFile(uploadPath + "news/" + imageFile);
				}
			}
			sqlMapClientTemplate.delete("deleteCommon",commonDelete);
		}
	}
	
	/**
	 * @function : 체크박스 체크 확인
	 * @process  : 
	 * 
	 * @MethodName : setChecked
	 * @param str
	 * @return
	 */
	private String setChecked(String str){
		if(str != null && str.equals("1"))
			return "checked=\"checked\"";
		else
			return ""; 
	}
	
	/**
	 * @function : 에러 메시지 표시
	 * @process  : 
	 * 
	 * @MethodName : errMsgGo
	 * @param msg
	 * @param url
	 */
	private void errMsgGo(String msg, String url){
		mav.setViewName("include/common_receive");
		mav.addObject("msg",msg);
		mav.addObject("go_url",url);
	}
	
	/**
	 * @function : 에러 메시지 & 리턴 유알엘
	 * @process  : 
	 * 
	 * @MethodName : errMsgGoMain
	 * @param msg
	 * @param url
	 */
	private void errMsgGoMain(String msg, String url){
		mav.setViewName("include/common_receive");
		mav.addObject("msg",msg);
		mav.addObject("frame","admin_main");
		mav.addObject("go_url",url);
	}
}
