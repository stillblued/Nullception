package co.nullception.udonmarket.comm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataSource {

	private static DataSource dataSource = new DataSource();
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private DataSource() {
	}

	public static DataSource getInstance() {
		return dataSource;
	}

	public Connection getConnection() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "udong", "1234");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();

		}
		return conn;

	}

	public void disconnect() {

		if (rs != null) {
			try {
				psmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}