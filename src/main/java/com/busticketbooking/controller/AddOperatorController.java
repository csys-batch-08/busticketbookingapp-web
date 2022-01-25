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
import com.busticketbooking.model.User;



@WebServlet("/addoperator")
public class AddOperatorController extends HttpServlet {
	
	OperatorDaoImpl operatorDao=new OperatorDaoImpl();
	
	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();
		String operatorName=req.getParameter("operatorName").toLowerCase();
		String operatorEmail=req.getParameter("operatorEmail").toLowerCase();
		long operatorContact=Long.parseLong(req.getParameter("operatorContact"));
		int operatorAge=Integer.parseInt(req.getParameter("operatorAge"));
		
		Operator operatorModel= new Operator(operatorName,
				operatorEmail, operatorContact, operatorAge);
		boolean operatorInsertFlag=operatorDao.insertOperator(operatorModel);
		if(operatorInsertFlag) {
			try {
				session.setAttribute("AdminHome", "AddOperatorSession");    
				req.getRequestDispatcher("AddOperator.jsp").forward(req,res);
				
			} catch (ServletException e) {
				System.out.println(e.getMessage());
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}

}
