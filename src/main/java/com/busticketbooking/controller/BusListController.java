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
import com.busticketbooking.model.Bus;

@WebServlet("/BusList")
public class BusListController extends HttpServlet {

	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();

		List<Bus> busList=new ArrayList<Bus>();
	    BusDaoImpl busDao=new BusDaoImpl();
	    busList=busDao.viewAllBus();
	    
	    if(busList!=null) {
	    	try {
	    		session.setAttribute("BusListAdmin", busList);
				res.sendRedirect("BusList.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
	    }
		
	}
}
