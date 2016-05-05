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

public class Land0907 implements ActionModel {

	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception {

		DBUtil db = new MySqlDBUtil();
		List<Map<String, String>> result = null;
		JSONArray jsonArr = null;

		String query = "";
		query += "(SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '52' AND W3_Y = '38' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '59' AND W3_Y = '38' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '58' AND W3_Y = '34' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '53' AND W3_Y = '32' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '48' AND W3_Y = '32' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '48' AND W3_Y = '36' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '53' AND W3_Y = '35' ORDER BY W3_SEQ LIMIT 1)";
		query += " ORDER BY RD_ORDER;                                                                                                                                                                                                                              ";

		result = db.select(query);
		jsonArr = JSONArray.fromObject(result);
		request.setAttribute("result", jsonArr);
		System.out.println("size : " + jsonArr.size());
	}
}