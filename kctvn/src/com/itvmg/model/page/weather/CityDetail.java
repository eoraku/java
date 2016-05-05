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

public class CityDetail implements ActionModel {

	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String w3_x = request.getParameter("w3_x");
		String w3_y = request.getParameter("w3_y");

		DBUtil db = new MySqlDBUtil();
		List<Map<String, String>> result = null;
		JSONArray jsonArr = null;

		String query = "";
		query += "SELECT W3_TIME, ROUND(W3_T3H) W3_T3H, ROUND(W3_PTY) W3_PTY,";
		query += " ROUND(W3_SKY) W3_SKY, ROUND(W3_WSD) W3_WSD, W3_WAV, ROUND(W3_R12) W3_R12, ROUND(W3_S12) W3_S12, W3_VEC";
		query += " FROM WEATHER";
		query += " WHERE W3_X = '";
		query += w3_x;
		query += "' AND W3_Y = '";
		query += w3_y;
		query += "'";
		query += " ORDER BY W3_SEQ LIMIT 16";

		result = db.select(query);
		jsonArr = JSONArray.fromObject(result);
		request.setAttribute("result", jsonArr);
		System.out.println("size : " + jsonArr.size());
	}
}