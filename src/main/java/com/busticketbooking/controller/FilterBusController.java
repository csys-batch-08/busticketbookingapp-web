package com.busticketbooking.controller;

import java.io.IOException;
import java.time.LocalDate;
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
	public void doPost(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session = req.getSession();
		BusDaoImpl busDao=new BusDaoImpl();
		String fromLocation=req.getParameter("fromlocation");
	    String toLocation=req.getParameter("tolocation");
	    LocalDate date=LocalDate.parse(req.getParameter("date"));
	    List<Bus> busFilterList=busDao.searchhBus(date, fromLocation, toLocation);
	    if(busFilterList!=null) {
	    	try {
	    		session.setAttribute("BusList", busFilterList);
	    		session.setAttribute("FromLocation", fromLocation);
	    		session.setAttribute("ToLocation", toLocation);
	    		session.setAttribute("Date", date);
	    		RequestDispatcher reqDispatcher=req.getRequestDispatcher("filterBus.jsp");
	    		reqDispatcher.forward(req, res);
			} catch (IOException | ServletException e) {
				e.printStackTrace();
			}
	    }
	}
}
