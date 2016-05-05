package com.itvmg.mvc;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ActionModel {
	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception;
}