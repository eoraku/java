package com.itvmg.model.page.familyevent;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.itvmg.mvc.ActionModel;
import com.itvmg.util.db.DBUtil;
import com.itvmg.util.db.MySqlDBUtil;

public class Death implements ActionModel {

	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception {

		DBUtil db = new MySqlDBUtil();
		List<Map<String, String>> result = null;
		JSONArray jsonArr = null;

		String query = "";
		query += "SELECT EB_NAME, EB_AGE_JOB, EB_WIDOW, EB_SON, EB_DAUGHTER, EB_SON_LAW, EB_DAUGHTER_LAW,";
		query += " EB_DATETIME, EH_NAME, EB_TELL1, EB_TELL2, EB_HALL_IMAGE, EG_IMAGE, EB_LOCATION, EH_IMG";
		query += " FROM EV_OBITUARY";
		query += " LEFT JOIN EV_BACKGROUND ON EB_BG = EG_SEQ";
		query += " LEFT JOIN EV_HALL ON EH_SEQ = EB_HALL_REF";
		query += " WHERE EB_USE = 'Y' AND eb_time > UNIX_TIMESTAMP()";
		query += " ORDER BY EB_TIME ASC, EB_NAME";
/*
SELECT EB_NAME, EB_AGE_JOB, EB_WIDOW, EB_SON, EB_DAUGHTER, EB_SON_LAW, EB_DAUGHTER_LAW,
		EB_DATETIME, EH_NAME, EB_TELL1, EB_TELL2, EB_HALL_IMAGE, EG_IMAGE, EB_LOCATION, EH_IMG
	FROM EV_OBITUARY
		LEFT JOIN EV_BACKGROUND ON EB_BG = EG_SEQ
		LEFT JOIN EV_HALL ON EH_SEQ = EB_HALL_REF
	WHERE EB_USE = 'Y' AND eb_time > UNIX_TIMESTAMP()
	ORDER BY EB_TIME ASC, EB_NAME
 */
		result = db.select(query);
//		result = db.select("SELECT * FROM EV_OBITUARY LEFT JOIN EV_BACKGROUND ON EB_BG = EG_SEQ WHERE EB_USE = 'Y' ORDER BY EB_TIME ASC, EB_NAME");
		jsonArr = JSONArray.fromObject(result);
		request.setAttribute("result", jsonArr);
		//System.out.println("size : " + jsonArr.size());
	}
}