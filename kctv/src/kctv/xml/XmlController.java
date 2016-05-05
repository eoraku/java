package kctv.xml;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kctv.web.board.Board;
import kctv.web.common.Common;
import kctv.web.news.News;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <pre>
 * kctv.xml
 * XmlController.java
 * </pre>
 * <pre>
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 16.
 * @version: 
 */
@Controller
@RequestMapping("/xml")
public class XmlController {
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	/**
	 * @function : 
	 * @process  : 
	 * 
	 * @MethodName : listInfo
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/listInfo.xml", method=RequestMethod.GET, headers="Accept=application/xml", produces={MediaType.APPLICATION_XML_VALUE})
	public @ResponseBody String listInfo(HttpServletRequest request) throws Exception {
		String date;
		date = Common.strToStr(request.getParameter("date"),Common.getDate());
		
		String xmlHeader = "";
		String xmlBody = "";
		String xmlResult = "";
		
		ArrayList<Board> listInfo;
		
		listInfo = (ArrayList<Board>)sqlMapClientTemplate.queryForList("listInfoXml", date);
		
		for(Board item:listInfo){
			xmlBody += "\t<item>\n";
			xmlBody += getTag("title",item.getBoard_title(), "");
			xmlBody += getTag("context",item.getBoard_contents(), "string");
			xmlBody += getTag("date",item.getBoard_regdate(), "string");
			xmlBody += "\t</item>\n";
		}
		
		xmlResult = xmlHeader + "<channel>\n" + xmlBody + "</channel>\n";
		xmlResult = Common.to8859fromUTF8(xmlResult);

		return xmlResult;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/listNews.xml", method=RequestMethod.GET, headers="Accept=application/xml", produces={MediaType.APPLICATION_XML_VALUE})
	public @ResponseBody String listVod(HttpServletRequest request) throws Exception {
		String code, date, f_code, s_code;
		code = Common.strToStr(request.getParameter("code"),"01");
		date = Common.strToStr(request.getParameter("date"),Common.getDate());
		date = date.replace("-", "");
		
		String xmlHeader = "";
		//String xmlHeader = "<?xml version=\"1.0\" encoding=\"euc-kr\"?>\n";

		String xmlBody = "";
		String xmlResult = "";
		
		ArrayList<News> listNews;
		
		if(code.equals("01")){ // 분야별 뉴스기사
			f_code = "01";
			s_code = "";
			listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("listNewsXml1", date);
		}else{ // 최신뉴스메인
			XmlParameter xmlParameter = new XmlParameter();
			
			if(code.equals("0301")){
				f_code = "03";
				s_code = "0301";
				xmlParameter.setWhere("and eng = '1' and chi is null");
			}else if(code.equals("0302")){
				f_code = "03";
				s_code = "0302";
				xmlParameter.setWhere("and eng is null and chi = '1'");
			}else if(code.equals("02")){
				f_code = "02";
				s_code = "";
				xmlParameter.setWhere("and eng is null and chi is null");
			}else if(code.equals("0201")){
				f_code = "02";
				s_code = "0201";
				xmlParameter.setWhere("and eng is null and chi is null and group_flag in ('1','5')");
			}else if(code.equals("0202")){
				f_code = "02";
				s_code = "0202";
				xmlParameter.setWhere("and eng is null and chi is null and group_flag in ('2','6')");
			}else if(code.equals("0203")){
				f_code = "02";
				s_code = "0203";
				xmlParameter.setWhere("and eng is null and chi is null and group_flag in ('3','7')");
			}else if(code.equals("0204")){
				f_code = "02";
				s_code = "0204";
				xmlParameter.setWhere("and eng is null and chi is null and group_flag in ('4','8')");
			}else{
				f_code = "01";
				s_code = "";
				xmlParameter.setWhere("");
			}
			
			xmlParameter.setVal1(date);
			
			listNews = (ArrayList<News>)sqlMapClientTemplate.queryForList("listNewsXml2", xmlParameter);
		}
		
		for(News item:listNews){
			if(item.getSvrfile2() == null)
				item.setSvrfile2("");
			if(item.getUpfile() == null)
				item.setUpfile("");
			xmlBody += "\t<item>\n";
			xmlBody += getTag("date",item.getLdate(), "");
			xmlBody += getTag("f_category",f_code, "");
			xmlBody += getTag("s_category",s_code, "");
			xmlBody += getTag("article",item.getTitle(), "string");
			xmlBody += getTag("reporter",item.getName(), "");
			xmlBody += getTag("context",item.getContent_clob(), "string");
			if(f_code.equals("01"))
				xmlBody += getTag("image","http://www.kctvjeju.com/upload/news/"+item.getSvrfile2(), "");
			else
				xmlBody += getTag("image","http://www.kctvjeju.com/upload/news/"+item.getUpfile(), "");
			xmlBody += "\t</item>\n";
		}
		
		xmlResult = xmlHeader + "<channel>\n" + xmlBody + "</channel>\n";
		xmlResult = Common.to8859fromUTF8(xmlResult);

		return xmlResult;
	}
	
	/**
	 * @function : tag 얻어오기
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
			tag = "\t\t<"+tagName+"><![CDATA["+value+"]]></"+tagName+">\n";
		else
			tag = "\t\t<"+tagName+">"+value+"</"+tagName+">\n";
		
		return tag;
	}
}
