package kctv.web.cms;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kctv.web.vod.VodWeek;
import kctv.xml.XPathVodWeb;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	ModelAndView mav;
	HttpSession session;
	
	private void common(HttpSession session, boolean isLeftMenu,String menu,String muid){
		this.session = session;
		mav = new ModelAndView(menu+"/"+muid);
		mav.addObject("isLeftMenu",isLeftMenu);
	}
	
	@RequestMapping("/content_top.htm")
	public ModelAndView contents_top(HttpSession session,@RequestParam("muid") int muid) throws Exception {
		mav = new ModelAndView("product/content_top");
		mav.addObject("menuName",(String)sqlMapClientTemplate.queryForObject("getMenuName",muid));
		return mav;
	}
	
	@RequestMapping("/index.htm")
	public ModelAndView company(HttpSession session,@RequestParam("muid") String muid,@RequestParam(value="subid",required=true,defaultValue="3") int subid) throws Exception {
		common(session,true,"product",muid);
		
		if(muid.equals("340")){
			mav.addObject("subid",subid);
			
			if(subid==1){
			}
			else if(subid==2){
				@SuppressWarnings("unchecked")
				ArrayList<VodWeek> listVodWeek = (ArrayList<VodWeek>)sqlMapClientTemplate.queryForList("listVodWeek");
				
				int i=0;
				for(VodWeek item:listVodWeek){
					item.setImage_url(ctxRoot+"upload/vodWeek/"+item.getImage_url());
					if(i == 0)
						mav.addObject("latestImage",item.getImage_url());
					i++;
				}
				mav.addObject("listVodWeek",listVodWeek);
			}
			else if(subid==3){
				XPathVodWeb xvw;
				@SuppressWarnings("rawtypes")
				ArrayList list = new ArrayList();
				//한국영화
				xvw = new XPathVodWeb("http://www.hchoice.co.kr/vod_xml/vod_xml.asp?gbn=1&reccate=1");
				list = xvw.getList();
				mav.addObject("listVodKOR",list);
				//해외영화
				xvw = new XPathVodWeb("http://www.hchoice.co.kr/vod_xml/vod_xml.asp?gbn=1&reccate=2");
				list = xvw.getList();
				mav.addObject("listVodFOR",list);
			}
			else if(subid==4){
				XPathVodWeb xvw;
				@SuppressWarnings("rawtypes")
				ArrayList list = new ArrayList();
				//드라마
				xvw = new XPathVodWeb("http://www.hchoice.co.kr/vod_xml/vod_xml.asp?gbn=2&reccate=1");
				list = xvw.getList();
				mav.addObject("listVodRec1",list);
				//애니메이션/키즈
				xvw = new XPathVodWeb("http://www.hchoice.co.kr/vod_xml/vod_xml.asp?gbn=2&reccate=2");
				list = xvw.getList();
				mav.addObject("listVodRec2",list);
				//지상파
				xvw = new XPathVodWeb("http://www.hchoice.co.kr/vod_xml/vod_xml.asp?gbn=2&reccate=3");
				list = xvw.getList();
				mav.addObject("listVodRec3",list);
				//교육
				xvw = new XPathVodWeb("http://www.hchoice.co.kr/vod_xml/vod_xml.asp?gbn=2&reccate=4");
				list = xvw.getList();
				mav.addObject("listVodRec4",list);
				//오락/스포츠
				xvw = new XPathVodWeb("http://www.hchoice.co.kr/vod_xml/vod_xml.asp?gbn=2&reccate=5");
				list = xvw.getList();
				mav.addObject("listVodRec5",list);
				//생활/다큐
				xvw = new XPathVodWeb("http://www.hchoice.co.kr/vod_xml/vod_xml.asp?gbn=2&reccate=6");
				list = xvw.getList();
				mav.addObject("listVodRec6",list);
			}
			else if(subid==5){
				XPathVodWeb xvw;
				@SuppressWarnings("rawtypes")
				ArrayList list = new ArrayList();
				//TOP10 무비
				xvw = new XPathVodWeb("http://www.hchoice.co.kr/vod_xml/vod_xml.asp?gbn=4");
				list = xvw.getList();
				mav.addObject("listVod10Mov",list);
			}
			else if(subid==6){
				XPathVodWeb xvw;
				@SuppressWarnings("rawtypes")
				ArrayList list = new ArrayList();
				//TOP10 프로그램
				xvw = new XPathVodWeb("http://www.hchoice.co.kr/vod_xml/vod_xml.asp?gbn=5");
				list = xvw.getList();
				mav.addObject("listVod10Pro",list);
			}
		}
		return mav;
	}
}
