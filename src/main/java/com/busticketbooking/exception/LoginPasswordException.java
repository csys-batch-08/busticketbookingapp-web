package com.busticketbooking.exception;

public class LoginPasswordException extends Exception {

	public String getPasswordLoginMessage() {
		return "invalid password";
	}
}
