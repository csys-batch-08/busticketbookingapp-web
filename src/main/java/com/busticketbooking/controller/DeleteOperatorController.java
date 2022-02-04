package com.busticketbooking.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/operatorDelete")
public class DeleteOperatorController extends HttpServlet{

	OperatorDaoImpl operatorDao=new OperatorDaoImpl();
	
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
		
		HttpSession session=req.getSession();
		
		int operatorId=Integer.parseInt(req.getParameter("operatorId"));
		
		boolean deleteOperatorFlag=operatorDao.deleteOperator(operatorId);
		
		PrintWriter out=res.getWriter();
		
		if(deleteOperatorFlag) {
			
			
    		try {
    			List<Operator> operatorList=operatorDao.viewOperator();
    			req.setAttribute("OperatorListAdmin", operatorList);
        		RequestDispatcher reqDispatcher=req.getRequestDispatcher("operatorList.jsp?deleteOperator=deleted");
				reqDispatcher.forward(req, res);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			} 
//			out.println("<script type=\"text/javascript\">");
//			out.println("alert('Successfully deleted');");
//			out.println("location='OperatorList';");
//			out.println("</script>");
		}
	}
}
