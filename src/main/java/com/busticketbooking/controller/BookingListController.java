package com.busticketbooking.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.busticketbooking.daoimpl.BookedTicketsDaoImpl;
import com.busticketbooking.model.BookedTickets;

@WebServlet("/BookingList")
public class BookingListController extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req,HttpServletResponse res) {
	    BookedTicketsDaoImpl bookDao=new BookedTicketsDaoImpl();
	    List<BookedTickets> bookingListAdmin=bookDao.showlistAdmin();
	    if(bookingListAdmin!=null) {
	    	try {
	    		req.setAttribute("BookingListAdmin", bookingListAdmin);
	    		RequestDispatcher reqDispatcher=req.getRequestDispatcher("bookingList.jsp");
 	    		reqDispatcher.forward(req, res);
			} catch (IOException | ServletException e) {
				e.printStackTrace();
			}
	    }
	}
}
