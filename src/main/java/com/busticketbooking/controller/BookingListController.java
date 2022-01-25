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

@WebServlet("/BookingList")
public class BookingListController extends HttpServlet {

	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();

		List<BookedTickets> bookingListAdmin=new ArrayList<BookedTickets>();
	    BookedTicketsDaoImpl bookDao=new BookedTicketsDaoImpl();
	    bookingListAdmin=bookDao.showlistAdmin();
	    
	    if(bookingListAdmin!=null) {
	    	try {
	    		session.setAttribute("BookingListAdmin", bookingListAdmin);
				res.sendRedirect("BookingList.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
	    }
	}
}
