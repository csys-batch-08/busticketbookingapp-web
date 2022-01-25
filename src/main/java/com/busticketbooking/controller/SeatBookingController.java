package com.busticketbooking.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.model.Bus;

@WebServlet("/SeatBooking")
public class SeatBookingController extends HttpServlet {

	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();
		BusDaoImpl busDao=new BusDaoImpl();
	       
	       // busId coming from filterJsp class
	       int busId=Integer.parseInt(req.getParameter("busIdValue")); 
	       
	       Bus busModel=busDao.findBusDetailsUsingID(busId);
	       
	       if(busModel!=null) {
	    	   try {
	    		   session.setAttribute("CurrentBusObject", busModel);
				   res.sendRedirect("SeatBooking.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
	       }
	}
}
