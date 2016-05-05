package com.itvmg.mvc;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {

	private static final long serialVersionUID = -9176228460509477504L;

	private FilterConfig filterConfig;
	private String encoding;

	public CharacterEncodingFilter() {
		encoding = null;
	}

	public void init(FilterConfig ftConf) throws ServletException {
		String initEncoding = ftConf.getInitParameter("encoding");
		filterConfig = ftConf;
		if ((initEncoding != null) && (initEncoding.length() > 0)) {
			encoding = initEncoding;
		} else {
			encoding = "UTF-8";
		}
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		try {
			if (req.getCharacterEncoding() == null) {
				req.setCharacterEncoding(encoding);
			}
			chain.doFilter(req, resp);
		} catch (Exception exception) {
			filterConfig.getServletContext().log(exception.getMessage());
		}
	}

	public void destroy() {
		filterConfig = null;
		encoding = null;
	}
}
