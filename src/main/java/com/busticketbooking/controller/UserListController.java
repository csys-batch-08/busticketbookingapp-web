package com.busticketbooking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.model.User;

@WebServlet("/UserList")
public class UserListController extends HttpServlet {

	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();

		 List<User> userList = new ArrayList<User>();
	        UserDaoImpl userDao=new UserDaoImpl(); 
	        userList=userDao.viewUserDetails();
	        
	        if(userList!=null) {
	        	try {
	        		session.setAttribute("UserList", userList);
					res.sendRedirect("UserList.jsp");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
	        }
	}
}
