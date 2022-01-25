package com.busticketbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.busticketbooking.connection.ConnectionUtill;
import com.busticketbooking.dao.OperatorDAO;
import com.busticketbooking.model.Operator;
import com.busticketbooking.model.User;


public class OperatorDaoImpl implements OperatorDAO{

	public boolean insertOperator(Operator OperatorModel) {
		String insertbus = "insert into bus_operators (OPERATOR_NAME,OPERATOR_EMAIL,OPERATOR_CONTACT, OPERATOR_AGE) values (?,?,?,?)";
		int result=0;
		try {
			Connection con = ConnectionUtill.connectdb();
			PreparedStatement pstatement = con.prepareStatement(insertbus);

			pstatement.setString(1, OperatorModel.getOperatorName());
			pstatement.setString(2, OperatorModel.getOperatorEmail());
			pstatement.setLong(3, OperatorModel.getOperatorContact());
			pstatement.setInt(4, OperatorModel.getOperatorAge());
			

			result = pstatement.executeUpdate();
			pstatement.close();
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result>0;
	} 
	
	
   public boolean updateOperator (Operator OperatorModel) {
    	
    	String operatorUpdate="update bus_operators set operator_name=?, operator_email=?, operator_contact=?, operator_age=? where operator_id='"+OperatorModel.getOperatorId()+"'";
    	
    	Connection con;
    	int result=0;
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement=con.prepareStatement(operatorUpdate);
			
			pstatement.setString(1,OperatorModel.getOperatorName());
			pstatement.setString(2, OperatorModel.getOperatorEmail());
			pstatement.setLong(3, OperatorModel.getOperatorContact());
			pstatement.setInt(4, OperatorModel.getOperatorAge());
			
			result=pstatement.executeUpdate();
			if(result==1) {
			System.out.println("for "+OperatorModel.getOperatorId()+ "profile is updated !!");
			pstatement.close();
			con.close();
			}
			else {
				System.out.println("BusOperator updation failed");
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result>0;
    }
   
   
   
   public boolean deleteOperator (int operatorId) {
		
	   String inactive="InActive";
		String operatorDelete="update bus_operators set operator_status='"+inactive+"' where operator_id=?";
		String commitQuery="commit";
		Connection con;
		int result=0;
		
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement=con.prepareStatement(operatorDelete);
			
			pstatement.setInt(1, operatorId);
			result=pstatement.executeUpdate();
			pstatement.executeQuery(commitQuery);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	return result>0;	
	}
   
   
   public List<Operator> viewOperator(){
   	
   	String operatorView="select * from bus_operators";
   	
   	Connection con;
   	ResultSet rs = null;
   	List<Operator> operatorList=new ArrayList<Operator>();
		try {
			con = ConnectionUtill.connectdb();	
			Statement pstatement=con.createStatement();
			rs=pstatement.executeQuery(operatorView);
			
			while(rs.next()) {
				Operator operator=new Operator(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getLong(4),rs.getInt(5));
				operatorList.add(operator);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return operatorList;
		
   }
   
   
 
	public Operator getOperatorById(int operatorId) {
		
		String getOperator ="select * from bus_operators where operator_id=?";
		Connection con = null;
		PreparedStatement pstatement = null;
		Operator operatormodel=null;
		ResultSet rs=null;
		 try {
			con = ConnectionUtill.connectdb();
			 pstatement = con.prepareStatement(getOperator);
			 pstatement.setInt(1, operatorId);
			rs = pstatement.executeQuery();
			 if (rs.next()) {
				 operatormodel=new Operator(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getLong(4),rs.getInt(5));
				con.close();
				pstatement.close();
				}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		 return operatormodel;

	}
}
