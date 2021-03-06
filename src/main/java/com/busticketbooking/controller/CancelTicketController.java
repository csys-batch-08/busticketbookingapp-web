package com.busticketbooking.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BookedTicketsDaoImpl;
import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.daoimpl.SeatDetailsDaoImpl;
import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.exception.BusDepartureDateEnded;
import com.busticketbooking.exception.TicketAlreadyCancel;
import com.busticketbooking.exception.WrongTicketNumber;
import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.Bus;
import com.busticketbooking.model.User;

@WebServlet("/cancelticketservlet")
public class CancelTicketController extends HttpServlet {

	DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("dd-mm-yyyy");
	BookedTicketsDaoImpl bookTicketsDao = new BookedTicketsDaoImpl();
	BusDaoImpl busDao = new BusDaoImpl();
	UserDaoImpl userDao = new UserDaoImpl();
	SeatDetailsDaoImpl seatDetails = new SeatDetailsDaoImpl();
	BookedTickets bookedTicketsModel = new BookedTickets();

	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		User userModel = (User) session.getAttribute("userModel");

		// ticket number entered by user in cancel ticket JSP
		String ticketNo = req.getParameter("tickettext");
		// to find booked tickets pojo class by using ticket no entered by user in
		// cancel ticket JSP
		bookedTicketsModel = bookTicketsDao.findBookedTicketsObjectDetails(ticketNo);

		// to check ticket number entered by user is correct or not
		if (bookedTicketsModel != null) {
			LocalDate date = bookedTicketsModel.getDepartureDate().toLocalDate();
			boolean resultCheck = bookTicketsDao.dateChecking(ticketNo, date);

			// to check whether departure date is finished or not
			if (resultCheck) {
				if (!(bookedTicketsModel.getBookingStatus().equals("cancelled"))) {

					// to update seat by using bus object from bookedTickets model
					int totalSeatAlreadyAvailable = bookedTicketsModel.getBusModel().getTotalseat();
					int seatToUpdate = totalSeatAlreadyAvailable + bookedTicketsModel.getTicketCount();
					// update seat to bus constructor
					Bus bus = new Bus(bookedTicketsModel.getBusModel().getBusId(),
							bookedTicketsModel.getBusModel().getBusNo(),
							bookedTicketsModel.getBusModel().getOperatorId(),
							bookedTicketsModel.getBusModel().getBusCategory(),
							bookedTicketsModel.getBusModel().getFromCity(),
							bookedTicketsModel.getBusModel().getToCity(),
							bookedTicketsModel.getBusModel().getDeparture(),
							bookedTicketsModel.getBusModel().getArrival(),
							bookedTicketsModel.getBusModel().getSeaterFare(), seatToUpdate,
							bookedTicketsModel.getBusModel().getSeatStatus());
					boolean busSeatUpdateFlag = busDao.updateSeatCount(bus);
					// checking seat count updated
					if (busSeatUpdateFlag) {
						// to reduce fine amount in 15% in userObject using updateDao
						double fineFare = (bookedTicketsModel.getTotalPrice() / 100) * 15;
						double refundFare = bookedTicketsModel.getTotalPrice() - fineFare;
						double refundPrice = bookedTicketsModel.getUserModel().getUserWallet() + refundFare;
						boolean userUpdateWalletFlag = userDao.updateWallet(refundPrice,
								bookedTicketsModel.getUserModel().getUserContact());
						if (userUpdateWalletFlag) {
							// to set wallet amount to user session object
							userModel.setUserWallet(refundPrice);
							// to cancel the ticket(changing status) in bookedTicket class using
							// cancelTicketdao
							boolean ticketCancelFlag = bookTicketsDao.cancelTicket(ticketNo);
							seatDetails.cancelSeatDetails(ticketNo);
							if (ticketCancelFlag) {
								try {
									res.sendRedirect("cancelTicket.jsp?cancel=success");
								} catch (Exception e) {
									e.printStackTrace();
								}
							}
						}
					}
				}
				// already cancel
				else {
					try {
						throw new TicketAlreadyCancel();
					} catch (TicketAlreadyCancel t1) {

						try {
							req.setAttribute("AlreadyCancel", t1.getAlreadyCancelMessage());
							RequestDispatcher reqDispatcher = req.getRequestDispatcher("cancelTicket.jsp");
							reqDispatcher.forward(req, res);
						} catch (ServletException | IOException e) {
							e.printStackTrace();
						}
					}
				}
			} else {
				try {
					throw new BusDepartureDateEnded();
				} catch (BusDepartureDateEnded b) {

					try {
						req.setAttribute("DateEnded", b.getDepartureMessage());
						RequestDispatcher reqDispatcher = req.getRequestDispatcher("cancelTicket.jsp");
						reqDispatcher.forward(req, res);
					} catch (ServletException | IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		// if ticketNumber entered by user is wrong
		else {
			try {
				throw new WrongTicketNumber();
			} catch (WrongTicketNumber t) {

				try {
					req.setAttribute("WrongNumber", t.getWrongNumber());
					RequestDispatcher reqDispatcher = req.getRequestDispatcher("cancelTicket.jsp");
					reqDispatcher.forward(req, res);
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
