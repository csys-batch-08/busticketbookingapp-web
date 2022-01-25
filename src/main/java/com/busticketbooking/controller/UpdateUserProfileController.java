package com.busticketbooking.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.OperatorDaoImpl;
import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.model.Operator;
import com.busticketbooking.model.User;

@WebServlet("/userProfileUpdate")
public class UpdateUserProfileController extends HttpServlet {
	
	UserDaoImpl userDao=new UserDaoImpl();
	
	public void service(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		
		User user=(User) session.getAttribute("userModel");	
		int userId= user.getUserId();
		String userName=req.getParameter("userName").toLowerCase();
		String userEmail=req.getParameter("emailId").toLowerCase();
		long userContact=Long.parseLong(req.getParameter("mobile"));
		String userPassword=req.getParameter("password");
		LocalDate userDOB=LocalDate.parse(req.getParameter("dob"));
		String userGender=req.getParameter("gender").toLowerCase();
		
		user.setUserName(userName);
		user.setUserEmail(userEmail);
		user.setUserPassword(userPassword);
		user.setUserDOB(userDOB);
		user.setUserGender(userGender);
		
		//to find users age by dob
		int userAge=userDao.findUserAge(user.getUserDOB());
		
		User userModel= new User(userId,userName,userDOB,
				userEmail, userContact,userGender, userPassword,0);
		boolean userUpdateFlag=userDao.updateUser(userModel);
		
		if(userUpdateFlag) {
			try {
				session.setAttribute("userHome", "updateUserProfileServlet");
				session.setAttribute("UserAge", userAge);
				req.getRequestDispatcher("UserProfile.jsp").forward(req,res);
				
			} catch (ServletException e) {
				System.out.println(e.getMessage());
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}

