package kctv.web.event;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * <pre>
 * kctv.web.event
 * EventController.java
 * </pre>
 * <pre>
 * 행사 & 알림 뷰 컨트롤러 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
@Controller
@RequestMapping("/event")
public class EventController {
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	String menu;
	String program;
	ModelAndView mav;
	HttpSession session;
	
	/**
	 * @function : 페이지 호출
	 * @process  : 
	 * 
	 * @MethodName : common
	 * @param session
	 * @param isLeftMenu
	 * @param page
	 */
	private void common(HttpSession session, boolean isLeftMenu,String page){
		this.session = session;
		
		mav = new ModelAndView("event/"+page);
		
		mav.addObject("isLeftMenu",isLeftMenu);
		mav.addObject("ctxRoot",ctxRoot);
	}
	
	/**
	 * @function : 하단 행사& 알림 영역 
	 * @process  : 
	 * 
	 * @MethodName : notice
	 * @param session
	 * @param muid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/notice.htm")
	public ModelAndView notice(HttpSession session,@RequestParam(value="muid",required=true,defaultValue="0") int muid) throws Exception {
		common(session,true,"notice");
		mav.addObject("eventNotice",(String)sqlMapClientTemplate.queryForObject("indexEvent"));
		return mav;
	}
	
	@RequestMapping("/notice2.htm")
	public ModelAndView notice2(HttpSession session,@RequestParam(value="muid",required=true,defaultValue="0") int muid) throws Exception {
		common(session,true,"notice2");
		mav.addObject("eventNotice",(String)sqlMapClientTemplate.queryForObject("indexEvent"));
		return mav;
	}
}
