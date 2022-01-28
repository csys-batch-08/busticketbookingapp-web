package com.busticketbooking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.OperatorDaoImpl;
import com.busticketbooking.model.Operator;

@WebServlet("/OperatorList")
public class OperatorListController extends HttpServlet{

	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) {
		
			    OperatorDaoImpl operatorDao=new OperatorDaoImpl();
			    List<Operator> operatorList=operatorDao.viewOperator();
	    
	    if(operatorList!=null) {
	    	try {
	    		req.setAttribute("OperatorListAdmin", operatorList);
	    		RequestDispatcher reqDispatcher=req.getRequestDispatcher("operatorList.jsp");
 	    		reqDispatcher.forward(req, res);
			} catch (IOException | ServletException e) {
				e.printStackTrace();
			}
	    }
	        
	        
		
	}
}
