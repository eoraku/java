package kctv.web.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * <pre>
 * kctv.web.error
 * ErrorController.java
 * </pre>
 * <pre>
 * 에러 처리 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 17.
 * @version: 
 */
@Controller
public class ErrorController {
	ModelAndView mav;
	
	@RequestMapping("/pageNotFoundError.htm")
	public ModelAndView pageNotFoundError(){
		mav = new ModelAndView("pageNotFoundError");
		
		return mav;
	}
}
