package com.busticketbooking.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.OperatorDaoImpl;
import com.busticketbooking.model.Operator;

@WebServlet("/UpdateOpertaorjsp")
public class UpdateOperatorController extends HttpServlet {
	
	OperatorDaoImpl operatorDao=new OperatorDaoImpl();
	
	public void service(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		Operator operatorModel=(Operator) session.getAttribute("operatorModel");	
		int operatorId=operatorModel.getOperatorId();
		String operatorName=req.getParameter("operatorName").toLowerCase();
		String operatorEmail=req.getParameter("operatorEmail").toLowerCase();
		long operatorContact=Long.parseLong(req.getParameter("operatorContact"));
		int operatorAge=Integer.parseInt(req.getParameter("operatorAge"));
		
		Operator operator= new Operator(operatorId,operatorName,
				operatorEmail, operatorContact, operatorAge);
		boolean updateOperatorFlag=operatorDao.updateOperator(operator);
		if(updateOperatorFlag) {
			try {
				session.setAttribute("AdminHome", "UpdateOperatorSession");    
				req.getRequestDispatcher("OperatorList.jsp?opertorId=0").forward(req,res);
				
			} catch (ServletException e) {
				System.out.println(e.getMessage());
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		
	}
}
