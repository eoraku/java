package kctv.web.session;

import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;

/**
 * <pre>
 * kctv.web.session
 * Session.java
 * </pre>
 * <pre>
 * 세션 정보 저장 클래스입니다. 일반 사용자 / 관리자 로그인 시에 세션에 아이디, 이름, 이메일, 권한을 적용합니다.
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class Session {
	public static boolean chkLogin(HttpSession session, ModelAndView mav){
		if(session.getAttribute("userid")!=null && session.getAttribute("userid").toString().length()>0){
			mav.addObject("login_userid",session.getAttribute("userid"));
			mav.addObject("login_name",session.getAttribute("name"));
			mav.addObject("login_email",session.getAttribute("email"));
			mav.addObject("login_level",session.getAttribute("level"));
			mav.addObject("isLogin",true);
			return true;
		}
		else
			return false;
	}
	
	public static boolean chkAdmin(HttpSession session, ModelAndView mav){
		if(session.getAttribute("adminId")!=null && session.getAttribute("adminId").toString().length()>0){
			mav.addObject("admin_userid",session.getAttribute("adminId"));
			mav.addObject("admin_name",session.getAttribute("adminName"));
			mav.addObject("admin_level",session.getAttribute("adminLevel"));
			mav.addObject("admin_menus",session.getAttribute("adminMenus"));
			mav.addObject("admin_email",session.getAttribute("adminEmail"));
			mav.addObject("isAdmin",true);
			return true;
		}
		else
			return false;
	}
}