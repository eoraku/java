package com.itvmg.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PreAction {

	public static final String CTX_ROOT = "/jeju";
	public static final String IMG_ROOT = CTX_ROOT + "/images";
	public static final String SERVER_ROOT = "http://192.168.40.30/files";

	public static void action(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("ctxRoot", CTX_ROOT);
		req.setAttribute("imgRoot", IMG_ROOT);
		req.setAttribute("serverRoot", SERVER_ROOT);
	}
}