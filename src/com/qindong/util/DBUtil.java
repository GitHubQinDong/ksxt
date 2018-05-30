package com.qindong.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class DBUtil {

	private DBUtil() {
	};

	private static String mysql;
	private static String url;
	private static String user;
	private static String psw;

	static {
		try {
			Properties setting = new Properties();
			InputStream in = DBUtil.class.getClassLoader().getResourceAsStream("DBConfig.properties");
			setting.load(in);
			mysql = setting.getProperty("driveName");
			url = setting.getProperty("url");
			user = setting.getProperty("user");
			psw = setting.getProperty("password");
			Class.forName(mysql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getCon() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(url, user, psw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static void closeAll(Connection conn, ResultSet rss, Statement stt) {
		try {
			if (rss != null)
				rss.close();
			if (stt != null)
				stt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//insert into user(username,password) values(?,?)
	public static int update(String sql,Object... paramList) {
		Connection conn = null;
		PreparedStatement stm = null;
		int result = 0, i = 0;
		try {
			conn = DBUtil.getCon();
			stm = conn.prepareStatement(sql);
			for (Object obj : paramList)
				stm.setObject(++i, obj);
			result = stm.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DBUtil.closeAll(conn, null, stm);
		}
		return result;
	}

	public static List<Map<String, Object>> query(String sql,Object... paramList) {
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		conn = DBUtil.getCon();
		int i = 0;
		try {
			stm = conn.prepareStatement(sql);
			for (Object obj : paramList)
				stm.setObject(++i, obj);
			rs = stm.executeQuery();
			ResultSetMetaData md = rs.getMetaData();
			int count = md.getColumnCount();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				i = 0;
				while (i++ < count) {
					String columnName = md.getColumnName(i);
					map.put(columnName, rs.getObject(columnName));
				}
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(conn, rs, stm);
		}
		return list;
	}
}