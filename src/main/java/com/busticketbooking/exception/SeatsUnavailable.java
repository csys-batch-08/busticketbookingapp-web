package com.busticketbooking.exception;

public class SeatsUnavailable extends Exception {

	public String getUnavailableMessage() {
		return "Seats are Unavailable";
	}
}
