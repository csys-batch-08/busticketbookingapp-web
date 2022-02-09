package com.busticketbooking.controller;

import java.io.IOException;
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

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		//getting userDetails from session from loginController
		User userModel = (User) session.getAttribute("userModel");

		//getting bus object from session
		Bus busModel = (Bus)session.getAttribute("CurrentBusObject");
		
		//getting details from seatBooking jsp page input entered by user
		String randomNo = req.getParameter("randomnumber");
		int ticketCount = 0;
		int totalPrice = 0;
		try {
			ticketCount = Integer.parseInt(req.getParameter("noofseats"));
			totalPrice = Integer.parseInt(req.getParameter("totalFair"));
		} catch (NumberFormatException e1) {
			e1.printStackTrace();
		}

		//checking balance from user to book ticket
		if (userModel.getUserWallet() >= totalPrice) {

			double updateAmountInWallet = userModel.getUserWallet() - totalPrice;
			userModel.setUserWallet(updateAmountInWallet);
			
			int updateBusSeat = busModel.getTotalseat() - ticketCount;
			busModel.setTotalseat(updateBusSeat);
			busDao.updateSeatCount(busModel);
			seatDetailsDao.ticketexist(ticketCount, randomNo, busModel, userModel);
			
			//inserting all getting values in booked tickets DAO
			BookedTickets bookTickets = new BookedTickets(0, randomNo, userModel, busModel, busModel.getDeparture(),
					ticketCount, totalPrice, "success");
			boolean ticketInsertFlag = bookTicketsDao.insertBookedTickets(bookTickets);
			
			//creating final session by using all
			req.setAttribute("FinalBookTicketsModel", bookTickets);
			if (ticketInsertFlag) {
				try {
					RequestDispatcher reqDispatcher=req.getRequestDispatcher("bookSuccess.jsp?infomsg=Booked");					
	 	    		reqDispatcher.forward(req, res);
				} catch (IOException | ServletException e) {
					e.printStackTrace();
				}
			}	
		}
		else {
			try {
				res.sendRedirect("updateWallet.jsp?insufficient=recharge");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
}

