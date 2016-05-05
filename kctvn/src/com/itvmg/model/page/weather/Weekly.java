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

public class Weekly implements ActionModel {

	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception {

		DBUtil db = new MySqlDBUtil();
		List<Map<String, String>> result = null;
		JSONArray jsonArr = null;

		String query = "";

		query += "(SELECT WK_NAME, WK_DATE, WK_CONTENT,";
		query += " WK_F2, WK_F3, WK_F4, WK_F5, WK_F6, WK_F7,";
		query += " CONCAT(WK_MNT2, '/', WK_MXT2) TEMP2, CONCAT(WK_MNT3, '/', WK_MXT3) TEMP3, CONCAT(WK_MNT4, '/', WK_MXT4) TEMP4,";
		query += " CONCAT(WK_MNT5, '/', WK_MXT5) TEMP5, CONCAT(WK_MNT6, '/', WK_MXT6) TEMP6, CONCAT(WK_MNT7, '/', WK_MXT7) TEMP7";
		query += " FROM WEATHER_WEEK";
		query += " WHERE WK_REGION = '11G00201'";
		query += " ORDER BY WK_SEQ DESC";
		query += " LIMIT 1)";
		query += " UNION (SELECT WK_NAME, WK_DATE, WK_CONTENT,";
		query += " WK_F2, WK_F3, WK_F4, WK_F5, WK_F6, WK_F7,";
		query += " CONCAT(WK_MNT2, '/', WK_MXT2) TEMP2, CONCAT(WK_MNT3, '/', WK_MXT3) TEMP3, CONCAT(WK_MNT4, '/', WK_MXT4) TEMP4,";
		query += " CONCAT(WK_MNT5, '/', WK_MXT5) TEMP5, CONCAT(WK_MNT6, '/', WK_MXT6) TEMP6, CONCAT(WK_MNT7, '/', WK_MXT7) TEMP7";
		query += " FROM WEATHER_WEEK";
		query += " WHERE WK_REGION = '11G00401'";
		query += " ORDER BY WK_SEQ DESC";
		query += " LIMIT 1);";

		result = db.select(query);
		jsonArr = JSONArray.fromObject(result);
		request.setAttribute("result", jsonArr);
		System.out.println("size : " + jsonArr.size());
		System.out.println(jsonArr);
	}
}