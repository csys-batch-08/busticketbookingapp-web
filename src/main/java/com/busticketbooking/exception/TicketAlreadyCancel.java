package com.busticketbooking.exception;

public class TicketAlreadyCancel extends Exception{
	
	public String getAlreadyCancelMessage() {
		return "Ticket Already Cancelled";
	}

}
