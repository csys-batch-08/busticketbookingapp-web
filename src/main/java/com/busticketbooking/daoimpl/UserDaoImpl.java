package com.busticketbooking.daoimpl;

import java.sql.*;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

import com.busticketbooking.connection.ConnectionUtill;
import com.busticketbooking.dao.UserDAO;
import com.busticketbooking.model.User;

public class UserDaoImpl implements UserDAO {

	public User loginUser(long contact) {

		String userLogin = "select user_id,user_name,user_dob,user_email,user_contact,user_gender,"
				+ "user_password,user_wallet from user_details where user_contact=?";
		Connection con = null;
		PreparedStatement pstatement = null;
		ResultSet rs = null;
		User userModel = null;
		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(userLogin);
			pstatement.setLong(1, contact);
			rs = pstatement.executeQuery();

			rs.next();
			userModel = new User(rs.getInt("User_id"), rs.getString("User_name"), rs.getDate("User_dob").toLocalDate(),
					rs.getString("User_email"), rs.getLong("User_contact"), rs.getString("User_gender"),
					rs.getString("User_password"), rs.getDouble("User_wallet"));

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con, rs);
		}
		return userModel;
	}

	public boolean checkUser(long contact) {

		String userLogin = "select user_id from user_details where user_contact=? and user_status='active'";
		Connection con = null;
		PreparedStatement pstatement = null;
		boolean checkUserFlag = true;
		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(userLogin);
			pstatement.setLong(1, contact);
			int i = pstatement.executeUpdate();
			if (i > 0) {
				checkUserFlag = true;
			} else {
				checkUserFlag = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con);
		}
		return checkUserFlag;
	}

	public boolean registrationUser(User userModel) {

		String insertUser = "insert into user_details (user_name,user_dob,user_email,user_contact,"
				+ "user_gender,user_password) values (?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement pstatement = null;
		int result = 0;
		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(insertUser);

			pstatement.setString(1, userModel.getUserName());
			pstatement.setDate(2, java.sql.Date.valueOf(userModel.getUserDOB()));
			pstatement.setString(3, userModel.getUserEmail());
			pstatement.setLong(4, userModel.getUserContact());
			pstatement.setString(5, userModel.getUserGender());
			pstatement.setString(6, userModel.getUserPassword());

			result = pstatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con);
		}
		return result > 0;

	}

	public boolean updateUser(User userModel) {

		String userUpdate = "update user_details set user_name=?, user_dob=?, user_gender=?,"
				+ " user_password=? where user_contact=?";
		int result = 0;
		Connection con = null;
		PreparedStatement pstatement = null;
		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(userUpdate);

			pstatement.setString(1, userModel.getUserName());
			pstatement.setDate(2, java.sql.Date.valueOf(userModel.getUserDOB()));
			pstatement.setString(3, userModel.getUserGender());
			pstatement.setString(4, userModel.getUserPassword());
			pstatement.setLong(5, userModel.getUserContact());

			result = pstatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con);
		}
		return result > 0;

	}

	// for Admin purpose to show all users
	public List<User> viewUserDetails() {

		String userView = "select user_id,user_name,user_dob,user_email,user_contact,user_gender,"
				+ "user_password,user_wallet,user_status from user_details";

		Connection con = null;
		PreparedStatement pstatement = null;
		ResultSet rs = null;
		List<User> userList = new ArrayList<User>();
		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(userView);

			rs = pstatement.executeQuery();

			while (rs.next()) {
				User userModel = new User(rs.getInt("user_id"), rs.getString("user_name"),
						rs.getDate("user_dob").toLocalDate(), rs.getString("user_email"), rs.getLong("user_contact"),
						rs.getString("user_gender"), rs.getString("user_password"), rs.getDouble("user_wallet"));
				userList.add(userModel);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con, rs);
		}
		return userList;

	}

	public User getUserDetailsById(int userId) {

		String getUser = "select user_id,user_name,user_dob,user_email,user_contact,user_gender,"
				+ "user_password,user_wallet from user_details where user_id=?";
		Connection con = null;
		PreparedStatement pstatement = null;
		ResultSet rs = null;
		User userModel = null;

		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(getUser);
			pstatement.setInt(1, userId);
			rs = pstatement.executeQuery();

			if (rs.next()) {
				userModel = new User(rs.getInt("user_id"), rs.getString("user_name"),
						rs.getDate("user_dob").toLocalDate(), rs.getString("user_email"), rs.getLong("user_contact"),
						rs.getString("user_gender"), rs.getString("user_password"), rs.getDouble("user_wallet"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con, rs);
		}
		return userModel;

	}

	public boolean updateWallet(double updatedWallet, long userContact) {
		String wallet = "update user_details set user_wallet=? where user_contact=?";

		Connection con = null;
		PreparedStatement pstatement = null;
		int result = 0;
		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(wallet);

			pstatement.setDouble(1, updatedWallet);
			pstatement.setLong(2, userContact);
			result = pstatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con);
		}
		return result > 0;

	}

	public int findUserAge(LocalDate dateOfBirth) {

		Period period = Period.between(dateOfBirth, LocalDate.now());

		return period.getYears();
	}

}
