package com.itvmg.util.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itvmg.mvc.Const;
import com.itvmg.mvc.MVCException;
import com.itvmg.util.WebUtil;

public abstract class DBUtil {

	public abstract Connection getConnection() throws Exception;

	public List<Map<String, String>> select(String query) throws Exception {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		ResultSetMetaData rsmd = null;
		try {
			con = getConnection();
			stmt = con.prepareStatement(query);
			rset = stmt.executeQuery();
			rsmd = rset.getMetaData();
			while (rset.next()) {
				Map<String, String> map = new HashMap<String, String>();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					map.put(rsmd.getColumnName(i).toUpperCase(), WebUtil.converterHTML(rset.getString(i)));
				}
				list.add(map);
			}
		} catch (Exception e) {
			System.out.println("db select error : " + query);
			throw new MVCException(Const.DB_SELECT_ERROR);
		} finally {
			try {
				if (con != null) {
					stmt.close();
				}
				if (stmt != null) {
					rset.close();
				}
				if (rset != null) {
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
}