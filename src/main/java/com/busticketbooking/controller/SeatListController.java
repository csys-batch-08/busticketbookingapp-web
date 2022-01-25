package com.busticketbooking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.SeatDetailsDaoImpl;
import com.busticketbooking.model.SeatDetails;

@WebServlet("/SeatList")
public class SeatListController extends HttpServlet {

	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();
		
		SeatDetailsDaoImpl seatDao=new SeatDetailsDaoImpl();
	    List<SeatDetails> seatDetailsList=new ArrayList<SeatDetails>();
	    seatDetailsList=seatDao.showSeatList();
	    
	    if(seatDetailsList!=null) {
	    	try {
	    		session.setAttribute("SeatList", seatDetailsList);
				res.sendRedirect("SeatList.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
	    }
	}
}
