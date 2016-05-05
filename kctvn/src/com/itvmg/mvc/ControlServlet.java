package com.itvmg.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.Element;

import com.itvmg.util.XMLEditer;

public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String viewPage = null;
	String modelPage = null;
	Element[] query = null;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		setProcInfo(request);
		execModel(request, response);
		execDispatcher(request, response);
	}

	void setProcInfo(HttpServletRequest request) {
		String configPath = getServletConfig().getInitParameter("config");
		String realPath = request.getSession().getServletContext().getRealPath(configPath);
		XMLEditer xmlEdit = new XMLEditer(realPath);
		String reqUrl = request.getRequestURI().replaceFirst(request.getContextPath(), "");
		Element[] elements = xmlEdit.getElements("action-mapping");
		for (int i = 0; i < elements.length; i++) {
			if (reqUrl.equals(xmlEdit.getAttribute(elements[i], "url"))) {
				viewPage = xmlEdit.getAttribute(elements[i], "view");
				modelPage = xmlEdit.getAttribute(elements[i], "model");
				query = xmlEdit.getElements(elements[i], "sql");
				break;
			}
		}
		System.out.println("[url]" + reqUrl + "     [model]" + modelPage + "     [view]" + viewPage);
	}

	void execModel(HttpServletRequest request, HttpServletResponse response) {
		PreAction.action(request, response);
		String rCode = Const.SUCESS;

		if ((modelPage != null) && (modelPage.length() > 0)) {
			try {
				ActionModel model = (ActionModel) Class.forName(modelPage).newInstance();
				model.execute(this, request, response);
				rCode = Const.SUCESS;
			} catch (MVCException me) {
				rCode = me.getMessage();
				me.printStackTrace();
			} catch (Exception e) {
				rCode = Const.ETC_ERROR;
				e.printStackTrace();
			}
		}
		request.setAttribute("rCode", rCode);
	}

	void execDispatcher(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		if ((viewPage != null) && (viewPage.length() > 0)) {
			try {
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			} catch (Exception e) {
				throw new ServletException("ControlServlet : [" + viewPage + "] Try Forward Error.");
			}
		}
	}
}