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

public class Olle_110923 implements ActionModel {

	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception {

		DBUtil db = new MySqlDBUtil();
		List<Map<String, String>> result = null;
		JSONArray jsonArr = null;

		String query = "";
		query += "(SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '60' AND W3_Y = '38' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '59' AND W3_Y = '38' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '60' AND W3_Y = '37' AND rd_order='3' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '60' AND W3_Y = '37' AND rd_order='4' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '58' AND W3_Y = '34' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '56' AND W3_Y = '33' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '53' AND W3_Y = '32' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '52' AND W3_Y = '32' AND rd_order='8' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '52' AND W3_Y = '32' AND rd_order='9' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '51' AND W3_Y = '32' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '50' AND W3_Y = '32' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '49' AND W3_Y = '32' AND rd_order='12' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '49' AND W3_Y = '32' AND rd_order='13' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '48' AND W3_Y = '32' AND rd_order='14' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '48' AND W3_Y = '32' AND rd_order='15' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '46' AND W3_Y = '35' AND rd_order='16' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '46' AND W3_Y = '35' AND rd_order='17' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '48' AND W3_Y = '36' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '49' AND W3_Y = '37' AND rd_order='19' ORDER BY W3_SEQ LIMIT 1)";
		query += " UNION (SELECT W3_X, W3_Y, RD_NAME, RD_TXT, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER FROM WEATHER LEFT JOIN OLLE_CODE ON RD_X = W3_X AND RD_Y = W3_Y WHERE W3_X = '49' AND W3_Y = '37' AND rd_order='20' ORDER BY W3_SEQ LIMIT 1)";
		query += " ORDER BY RD_ORDER;                                                                                                                                                                                                                            ";

		result = db.select(query);
		//System.out.println(query);// query媛믪� 硫�æ�쒕뜲 result媛믪씠 �댁긽�섎떎.�꾧뎄吏�..
		jsonArr = JSONArray.fromObject(result); 
		System.out.println(result);  
		request.setAttribute("result", jsonArr);
		System.out.println("size : " + jsonArr.size());
		System.out.println(jsonArr);
	}
}