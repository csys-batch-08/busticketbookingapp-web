package com.busticketbooking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.OperatorDaoImpl;
import com.busticketbooking.model.Operator;

@WebServlet("/OperatorUpdate")
public class UpdateOperator extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		int operatorId = 0;
		try {
			operatorId = Integer.parseInt(req.getParameter("operatorId"));
		} catch (NumberFormatException e1) {
			e1.printStackTrace();
		}
		OperatorDaoImpl operatorDao = new OperatorDaoImpl();
		Operator operatorModel = operatorDao.getOperatorById(operatorId);
		if (operatorModel != null) {
			try {
				session.setAttribute("OperatorObject", operatorModel);
				RequestDispatcher reqDispatcher = req.getRequestDispatcher("updateOperator.jsp");
				reqDispatcher.forward(req, res);
			} catch (IOException | ServletException e) {
				e.printStackTrace();
			}
		}

	}
}
