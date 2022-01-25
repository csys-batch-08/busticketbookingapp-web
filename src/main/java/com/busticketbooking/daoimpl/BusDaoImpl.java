package com.busticketbooking.daoimpl;
import java.util.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.busticketbooking.connection.ConnectionUtill;
import com.busticketbooking.dao.BusDAO;
import com.busticketbooking.model.Bus;
import com.busticketbooking.model.Operator;
import com.busticketbooking.model.User;

public class BusDaoImpl implements BusDAO {

	SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy hh:mm");
	
	public boolean insertBus(Bus busModel) {
		String busInsert = "insert into bus_details (bus_category, from_city, to_city, departure, arrival, seater_fare, total_seat,seat_status) values (?,?,?,?,?,?,?,?)";
		int result = 0 ;
		System.out.println("busdao"+busInsert);
		try {
			Connection con = ConnectionUtill.connectdb();
			PreparedStatement pstatement = con.prepareStatement(busInsert);
			
			pstatement.setString(1, busModel.getBusCategory());
			pstatement.setString(2, busModel.getFromCity());
			pstatement.setString(3, busModel.getToCity());
			Timestamp depDateTime = Timestamp.valueOf(busModel.getDeparture());
			pstatement.setTimestamp(4,  depDateTime);
			Timestamp arrDateTime = Timestamp.valueOf(busModel.getArrival());
			pstatement.setTimestamp(5,  arrDateTime);
			pstatement.setInt(6, busModel.getSeaterFare());
			pstatement.setInt(7, busModel.getTotalseat());
			pstatement.setString(8, busModel.getSeatStatus());
			
			result = pstatement.executeUpdate();

		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result>0;
	}

	public boolean deleteBus(int busId) {

		String busDelete = "delete from bus_details where bus_id=?";
		int result=0;
		Connection con;
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement = con.prepareStatement(busDelete);

			pstatement.setInt(1, busId);
			result = pstatement.executeUpdate();
			
			con.close();
			pstatement.close();
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result>0;
	}
	
	//updating bus details without bus number and operator
	public boolean updateBus(Bus busModel) {
		
            String busUpdate="update bus_details set bus_category=?, from_city=?, to_city=?, departure=?, arrival=?, seater_fare=?, total_seat=?,seat_status=? where bus_id='"+busModel.getBusId()+"'";
            int result=0;
    	    Connection con;
    	    try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement=con.prepareStatement(busUpdate);
			
			pstatement.setString(1, busModel.getBusCategory());
			pstatement.setString(2, busModel.getFromCity());
			pstatement.setString(3, busModel.getToCity());
			Timestamp depDateTime = Timestamp.valueOf(busModel.getDeparture());
			pstatement.setTimestamp(4,  depDateTime);
			Timestamp arrDateTime = Timestamp.valueOf(busModel.getArrival());
			pstatement.setTimestamp(5,  arrDateTime);
			pstatement.setInt(6, busModel.getSeaterFare());
			pstatement.setInt(7, busModel.getTotalseat());
			pstatement.setString(8, busModel.getSeatStatus());
			
			result=pstatement.executeUpdate();
			con.close();
			pstatement.close();
			}
    	    catch (ClassNotFoundException e) {
    	    	System.out.println(e.getMessage());
    		} catch (SQLException e) {
    			System.out.println(e.getMessage());
    		}
    	    return result>0;
	}
	
	
	//to add bus number and operator when departure day by admin
	public boolean updateBusNoAndOperator(Bus busModel) {
		String busUpdate="update bus_details set bus_no=?,operator_id=? where bus_id=?";
        int result=0;
	    Connection con;
	    try {
		con = ConnectionUtill.connectdb();
		PreparedStatement pstatement=con.prepareStatement(busUpdate);
		
		pstatement.setInt(1, busModel.getBusNo());
		pstatement.setInt(2, busModel.getOperatorId());
		pstatement.setInt(3, busModel.getBusId());
		result=pstatement.executeUpdate();
		con.close();
		pstatement.close();
		}
	    catch (ClassNotFoundException e) {
	    	System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	    return result>0;
	}
	
	
	

	//for admin use to view all busses:
	 public List<Bus> viewAllBus(){
	    	
	    	String busView="select bus_id,bus_no,operator_id,bus_category,from_city,to_city,departure,arrival,seater_fare,total_seat,seat_status from bus_details";
	    	
	    	Connection con;
	    	ResultSet rs=null;
	    	Bus busModel;
	    	List<Bus> busList=new ArrayList<Bus>();
			try {
				con = ConnectionUtill.connectdb();
				PreparedStatement pstatement=con.prepareStatement(busView);
				rs=pstatement.executeQuery();
				
				while(rs.next()) {					
				busModel=new Bus(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getTimestamp(7).toLocalDateTime(),rs.getTimestamp(8).toLocalDateTime(),rs.getInt(9),rs.getInt(10),rs.getString(11));
				busList.add(busModel);
			}
//				con.close();
//				pstatement.close();
			} catch (ClassNotFoundException e) {
				System.out.println(e.getMessage());
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			
			return busList;
			
	    }
	 
	 
	 
	 
	 //for users use to filter the bus according to date and location:
		public List<Bus> searchhBus(LocalDate givenDepartureDate,String fromLocation,String toLocation) 
		 {
				String findBus="select bus_id,bus_no,operator_id,bus_category,from_city,to_city,departure,arrival,seater_fare,"
						+ "total_seat,seat_status from bus_details where to_char(departure,'dd-mm-yyyy')=? and from_city=? and to_city=?";
				Connection con=null;
				PreparedStatement pstatement=null;
				Bus busModel;
				ResultSet rs=null;
				List<Bus> busFilterList=new ArrayList<Bus>();
				try {
					con=ConnectionUtill.connectdb();
					pstatement =con.prepareStatement(findBus);
					pstatement.setDate(1, java.sql.Date.valueOf(givenDepartureDate));
					pstatement.setString(2, fromLocation);
					pstatement.setString(3, toLocation);
					rs=pstatement.executeQuery();
					
					while(rs.next()) {					
						busModel=new Bus(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getTimestamp(7).toLocalDateTime(),rs.getTimestamp(8).toLocalDateTime(),rs.getInt(9),rs.getInt(10),rs.getString(11));
						busFilterList.add(busModel);
					}
				} catch (ClassNotFoundException e) {
					System.out.println(e.getMessage());
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}	
				return busFilterList;
		    }
		
		
	 
		public boolean updateSeatCount(Bus busModel) {
			
			String updateSeat="update bus_details set total_seat=? where bus_id=?";
			 Connection con;
			 int result=0;
	    	    try {
				con = ConnectionUtill.connectdb();
				PreparedStatement pstatement=con.prepareStatement(updateSeat);
				
				pstatement.setInt(1, busModel.getTotalseat());
				pstatement.setInt(2, busModel.getBusId());
				result=pstatement.executeUpdate();
				con.close();
				pstatement.close();
				}
	    	    catch (ClassNotFoundException e) {
	    			System.out.println(e.getMessage());
	    		} catch (SQLException e) {
	    			System.out.println(e.getMessage());
	    		}
	    	    return result>0;
		}
		
		
		public boolean updateBusStatus(String status,int busId) {
			String updateStatus="update bus_details set seat_status=? where bus_id=?";
			Connection con;
			 int result=0;
	    	    try {
				con = ConnectionUtill.connectdb();
				PreparedStatement pstatement=con.prepareStatement(updateStatus);
				
				pstatement.setString(1, status);
				pstatement.setInt(2, busId);
				result=pstatement.executeUpdate();
				con.close();
				pstatement.close();
				}
	    	    catch (ClassNotFoundException e) {
	    			System.out.println(e.getMessage());
	    		} catch (SQLException e) {
	    			System.out.println(e.getMessage());
	    		}
	    	    return result>0;
		}
		
	 
	 public Bus findBusDetailsUsingID(int busId)  {
		 String getBus ="select bus_id,bus_no,operator_id,bus_category,from_city,to_city,departure,arrival,seater_fare,total_seat,seat_status from bus_details where bus_id=?";
			Connection	 con = null;
			PreparedStatement pstatement=null;
			Bus busModel = null;
			
			 try {
				 
				con = ConnectionUtill.connectdb();
				pstatement=con.prepareStatement(getBus);
				pstatement.setInt(1, busId);
				ResultSet rs = pstatement.executeQuery();
				
				 if(rs.next()) {
					 busModel=new Bus(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getTimestamp(7).toLocalDateTime(),rs.getTimestamp(8).toLocalDateTime(),rs.getInt(9),rs.getInt(10),rs.getString(11));
				 
				 }
				con.close();
				pstatement.close();
			} catch (ClassNotFoundException e) {
				e.getMessage();
				System.out.println("classnot found");
			} catch (SQLException e) {
				e.getMessage();
				System.out.println("sql exception");
			}
			
			 return busModel;
		}
	 
	 	public List<String> getLocations() {
	 		String locationQuery="select distinct(from_city) from bus_details";
	 		Connection	 con = null;
			PreparedStatement pstatement=null;
			List<String> locationList=new ArrayList<String>();
	 		try {
					con = ConnectionUtill.connectdb();
					pstatement=con.prepareStatement(locationQuery);
					ResultSet rs=pstatement.executeQuery();
					while(rs.next()) {
						locationList.add(rs.getString(1));
					}
					con.close();
					pstatement.close();
				} catch (ClassNotFoundException e) {
					System.out.println(e.getMessage());
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
				return locationList;
	 	}
}

		
	 		
	 	

	



