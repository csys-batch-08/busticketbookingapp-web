package com.busticketbooking.dao;

import java.sql.ResultSet;
import java.util.List;

import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.Bus;
import com.busticketbooking.model.User;

public interface BookedTicketsDAO {

	public boolean insertBookedTickets(BookedTickets bookedTicketsModel);
	
	public int findBookingId(BookedTickets bookedTicketsModel);
	
	public List<BookedTickets> getBookingDetailsForCurrentUser(User userModel);
	
	public List<BookedTickets> findBookedTicketsDetails(String bookingId);
	
	public boolean cancelTicket(String ticketNo);
	
	public ResultSet showlistAdmin();
	
	
}
