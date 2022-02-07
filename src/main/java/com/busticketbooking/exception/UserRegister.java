package com.busticketbooking.exception;

public class UserRegister extends Exception{


	public String getEmailRegisterMessage() {
		return "This account already register";
	}
	

	public String getPhoneRegisterMessage() {
		return "This account already register";
	}
	
}
