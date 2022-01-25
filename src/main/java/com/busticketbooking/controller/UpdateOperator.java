package com.busticketbooking.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.OperatorDaoImpl;
import com.busticketbooking.model.Operator;

@WebServlet("/OperatorUpdate")
public class UpdateOperator extends HttpServlet {

	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();
		
		int operatorId=Integer.parseInt(req.getParameter("operatorId")); 
     	OperatorDaoImpl operatorDao=new OperatorDaoImpl();
         Operator operatorModel=operatorDao.getOperatorById(operatorId);
         
         if(operatorModel!=null) {
        	 try {
        		 session.setAttribute("OperatorObject", operatorModel);
				res.sendRedirect("UpdateOperator.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
         }
		
	}
}
