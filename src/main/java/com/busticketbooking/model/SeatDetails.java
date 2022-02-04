package com.busticketbooking.model;

import java.io.Serializable;
import java.util.Objects;

public class SeatDetails implements Serializable{

	private BookedTickets bookedTickets;
	private int seatNo;
	private String status;
	
	public SeatDetails() {
		super();
	}

	public SeatDetails(BookedTickets bookedTickets, int seatNo, String status) {
		super();
		this.bookedTickets = bookedTickets;
		this.seatNo = seatNo;
		this.status = status;
	}

	public BookedTickets getBookedTickets() {
		return bookedTickets;
	}

	public void setBookedTickets(BookedTickets bookedTickets) {
		this.bookedTickets = bookedTickets;
	}

	public int getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "SeatDetails [bookedTickets=" + bookedTickets + ", seatNo=" + seatNo + ", status=" + status + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(bookedTickets, seatNo, status);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SeatDetails other = (SeatDetails) obj;
		return Objects.equals(bookedTickets, other.bookedTickets) && seatNo == other.seatNo
				&& Objects.equals(status, other.status);
	}

	
	
}
