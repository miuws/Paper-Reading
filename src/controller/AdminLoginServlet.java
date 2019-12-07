package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.AdminUserDao;

public class AdminLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String adminUsername = request.getParameter("adminname");
		System.out.print(adminUsername);
		String adminPassword = request.getParameter("adminpassword");
		System.out.print(adminPassword);
		AdminUserDao aud = new AdminUserDao();
		String DbPassword = "";
		try {
			DbPassword = aud.getPassword(adminUsername);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(DbPassword.equals(adminPassword)){
			HttpSession session = request.getSession();
			session.setAttribute("adminUser", adminUsername);
			session.setAttribute("flag", "login_success");
			request.getRequestDispatcher("../adminHome.jsp").forward(request, response);
		}else{
			request.setAttribute("error", "ERROR");
			request.getRequestDispatcher("../adminLogin.jsp").forward(request, response);
		}
	}

}
