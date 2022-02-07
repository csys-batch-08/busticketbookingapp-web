package com.busticketbooking.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busticketbooking.daoimpl.OperatorDaoImpl;
import com.busticketbooking.model.Operator;



@WebServlet("/addoperator")
public class AddOperatorController extends HttpServlet {
	
	OperatorDaoImpl operatorDao=new OperatorDaoImpl();
	
	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse res) {
				
		String operatorName=req.getParameter("operatorName").toLowerCase();
		String operatorEmail=req.getParameter("operatorEmail").toLowerCase();
		long operatorContact=Long.parseLong(req.getParameter("operatorContact"));
		int operatorAge=Integer.parseInt(req.getParameter("operatorAge"));
		
		Operator operatorModel= new Operator(operatorName,
				operatorEmail, operatorContact, operatorAge);
		boolean operatorInsertFlag=operatorDao.insertOperator(operatorModel);
		if(operatorInsertFlag) {
			try {
				res.sendRedirect("addOperator.jsp?infomsg=successfully added");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
