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
		Connection con = null;
		PreparedStatement pstatement=null;
		ResultSet rs=null;
		Admin adminmodule=null;
		try {
			con = ConnectionUtill.connectdb();
			pstatement=con.prepareStatement(loginadmin);
			pstatement.setString(1, contact);
			rs=pstatement.executeQuery();
			
			rs.next() ;
				adminmodule=new Admin(rs.getString("admin_password"),rs.getString("admin_email"));
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			ConnectionUtill.closeStatement(pstatement,con, rs);
		}
		return adminmodule;
	}
	    
}
