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

public class Special implements ActionModel {

	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception {

		DBUtil db = new MySqlDBUtil();
		List<Map<String, String>> result = null;
		JSONArray jsonArr = null;

		String query = "";
		query += "SELECT SUBSTRING(WW_TIME, 1, 16) WW_TIME, SUBSTRING(WW_WTIME, 1, 16) WW_WTIME, WW_TITLE, WW_ETIME, WW_REGION,";
		query += " WW_CONTENTS, WW_WCONTENT, WW_REMARK";
		query += " FROM WEATHER_WARNING";
		query += " WHERE WW_TIME > DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 2 DAY), '%Y-%m-%d %k:%i:%s.0')";
		query += " ORDER BY WW_SEQ DESC";
		query += " LIMIT 1";
		result = db.select(query);
		jsonArr = JSONArray.fromObject(result);
		request.setAttribute("result1", jsonArr);
		System.out.println("size : " + jsonArr.size());
/*
SELECT SUBSTRING(WW_TIME, 1, 16) WW_TIME, SUBSTRING(WW_WTIME, 1, 16) WW_WTIME, WW_TITLE, WW_ETIME, WW_REGION,WW_CONTENTS, WW_WCONTENT, WW_REMARK
	FROM WEATHER_WARNING
	WHERE WW_TIME > DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 2 DAY), '%Y-%m-%d %k:%i:%s.0')
	ORDER BY WW_SEQ DESC
	LIMIT 1;
*/
		query = "";
		query += "SELECT WT_ATIME, WT_TSEQ, WT_KNAME, WT_LOCATION, WT_CP, WT_SPDMAX, WT_DIRECTION, WT_SPEED, WT_IMAGE, CC_TYPHOON";
		query += " FROM WEATHER_TYPHOON, COM_CONFIG";
		query += " WHERE CAST(LEFT(wt_atime ,4) AS UNSIGNED) = YEAR(CURDATE())";
		query += " ORDER BY CAST(WT_TSEQ AS UNSIGNED) DESC, wt_seq DESC";
		query += " LIMIT 1";
		result = db.select(query);
		jsonArr = JSONArray.fromObject(result);
		request.setAttribute("result2", jsonArr);
		System.out.println("size : " + jsonArr.size());
/*
SELECT WT_ATIME, WT_TSEQ, WT_KNAME, WT_LOCATION, WT_CP, WT_SPDMAX, WT_DIRECTION, WT_SPEED, WT_IMAGE, CC_TYPHOON
	FROM WEATHER_TYPHOON, COM_CONFIG
	WHERE CAST(LEFT(wt_atime ,4) AS UNSIGNED) = YEAR(CURDATE()) -- 신규 쿼리
	ORDER BY CAST(WT_TSEQ AS UNSIGNED) DESC, wt_seq DESC -- 신규 쿼리(태풍정보 두개 이상시에 정렬 오류)
	-- ORDER BY WT_SEQ DESC -- 예전 쿼리
	LIMIT 1;
*/
		query = "";
		query += "SELECT WP_TIME, WP_FILE FROM (";
		query += " SELECT WP_TIME, WP_FILE";
		query += " FROM WEATHER_PHOTO";
		query += " WHERE WP_TIME > DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 2 DAY), '%Y%m%d%k%i')";
		query += " ORDER BY WP_SEQ DESC";
		query += " LIMIT 12) T1";
		query += " ORDER BY WP_TIME;";
		result = db.select(query);
		jsonArr = JSONArray.fromObject(result);
		request.setAttribute("result3", jsonArr);
		System.out.println("size : " + jsonArr.size());
/*
SELECT WP_TIME, WP_FILE FROM (
	SELECT WP_TIME, WP_FILE
		FROM WEATHER_PHOTO
		WHERE WP_TIME > DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 2 DAY), '%Y%m%d%k%i')
		ORDER BY WP_SEQ DESC
		LIMIT 12) T1
	ORDER BY WP_TIME;
*/
	}
}