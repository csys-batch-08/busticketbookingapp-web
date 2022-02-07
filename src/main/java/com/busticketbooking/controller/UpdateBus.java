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

@WebServlet("/BusUpdate")
public class UpdateBus extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req,HttpServletResponse res)  {
				
		HttpSession session = req.getSession();
		int busId=Integer.parseInt(req.getParameter("busId")); 
		BusDaoImpl busDao=new BusDaoImpl();
        Bus busModel=busDao.findBusDetailsUsingID(busId);
         if(busModel!=null) {
        	 try {
        		 session.setAttribute("BusObject", busModel);
        		 RequestDispatcher reqDispatcher=req.getRequestDispatcher("updateBus.jsp");
 	    		reqDispatcher.forward(req, res);
			} catch (IOException | ServletException e) {
				e.printStackTrace();
			}
         }
		
	}
}