package kctv.xml;

import java.util.ArrayList;

import javax.xml.xpath.XPathConstants;

import org.w3c.dom.NodeList;

/**
 * <pre>
 * kctv.xml
 * XPathBodo.java
 * </pre>
 * <pre>
 * 뉴스 리스트 XML 읽기
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class XPathBodo extends XPathXml{
	public XPathBodo(String xmlPath){
		getLocalXml(xmlPath);
	}
	
	/**
	 * @function : xml 형식(vod list)을 ArrayList로 받아옴
	 * @process  : 
	 * 
	 * @MethodName : getList
	 * @return
	 */
	public ArrayList<BodoXml> getList(){
		NodeList makeDateTime;
		NodeList tpName;
		NodeList category;
		NodeList writer;
		NodeList title;
		NodeList subtitle;
		NodeList content;
		NodeList wmv;
		
		BodoXml bodoXml;
		ArrayList<BodoXml> list=new ArrayList<BodoXml>();
		try{
			makeDateTime = (NodeList)xpath.evaluate("//NEWS/MAKEDATETIME", document, XPathConstants.NODESET);
			tpName       = (NodeList)xpath.evaluate("//NEWS/TPNAME", document, XPathConstants.NODESET);
			category     = (NodeList)xpath.evaluate("//NEWS/CATEGORY", document, XPathConstants.NODESET);
			writer       = (NodeList)xpath.evaluate("//NEWS/WRITER", document, XPathConstants.NODESET);
			title        = (NodeList)xpath.evaluate("//NEWS/TITLE", document, XPathConstants.NODESET);
			subtitle     = (NodeList)xpath.evaluate("//NEWS/SUBTITLE", document, XPathConstants.NODESET);
			content      = (NodeList)xpath.evaluate("//NEWS/TEXT", document, XPathConstants.NODESET);
			wmv          = (NodeList)xpath.evaluate("//NEWS/WMV/id", document, XPathConstants.NODESET);
			
			for( int idx=0; idx<makeDateTime.getLength(); idx++ ){
				bodoXml=new BodoXml(
						makeDateTime.item(idx).getTextContent(),
						tpName.item(idx).getTextContent(),
						category.item(idx).getTextContent(),
						writer.item(idx).getAttributes().getNamedItem("id").getNodeValue(),
						writer.item(idx).getTextContent(),
						title.item(idx).getTextContent(),
						subtitle.item(idx).getTextContent(),
						content.item(idx).getTextContent(),
						wmv.item(idx).getTextContent()
						);
				list.add(bodoXml);
			}
			return list;
		}catch(Exception e){}
		return null;
	}
}
