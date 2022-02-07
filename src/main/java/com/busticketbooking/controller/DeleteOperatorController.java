package com.busticketbooking.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.busticketbooking.daoimpl.OperatorDaoImpl;
import com.busticketbooking.model.Operator;

@WebServlet("/operatorDelete")
public class DeleteOperatorController extends HttpServlet {
	OperatorDaoImpl operatorDao = new OperatorDaoImpl();

	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		int operatorId = Integer.parseInt(req.getParameter("operatorId"));
		boolean deleteOperatorFlag = operatorDao.deleteOperator(operatorId);
		if (deleteOperatorFlag) {
			try {
				List<Operator> operatorList = operatorDao.viewOperator();
				req.setAttribute("OperatorListAdmin", operatorList);
				RequestDispatcher reqDispatcher = req.getRequestDispatcher("operatorList.jsp?deleteOperator=deleted");
				reqDispatcher.forward(req, res);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}
	}
}
