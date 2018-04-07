package kctv.xml;

import java.net.URLEncoder;
import java.util.ArrayList;

/**
 * <pre>
 * kctv.xml
 * DocRssWeb.java
 * </pre>
 * <pre>
 * 네이버 검색 api를 이용하여 검색어에 대한 웹 검색 결과를 받아오는 클래스 입니다. RSS피드를 이용하여 검색 결과를 받아온 후에 처리합니다.
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class DocRssWeb extends DocRss {
	ArrayList<RssWeb> list;
	String title;
	String link;
	String desc;

	/**
	 * @param schText
	 * 검색어
	 * @param display
	 * 검색 숫자
	 * @param pageNo
	 * 검색 시작 위치
	 * @throws Exception
	 */
	public DocRssWeb(String schText, int display, int pageNo) throws Exception {
		super("http://openapi.naver.com/search?key=24b93310696584a74c219f924693f993&query="+URLEncoder.encode(schText, "UTF-8")+"&display="+display+"&start="+((display*(pageNo-1))+1)+"&target=webkr");
		/*System.out.println("countList:"+countList);
		System.out.println("startItem:"+startItem);
		System.out.println("total:"+total);
		System.out.println("start:"+start);
		System.out.println("display:"+display);*/
		
		list = new ArrayList<RssWeb>();
		
		for (int i=startItem; i<countList; i++) {
			if(items.item(i).getChildNodes().item(0) != null && items.item(i).getChildNodes().item(0).getNodeName() == "title")
				title = items.item(i).getChildNodes().item(0).getTextContent();
			else
				title = "";
			if(items.item(i).getChildNodes().item(1) != null && items.item(i).getChildNodes().item(1).getNodeName() == "link")
				link = items.item(i).getChildNodes().item(1).getTextContent();
			else
				link = "";
			if(items.item(i).getChildNodes().item(2) != null && items.item(i).getChildNodes().item(2).getNodeName() == "description")
				desc = items.item(i).getChildNodes().item(2).getTextContent();
			else desc = "";
			
			if(!title.equals("") && !link.equals("") && !desc.equals(""))
				list.add(new RssWeb(title,link,desc));
		}
	}

	public ArrayList<RssWeb> getList() {
		return list;
	}

	public void setList(ArrayList<RssWeb> list) {
		this.list = list;
	}
}
