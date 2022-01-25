package com.busticketbooking.exception;

public class WrongTicketNumber extends Exception{

	String message="Wrong Ticket Number";
	
	public String getWrongNumber() {
		return message;
	}
}
