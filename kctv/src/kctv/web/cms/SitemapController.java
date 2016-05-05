package kctv.web.cms;

import java.util.ArrayList;

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
 * SitemapController.java
 * </pre>
 * <pre>
 * 홈페이지 사이트맵 컨트롤러 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 18.
 * @version: 
 */
@Controller
@RequestMapping("/sitemap")
public class SitemapController {
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	ModelAndView mav;
	HttpSession session;

	/**
	 * @function : 페이지 호출
	 * @process  : 
	 * 
	 * @MethodName : common
	 * @param session
	 * @param isLeftMenu
	 * @param menu
	 * @param muid
	 */
	private void common(HttpSession session, boolean isLeftMenu,String menu,int muid){
		this.session = session;
		mav = new ModelAndView(menu+"/"+muid);
		mav.addObject("isLeftMenu",isLeftMenu);
	}
	
	/**
	 * @function : muid에 해당하는 메뉴명 조회
	 * @process  : 
	 * 
	 * @MethodName : contents_top
	 * @param session
	 * @param muid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/content_top.htm")
	public ModelAndView contents_top(HttpSession session,@RequestParam("muid") int muid) throws Exception {
		mav = new ModelAndView("sitemap/content_top");
		mav.addObject("menuName",(String)sqlMapClientTemplate.queryForObject("getMenuName",muid));
		return mav;
	}
	
	/**
	 * @function : 사이트맵 그룹 메뉴 조회
	 * @process  : 
	 * 
	 * @MethodName : cpublic
	 * @param session
	 * @param muid
	 * @param subid
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/index.htm")
	public ModelAndView cpublic(HttpSession session,@RequestParam("muid") int muid,@RequestParam(value="subid",required=true,defaultValue="3") int subid) throws Exception {
		common(session,true,"sitemap",muid);
		
		if(muid==185){
			ArrayList<LeftMenu> sitemap;
			//사이트맵 그룹 메뉴 검색
			sitemap = (ArrayList<LeftMenu>)sqlMapClientTemplate.queryForList("getSitemap",8);
			mav.addObject("sitemap00",sitemap);
			
			sitemap = (ArrayList<LeftMenu>)sqlMapClientTemplate.queryForList("getSitemap",1);
			mav.addObject("sitemap01",sitemap);
			
			sitemap = (ArrayList<LeftMenu>)sqlMapClientTemplate.queryForList("getSitemap",2);
			mav.addObject("sitemap02",sitemap);
			
			sitemap = (ArrayList<LeftMenu>)sqlMapClientTemplate.queryForList("getSitemap",4);
			mav.addObject("sitemap04",sitemap);
			
			sitemap = (ArrayList<LeftMenu>)sqlMapClientTemplate.queryForList("getSitemap",7);
			mav.addObject("sitemap05",sitemap);
			
			sitemap = (ArrayList<LeftMenu>)sqlMapClientTemplate.queryForList("getSitemap",5);
			mav.addObject("sitemap06",sitemap);
			
			sitemap = (ArrayList<LeftMenu>)sqlMapClientTemplate.queryForList("getSitemap",6);
			mav.addObject("sitemap07",sitemap);
		}
		
		return mav;
	}
}
