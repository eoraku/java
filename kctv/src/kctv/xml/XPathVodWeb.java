package kctv.xml;

import java.util.ArrayList;

import javax.xml.xpath.XPathConstants;
import org.w3c.dom.NodeList;

/**
 * <pre>
 * kctv.xml
 * XPathVodWeb.java
 * </pre>
 * <pre>
 * VOD 리스트 XML 읽기
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 16.
 * @version: 
 */
public class XPathVodWeb extends XPathXml{
	public XPathVodWeb(String url){
		super(url);
	}
	
	/**
	 * @function :xml 형식(vod list)을 ArrayList로 받아옴 
	 * @process  : 
	 * 
	 * @MethodName : getList
	 * @return
	 */
	public ArrayList<VodXml> getList(){
		if(xpath == null){
			return null;
		}
		NodeList id;
		NodeList gbn;
		NodeList title;
		NodeList file;
		NodeList director;
		NodeList talent1;
		NodeList talent2;
		NodeList synopsis;
		NodeList grade;
		NodeList cate;
		
		VodXml vodXml;
		ArrayList<VodXml> list=new ArrayList<VodXml>();
		try{
			id       = (NodeList)xpath.evaluate("//list/PGM_ID", document, XPathConstants.NODESET);
			gbn      = (NodeList)xpath.evaluate("//list/GBN", document, XPathConstants.NODESET);
			title    = (NodeList)xpath.evaluate("//list/PGM_TITLE", document, XPathConstants.NODESET);
			file     = (NodeList)xpath.evaluate("//list/POSTER_FILE", document, XPathConstants.NODESET);
			director = (NodeList)xpath.evaluate("//list/DIRECTOR", document, XPathConstants.NODESET);
			talent1  = (NodeList)xpath.evaluate("//list/TALENT1", document, XPathConstants.NODESET);
			talent2  = (NodeList)xpath.evaluate("//list/TALENT2", document, XPathConstants.NODESET);
			synopsis = (NodeList)xpath.evaluate("//list/SYNOPSIS", document, XPathConstants.NODESET);
			grade    = (NodeList)xpath.evaluate("//list/CONS_GRADE", document, XPathConstants.NODESET);
			cate     = (NodeList)xpath.evaluate("//list/RECCATE", document, XPathConstants.NODESET);
			
			for( int idx=0; idx<id.getLength(); idx++ ){
				vodXml=new VodXml(
						id.item(idx).getTextContent(),
						gbn.item(idx).getTextContent(),
						title.item(idx).getTextContent(),
						file.item(idx).getTextContent(),
						director.item(idx).getTextContent(),
						talent1.item(idx).getTextContent(),
						talent2.item(idx).getTextContent(),
						synopsis.item(idx).getTextContent(),
						grade.item(idx).getTextContent(),
						cate.item(idx).getTextContent());
				list.add(vodXml);
			}
			return list;
		}catch(Exception e){}
		return null;
	}
	
	/**
	 * @function : xml 형식(vod list)을 파라미터 카운트 만큼 ArrayList로 받아옴
	 * @process  : 
	 * 
	 * @MethodName : getListCnt
	 * @param cnt
	 * @return
	 */
	public ArrayList<VodXml> getListCnt(int cnt){
		NodeList title;
		NodeList file;
		
		VodXml vodXml;
		ArrayList<VodXml> list=new ArrayList<VodXml>();
		try{
			title    = (NodeList)xpath.evaluate("//list/PGM_TITLE", document, XPathConstants.NODESET);
			file     = (NodeList)xpath.evaluate("//list/POSTER_FILE", document, XPathConstants.NODESET);
			
			for( int idx=0; idx<cnt; idx++ ){
				vodXml=new VodXml(
						String.valueOf(idx+1),
						title.item(idx).getTextContent(),
						file.item(idx).getTextContent());
				list.add(vodXml);
			}
			return list;
		}catch(Exception e){}
		return null;
	}
}
