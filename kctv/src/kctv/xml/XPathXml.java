package kctv.xml;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathFactory;

import kctv.exception.ErrorMsg;

import org.w3c.dom.Document;
import org.xml.sax.InputSource;

/**
 * <pre>
 * kctv.xml
 * XPathXml.java
 * </pre>
 * <pre>
 * XML 파일을 읽기 위한 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class XPathXml {
	InputSource is;
	Document document;
	XPath xpath;
	private String xml;
	
	public XPathXml(){
		
	}
	
	/**
	 * @param url
	 * xml url
	 */
	public XPathXml(String url){
		getURLXML(url);
		stripNonValidXMLCharacters();
		if(xml == null || xml.length()<1){
			xpath = null;
		}else{
			is = new InputSource(new StringReader(xml));
			try{
				document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
				xpath = XPathFactory.newInstance().newXPath();
			}catch(Exception e){
				System.out.println("URL not available.");
			}
		}
	}
	
	/**
	 * @function : XML 로컬 파일 읽기
	 * @process  : 
	 * 
	 * @MethodName : getLocalXml
	 * @param xmlPath
	 */
	public void getLocalXml(String xmlPath){
		//System.out.println(xmlPath);
		try{
			File file = new File(xmlPath);
			//System.out.println(file.exists());
			document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file);
			xpath = XPathFactory.newInstance().newXPath();
		}catch(Exception e){
			//System.out.println("File not found.");
			throw new ErrorMsg(new String("파일이 존재하지 않습니다."));
		}
	}
	
	/**
	 * @function : XML URL파일 읽기
	 * @process  : 
	 * 
	 * @MethodName : getURLXML
	 * @param source
	 */
	private void getURLXML(String source){
		StringBuffer sBuffer = new StringBuffer();
		try{
			String urlAddr = source; 

			URL url = new URL(urlAddr);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			if(conn != null){
				conn.setConnectTimeout(20000);
				conn.setUseCaches(false);
				if(conn.getResponseCode()==HttpURLConnection.HTTP_OK){
					InputStreamReader isr = new InputStreamReader(conn.getInputStream(),"EUC-KR");
					BufferedReader br = new BufferedReader(isr);
					while(true){
						String line = br.readLine();
						if(line==null){
							break;
						}
						sBuffer.append(line);
					}
					br.close();
					conn.disconnect();
				}
			}
			xml = sBuffer.toString();
		}catch (Exception e) {}
	}
	
	/**
	 * @function : 
	 * @process  : 문자열을 한자씩 읽어 유효한 XML 표준 문자인지 확인
	 * 	Char	   ::=   	#x9 | #xA | #xD | [#x20-#xD7FF] | [#xE000-#xFFFD] | [#x10000-#x10FFFF]	/* any Unicode character, excluding the surrogate blocks, FFFE, and FFFF. 
	 * @MethodName : stripNonValidXMLCharacters
	 */
	private void stripNonValidXMLCharacters() {
		StringBuffer out = new StringBuffer(); // Used to hold the output.
		char current; // Used to reference the current character.
		
		if (xml == null || ("".equals(xml))) {
			return; // vacancy test.
		}
		for (int i = 0; i < xml.length(); i++) {
			//NOTE: No IndexOutOfBoundsException caught here; it should not happen.
			current = xml.charAt(i); 
			if ((current == 0x9) 
					|| (current == 0xA) 
					|| (current == 0xD) 
					|| ((current >= 0x20) && (current <= 0xD7FF)) 
					|| ((current >= 0xE000) && (current <= 0xFFFD)) 
					|| ((current >= 0x10000) && (current <= 0x10FFFF)))
				out.append(current);
		}
		xml = out.toString();
	}
}
