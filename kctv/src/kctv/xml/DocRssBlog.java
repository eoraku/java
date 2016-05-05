package kctv.xml;

import java.net.URLEncoder;
import java.util.ArrayList;

/**
 * <pre>
 * kctv.xml
 * DocRssBlog.java
 * </pre>
 * <pre>
 * 네이버 검색 api를 이용하여 검색어에 대한 블로그 결과를 받아오는 클래스 입니다. RSS피드를 이용하여 검색 결과를 받아온 후에 처리합니다.
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 12.
 * @version: 
 */
public class DocRssBlog extends DocRss {
	ArrayList<RssBlog> list;
	String title;
	String link;
	String desc;
	String bloggername;
	String bloggerlink;
	
	/**
	 * @param schText
	 * 검색어
	 * @param display
	 * 검색 숫자
	 * @param pageNo
	 * 검색 시작 위치
	 * @throws Exception
	 */
	public DocRssBlog(String schText, int display, int pageNo) throws Exception {
		super("http://openapi.naver.com/search?key=24b93310696584a74c219f924693f993&query="+URLEncoder.encode(schText, "UTF-8")+"&display="+display+"&start="+((display*(pageNo-1))+1)+"&target=blog&sort=sim");
		/*System.out.println("countList:"+countList);
		System.out.println("startItem:"+startItem);
		System.out.println("total:"+total);
		System.out.println("start:"+start);
		System.out.println("display:"+display);*/
		
		list = new ArrayList<RssBlog>();
		
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
			else
				desc = "";
			if(items.item(i).getChildNodes().item(3) != null && items.item(i).getChildNodes().item(3).getNodeName() == "bloggername")
				bloggername = items.item(i).getChildNodes().item(3).getTextContent();
			else
				bloggername = "";
			if(items.item(i).getChildNodes().item(4) != null && items.item(i).getChildNodes().item(4).getNodeName() == "bloggerlink")
				bloggerlink = items.item(i).getChildNodes().item(4).getTextContent();
			else
				bloggerlink = "";
			
			if(!title.equals("") && !link.equals("") && !desc.equals("")/* && !bloggername.equals("") && !bloggerlink.equals("")*/)
				list.add(new RssBlog(title,link,desc,bloggername,bloggerlink));
		}
	}
	
	public ArrayList<RssBlog> getList() {
		return list;
	}

	public void setList(ArrayList<RssBlog> list) {
		this.list = list;
	}
}
