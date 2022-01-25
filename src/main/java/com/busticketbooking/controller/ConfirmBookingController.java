package com.busticketbooking.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BookedTicketsDaoImpl;
import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.daoimpl.SeatDetailsDaoImpl;
import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.Bus;
import com.busticketbooking.model.SeatDetails;
import com.busticketbooking.model.User;

@WebServlet("/confirmBooking")
public class ConfirmBookingController extends HttpServlet {

	BusDaoImpl busDao = new BusDaoImpl();
	UserDaoImpl userDao = new UserDaoImpl();
	BookedTicketsDaoImpl bookTicketsDao = new BookedTicketsDaoImpl();
	SeatDetailsDaoImpl seatDetailsDao=new SeatDetailsDaoImpl();
	SeatDetails seatDetails=new SeatDetails();

	public void service(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		//getting userDetails from session from loginController
		User userModel = (User) session.getAttribute("userModel");

		
		//getting bus object from session
		Bus busModel = (Bus)session.getAttribute("CurrentBusObject");
		
		
		//getting details from seatbooking jsp page input entered by user
		String randomNo = req.getParameter("randomnumber");
		int ticketCount = Integer.parseInt(req.getParameter("noofseats"));
		int totalPrice = Integer.parseInt(req.getParameter("totalFair"));

		//checking balance from user to book ticket
		if (userModel.getUserWallet() >= totalPrice) {

			double updateAmountInWallet = userModel.getUserWallet() - totalPrice;
			userModel.setUserWallet(updateAmountInWallet);
			
			int updateBusSeat = busModel.getTotalseat() - ticketCount;
			busModel.setTotalseat(updateBusSeat);
			boolean updateSeatFlag = busDao.updateSeatCount(busModel);

			
			//getting seat no from dao 
			try {
				seatDetailsDao.ticketexist(ticketCount, randomNo, busModel, userModel);
			} catch (ClassNotFoundException e1) {
				System.out.println(e1.getMessage());
			} catch (SQLException e1) {
				System.out.println(e1.getMessage());
			}
			
			//inserting all getting values in booked tickets dao
			BookedTickets bookTickets = new BookedTickets(0, randomNo, userModel, busModel, busModel.getDeparture(),
					ticketCount, totalPrice, "success");
			boolean ticketInsertFlag = bookTicketsDao.insertBookedTickets(bookTickets);

			//creating final session by using all
			session.setAttribute("FinalBookTicketsModel", bookTickets);

			if (ticketInsertFlag) {
				try {
					res.sendRedirect("BookSuccess.jsp");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}	
		}
		
		//if user wallet is insufficient 
		else {
			try {
				session.setAttribute("userHome", "insufficient");
				res.sendRedirect("UpdateWallet.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}

	}
}
