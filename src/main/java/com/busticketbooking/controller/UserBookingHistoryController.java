package com.busticketbooking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BookedTicketsDaoImpl;
import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.User;


@WebServlet("/UserBookingHistory")
public class UserBookingHistoryController extends HttpServlet {

	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();
		User userModel=(User)session.getAttribute("userModel");
		BookedTicketsDaoImpl bookTicketsDao=new BookedTicketsDaoImpl();
	    List<BookedTickets> bookTicketsList=new ArrayList<BookedTickets>();
	      
	    bookTicketsList=bookTicketsDao.getBookingDetailsForCurrentUser(userModel);
		
	    if(bookTicketsList!=null) {
	    	try {
	    		session.setAttribute("BookingList", bookTicketsList);
				res.sendRedirect("UserBookingHistory.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
	    }
		
	}
}
