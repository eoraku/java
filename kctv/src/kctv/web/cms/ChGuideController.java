package kctv.web.cms;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * <pre>
 * kctv.web.cms
 * ChGuideController.java
 * </pre>
 * <pre>
 * 채널가이드 컨트롤러 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
@Controller
@RequestMapping("/chGuide")
public class ChGuideController {
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	ModelAndView mav;
	HttpSession session;
	
	/**
	 * @function : 
	 * @process  : 
	 * 
	 * @MethodName : common
	 * @param session
	 * @param isLeftMenu
	 * @param menu
	 * @param muid
	 */
	private void common(HttpSession session, boolean isLeftMenu,String menu,String muid){
		this.session = session;
		mav = new ModelAndView(menu+"/"+muid);
		mav.addObject("isLeftMenu",isLeftMenu);
	}
	
	@RequestMapping("/content_top.htm")
	public ModelAndView contents_top(HttpSession session,@RequestParam("muid") int muid) throws Exception {
		mav = new ModelAndView("chGuide/content_top");
		mav.addObject("menuName",(String)sqlMapClientTemplate.queryForObject("getMenuName",muid));
		return mav;
	}
	
	@RequestMapping("/index.htm")
	public ModelAndView company(HttpSession session,@RequestParam("muid") String muid) throws Exception {
		common(session,true,"chGuide",muid);
		return mav;
	}
}
