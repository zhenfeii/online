package com.wyu.online.utils;

import org.junit.Test;

import java.sql.*;

/**
 * The beauty of the code
 * 
 * @author yuguoliang
 *
 *	单例模式，初始化与数据的连接.
 */
public class DaoConnection {

	private static DaoConnection dc;

	private Connection connection;

	private static final String URL = "jdbc:mysql://localhost:3306/online?characterEncoding=utf8";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "123456";
	private static final String CLASSDRIVER = "com.mysql.jdbc.Driver";

	//匿名内部类加载驱动类
	{
		try {
			Class.forName(CLASSDRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//初始化
	public static DaoConnection initDaoConnection() {
		if (dc == null) {
			dc = new DaoConnection();
		}
		return dc;
	}

	/**
	 * @return the jDBC连接
	 * @throws SQLException 
	 */
	public Connection getConnection() throws SQLException {
		connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		return connection;
	}

	public PreparedStatement getPreparedStatement(String sql, Object... args) throws SQLException {

		DaoConnection dc = initDaoConnection();

		PreparedStatement ps = dc.getConnection().prepareStatement(sql);
		int i = 1;
		if (args != null & args.length > 0) {
			for (Object object : args) {
				ps.setObject(i, object);
				i++;
			}
		}
		return ps;
	}

	@Test
	public void testPeparStament() throws SQLException {

		PreparedStatement ps = new DaoConnection().getPreparedStatement("select * from paper where subject_id=?",
				new Object[] { 1 });
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			System.out.println(rs.getString("name"));
		}
	}

	/**
	 * 测试数据库连接是否成功
	 */
	@Test
	public void testConnection() {
		try {
			Connection connection = new DaoConnection().getConnection();
			if (connection != null) {
				System.out.println("数据库测试连接成功");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}