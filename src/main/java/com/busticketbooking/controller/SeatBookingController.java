package com.busticketbooking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.model.Bus;

@WebServlet("/SeatBooking")
public class SeatBookingController extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();
		BusDaoImpl busDao=new BusDaoImpl();
	       
	       // busId coming from filterJsp class
	       int busId=Integer.parseInt(req.getParameter("busIdValue")); 
	       
	       Bus busModel=busDao.findBusDetailsUsingID(busId);
	       
	       
	       if(busModel!=null) {
	    	   if(busModel.getTotalseat()==0) {
	    		   busDao.updateBusStatus("unavailable", busId);
	    		   try {
//		    			session.setAttribute("CurrentBusObject", busModel);
			    		RequestDispatcher reqDispatcher=req.getRequestDispatcher("filterBus.jsp?seatstatus=unavailable");
						reqDispatcher.forward(req, res);
					} catch (ServletException | IOException e) {
						e.printStackTrace();
					}
	    	   }
	    	   else {
	    		   busDao.updateBusStatus("available", busId);
	    		   try {
		    			session.setAttribute("CurrentBusObject", busModel);
			    		RequestDispatcher reqDispatcher=req.getRequestDispatcher("seatBooking.jsp");
						reqDispatcher.forward(req, res);
					} catch (ServletException | IOException e) {
						e.printStackTrace();
					}
	    	   }
	       }
	}
}
