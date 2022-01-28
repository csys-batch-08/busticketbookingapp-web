package com.busticketbooking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.SeatDetailsDaoImpl;
import com.busticketbooking.model.SeatDetails;

@WebServlet("/SeatList")
public class SeatListController extends HttpServlet {

	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) {
				
		SeatDetailsDaoImpl seatDao=new SeatDetailsDaoImpl();
	    List<SeatDetails> seatDetailsList=seatDao.showSeatList();
	    
	    if(seatDetailsList!=null) {
	    	try {
	    		req.setAttribute("SeatList", seatDetailsList);
	    		RequestDispatcher reqDispatcher=req.getRequestDispatcher("seatList.jsp");
 	    		reqDispatcher.forward(req, res);
			} catch (IOException | ServletException e) {
				e.printStackTrace();
			}
	    }
	}
}
