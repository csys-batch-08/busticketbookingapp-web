package com.busticketbooking.model;


import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

public class BookedTickets {

	private int bookingId;
	private String ticketNo;
	private User userModel;
	private Bus busModel;
	private LocalDate bookingDate;
	private LocalDateTime departureDate;
	private int ticketCount;
	private String bookingStatus;
	private double totalPrice;
	private String paymentStatus;
	
	

	public BookedTickets() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookedTickets(int bookingId,String ticketNo, User userModel, Bus busModel, LocalDate bookingDate,
			LocalDateTime departureDate, int ticketCount,  double totalPrice,String bookingStatus,
			String paymentStatus) {
		super();
		this.bookingId = bookingId;
		this.ticketNo=ticketNo;
		this.userModel = userModel;
		this.busModel = busModel;
		this.bookingDate = bookingDate;
		this.departureDate = departureDate;
		this.ticketCount = ticketCount;
		this.bookingStatus = bookingStatus;
		this.totalPrice = totalPrice;
		this.paymentStatus = paymentStatus;
	}

	public BookedTickets(int bookingId,String ticketNo, User userModel, Bus busModel, 
			LocalDateTime departureDate, int ticketCount,  double totalPrice,
			String paymentStatus) {
		super();
		this.bookingId = bookingId;
		this.ticketNo=ticketNo;
		this.userModel = userModel;
		this.busModel = busModel;
		this.departureDate = departureDate;
		this.ticketCount = ticketCount;
		this.totalPrice = totalPrice;
		this.paymentStatus = paymentStatus;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public String getTicketNo() {
		return ticketNo;
	}

	public void setTicketNo(String ticketNo) {
		this.ticketNo = ticketNo;
	}

	public User getUserModel() {
		return userModel;
	}

	public void setUserModel(User userModel) {
		this.userModel = userModel;
	}

	public Bus getBusModel() {
		return busModel;
	}

	public void setBusModel(Bus busModel) {
		this.busModel = busModel;
	}

	public LocalDate getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(LocalDate bookingDate) {
		this.bookingDate = bookingDate;
	}

	public LocalDateTime getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(LocalDateTime departureDate) {
		this.departureDate = departureDate;
	}

	public int getTicketCount() {
		return ticketCount;
	}

	public void setTicketCount(int ticketCount) {
		this.ticketCount = ticketCount;
	}

	public String getBookingStatus() {
		return bookingStatus;
	}

	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	@Override
	public String toString() {
		return "BookedTickets [bookingId=" + bookingId + ", ticketNo=" + ticketNo + ", userModel=" + userModel
				+ ", busModel=" + busModel + ", bookingDate=" + bookingDate + ", departureDate=" + departureDate
				+ ", ticketCount=" + ticketCount + ", bookingStatus=" + bookingStatus + ", totalPrice=" + totalPrice
				+ ", paymentStatus=" + paymentStatus + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(bookingDate, bookingId, bookingStatus, busModel, departureDate, paymentStatus, ticketCount,
				ticketNo, totalPrice, userModel);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BookedTickets other = (BookedTickets) obj;
		return Objects.equals(bookingDate, other.bookingDate) && bookingId == other.bookingId
				&& Objects.equals(bookingStatus, other.bookingStatus) && Objects.equals(busModel, other.busModel)
				&& Objects.equals(departureDate, other.departureDate)
				&& Objects.equals(paymentStatus, other.paymentStatus) && ticketCount == other.ticketCount
				&& Objects.equals(ticketNo, other.ticketNo) && totalPrice == other.totalPrice
				&& Objects.equals(userModel, other.userModel);
	}

	
	
	}
	
	

