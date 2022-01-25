package com.busticketbooking.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BookedTicketsDaoImpl;
import com.busticketbooking.daoimpl.SeatDetailsDaoImpl;
import com.busticketbooking.exception.WrongTicketNumber;
import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.SeatDetails;

@WebServlet("/myticketservlet")
public class MyTicketController extends HttpServlet {

	BookedTickets bookTickets = new BookedTickets();
	BookedTicketsDaoImpl bookTicketsDao = new BookedTicketsDaoImpl();
	SeatDetailsDaoImpl seatDetailsDao = new SeatDetailsDaoImpl();
	BookedTickets bookedTicketsModel = new BookedTickets();
	List<SeatDetails> seatNoList=new ArrayList<SeatDetails>();

	public void service(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();

		String ticketNo=req.getParameter("tickettext");
		bookTickets = bookTicketsDao.findBookedTicketsObjectDetails(ticketNo);
		
		//to take seat no from seat table and store it in string to show 
		seatNoList=seatDetailsDao.getSeatDetailsUsingTicketNo(ticketNo);
		String bookSeatNum = "";
		for (int i = 0; i < seatNoList.size(); i++) {
			/* bookSeatNo += seatNoList.[i] + " "; */
			SeatDetails agis= seatNoList.get(i); 
			bookSeatNum += agis.getSeatNo() + "  ";	
		}
		try {
		if (bookTickets != null) {

		
			LocalDate date = bookTickets.getDepartureDate().toLocalDate();
			boolean resultCheck=bookTicketsDao.dateChecking(ticketNo, date);
			
			//to check whether departure date is finished or not
			if (resultCheck) { 
				session.setAttribute("ticketdetailsresult", bookTickets);
				System.out.println("after");
				session.setAttribute("seatnumberdetailsresult", bookSeatNum);
				try {
					res.sendRedirect("TicketInvoice.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				throw new WrongTicketNumber();
			}
		}
		// if ticketnumber entered by user is wrong
		else {
			throw new WrongTicketNumber();
		}
		}
		catch(WrongTicketNumber t) {
			session.setAttribute("WrongNumber", t.getWrongNumber());
			try {
				res.sendRedirect("MyTicket.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}
