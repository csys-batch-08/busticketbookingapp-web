package com.busticketbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.busticketbooking.connection.ConnectionUtill;
import com.busticketbooking.dao.AdminDAO;
import com.busticketbooking.model.Admin;
import com.busticketbooking.model.User;

public class AdminDaoImpl implements AdminDAO {

	public Admin adminLogin(String contact)  {
		
		String loginadmin="select admin_password,admin_email from admin_details where admin_email=?";
		Connection con;
		Admin adminmodule=null;
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement=con.prepareStatement(loginadmin);
			pstatement.setString(1, contact);
			ResultSet rs=pstatement.executeQuery();
			
			rs.next() ;
				adminmodule=new Admin(rs.getString(1),rs.getString(2));
			
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return adminmodule;
	}
	    
}
