package com.busticketbooking.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.model.Bus;

@WebServlet("/FilterBus")
public class FilterBusController extends HttpServlet {

	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();
		BusDaoImpl busDao=new BusDaoImpl();
		List<Bus> busFilterList=new ArrayList<Bus>();
		
		String fromLocation=req.getParameter("fromlocation");
	    String toLocation=req.getParameter("tolocation");
	    LocalDate date=LocalDate.parse(req.getParameter("date"));
	    
	    busFilterList=busDao.searchhBus(date, fromLocation, toLocation);
	    if(busFilterList!=null) {
	    	try {
	    		session.setAttribute("BusList", busFilterList);
				res.sendRedirect("FilterBus.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
	    }
	}
}
