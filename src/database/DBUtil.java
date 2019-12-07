package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DBUtil {    
	private static ComboPooledDataSource cpds;
	static {
		cpds = new ComboPooledDataSource("mysql");
	}
	public static DataSource getDataSource() {
		return cpds;
	}
	public static Connection getConnection() throws SQLException {
		return cpds.getConnection();
	}
	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
