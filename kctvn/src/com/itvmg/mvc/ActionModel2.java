package com.itvmg.mvc;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.Element;

public interface ActionModel2 {
	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response, Element[] query) throws Exception;
}