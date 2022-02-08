package com.busticketbooking.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.exception.UserRegister;
import com.busticketbooking.model.User;

@WebServlet("/registerpage")
public class UserRegisterController extends HttpServlet {
	UserDaoImpl userDao = new UserDaoImpl();

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		UserDaoImpl userDao = new UserDaoImpl();
		String name = req.getParameter("name").toLowerCase();
		String email = req.getParameter("emailId").toLowerCase();
		long mobile = 0;
		try {
			mobile = Long.parseLong(req.getParameter("mobile"));
		} catch (NumberFormatException e2) {
			e2.printStackTrace();
		}
		boolean checkMobile = userDao.checkUser(mobile);

		if (!(checkMobile)) {
			String password = req.getParameter("password");
			LocalDate dob = LocalDate.parse(req.getParameter("dob"));
			String gender = req.getParameter("gender").toLowerCase();
			User userModel = new User(0, name, dob, email, mobile, gender, password, 0);
			boolean registerFlag = userDao.registrationUser(userModel);
			if (registerFlag) {

				try {
					res.sendRedirect("userRegister.jsp?register=success");
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				try {
					throw new UserRegister();
				} catch (UserRegister e) {
					session.setAttribute("registerMessage", e.getPhoneRegisterMessage());
					try {
						res.sendRedirect("userRegister.jsp");
					} catch (IOException e1) {
						e1.printStackTrace();
					}
				}
			}
		} else {
			try {
				throw new UserRegister();
			} catch (UserRegister e) {
				session.setAttribute("registerMessage", e.getPhoneRegisterMessage());
				try {
					res.sendRedirect("userRegister.jsp");
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}

	}
}
