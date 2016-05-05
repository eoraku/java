package com.itvmg.model.page.weather;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.itvmg.mvc.ActionModel;
import com.itvmg.util.db.DBUtil;
import com.itvmg.util.db.MySqlDBUtil;

public class NationalSeaDetail implements ActionModel {

	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String wn_region = request.getParameter("wn_region");

		DBUtil db = new MySqlDBUtil();
		List<Map<String, String>> result = null;
		JSONArray jsonArr = null;

		String query = "";
		query += "SELECT WN_TIME, WN_WHEN, WN_RAINF, SUBSTRING(WN_FORECAST, 4) WN_FORECAST, WN_WINDA, WN_WTRAND, WN_WINDB,";
		query += " CONCAT(ROUND(WN_WSPEEDA), '~', ROUND(WN_WSPEEDB)) WN_WSPEED, CONCAT(WN_WHEIGHTA, '~', WN_WHEIGHTB) WN_WHEIGHT";
		query += " FROM WEATHER_SIMPLE";
		query += " WHERE WN_REGION = '";
		query += wn_region;
		query += "'";
		query += " ORDER BY WN_WHEN";

		result = db.select(query);

		jsonArr = JSONArray.fromObject(result);
		request.setAttribute("result", jsonArr);
		System.out.println("size : " + jsonArr.size());
	}
}