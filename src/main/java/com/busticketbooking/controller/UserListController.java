package com.busticketbooking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.model.User;

@WebServlet("/UserList")
public class UserListController extends HttpServlet {

	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) {
		
	        UserDaoImpl userDao=new UserDaoImpl(); 
	        List<User> userList=userDao.viewUserDetails();
	        
	        if(userList!=null) {
	        	try {
	        		req.setAttribute("UserList", userList);
	        		RequestDispatcher reqDispatcher=req.getRequestDispatcher("userList.jsp");
	 	    		reqDispatcher.forward(req, res);
				} catch (IOException | ServletException e) {
					e.printStackTrace();
				}
	        }
	}
}
