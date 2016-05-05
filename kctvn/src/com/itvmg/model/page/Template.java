package com.itvmg.model.page;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.Element;

import com.itvmg.mvc.ActionModel2;

public class Template implements ActionModel2 {

	@Override
	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response, Element[] query) throws Exception {

		//		Enumeration<?> enumParams = request.getParameterNames();
		//		while (enumParams.hasMoreElements()) {
		//			System.out.println(request.getParameter(String.valueOf(enumParams.nextElement())));
		//		}
		//		for (int j = 0; j < query.length; j++) {
		//			String strId = query[j].getAttribute("id");
		//			String strType = query[j].getAttribute("type");
		//			String strSql = query[j].getTextContent();
		//
		//			System.out.println("strId " + strId);
		//			System.out.println("strType " + strType);
		//			System.out.println("strSql " + strSql);
		//		}

	}
}