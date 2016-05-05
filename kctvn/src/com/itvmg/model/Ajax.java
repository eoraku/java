package com.itvmg.model;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.itvmg.mvc.ActionModel;
import com.itvmg.util.db.DBUtil;
import com.itvmg.util.db.MySqlDBUtil;

public class Ajax implements ActionModel {

	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String command = request.getParameter("command");
		String result = "";

		if ("landdetail".equals(command) || "citydetail".equals(command)) {
			result = getLanddetail(request);
		} else if ("seadetail".equals(command) || "nationalseadetail".equals(command)) {
			result = getSeedatail(request);
		}

		out.write(result);
	}

	private String getSeedatail(HttpServletRequest request) throws Exception {
		String wn_region = request.getParameter("wn_region");
		System.out.println(wn_region);
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
		System.out.println("size : " + jsonArr.size());
		return jsonArr.toString();
	}

	private String getLanddetail(HttpServletRequest request) throws Exception {
		String w3_x = request.getParameter("w3_x");
		String w3_y = request.getParameter("w3_y");

		DBUtil db = new MySqlDBUtil();
		List<Map<String, String>> result = null;
		JSONArray jsonArr = null;

		String query = "";
		query += "SELECT W3_TIME, ROUND(W3_T3H) W3_T3H, ROUND(W3_PTY) W3_PTY,";
		query += " ROUND(W3_SKY) W3_SKY, ROUND(W3_WSD) W3_WSD, W3_WAV, ROUND(W3_R12) W3_R12, ROUND(W3_S12) W3_S12, ROUND(W3_VEC) W3_VEC";
		query += " FROM WEATHER";
		query += " WHERE W3_X = '";
		query += w3_x;
		query += "' AND W3_Y = '";
		query += w3_y;
		query += "'";
		query += " ORDER BY W3_SEQ";

		result = db.select(query);
		jsonArr = JSONArray.fromObject(result);
		System.out.println("size : " + jsonArr.size());
		return jsonArr.toString();
	}
}