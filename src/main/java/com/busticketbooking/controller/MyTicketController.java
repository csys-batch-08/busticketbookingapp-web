package com.busticketbooking.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BookedTicketsDaoImpl;
import com.busticketbooking.daoimpl.SeatDetailsDaoImpl;
import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.exception.WrongTicketNumber;
import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.SeatDetails;

@WebServlet("/myticketservlet")
public class MyTicketController extends HttpServlet {

	BookedTickets bookTickets = new BookedTickets();
	BookedTicketsDaoImpl bookTicketsDao = new BookedTicketsDaoImpl();
	SeatDetailsDaoImpl seatDetailsDao = new SeatDetailsDaoImpl();
	BookedTickets bookedTicketsModel = new BookedTickets();
	UserDaoImpl dao = new UserDaoImpl();
	List<SeatDetails> seatNoList = new ArrayList<>();

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		String ticketNo = req.getParameter("tickettext");
		bookTickets = bookTicketsDao.findBookedTicketsObjectDetails(ticketNo);
		// to take seat no from seat table and store it in string to show
		seatNoList = seatDetailsDao.getSeatDetailsUsingTicketNo(ticketNo);
		String bookSeatNum = "";
		for (int i = 0; i < seatNoList.size(); i++) {
			SeatDetails agis = seatNoList.get(i);
			bookSeatNum += agis.getSeatNo() + "  ";
		}
		try {
			if (bookTickets != null) {
				LocalDate date = bookTickets.getDepartureDate().toLocalDate();
				boolean resultCheck = bookTicketsDao.dateChecking(ticketNo, date);
				// to check whether departure date is finished or not
				if (resultCheck) {
					session.setAttribute("ticketdetailsresult", bookTickets);
					session.setAttribute("seatnumberdetailsresult", bookSeatNum);
					res.sendRedirect("ticketInvoice.jsp");
				} else {
					throw new WrongTicketNumber();
				}
			}
			// if ticketNumber entered by user is wrong
			else {
				throw new WrongTicketNumber();
			}
		} catch (WrongTicketNumber | IOException t) {
			try {
				req.setAttribute("WrongNumber", ((WrongTicketNumber) t).getWrongNumber());
				RequestDispatcher reqDispatcher = req.getRequestDispatcher("myTicket.jsp");
				reqDispatcher.forward(req, res);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}

	}
}
