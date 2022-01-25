package com.busticketbooking.exception;

public class InsufficientBalance extends Exception {
	String message="insufficient balance";
	
//	@Override
//	public String getMessage() {
//		return message;
//	}
	
	@Override
	public String toString() {
		return message;
	}
}
