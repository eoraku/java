package kctv.web.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * <pre>
 * kctv.web.common
 * PopupController.java
 * </pre>
 * <pre>
 * 팝업 사용 컨트롤 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 17.
 * @version: 
 */
@Controller
@RequestMapping("/popup")
public class PopupController {
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	ModelAndView mav;
	
	/**
	 * @function : 팝업 호출
	 * @process  : 
	 * 
	 * @MethodName : common
	 * @param page
	 */
	private void common(String page){
		mav = new ModelAndView(page);
		mav.addObject("ctxRoot",ctxRoot);
	}
	
	/**
	 * @function : 1건 팝업 호출
	 * @process  : 
	 * 
	 * @MethodName : company
	 * @param num
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/index.htm")
	public ModelAndView company(@RequestParam(value="num",required=false,defaultValue="0") int num) throws Exception {
		common("popup/index");
		
		Popup popup = (Popup)sqlMapClientTemplate.queryForObject("getPopup", num);
		
		mav.addObject("item", popup);
		
		return mav;
	}
	
	/**
	 * @function : 팝업 이미지 처리
	 * @process  : 
	 * 
	 * @MethodName : viewImg
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/viewImg.htm")
	public ModelAndView viewImg(HttpServletRequest request) throws Exception {
		common("popup/viewImg");
		request.setCharacterEncoding("euc-kr");
		String imgUrl = Common.strToStr(request.getParameter("imgUrl"));
		int imgWidth = Common.strToInt(request.getParameter("imgWidth"));
		int imgHeight = Common.strToInt(request.getParameter("imgWidth"));
		
		mav.addObject("imgUrl",imgUrl);
		mav.addObject("imgWidth",imgWidth);
		mav.addObject("imgHeight",imgHeight);
		
		return mav;
	}
}
