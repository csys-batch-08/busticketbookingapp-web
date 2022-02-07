package com.busticketbooking.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.model.Bus;

@WebServlet("/BusList")
public class BusListController extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req,HttpServletResponse res) {
	    BusDaoImpl busDao=new BusDaoImpl();
	    List<Bus> busList=busDao.viewAllBus();
	    if(busList!=null) {
	    	try {
	    		req.setAttribute("BusListAdmin", busList);
	    		RequestDispatcher reqDispatcher=req.getRequestDispatcher("busList.jsp");
	    		reqDispatcher.forward(req, res);
			} catch (IOException | ServletException e) {
				e.printStackTrace();
			}
	    }
		
	}
}
