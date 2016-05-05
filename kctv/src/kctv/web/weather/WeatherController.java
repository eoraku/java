package kctv.web.weather;

import javax.servlet.http.HttpSession;

import kctv.web.session.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * <pre>
 * kctv.web.weather
 * WeatherController.java
 * </pre>
 * <pre>
 * 날씨페이지 컨트롤러
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 13.
 * @version: 
 */
@Controller
@RequestMapping("/weather")
public class WeatherController {
	@Value("#{config['serverType']}") String serverType;
	@Value("#{config['ssl']}") String ssl;
	@Value("#{config['domain']}") String domain;
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplateWeather;
	
	ModelAndView mav;
	
	boolean isAdmin=false;
	boolean isLogin = false;
	
	private void common(String page){
		mav = new ModelAndView("weather/"+page);
		mav.addObject("ctxRoot",ctxRoot);
	}
	
	@RequestMapping("/index.htm")
	public ModelAndView index(HttpSession session) throws Exception {
		common("index");
		isLogin=Session.chkLogin(session, mav);
		return mav;
	}

}
