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

@WebServlet("/UpdateOperatorjsp")
public class UpdateOperatorController extends HttpServlet {
	
	OperatorDaoImpl operatorDao=new OperatorDaoImpl();
	
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
		
		HttpSession session=req.getSession();
		 PrintWriter out=res.getWriter();
		 
		Operator operatorModel=(Operator) session.getAttribute("OperatorObject");	
		int operatorId=operatorModel.getOperatorId();
		
		String operatorName=req.getParameter("operatorName").toLowerCase();
		String operatorEmail=req.getParameter("operatorEmail").toLowerCase();
		long operatorContact=Long.parseLong(req.getParameter("operatorContact"));
		int operatorAge=Integer.parseInt(req.getParameter("operatorAge"));
		
		operatorModel.setOperatorName(operatorName);
		operatorModel.setOperatorEmail(operatorEmail);
		operatorModel.setOperatorContact(operatorContact);
		operatorModel.setOperatorAge(operatorAge);
		
		boolean updateOperatorFlag=operatorDao.updateOperator(operatorModel);
	
		if(updateOperatorFlag) {
			
			List<Operator> operatorList=operatorDao.viewOperator();
			req.setAttribute("OperatorListAdmin", operatorList);
			try {
			RequestDispatcher rd = req.getRequestDispatcher("operatorList.jsp?updateOperator=updated");
				rd.forward(req, res);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			} 
//			res.sendRedirect(operatorEmail);
//			out.println("<script type=\"text/javascript\">");
//			out.println("alert('Successfully Updated');");
//			out.println("location='OperatorList';");
//			out.println("</script>");
				
		}	
		
	}
}
