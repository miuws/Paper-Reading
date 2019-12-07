package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBUtil;
import model.AdminUser;

import java.util.*;

public class AdminUserDao {

	public String getPassword(String adminUsername) throws SQLException{
		Connection conn = DBUtil.getConnection();
		String sql = "" +
				"select USERCODE from user " +
				"where USERNAME = ? ";
		PreparedStatement ptmt = conn.prepareStatement(sql);
		System.out.print(sql);
		ptmt.setString(1, adminUsername);
		ResultSet rs = ptmt.executeQuery();
		String password = "";
		while(rs.next()){
			password = rs.getString("USERCODE");
			System.out.print(password);
		}
		rs.close();
		ptmt.close();
		DBUtil.close(conn);
		return password;
	}
	
	public boolean isExist(String username) throws SQLException{
		Connection conn = DBUtil.getConnection();
		String sql = "" +
				"select admin_username from tb_adminuser " +
				"where tb_admin_username = ? ";
		PreparedStatement ptmt = conn.prepareStatement(sql);
		ptmt.setString(1, username);
		ResultSet rs = ptmt.executeQuery();
		while(rs.next()){
			return true;
		}
		rs.close();
		ptmt.close();
		DBUtil.close(conn);
		return false;
	}
	
	public void updateAdminUser(AdminUser au) throws SQLException{
		Connection conn = DBUtil.getConnection();
		String sql = "" +
				"update USER " +
				"set USERCODE = ? " +
				"where USERNAME = ? ";
		PreparedStatement ptmt = conn.prepareStatement(sql);
		ptmt.setString(1, au.getAdminPassword());
		ptmt.setString(2, au.getAdminUsername());
		ptmt.execute();
		ptmt.close();
		DBUtil.close(conn);
	} 
}
