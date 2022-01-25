package com.busticketbooking.daoimpl;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.time.ZonedDateTime;

import com.busticketbooking.connection.ConnectionUtill;
import com.busticketbooking.dao.UserDAO;
import com.busticketbooking.model.User;

public class UserDaoImpl implements UserDAO {

	
	public User loginUser(long contact) {

		String userLogin = "select user_id,user_name,user_dob,user_email,user_contact,user_gender,user_password,user_wallet from user_details where user_contact=?";
		Connection con;
		User userModel = null;
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement = con.prepareStatement(userLogin);
			pstatement.setLong(1, contact);
			ResultSet rs = pstatement.executeQuery();

			rs.next();
			userModel = new User(rs.getInt(1), rs.getString(2), rs.getDate(3).toLocalDate(), rs.getString(4), rs.getLong(5),
					rs.getString(6), rs.getString(7), rs.getDouble(8));
			con.close();
			pstatement.close();
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return userModel;
	}
	

	public boolean checkUser(long contact) {

		String userLogin = "select user_id from user_details where user_contact=? and user_status='active'";
		Connection con;
		boolean checkUserFlag = true;
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement = con.prepareStatement(userLogin);
			pstatement.setLong(1, contact);
			int i = pstatement.executeUpdate();
			if (i > 0) {
				checkUserFlag = true;
			} else {
				checkUserFlag = false;
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			;
		}
		return checkUserFlag;
	}
	
	
	public boolean registrationUser(User userModel) {

		String insertUser = "insert into user_details (user_name,user_dob,user_email,user_contact,user_gender,user_password) values (?,?,?,?,?,?)";
		Connection con;
		int result =0;
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement = con.prepareStatement(insertUser);

			pstatement.setString(1, userModel.getUserName());
			pstatement.setDate(2, java.sql.Date.valueOf(userModel.getUserDOB()));
			pstatement.setString(3, userModel.getUserEmail());
			pstatement.setLong(4, userModel.getUserContact());
			pstatement.setString(5, userModel.getUserGender());
			pstatement.setString(6, userModel.getUserPassword());

			result	= pstatement.executeUpdate();
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		 return result>0;

	}

	public boolean updateUser(User userModel) {

		String userUpdate = "update user_details set user_name=?, user_dob=?, user_gender=?, user_password=? where user_contact=?";
		int result=0;
		Connection con;
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement = con.prepareStatement(userUpdate);

			pstatement.setString(1, userModel.getUserName());
			pstatement.setDate(2, java.sql.Date.valueOf(userModel.getUserDOB()));
			pstatement.setString(3, userModel.getUserGender());
			pstatement.setString(4, userModel.getUserPassword());
			pstatement.setLong(5, userModel.getUserContact());
			
			result=pstatement.executeUpdate();
			pstatement.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result>0;

	}
	

	// for Admin purpose to show all users
	public ResultSet viewUserDetails() {

		String userView = "select user_id,user_name,user_dob,user_email,user_contact,user_gender,user_password,user_wallet,user_status from user_details";

		Connection con;
		ResultSet rs = null;
//		List<User> userList = new ArrayList<User>();
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement = con.prepareStatement(userView);

			rs = pstatement.executeQuery();

//			while (rs.next()) {
//				User userModel = new User(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),
//						rs.getLong(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9));
//			}
			return rs;
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return rs;

		

	}

	public User getUserDetailsById(int userId) 
	{ 

		String getUser = "select user_id,user_name,user_dob,user_email,user_contact,user_gender,user_password,user_wallet from user_details where user_id=?";
		Connection con = null;
		PreparedStatement pstatement = null;
		User userModel = null;

		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(getUser);
			pstatement.setInt(1, userId);
			ResultSet rs = pstatement.executeQuery();

			if (rs.next()) {
				userModel = new User(rs.getInt(1), rs.getString(2),  rs.getDate(3).toLocalDate(), rs.getString(4), rs.getLong(5),
						rs.getString(6), rs.getString(7), rs.getDouble(8));
			}
			con.close();
			pstatement.close();
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return userModel;

	}
	
	public boolean updateWallet(double updatedWallet, long userContact) {
		String wallet = "update user_details set user_wallet=? where user_contact=?";

		Connection con;
		PreparedStatement pstatement;
		int result = 0;
		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(wallet);

			pstatement.setDouble(1, updatedWallet);
			pstatement.setLong(2, userContact);
			result = pstatement.executeUpdate();
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result > 0;

	}

	
	public int findUserAge(LocalDate DOB) {
		
	      Period period = Period.between(DOB, LocalDate.now());
	      
	      return period.getYears();
	}

}


