package com.busticketbooking.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
	public void service(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();

		String name = req.getParameter("name").toLowerCase();
		String email = req.getParameter("emailId").toLowerCase();

		long mobile = Long.parseLong(req.getParameter("mobile"));

		boolean checkMobile = userDao.checkUser(mobile);
		try {
			if (!(checkMobile)) {
				String password = req.getParameter("password");
				LocalDate dob = LocalDate.parse(req.getParameter("dob"));
				String gender = req.getParameter("gender").toLowerCase();
				User userModel = new User(0, name, dob, email, mobile, gender, password, 0);
				UserDaoImpl userDao = new UserDaoImpl();

				boolean registerFlag = userDao.registrationUser(userModel);

				if (registerFlag) {
					PrintWriter out;
					try {
						out = res.getWriter();
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Registered successfully');");
						out.println("location='userRegister.jsp';");
						out.println("</script>");
					} catch (IOException e) {
						e.printStackTrace();
					} 
				} 
				else {
					throw new UserRegister();
				}
			} else {
				throw new UserRegister();
			}
		} catch (UserRegister e) {
			session.setAttribute("registerMessage", e.getPhoneRegisterMessage());
			try {
				res.sendRedirect("userRegister.jsp");
			} catch (IOException e1) {
				System.out.println(e.getMessage());
			}
		}
	}
}
