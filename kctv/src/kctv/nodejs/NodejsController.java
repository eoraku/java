package kctv.nodejs;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kctv.web.common.Common;
import kctv.web.news.News;
import kctv.web.news.NewsParameter;
import kctv.web.vod.Vod;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * <pre>
 * kctv.nodejs
 * NodejsController.java
 * </pre>
 * <pre>
 * Nodejs 사용을 위한 컨트롤러 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 16.
 * @version: 
 */
@Controller
@RequestMapping("/nodejs")
public class NodejsController {
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	ModelAndView mav;
	
	String serverUrl = "http://122.202.129.90:3000";
	
	/**
	 * @function : 페이지 호출 공통 처리
	 * @process  : ctxRoot/nodejs/이하 호출시 사용
	 * 
	 * @MethodName : common
	 * @param page
	 */
	private void common(String page){
		mav = new ModelAndView("nodejs/"+page);
		mav.addObject("ctxRoot",ctxRoot);
		mav.addObject("serverUrl",serverUrl);
	}
	
	/**
	 * @function : 메인페이지 화제의 영상 리스트 xml
	 * @process  : 
	 * 
	 * @MethodName : listVod
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/listVod.xml", method=RequestMethod.GET, headers="Accept=application/xml", produces={MediaType.APPLICATION_XML_VALUE})
	public @ResponseBody String listVod() throws Exception {
		String xmlHeader = "<?xml version=\"1.0\" encoding=\"euc-kr\"?>";
		String xmlBody = "";
		String xmlResult = "";
		ArrayList<Vod> listVod = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("indexVodEng", 5);
		for(Vod item:listVod){
			xmlBody += getTag("title",item.getTitle(), "string");
		}
		
		xmlResult = xmlHeader + "<root>" + xmlBody + "</root>";
		xmlResult = new String(xmlResult.getBytes("euc-kr"),"iso-8859-1");
		return xmlResult;
	}
	
	/**
	 * @function : 뉴스 json 포맷으로 받기
	 * @process  : 뉴스 검색 후 json파일 형식으로 반환
	 * 
	 * @MethodName : jsonp
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/news.json", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String jsonp(HttpServletRequest request) throws Exception {
		String callBack = request.getParameter("callback");
		
		int pageNo = 1;
		int pageSize = 20;
		int guid = 1;
		String schType = "";
		String schText = "";
		
		NewsParameter newsParameter = new NewsParameter(pageNo, pageSize, guid, schType, schText);
		
		ArrayList<News> listNews;
		listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("listNews", newsParameter);
		remapNews(listNews);
		
		int rows = 0;
		String body = "";
		for(News item:listNews){
			if(rows>0)
				body += ",";
			
			body += (++rows)
					+":{'num':'"+item.getNum()
					+"','name':'"+item.getName()
					+"','title':'"+item.getTitle()
					//+"','content':'"+item.getContent()
					//+"','date':'"+item.getLdate()
					+"','image':'"+item.getSvrfile2()+"'}";
		}
		
		body = callBack+"({"+body+"})";
		
		return body;
	}
	
	/**
	 * @function : view 페이지 
	 * @process  : 
	 * 
	 * @MethodName : view
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/view.htm")
	public ModelAndView view(){
		common("view");
		ArrayList<News> listNews;
		listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("nodejsNewsHot");
		remapNews(listNews);
		mav.addObject("listNews",listNews);
		return mav;
	}
	
	/**
	 * @function : control 페이지
	 * @process  : 
	 * 
	 * @MethodName : control
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/control.htm")
	public ModelAndView control(){
		common("control");
		ArrayList<News> listNews;
		listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("nodejsNewsHot");
		remapNews(listNews);
		mav.addObject("listNews",listNews);
		return mav;
	}
	
	@RequestMapping("/m1.htm")
	public ModelAndView m1(){
		common("m1");
		return mav;
	}
	
	@RequestMapping("/m2.htm")
	public ModelAndView m2(){
		common("m2");
		return mav;
	}
	
	@RequestMapping("/m3.htm")
	public ModelAndView m3(){
		common("m3");
		return mav;
	}
	
	@RequestMapping("/v0.htm")
	public ModelAndView v0(){
		common("v0");
		return mav;
	}
	
	@RequestMapping("/v1.htm")
	public ModelAndView v1(){
		common("v1");
		return mav;
	}
	
	@RequestMapping("/v2.htm")
	public ModelAndView v2(){
		common("v2");
		return mav;
	}
	
	@RequestMapping("/v3.htm")
	public ModelAndView v3(){
		common("v3");
		return mav;
	}
	
	@RequestMapping("/v4.htm")
	public ModelAndView v4(){
		common("v4");
		return mav;
	}
	
	/**
	 * @function : tag 매칭후 해당 태그 리턴
	 * @process  : 
	 * 
	 * @MethodName : getTag
	 * @param tagName
	 * @param value
	 * @param type
	 * @return
	 * @throws Exception
	 */
	private String getTag(String tagName, String value, String type) throws Exception {
		String tag;
		
		if(type.equals("string"))
			tag = "<"+tagName+"><![CDATA["+value+"]]></"+tagName+">";
		else
			tag = "<"+tagName+">"+value+"</"+tagName+">";
		
		return tag;
	}
	
	/**
	 * @function : 뉴스 리매핑
	 * @process  : 
	 * 
	 * @MethodName : remapNews
	 * @param list
	 */
	private void remapNews(ArrayList<News> list){
		String imageUrl;
		for(News item:list){
			if(item.getGroup_flag() != null && item.getGroup_flag().length()>0){
				item.setMaincd(Common.newsCategory[Integer.parseInt(item.getGroup_flag())]);
				item.setSubcd(Common.newsGroup[Integer.parseInt(item.getGroup_flag())]);
			}

			if(item.getLdate() != null)
				item.setLdate(item.getLdate().substring(0,4)+"-"+item.getLdate().substring(4,6)+"-"+item.getLdate().substring(6,8));
			
			if(item.getTitle() != null){
				item.setTitle(replaceQuote(item.getTitle()));
			}
			
			/*if(item.getContent() != null){
				item.setContent(Common.replaceBRtoSpace(item.getContent()));
				item.setContent(replaceQuote(item.getContent()));
			}*/

			imageUrl = item.getSvrfile2();
			if(imageUrl != null && !imageUrl.equals("0") && imageUrl.length()>1){
				item.setSvrfile2("http://www.kctvjeju.com/upload/news/"+imageUrl);
			}
		}
	}
	
	/**
	 * @function : ' -> " 변환
	 * @process  : 
	 * 
	 * @MethodName : replaceQuote
	 * @param str
	 * @return
	 */
	private static String replaceQuote(String str){
		return str.replace("'","&#034;");
	}
}
