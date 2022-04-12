package config;

import java.sql.*;

public class Config {
	public static Connection getConnection() {
		try {
			String dbUrl = "jdbc:mysql://localhost:3306/poke?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
			String dbId = "root";
			String dbPw = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(dbUrl, dbId, dbPw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}