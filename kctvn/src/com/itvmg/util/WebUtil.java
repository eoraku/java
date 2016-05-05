package com.itvmg.util;

/**
 * 웹 관련 유틸 클래스
 * 
 * @since 2010.04.08
 * @author skkwon
 * 
 */
public class WebUtil {

	public static String converterHTML(String str) {
		String result = "";
		if (str != null) {
			result = str;
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll("\"", "&quot;");
			result = result.replaceAll("\'", "&apos;");
			result = result.replaceAll("\r\n", "<br />");
			result = result.replaceAll("\n", "<br />");
		}
		return result;
	}
}