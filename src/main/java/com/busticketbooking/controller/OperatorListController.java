package com.busticketbooking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.OperatorDaoImpl;
import com.busticketbooking.model.Operator;

@WebServlet("/OperatorList")
public class OperatorListController extends HttpServlet{

	public void service(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		
			    OperatorDaoImpl operatorDao=new OperatorDaoImpl();
			    List<Operator> operatorList=operatorDao.viewOperator();
	    
	    if(operatorList!=null) {
	    	try {
	    		session.setAttribute("OperatorListAdmin", operatorList);
				res.sendRedirect("OperatorList.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
	    }
	        
	        
		
	}
}
