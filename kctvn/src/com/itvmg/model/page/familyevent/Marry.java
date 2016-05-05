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

public class Marry implements ActionModel {

	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception {

		DBUtil db = new MySqlDBUtil();
		List<Map<String, String>> result = null;
		JSONArray jsonArr = null;

		String query = "";
		query += "SELECT EW_M_NAME, EW_M_JOB, EW_MF_NAME, EW_MF_JOB, EW_MM_NAME, EW_MM_JOB, EW_M_REL, EW_M_TEL,";
		query += " EW_B_NAME, EW_B_JOB, EW_BF_NAME, EW_BF_JOB, EW_BM_NAME, EW_BM_JOB, EW_B_REL, EW_B_TEL,";
		query += " EW_PHOTO, EW_DATE, EH_NAME, EW_HALL_IMAGE, EG_IMAGE, EW_LOCATION, EH_IMG";
		query += " FROM EV_WEDDING";
		query += " LEFT JOIN EV_BACKGROUND ON EW_BG = EG_SEQ";
		query += " LEFT JOIN EV_HALL ON EH_SEQ = EW_HALL_REF";
		query += " WHERE EW_USE = 'Y' AND ew_time > UNIX_TIMESTAMP()";
		query += " ORDER BY EW_TIME, EW_M_NAME";
/*
SELECT EW_M_NAME, EW_M_JOB, EW_MF_NAME, EW_MF_JOB, EW_MM_NAME, EW_MM_JOB, EW_M_REL, EW_M_TEL,
		EW_B_NAME, EW_B_JOB, EW_BF_NAME, EW_BF_JOB, EW_BM_NAME, EW_BM_JOB, EW_B_REL, EW_B_TEL,
		EW_PHOTO, EW_DATE, EH_NAME, EW_HALL_IMAGE, EG_IMAGE, EW_LOCATION, EH_IMG
	FROM EV_WEDDING
		LEFT JOIN EV_BACKGROUND ON EW_BG = EG_SEQ
		LEFT JOIN EV_HALL ON EH_SEQ = EW_HALL_REF
	WHERE EW_USE = 'Y' AND ew_time > UNIX_TIMESTAMP()
	ORDER BY EW_TIME, EW_M_NAME
 */
		result = db.select(query);
//		result = db.select("SELECT * FROM EV_WEDDING LEFT JOIN EV_BACKGROUND ON EW_BG = EG_SEQ WHERE EW_USE = 'Y' ORDER BY EW_TIME, EW_M_NAME");
		jsonArr = JSONArray.fromObject(result);
		String temp = jsonArr.toString();
		//temp = temp.replace("<", "&lt;");
		//temp = temp.replace(">", "&gt;");
		temp = temp.replace("\\r\\n", "<br />");

		request.setAttribute("result", temp);
		//System.out.println("size : " + jsonArr.size());
		//System.out.println(temp);
	}
}