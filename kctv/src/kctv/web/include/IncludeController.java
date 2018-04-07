package kctv.web.include;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kctv.web.cms.LeftMenu;
import kctv.web.session.Session;
import kctv.web.weather.National;

/**
 * <pre>
 * kctv.web.include
 * IncludeController.java
 * </pre>
 * <pre>
 * WebContent/WEB-INF/view/include 영역 컨트롤러 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
@Controller
@RequestMapping("/include")
public class IncludeController {
	@Value("#{config['serverType']}") String serverType;
	@Value("#{config['ssl']}") String ssl;
	@Value("#{config['domain']}") String domain;
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplateWeather;
	
	ModelAndView mav;
	
	boolean isAdmin=false;
	
	/**
	 * @function : 페이지 호출 처리
	 * @process  : 
	 * 
	 * @MethodName : common
	 * @param view
	 */
	private void common(String view){
		mav = new ModelAndView("include/"+view);
		mav.addObject("serverType", serverType);
		mav.addObject("homeUrl","http://"+domain+ctxRoot);
		mav.addObject("sslDomain",ssl+domain+ctxRoot);
	}
	
	@RequestMapping("/common_header.htm")
	public ModelAndView common_header() throws Exception {
		common("common_header");
		return mav;
	}
	
	@RequestMapping("/common_footer.htm")
	public ModelAndView common_footer(HttpSession session) throws Exception {
		common("common_footer");
		isAdmin=Session.chkAdmin(session, mav);
		return mav;
	}
	
	@RequestMapping("/common_top.htm")
	public ModelAndView common_top() throws Exception {
		common("common_top");
		addListTopSearch();
		return mav;
	}
	
	@RequestMapping("/common_top_menu.htm")
	public ModelAndView common_top_menu(HttpSession session) throws Exception {
		common("common_top_menu");
		mav.addObject("isLogin", Session.chkLogin(session, mav));
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/common_left_menu.htm")
	public ModelAndView common_left_menu(@RequestParam("muid") int muid) throws Exception {
		common("common_left_menu");
		int puid = 0;
		ArrayList<LeftMenu> menuList=(ArrayList<LeftMenu>)sqlMapClientTemplate.queryForList("cmsLeftMenu",muid);
		LeftMenu leftMenu;
		for(int i=0;i<menuList.size(); i++){
			leftMenu=(LeftMenu)menuList.get(i);
			if(leftMenu.getUid()==muid)
				puid=leftMenu.getParent();
		}
		mav.addObject("muid",muid);
		mav.addObject("puid",puid);
		mav.addObject("leftMenu",menuList);
		return mav;
	}
	
	@RequestMapping("/news_header.htm")
	public ModelAndView news_header() throws Exception {
		common("news_header");
		return mav;
	}
	
	@RequestMapping("/eng_news_header.htm")
	public ModelAndView eng_news_header() throws Exception {
		common("eng_news_header");
		return mav;
	}
	
	@RequestMapping("/chi_news_header.htm")
	public ModelAndView chi_news_header() throws Exception {
		common("chi_news_header");
		return mav;
	}
	
	@RequestMapping("/news_footer.htm")
	public ModelAndView news_footer() throws Exception {
		common("news_footer");
		return mav;
	}
	
	@RequestMapping("/eng_news_footer.htm")
	public ModelAndView eng_news_footer() throws Exception {
		common("eng_news_footer");
		return mav;
	}
	
	@RequestMapping("/chi_news_footer.htm")
	public ModelAndView chi_news_footer() throws Exception {
		common("chi_news_footer");
		return mav;
	}
	
	@RequestMapping("/news_top.htm")
	public ModelAndView news_top() throws Exception {
		common("news_top");
		addListTopSearch();
		addWeather();
		return mav;
	}
	
	@RequestMapping("/eng_news_top.htm")
	public ModelAndView eng_news_top() throws Exception {
		common("eng_news_top");
		return mav;
	}
	
	@RequestMapping("/chi_news_top.htm")
	public ModelAndView chi_news_top() throws Exception {
		common("chi_news_top");
		return mav;
	}
	
	@RequestMapping("/news_top_menu.htm")
	public ModelAndView news_top_menu() throws Exception {
		common("news_top_menu");
		return mav;
	}
	
	@RequestMapping("/eng_news_top_menu.htm")
	public ModelAndView eng_news_top_menu() throws Exception {
		common("eng_news_top_menu");
		mav.addObject("domain",domain);
		return mav;
	}
	
	@RequestMapping("/chi_news_top_menu.htm")
	public ModelAndView chi_news_top_menu() throws Exception {
		common("chi_news_top_menu");
		mav.addObject("domain",domain);
		return mav;
	}
	
	@RequestMapping("/admin_header.asp")
	public ModelAndView admin_header() throws Exception {
		common("admin_header");
		return mav;
	}
	
	@RequestMapping("/admin_footer.asp")
	public ModelAndView admin_footer() throws Exception {
		common("admin_footer");
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	public void addListTopSearch(){
		mav.addObject("listTopSearch", (ArrayList<String>)sqlMapClientTemplate.queryForList("indexListTopSearch"));
	}
	
	@SuppressWarnings("unchecked")
	private void addWeather(){
		//ArrayList<National> listNational = (ArrayList<National>)sqlMapClientTemplateWeather.queryForList("listNational");
		//mav.addObject("listNational",listNational);
	}
}
