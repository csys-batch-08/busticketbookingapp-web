package com.busticketbooking.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busticketbooking.daoimpl.OperatorDaoImpl;

@WebServlet("/operatorDelete")
public class DeleteOperatorController extends HttpServlet{

	OperatorDaoImpl operatorDao=new OperatorDaoImpl();
	
	public void service(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("deleteoperaor");
		
		int operatorId=Integer.parseInt(req.getParameter("operatorId"));
		boolean deleteOperatorFlag=operatorDao.deleteOperator(operatorId);
		
		if(deleteOperatorFlag) {
			try {
				req.getRequestDispatcher("OperatorList.jsp").forward(req,res);
			} catch (ServletException e) {
				System.out.println(e.getMessage());
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
