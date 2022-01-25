package com.busticketbooking.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.daoimpl.OperatorDaoImpl;
import com.busticketbooking.model.Bus;
import com.busticketbooking.model.Operator;


@WebServlet("/BusUpdate")
public class UpdateBus extends HttpServlet {

	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();
		
		int busId=Integer.parseInt(req.getParameter("busId")); 
		BusDaoImpl busDao=new BusDaoImpl();
        Bus busModel=busDao.findBusDetailsUsingID(busId);
         
         if(busModel!=null) {
        	 try {
        		 session.setAttribute("BusObject", busModel);
				res.sendRedirect("UpdateBus.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
         }
		
	}
}