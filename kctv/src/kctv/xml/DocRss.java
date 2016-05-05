package kctv.xml;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;


/**
 * <pre>
 * kctv.xml
 * DocRss.java
 * </pre>
 * <pre>
 * 검색결과 xml을 파싱하기 위해 사용하는 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 12.
 * @version: 
 */
public class DocRss {
	NodeList items;
	int countList;
	int startItem;
	int total;
	int start;
	int display;
	
	/**
	 * @param url
	 * 검색 쿼리 url
	 */
	public DocRss(String url){
		try{
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(url);
			NodeList rss = doc.getElementsByTagName("rss");
			NodeList channel = rss.item(0).getChildNodes();
			
			// _n 변수에 <channel> ~~~ </channel> 속 노드들 정보가 들어간다
			items = channel.item(0).getChildNodes();
			countList = (int)items.getLength();
			String nodeName;
			String nodeValue;
			
			for (int i=0; i<countList; i++) {
				if(items.item(i).getChildNodes().item(0).getFirstChild() != null) {
					startItem = i;
					break;
				}
				nodeName = items.item(i).getNodeName();
				nodeValue = items.item(i).getTextContent();
				
				if(nodeName.equals("total"))
					total = Integer.parseInt(nodeValue);
				else if(nodeName.equals("start"))
					start = Integer.parseInt(nodeValue);
				else if(nodeName.equals("display"))
					display = Integer.parseInt(nodeValue);
			}
		}catch(Exception e) {
			System.out.println(e.toString());
		}
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
}
