package com.busticketbooking.model;


import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

public class Bus {

	private int busId;
	private int busNo;
	private int operatorId;
	private String busCategory;
	private String fromCity;
	private String toCity;
	private LocalDateTime departure;
	private LocalDateTime arrival;
	private int seaterFare;
	private int totalSeat;
	private String seatStatus;

	
	public Bus(int busId, int busNo, int operatorId, String busCategory, String fromCity, String toCity,
			LocalDateTime departure, LocalDateTime arrival, int seaterFare, int totalseat, String seatStatus) {
		super();
		this.busId = busId;
		this.busNo = busNo;
		this.operatorId = operatorId;
		this.busCategory = busCategory;
		this.fromCity = fromCity;
		this.toCity = toCity;
		this.departure = departure;
		this.arrival = arrival;
		this.seaterFare = seaterFare;
		this.totalSeat = totalseat;
		this.seatStatus = seatStatus;
	}

	public Bus(int busId, String busCategory, String fromCity, String toCity,
			LocalDateTime departure, LocalDateTime arrival, int seaterFare, int totalseat,
			String seatStatus) {
		super();
		this.busId = busId;
		this.busCategory = busCategory;
		this.fromCity = fromCity;
		this.toCity = toCity;
		this.departure = departure;
		this.arrival = arrival;
		this.seaterFare = seaterFare;
		this.totalSeat = totalseat;
		this.seatStatus = seatStatus;
	}
	
	public Bus(int busId, int busNo, int operatorId) {
		super();
		this.busId = busId;
		this.busNo = busNo;
		this.operatorId = operatorId;
	}


	public int getBusId() {
		return busId;
	}

	public int getBusNo() {
		return busNo;
	}

	public int getOperatorId() {
		return operatorId;
	}

	public String getBusCategory() {
		return busCategory;
	}

	public String getFromCity() {
		return fromCity;
	}

	public String getToCity() {
		return toCity;
	}

	public LocalDateTime getDeparture() {
		return departure;
	}

	public LocalDateTime getArrival() {
		return arrival;
	}

	public int getSeaterFare() {
		return seaterFare;
	}

	public int getTotalseat() {
		return totalSeat;
	}

	public String getSeatStatus() {
		return seatStatus;
	}

	public void setBusId(int busId) {
		this.busId = busId;
	}

	public void setBusNo(int busNo) {
		this.busNo = busNo;
	}

	public void setOperatorId(int operatorId) {
		this.operatorId = operatorId;
	}

	public void setBusCategory(String busCategory) {
		this.busCategory = busCategory;
	}

	public void setFromCity(String fromCity) {
		this.fromCity = fromCity;
	}

	public void setToCity(String toCity) {
		this.toCity = toCity;
	}

	public void setDeparture(LocalDateTime departure) {
		this.departure = departure;
	}

	public void setArrival(LocalDateTime arrival) {
		this.arrival = arrival;
	}

	public void setSeaterFare(int seaterFare) {
		this.seaterFare = seaterFare;
	}

	public void setTotalseat(int totalseat) {
		this.totalSeat = totalseat;
	}

	public void setSeatStatus(String seatStatus) {
		this.seatStatus = seatStatus;
	}

	@Override
	public String toString() {
		return "Bus [busId=" + busId + ", busNo=" + busNo + ", operatorId=" + operatorId + ", busCategory="
				+ busCategory + ", fromCity=" + fromCity + ", toCity=" + toCity + ", departure=" + departure
				+ ", arrival=" + arrival + ", seaterFare=" + seaterFare + ", totalseat=" + totalSeat + ", seatStatus="
				+ seatStatus + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(arrival, busCategory, busId, busNo, departure, fromCity, operatorId, seatStatus, seaterFare,
				toCity, totalSeat);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Bus other = (Bus) obj;
		return Objects.equals(arrival, other.arrival) && Objects.equals(busCategory, other.busCategory)
				&& busId == other.busId && busNo == other.busNo && Objects.equals(departure, other.departure)
				&& Objects.equals(fromCity, other.fromCity) && operatorId == other.operatorId
				&& Objects.equals(seatStatus, other.seatStatus) && seaterFare == other.seaterFare
				&& Objects.equals(toCity, other.toCity) && totalSeat == other.totalSeat;
	}

	
	


	
}
