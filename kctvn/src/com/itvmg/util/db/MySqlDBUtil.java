package com.itvmg.util.db;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itvmg.mvc.Const;
import com.itvmg.mvc.MVCException;

public class MySqlDBUtil extends DBUtil {

	@Override
	public Connection getConnection() throws Exception {
		Connection conn = null;
		try {
			Context initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/kweather");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MVCException(Const.DB_CONNECTION_ERROR);
		}
		return conn;
	}
}