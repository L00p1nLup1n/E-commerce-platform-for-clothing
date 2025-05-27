package ship.iu.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DBconnectionSQL {
	private static String DB_URL = "jdbc:mysql://localhost:3306/ltweb01";
	private static String user_name = "root";
	private static String pass = "lamhocUTE2024.";
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
		}
	}

	public static Connection getConn() throws SQLException {
		try {
			return DriverManager.getConnection(DB_URL, user_name, pass);
		} catch (SQLException ex) {
			Logger.getLogger(DBconnectionSQL.class.getName()).log(Level.SEVERE, null, ex);
			throw new SQLException("Failed to connect to database", ex);
		}
	}

	public static void main(String[] args) {
		try {
			Connection c = getConn();
			if (c == null) {
				System.out.println("Something went wrong");
			} else {
				System.out.println("Success");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
