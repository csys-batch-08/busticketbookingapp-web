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
	
	BookedTicketsDaoImpl tickedDao=new BookedTicketsDaoImpl();

	public boolean insertSeat(SeatDetails seatDetails) {
		String seatInsert = "insert into seat_details (booking_id,user_id,bus_id,seat_no,seat_status) values (?,?,?,?,?)"; 
		
		Connection con = null;
		PreparedStatement pstatement=null;
		int result=0;
		
		try {
			con = ConnectionUtill.connectdb();
			pstatement=con.prepareStatement(seatInsert);
			
			pstatement.setInt(1, seatDetails.getBookedTickets().getBookingId());
			pstatement.setInt(2, seatDetails.getBookedTickets().getUserModel().getUserId());
			pstatement.setInt(3, seatDetails.getBookedTickets().getBusModel().getBusId());
			pstatement.setInt(4, seatDetails.getSeatNo());
			pstatement.setString(5, seatDetails.getStatus());
		
			result=pstatement.executeUpdate();
			
		} catch (SQLException e) {
			e.getMessage();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con);
		}
		return result>0;
	}
	
	public boolean ticketexist(int ticketCountEntered,String ticketRandomNumber,Bus bus,User user)  {
	Connection con = null;
	PreparedStatement pstatement=null;
	PreparedStatement pstatement1=null;
	boolean resultFlag=true;
	ResultSet rs = null;
	try {
		con = ConnectionUtill.connectdb();
		String query = "select ticket_no,user_id,bus_id,seat_no,seat_status from seat_details where seat_no=?  and bus_id=? and seat_status in 'booked'";
		String query1 = "insert into seat_details(ticket_no,user_id,bus_id,seat_no) values(?,?,?,?)";
		pstatement=con.prepareStatement(query);
		int busseat = bus.getTotalseat();
		int seatcount = 0;
		int seatno = 1;
		if(busseat >= 0) {
		while(seatcount < ticketCountEntered) {
		
			pstatement.setInt(1, seatno);
			pstatement.setInt(2, bus.getBusId());
			rs = pstatement.executeQuery();
			if(rs.next()) {
				
			}
			else {
				
				pstatement1=con.prepareStatement(query1);
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
			resultFlag=true;
		}}else {
			
			resultFlag=false;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		ConnectionUtill.closeStatement(pstatement, con, rs);
		ConnectionUtill.closeStatement(pstatement1, con);
	}
	return resultFlag;
	}
	
	
	public boolean cancelSeatDetails(String ticketNo)  {
		String seatCancel="delete from seat_details where ticket_no=?";
		
		Connection con = null;
		PreparedStatement pstatement=null;
		int result=0;
		try {
			con = ConnectionUtill.connectdb();
			pstatement=con.prepareStatement(seatCancel);
			
			pstatement.setString(1, ticketNo);
			result=pstatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con);
		}
		
		
		return result>0;
		
	}
	
	
	
	public List<SeatDetails> showSeatList() {
		String seatDetailsQuery="select ticket_no,user_id,bus_id,seat_no,seat_status from seat_details order by bus_id,seat_no";
		
		Connection con = null;
		BookedTickets bookTickets=null;
	   	ResultSet rs = null;
	   	PreparedStatement pstatement=null;
	   	List<SeatDetails> seatDetailsList=new ArrayList<>();
			try {
				con = ConnectionUtill.connectdb();	
				pstatement=con.prepareStatement(seatDetailsQuery);
				rs=pstatement.executeQuery();

				while(rs.next()) {
					bookTickets=tickedDao.findBookedTicketsObjectDetails(rs.getString("ticket_no"));
					SeatDetails seatDetails=new SeatDetails(bookTickets,rs.getInt("seat_no"),rs.getString("seat_status"));
					seatDetailsList.add(seatDetails);
				}
				
				return seatDetailsList;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectionUtill.closeStatement(pstatement, con, rs);
			}
			return seatDetailsList;
	}
	
	
	public List<String> getSeatNoListUsingTicketNo(String ticketNo) {
		String seatDetailsQuery="select seat_no from seat_details where ticket_NO=?";
		
		Connection con = null;
	   	ResultSet rs = null;
	   	PreparedStatement pstatement=null;
	   	List<String> seatList=new ArrayList<>();
			try {
				con = ConnectionUtill.connectdb();	
				pstatement=con.prepareStatement(seatDetailsQuery);
				pstatement.setString(1, ticketNo);
				rs=pstatement.executeQuery();
				
				while(rs.next()) {
					seatList.add(rs.getString(1));
				}
				return seatList;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectionUtill.closeStatement(pstatement, con, rs);
			}
			return seatList;
	}
	
	
	public List<SeatDetails> getSeatDetailsUsingTicketNo(String ticketNo) {
		String seatDetailsQuery="select ticket_no,seat_no,seat_status from seat_details where ticket_no=?";
		
		Connection con = null;
		BookedTickets bookTickets=null;
		PreparedStatement pstatement=null;
		ResultSet rs = null;
	   	List<SeatDetails> seatDetailsList=new ArrayList<>();
			try {
				con = ConnectionUtill.connectdb();	
				pstatement=con.prepareStatement(seatDetailsQuery);
				pstatement.setString(1, ticketNo);
				rs=pstatement.executeQuery();
				
				while(rs.next()) {
					bookTickets=tickedDao.findBookedTicketsObjectDetails(rs.getString(1));
					SeatDetails seatDetails=new SeatDetails(bookTickets,rs.getInt(2),rs.getString(3));
					seatDetailsList.add(seatDetails);
				}
				return seatDetailsList;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectionUtill.closeStatement(pstatement, con, rs);
			}
			return seatDetailsList;
	}
	

}
