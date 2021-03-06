package com.busticketbooking.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.model.User;

@WebServlet("/userProfileUpdate")
public class UpdateUserProfileController extends HttpServlet {

	UserDaoImpl userDao = new UserDaoImpl();

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("userModel");
		int userId = user.getUserId();
		String userName = req.getParameter("userName").toLowerCase();
		String userEmail = req.getParameter("emailId").toLowerCase();
		long userContact = 0;
		try {
			userContact = Long.parseLong(req.getParameter("mobile"));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		String userPassword = req.getParameter("password");
		LocalDate userDOB = LocalDate.parse(req.getParameter("dob"));
		String userGender = req.getParameter("gender").toLowerCase();

		user.setUserName(userName);
		user.setUserEmail(userEmail);
		user.setUserPassword(userPassword);
		user.setUserDOB(userDOB);
		user.setUserGender(userGender);
		// to find users age by DOB
		int userAge = userDao.findUserAge(user.getUserDOB());

		User userModel = new User(userId, userName, userDOB, userEmail, userContact, userGender, userPassword, 0);
		boolean userUpdateFlag = userDao.updateUser(userModel);
		if (userUpdateFlag) {
			session.setAttribute("UserAge", userAge);
			try {
				res.sendRedirect("userProfile.jsp?updated=success");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
