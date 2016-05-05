package com.itvmg.model.page.etc;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.itvmg.mvc.ActionModel;
import com.itvmg.util.db.DBUtil;
import com.itvmg.util.db.MySqlDBUtil;

public class Event implements ActionModel {

	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception {

		DBUtil db = new MySqlDBUtil();
		List<Map<String, String>> result = null;
		JSONArray jsonArr = null;

		result = db.select("SELECT * FROM EV_EVENT LEFT JOIN EV_BACKGROUND ON EV_BG = EG_SEQ WHERE EV_USE = 'Y' ORDER BY EV_TIME ASC, EV_TITLE");
		jsonArr = JSONArray.fromObject(result);
		request.setAttribute("result", jsonArr);
		System.out.println("size : " + jsonArr.size());
	}
}