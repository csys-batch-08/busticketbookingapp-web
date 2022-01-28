package com.busticketbooking.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.model.Bus;

@WebServlet("/FilterBus")
public class FilterBusController extends HttpServlet {

	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		BusDaoImpl busDao=new BusDaoImpl();
		
		String fromLocation=req.getParameter("fromlocation");
	    String toLocation=req.getParameter("tolocation");
	    LocalDate date=LocalDate.parse(req.getParameter("date"));
	    
	    List<Bus> busFilterList=busDao.searchhBus(date, fromLocation, toLocation);
	    if(busFilterList!=null) {
	    	try {
	    		req.setAttribute("BusList", busFilterList);
	    		req.setAttribute("FromLocation", fromLocation);
	    		req.setAttribute("ToLocation", toLocation);
	    		req.setAttribute("Date", date);
	    		RequestDispatcher reqDispatcher=req.getRequestDispatcher("filterBus.jsp");
	    		reqDispatcher.forward(req, res);
			} catch (IOException | ServletException e) {
				e.printStackTrace();
			}
	    }
	}
}
