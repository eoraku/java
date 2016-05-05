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

public class AirLine implements ActionModel {

	public void execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String line = request.getParameter("line");
		String io = request.getParameter("io");

		//System.out.println("line : " + line);
		//System.out.println("io : " + io);

		DBUtil db = new MySqlDBUtil();
		List<Map<String, String>> result = null;
		JSONArray jsonArr = null;

		/*사내테스트용*/
//		String query = "SELECT AL_KNAME, AL_ENAME, CONCAT(AIR2C, NO) AIR2C, " + "CONCAT(SUBSTRING(SDT, 9, 2), ':', SUBSTRING(SDT, 11, 2)) SDT, "
//				+ "IF(CDT = '', '-', CONCAT(SUBSTRING(CDT, 9, 2), ':', SUBSTRING(CDT, 11, 2))) CDT, " + "CITYKOR, CITYENG, STKOR, STENG "
//				+ "FROM AIR LEFT JOIN AIRLINE ON AIR2C = AL_CODE ORDER BY SDT, AIR2C LIMIT 20";
		
		/*실제*/
		String query = "SELECT AL_KNAME, AL_ENAME, CONCAT(AIR2C, NO) AIR2C, CONCAT(SUBSTRING(SDT, 9, 2), ':', SUBSTRING(SDT, 11, 2)) SDT, "
		+ "IF(CDT = '', '-', CONCAT(SUBSTRING(CDT, 9, 2), ':', SUBSTRING(CDT, 11, 2))) CDT, " + "CITYKOR, CITYENG, STKOR, STENG "
		//+ "FROM AIR LEFT JOIN AIRLINE ON AIR2C = AL_CODE WHERE SDT > DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 15 DAY_MINUTE), '%Y%m%d%H%i') "
		+ "FROM AIR LEFT JOIN AIRLINE ON AIR2C = AL_CODE WHERE (SDT >= DATE_FORMAT(NOW(), '%Y%m%d%H%i') AND (CDT='' OR CDT >= DATE_FORMAT(NOW(), '%Y%m%d%H%i'))) "
		+ "AND SDT < DATE_FORMAT(DATE_ADD(NOW(), INTERVAL 24 DAY_HOUR), '%Y%m%d%H%i') AND LINE = '" + line + "' AND IO = '" + io
		+ "' ORDER BY SDT, AIR2C";

		result = db.select(query);
		jsonArr = JSONArray.fromObject(result);
		request.setAttribute("result", jsonArr);
		//System.out.println("size : " + jsonArr.size());

		result = db.select("SELECT * FROM AIRLINE");
		jsonArr = JSONArray.fromObject(result);
		request.setAttribute("code", jsonArr);
		//System.out.println("size : " + jsonArr.size());
	}
}