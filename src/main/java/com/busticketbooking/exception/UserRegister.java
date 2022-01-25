package com.busticketbooking.exception;

public class UserRegister extends Exception{


	public String getEmailRegisterMessage() {
		return "this account already register";
	}
	

	public String getPhoneRegisterMessage() {
		return "this account already register";
	}
	
}
