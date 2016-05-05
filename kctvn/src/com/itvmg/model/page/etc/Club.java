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

public class Club implements ActionModel {

	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception {

		DBUtil db = new MySqlDBUtil();
		List<Map<String, String>> result = null;
		JSONArray jsonArr = null;

		String query = "";

		query += "SELECT NC_NAME, NC_DATE, NC_TIME, NC_LOCATION, NC_TITLE, NC_TELL, NC_CATEGORY";
		query += " FROM NF_CLUB";
		query += " WHERE NC_USE = 'Y'";
		query += " ORDER BY NC_DATETIME";

		result = db.select(query);
		jsonArr = JSONArray.fromObject(result);
		request.setAttribute("result", jsonArr);
		System.out.println("size : " + jsonArr.size());
	}
}