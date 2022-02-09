package com.busticketbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.busticketbooking.connection.ConnectionUtill;
import com.busticketbooking.dao.BookedTicketsDAO;
import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.Bus;
import com.busticketbooking.model.User;

public class BookedTicketsDaoImpl implements BookedTicketsDAO {

	BusDaoImpl busDao = new BusDaoImpl();
	UserDaoImpl userDao = new UserDaoImpl();
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd-mm-yyyy");
	DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("dd-MM-yyyy");

	public boolean insertBookedTickets(BookedTickets bookedTicketsModel) {
		String ticketsInsert = "insert into Booked_tickets (ticket_no,user_id,bus_id,departure_date,"
				+ "ticket_count,total_price,payment_status) values (?,?,?,?,?,?,?)";
		String updateWallet = "update user_details set user_wallet=? where user_id=?";

		Connection con = null;
		PreparedStatement pstatement = null;
		PreparedStatement pstatement1 = null;
		int result = 0;

		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(ticketsInsert);
			pstatement1 = con.prepareStatement(updateWallet);
			pstatement.setString(1, bookedTicketsModel.getTicketNo());
			pstatement.setInt(2, bookedTicketsModel.getUserModel().getUserId());
			pstatement.setInt(3, bookedTicketsModel.getBusModel().getBusId());
			Timestamp departureDateTime = Timestamp.valueOf(bookedTicketsModel.getBusModel().getDeparture());
			pstatement.setTimestamp(4, departureDateTime);
			pstatement.setInt(5, bookedTicketsModel.getTicketCount());
			pstatement.setDouble(6, bookedTicketsModel.getTotalPrice());
			pstatement.setString(7, bookedTicketsModel.getPaymentStatus());

			pstatement1.setDouble(1, bookedTicketsModel.getUserModel().getUserWallet());
			pstatement1.setInt(2, bookedTicketsModel.getUserModel().getUserId());

			result = pstatement.executeUpdate();
			result = pstatement1.executeUpdate();

		} catch (SQLException e) {
			e.getMessage();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con);
			ConnectionUtill.closeStatement(pstatement1, con);
		}
		return result > 0;
	}

	public int findBookingId(BookedTickets bookedTicketsModel) {

		String bookingIdFinder = "select booking_id from booked_tickets where user_id=? and "
				+ "to_timestamp(departure_date,'DD-MM-YYYY HH24:MI')=? ";
		Connection con = null;
		PreparedStatement pstatement = null;
		int bookingId = 0;
		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(bookingIdFinder);
			pstatement.setInt(1, bookedTicketsModel.getUserModel().getUserId());
			Timestamp depDateTime = Timestamp.valueOf(bookedTicketsModel.getDepartureDate());
			pstatement.setTimestamp(2, depDateTime);
			ResultSet rs = pstatement.executeQuery();
			if (rs.next()) {
				bookingId = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.getMessage();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con);
		}
		return bookingId;

	}

	// to show all booking for particular user
	public List<BookedTickets> getBookingDetailsForCurrentUser(User userModel) {
		String query = "select booking_id,ticket_no,user_id,bus_id,booking_date,departure_date,ticket_count,total_price,"
				+ "booking_status,payment_status from booked_tickets where user_id=? order by departure_date desc";

		Connection con = null;
		PreparedStatement pstatement = null;
		ResultSet rs = null;
		Bus busModel = null;
		User userModel1 = null;
		List<BookedTickets> bookingList = new ArrayList<>();

		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(query);
			pstatement.setInt(1, userModel.getUserId());
			rs = pstatement.executeQuery();

			while (rs.next()) {
				userModel1 = userDao.getUserDetailsById(rs.getInt("user_Id"));
				busModel = busDao.findBusDetailsUsingID(rs.getInt("bus_Id"));
				BookedTickets bookedTicketsModel = new BookedTickets(rs.getInt("booking_Id"), rs.getString("ticket_No"),
						userModel1, busModel, rs.getDate("booking_Date").toLocalDate(),
						rs.getTimestamp("departure_Date").toLocalDateTime(), rs.getInt("ticket_Count"),
						rs.getDouble("total_Price"), rs.getString("booking_Status"), rs.getString("payment_Status"));
				bookingList.add(bookedTicketsModel);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con, rs);
		}

		return bookingList;
	}

	// user for invoice to collect booked tickets full details by using booking id
	// or booking number
	public List<BookedTickets> findBookedTicketsDetails(String bookingId) {
		String findTicketDetails = "select booking_id,ticket_no,user_id,bus_id,booking_date,departure_date,"
				+ "ticket_count,total_price,booking_status,payment_status from booked_tickets where ticket_no=?";

		Connection con = null;
		PreparedStatement pstatement = null;
		ResultSet rs = null;
		Bus busModel = null;
		User userModel = null;
		List<BookedTickets> bookTickets = new ArrayList<>();
		BookedTickets bookedTicketsModel = null;
		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(findTicketDetails);
			pstatement.setString(1, bookingId);
			rs = pstatement.executeQuery();

			while (rs.next()) {

				userModel = userDao.getUserDetailsById(rs.getInt("user_ID"));
				busModel = busDao.findBusDetailsUsingID(rs.getInt("bus_ID"));
				bookedTicketsModel = new BookedTickets(rs.getInt("booking_ID"), rs.getString("ticket_NO"), userModel,
						busModel, rs.getDate("Booking_Date").toLocalDate(),
						rs.getTimestamp("Departure_Date").toLocalDateTime(), rs.getInt("Ticket_Count"),
						rs.getDouble("Total_Price"), rs.getString("Booking_Status"), rs.getString("Payment_Status"));
				bookTickets.add(bookedTicketsModel);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con, rs);
		}
		return bookTickets;
	}

	public boolean cancelTicket(String ticketNo) {
		String ticketCancel = "update booked_tickets set booking_status=? ,payment_status=? where ticket_no=?";
		int result = 0;
		Connection con = null;
		PreparedStatement pstatement = null;
		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(ticketCancel);
			pstatement.setString(1, "cancelled");
			pstatement.setString(2, "refunded");
			pstatement.setString(3, ticketNo);
			result = pstatement.executeUpdate();

		} catch (SQLException e) {
			e.getMessage();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con);
		}
		return result > 0;

	}

	public List<BookedTickets> showlistAdmin() {

		String showQuery = "select booking_id,ticket_no,user_id,bus_id,booking_date,departure_date,"
				+ "ticket_count,total_price,booking_status,payment_status from booked_tickets";

		Connection con = null;
		PreparedStatement pstatement = null;
		ResultSet rs = null;
		Bus busModel = null;
		User userModel = null;
		BookedTickets bookedTicketsModel = null;
		List<BookedTickets> bookingListAdmin = new ArrayList<>();

		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(showQuery);
			rs = pstatement.executeQuery();

			while (rs.next()) {
				userModel = userDao.getUserDetailsById(rs.getInt("user_id"));
				busModel = busDao.findBusDetailsUsingID(rs.getInt("bus_id"));
				bookedTicketsModel = new BookedTickets(rs.getInt("booking_id"), rs.getString("ticket_no"), userModel,
						busModel, rs.getDate("booking_date").toLocalDate(),
						rs.getTimestamp("departure_date").toLocalDateTime(), rs.getInt("ticket_count"),
						rs.getDouble("total_price"), rs.getString("booking_status"), rs.getString("payment_status"));
				bookingListAdmin.add(bookedTicketsModel);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con, rs);
		}

		return bookingListAdmin;
	}

	public BookedTickets findBookedTicketsObjectDetails(String bookingId) {
		String findTicketDetails = "select booking_id,ticket_no,user_id,bus_id,booking_date,departure_date,"
				+ "ticket_count,total_price,booking_status,payment_status from booked_tickets where ticket_no=?";

		Connection con = null;
		PreparedStatement pstatement = null;
		ResultSet rs = null;
		Bus busModel = null;
		User userModel = null;
		BookedTickets bookedTicketsModel = null;
		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(findTicketDetails);
			pstatement.setString(1, bookingId);
			rs = pstatement.executeQuery();

			while (rs.next()) {

				userModel = userDao.getUserDetailsById(rs.getInt("user_id"));
				busModel = busDao.findBusDetailsUsingID(rs.getInt("bus_id"));
				bookedTicketsModel = new BookedTickets(rs.getInt("booking_id"), rs.getString("ticket_no"), userModel,
						busModel, rs.getDate("booking_date").toLocalDate(),
						rs.getTimestamp("departure_date").toLocalDateTime(), rs.getInt("ticket_count"),
						rs.getDouble("total_price"), rs.getString("booking_status"), rs.getString("payment_status"));
			}
			return bookedTicketsModel;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con, rs);
		}
		return bookedTicketsModel;
	}

	public boolean dateChecking(String ticketNo, LocalDate departureDate) {
		String checkDate = "select departure_date from booked_tickets where ticket_no=? and "
				+ "to_date(?,'dd-MM-yyyy')>= to_date(sysdate,'dd-MM-yyyy')";

		Connection con = null;
		PreparedStatement pstatement = null;
		ResultSet rs = null;
		boolean resultFlag = false;
		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(checkDate);
			pstatement.setString(1, ticketNo);
			pstatement.setDate(2, java.sql.Date.valueOf(departureDate));
			rs = pstatement.executeQuery();

			if (rs.next()) {
				resultFlag = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con, rs);
		}
		return resultFlag;
	}
}
