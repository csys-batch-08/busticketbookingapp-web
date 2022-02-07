package com.busticketbooking.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		User userModel = (User) session.getAttribute("userModel");
		BookedTicketsDaoImpl bookTicketsDao = new BookedTicketsDaoImpl();
		List<BookedTickets> bookTicketsList = bookTicketsDao.getBookingDetailsForCurrentUser(userModel);
		if (bookTicketsList != null) {
			try {
				req.setAttribute("BookingList", bookTicketsList);
				RequestDispatcher reqDispatcher = req.getRequestDispatcher("userBookingHistory.jsp");
				reqDispatcher.forward(req, res);
			} catch (IOException | ServletException e) {
				e.printStackTrace();
			}
		}

	}
}
