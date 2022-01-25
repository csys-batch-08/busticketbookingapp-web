package com.busticketbooking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.model.User;


@WebServlet("/SearchBus")
public class SearchBusController extends HttpServlet {

	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();
		UserDaoImpl userDao = new UserDaoImpl();
		User userModel=(User) session.getAttribute("userModel");
		
		//to find users age by dob
		int userAge=userDao.findUserAge(userModel.getUserDOB());
	
		BusDaoImpl busDao=new BusDaoImpl();
	    List<String> locationList=new ArrayList<String>(); 
	    locationList=busDao.getLocations();
	    
	    if(locationList!=null) {
	    	try {
	    		session.setAttribute("UserAge", userAge);
	    		session.setAttribute("LocationList", locationList);
	    		session.setAttribute("userHome", "homeSession");
				res.sendRedirect("SearchBus.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
	    }
	    
	}
}
