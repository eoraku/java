package kctv.web.cms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kctv.web.cms.CmContent;
import kctv.web.common.Common;
import kctv.web.session.Session;

/**
 * <pre>
 * kctv.web.cms
 * CmsController.java
 * </pre>
 * <pre>
 * 컨텐츠 영역 컨트롤러 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2014. 1. 4.
 * @version: 
 */
@Controller
@RequestMapping("/contents")
public class CmsController {
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	String menu;
	int muid;
	int pageNo;
	int buid;
	int guid;
	String subPage;
	String mode;
	ModelAndView mav;
	HttpSession session;
	CmContent cmContent;
	
	/**
	 * @function : 페이지 이동 처리 (해당 페이지 Cm으로 사용하는 내역 조회) 
	 * @process  : 
	 * 
	 * @MethodName : common
	 * @param request
	 * @param menu
	 * @param isLeftMenu
	 * @throws Exception
	 */
	private void common(HttpServletRequest request, String menu,boolean isLeftMenu) throws Exception {
		this.session = request.getSession();
		
		mav = new ModelAndView("layout");
		setRequestParameter(request);
		cmContent=(CmContent)sqlMapClientTemplate.queryForObject("getCmContent",muid);
		
		mav.addObject("ctxRoot",ctxRoot);
		mav.addObject("menu",menu);
		mav.addObject("isLeftMenu",isLeftMenu);
		mav.addObject("cmContent",cmContent);
		
		Session.chkLogin(session, mav);
	}
	
	@RequestMapping("{menuName}/left_menu.htm")
	public ModelAndView left_menu(@PathVariable("menuName") String menuName) throws Exception {
		mav = new ModelAndView(menuName+"/left_menu");
		return mav;
	}
	
	@RequestMapping("/company.htm")
	public ModelAndView company(HttpServletRequest request) throws Exception {
		common(request, "company",true);
		return mav;
	}
	
	@RequestMapping("/product.htm")
	public ModelAndView product(HttpServletRequest request) throws Exception {
		common(request, "product",true);
		return mav;
	}
	
	@RequestMapping("/chGuide.htm")
	public ModelAndView ch_guide(HttpServletRequest request) throws Exception {
		common(request, "chGuide",true);
		return mav;
	}
	
	@RequestMapping("/cPublic.htm")
	public ModelAndView cPublic(HttpServletRequest request) throws Exception {
		common(request, "cPublic",true);
		return mav;
	}
	
	@RequestMapping("/program.htm")
	public ModelAndView program(HttpServletRequest request) throws Exception {
		common(request, "program",true);
		
		if(cmContent.getFrame_id()==10){
			if(guid==0){
				mav.addObject("subPage",getCmType(cmContent.getType()));
				mav.addObject("guid",muid);
			}else{
				mav.addObject("subPage",getCmType((Integer)sqlMapClientTemplate.queryForObject("getCmSubType",guid)));
			}
		}
		
		return mav;
	}
	
	@RequestMapping("/customer.htm")
	public ModelAndView customer(HttpServletRequest request) throws Exception {
		common(request, "customer",true);
		return mav;
	}
	
	@RequestMapping("/member.htm")
	public ModelAndView member(HttpServletRequest request) throws Exception {
		common(request, "member",true);
		return mav;
	}
	
	@RequestMapping("/kctvn.htm")
	public ModelAndView kctvn(HttpServletRequest request) throws Exception {
		common(request, "kctvn",true);
		return mav;
	}
	
	@RequestMapping("/sitemap.htm")
	public ModelAndView sitemap(HttpServletRequest request) throws Exception {
		common(request, "sitemap",true);
		return mav;
	}
	
	private String getCmType(int mid){
		String subPage;
		if(mid==0)
			subPage = "intro";
		else if(mid==3)
			subPage = "vod";
		else if(mid==4)
			subPage = "board";
		else
			subPage = "intro";
		
		return subPage;
	}
	
	private void setRequestParameter(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("euc-kr");
		
		this.muid = Common.strToInt(request.getParameter("muid"));
		mav.addObject("muid",muid);
		
		this.pageNo = Common.strToInt(request.getParameter("pageNo"), 1);
		mav.addObject("pageNo",pageNo);
		
		this.buid = Common.strToInt(request.getParameter("buid"));
		mav.addObject("buid",buid);
		
		this.mode = Common.strToStr(request.getParameter("mode"), "list");
		mav.addObject("mode",mode);
		
		this.guid = Common.strToInt(request.getParameter("guid"));
		mav.addObject("guid",guid);
		
		this.subPage = Common.strToStr(request.getParameter("subPage"), "index");
		mav.addObject("subPage",subPage);
	}
}
