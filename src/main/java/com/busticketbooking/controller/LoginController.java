package com.busticketbooking.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.AdminDaoImpl;
import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.exception.LoginPasswordException;
import com.busticketbooking.exception.LoginUserNameException;
import com.busticketbooking.model.Admin;
import com.busticketbooking.model.User;

@WebServlet("/loginWay")
public class LoginController extends HttpServlet {

	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();

		String loginId = req.getParameter("name");
		String password = req.getParameter("password");

		AdminDaoImpl adminDao = new AdminDaoImpl();
		UserDaoImpl userDao = new UserDaoImpl();
		Admin adminModel;
		User userModel = new User();

		// Admin Login
		if (loginId.endsWith("admin@gmail.com")) {
//			boolean adminCheckFlag;
//			adminCheckFlag = adminDao.checkadmin(loginId);
			adminModel = adminDao.adminLogin(loginId);
			try {
				if (adminModel!=null) {
					if (adminModel.getAdminPassword().equals(password)) {
						try {
							res.sendRedirect("adminHome.jsp");
//							session.setAttribute("AdminHome", "HomeSession");
						} catch (IOException e) {
							e.printStackTrace();
						}
					} else {
						throw new LoginPasswordException();
					}
				} else {
					throw new LoginUserNameException();
				}
			} catch (LoginUserNameException e) {
				session.setAttribute("erroruserid", e.getUserNameLoginMessage());
				try {
					res.sendRedirect("login.jsp");
				} catch (IOException e1) {
					System.out.println(e.getMessage());
				}
			} catch (LoginPasswordException e) {
				session.setAttribute("erroruserid", e.getPasswordLoginMessage());
				try {
					res.sendRedirect("login.jsp");
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		} else if (loginId.contains("admin@gmail.com") == false && loginId.matches("[0-9]+") == false) {
			try {
				throw new LoginUserNameException();
			} catch (LoginUserNameException e) {
				session.setAttribute("erroruserid", e.getUserNameLoginMessage());
				try {
					res.sendRedirect("login.jsp");
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}

		// userLogin
		else {
			long userId = Long.parseLong(loginId);
			userModel = userDao.loginUser(userId);
			try {
				if (userModel!=null) {
					
					if (userModel.getUserPassword().equals(password)) {
						try {
							
							session.setAttribute("userModel", userModel);
//						    session.setAttribute("userHome", "loginSession");
							
							res.sendRedirect("SearchBus");
						} catch (IOException e) {
							e.printStackTrace();
						}
					} else {
						throw new LoginPasswordException();
					}

				} else {
					throw new LoginUserNameException();
				}
			} catch (LoginUserNameException e) {
				session.setAttribute("erroruserid", e.getUserNameLoginMessage());
				try {
					res.sendRedirect("login.jsp");
				} catch (IOException e1) {
					e1.printStackTrace();
				}

			} catch (LoginPasswordException e) {
				session.setAttribute("erroruserid", e.getPasswordLoginMessage());
				try {
					res.sendRedirect("login.jsp");
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}
	}
}
