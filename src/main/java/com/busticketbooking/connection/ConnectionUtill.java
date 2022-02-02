package com.busticketbooking.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionUtill {

     public static Connection connectdb() throws ClassNotFoundException, SQLException {
	      Class.forName("oracle.jdbc.driver.OracleDriver");
	      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
	
	      return con;
	
}
     
     public static void closeStatement(PreparedStatement pstmt, Connection con) {
 		try {
 			if (pstmt != null) {
 				pstmt.close();
 			}
 			if (con != null) {
 				con.close();
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 	}
 	
 	public static void closeStatement(Statement stmt, Connection con) {
 		try {
 			if (stmt != null) {
 				stmt.close();
 			}
 			if (con != null) {
 				con.close();
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 	}

 	public static void closeStatement(PreparedStatement pstmt, Connection con, ResultSet rs) {
 		try {
 			if (pstmt != null) {
 				pstmt.close();
 			}
 			if (con != null) {
 				con.close();
 			}
 			if(rs!=null){
 				rs.close();
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 	}
 

 	
 	public static void closeStatement(Statement stmt, Connection con,ResultSet rs) {
 		try {
 			if (stmt != null) {
 				stmt.close();
 			}
 			if (con != null) {
 				con.close();
 			}
 			if(rs!=null){
 				rs.close();
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 	}


}
