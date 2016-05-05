package com.itvmg.model.page.airline;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.itvmg.mvc.ActionModel;
import com.itvmg.util.db.DBUtil;
import com.itvmg.util.db.MySqlDBUtil;

public class AirLineWeather implements ActionModel {

	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception {

		DBUtil db = new MySqlDBUtil();
		List<Map<String, String>> result = null;
		JSONArray jsonArr = null;

		result = db.select("SELECT RC_NAME, WN_RAINF, SUBSTRING(WN_FORECAST, 4) WN_FORECAST, ROUND(WN_TEMP) WN_TEMP, RC_X, RC_Y, RC_ORDER "
				+ "FROM WEATHER_SIMPLE LEFT JOIN REGION_CODE ON WN_REGION = RC_CODE WHERE WN_WHEN = '0' AND RC_CATEGORY = '1' ORDER BY RC_ORDER");
		jsonArr = JSONArray.fromObject(result);
		request.setAttribute("result", jsonArr);
		System.out.println("size : " + jsonArr.size());
	}
}