package com.busticketbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.busticketbooking.connection.ConnectionUtill;
import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.Bus;
import com.busticketbooking.model.SeatDetails;
import com.busticketbooking.model.User;

public class SeatDetailsDaoImpl {
	
//	BusDaoImpl busDao=new BusDaoImpl();s
//	UserDaoImpl userDao=new UserDaoImpl();
	BookedTicketsDaoImpl tickedDao=new BookedTicketsDaoImpl();

	public boolean insertSeat(SeatDetails seatDetails) {
		String seatInsert = "insert into seat_details (booking_id,user_id,bus_id,seat_no,seat_status) values (?,?,?,?,?)"; 
		
		//,seat_no
		Connection con;
		int result=0;
		
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement=con.prepareStatement(seatInsert);
			
			pstatement.setInt(1, seatDetails.getBookedTickets().getBookingId());
			pstatement.setInt(2, seatDetails.getBookedTickets().getUserModel().getUserId());
			pstatement.setInt(3, seatDetails.getBookedTickets().getBusModel().getBusId());
			pstatement.setInt(4, seatDetails.getSeatNo());
			pstatement.setString(5, seatDetails.getStatus());
		
			result=pstatement.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			e.getMessage();
		} catch (SQLException e) {
			e.getMessage();
		}
		return result>0;
	}
	
	public boolean ticketexist(int ticketCountEntered,String ticketRandomNumber,Bus bus,User user) throws ClassNotFoundException, SQLException {
		
	Connection	con = ConnectionUtill.connectdb();
	String query = "select ticket_no,user_id,bus_id,seat_no,seat_status from seat_details where seat_no=?  and bus_id=? and seat_status in 'booked'";
	String query1 = "insert into seat_details(ticket_no,user_id,bus_id,seat_no) values(?,?,?,?)";
	PreparedStatement pstatement=con.prepareStatement(query);
	int busseat = bus.getTotalseat();
	int seatcount = 0;
	int seatno = 1;
	if(busseat >= 0) {
	while(seatcount < ticketCountEntered) {
	
		pstatement.setInt(1, seatno);
		pstatement.setInt(2, bus.getBusId());
		ResultSet rs = pstatement.executeQuery();
		if(rs.next()) {
			
		}
		else {
			
			PreparedStatement pstatement1=con.prepareStatement(query1);
			
			pstatement1.setString(1, ticketRandomNumber);
			pstatement1.setInt(2, user.getUserId());
			pstatement1.setInt(3, bus.getBusId());
			pstatement1.setInt(4, seatno);
			pstatement1.executeUpdate();
			pstatement1.executeUpdate("commit");
			seatcount++;
		}
		
		seatno++;
	}
	
	if(seatcount == ticketCountEntered) {
		return true;
	}}else {
		//System.out.println("bus out of seat!!");
		return false;
	}
	
	return false;
	}
	
	
	public boolean cancelSeatDetails(String ticketNo) throws ClassNotFoundException, SQLException {
		String seatCancel="delete from seat_details where ticket_no=?";
		
		Connection	con = ConnectionUtill.connectdb();
		int result=0;
		PreparedStatement pstatement=con.prepareStatement(seatCancel);
		
		pstatement.setString(1, ticketNo);
		result=pstatement.executeUpdate();
		
		return result>0;
		
	}
	
	
	
	public List<SeatDetails> showSeatList() {
		String seatDetailsQuery="select ticket_no,user_id,bus_id,seat_no,seat_status from seat_details order by bus_id,seat_no";
		
		Connection con;

		BookedTickets bookTickets=null;
	   	ResultSet rs = null;
	   	List<SeatDetails> seatDetailsList=new ArrayList<SeatDetails>();
			try {
				con = ConnectionUtill.connectdb();	
				Statement pstatement=con.createStatement();
				rs=pstatement.executeQuery(seatDetailsQuery);

				while(rs.next()) {
					bookTickets=tickedDao.findBookedTicketsObjectDetails(rs.getString(1));
					SeatDetails seatDetails=new SeatDetails(bookTickets,rs.getInt(4),rs.getString(5));
					seatDetailsList.add(seatDetails);
				}
				
				return seatDetailsList;
			} catch (ClassNotFoundException e) {
				System.out.println(e.getMessage());
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			return seatDetailsList;
	}
	
	
	public List<String> getSeatNoListUsingTicketNo(String ticketNo) {
		String seatDetailsQuery="select seat_no from seat_details where ticket_NO=?";
		
		Connection con;
	   	ResultSet rs = null;
	   	List<String> seatList=new ArrayList<String>();
			try {
				con = ConnectionUtill.connectdb();	
				PreparedStatement pstatement=con.prepareStatement(seatDetailsQuery);
				pstatement.setString(1, ticketNo);
				rs=pstatement.executeQuery();
				
				while(rs.next()) {
					seatList.add(rs.getString(1));
				}
				return seatList;
			} catch (ClassNotFoundException e) {
				System.out.println(e.getMessage());
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			return seatList;
	}
	
	
	public List<SeatDetails> getSeatDetailsUsingTicketNo(String ticketNo) {
		String seatDetailsQuery="select ticket_no,user_id,bus_id,seat_no,seat_status from seat_details where ticket_NO=?";
		Connection con;
		BookedTickets bookTickets=null;
	   	ResultSet rs = null;
	   	List<SeatDetails> seatDetailsList=new ArrayList<SeatDetails>();
			try {
				con = ConnectionUtill.connectdb();	
				PreparedStatement pstatement=con.prepareStatement(seatDetailsQuery);
				pstatement.setString(1, ticketNo);
				rs=pstatement.executeQuery();
				
				while(rs.next()) {
					bookTickets=tickedDao.findBookedTicketsObjectDetails(rs.getString(1));
					SeatDetails seatDetails=new SeatDetails(bookTickets,rs.getInt(4),rs.getString(5));
					seatDetailsList.add(seatDetails);
				}
				return seatDetailsList;
			} catch (ClassNotFoundException e) {
				System.out.println(e.getMessage());
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			return seatDetailsList;
	}
	

}
