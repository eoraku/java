package kctv.web.cms;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/kctvn")
public class KctvnController {
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	ModelAndView mav;
	HttpSession session;
	
	private void common(HttpSession session, boolean isLeftMenu,String menu,int muid){
		this.session = session;
		mav = new ModelAndView(menu+"/"+muid);
		mav.addObject("isLeftMenu",isLeftMenu);
	}
	
	@RequestMapping("/content_top.htm")
	public ModelAndView contents_top(HttpSession session,@RequestParam("muid") int muid) throws Exception {
		mav = new ModelAndView("kctvn/content_top");
		mav.addObject("menuName",(String)sqlMapClientTemplate.queryForObject("getMenuName",muid));
		return mav;
	}
	
	@RequestMapping("/index.htm")
	public ModelAndView cpublic(HttpSession session,@RequestParam("muid") int muid,@RequestParam(value="subid",required=true,defaultValue="3") int subid) throws Exception {
		common(session,true,"kctvn",muid);
		
		return mav;
	}
}
