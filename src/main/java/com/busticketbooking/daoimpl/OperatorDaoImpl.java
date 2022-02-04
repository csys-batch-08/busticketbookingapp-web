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
		Connection con = null;
		PreparedStatement pstatement=null;
		try {
			con = ConnectionUtill.connectdb();
			pstatement = con.prepareStatement(insertbus);

			pstatement.setString(1, OperatorModel.getOperatorName());
			pstatement.setString(2, OperatorModel.getOperatorEmail());
			pstatement.setLong(3, OperatorModel.getOperatorContact());
			pstatement.setInt(4, OperatorModel.getOperatorAge());
			
			result = pstatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con);
		}
		return result>0;
	} 
	
	
   public boolean updateOperator (Operator operatorModel) {
    	
    	String operatorUpdate="update bus_operators set operator_name=?, operator_email=?, operator_contact=?, operator_age=? where operator_id=?";
    	
    	Connection con = null;
    	PreparedStatement pstatement=null;
    	int result=0;
		try {
			con = ConnectionUtill.connectdb();
			pstatement=con.prepareStatement(operatorUpdate);
			
			pstatement.setString(1,operatorModel.getOperatorName());
			pstatement.setString(2, operatorModel.getOperatorEmail());
			pstatement.setLong(3, operatorModel.getOperatorContact());
			pstatement.setInt(4, operatorModel.getOperatorAge());
			pstatement.setInt(5, operatorModel.getOperatorId());
			
			result=pstatement.executeUpdate();
			pstatement.executeUpdate("commit");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con);
		}
		return result>0;
    }
   
   
   
   public boolean deleteOperator (int operatorId) {
		
		String operatorDelete="update bus_operators set operator_status=? where operator_id=? ";
		String commitQuery="commit";
		Connection con = null;
		PreparedStatement pstatement=null;
		int result=0;
		
		try {
			con = ConnectionUtill.connectdb();
			pstatement=con.prepareStatement(operatorDelete);
			
			pstatement.setString(1, "inactive");
			pstatement.setInt(2, operatorId);
			
			result=pstatement.executeUpdate();
			pstatement.executeQuery(commitQuery);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con);
		}
	return result>0;	
	}
   
   
   public List<Operator> viewOperator(){
   	
   	String operatorView="select operator_id,operator_name,operator_email,operator_contact,operator_age,operator_status from bus_operators";
   	
   	Connection con=null;
   	PreparedStatement pstatement=null;
   	ResultSet rs = null;
   	List<Operator> operatorList=new ArrayList<Operator>();
		try {
			con = ConnectionUtill.connectdb();	
			pstatement=con.prepareStatement(operatorView);
			rs=pstatement.executeQuery();
			
			while(rs.next()) {
				Operator operator=new Operator(rs.getInt("operator_id"),rs.getString("operator_name"),rs.getString("operator_email"),rs.getLong("operator_contact"),rs.getInt("operator_age"),rs.getString("operator_status"));
				operatorList.add(operator);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con,rs);
		}
		
		return operatorList;
		
   }
   
   
 
	public Operator getOperatorById(int operatorId) {
		
		String getOperator ="select operator_id,operator_name,operator_email,operator_contact,operator_age,operator_status from bus_operators where operator_id=?";
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
				 operatormodel=new Operator(rs.getInt("operator_id"),rs.getString("operator_name"),rs.getString("operator_email"),rs.getLong("operator_contact"),rs.getInt("operator_age"),rs.getString("operator_status"));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtill.closeStatement(pstatement, con,rs);
		}
		
		 return operatormodel;

	}
}
