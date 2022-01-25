package com.busticketbooking.dao;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

import com.busticketbooking.model.Bus;

public interface BusDAO {

	public boolean insertBus(Bus busModel);
	
	public boolean updateBus(Bus busModel);
	
	public List<Bus> viewAllBus();
	
	public List<Bus> searchhBus(LocalDate givenDepartureDate,String fromLocation,String toLocation) ;
	
	public boolean updateSeatCount(Bus busModel);
	
	public Bus findBusDetailsUsingID(int busId);
	
	
}
