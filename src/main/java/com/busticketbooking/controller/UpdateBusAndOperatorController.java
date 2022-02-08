package com.busticketbooking.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.model.Bus;

@WebServlet("/busAndOperatorPage")
public class UpdateBusAndOperatorController extends HttpServlet {
	BusDaoImpl busDao = new BusDaoImpl();

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {

		HttpSession session = req.getSession();
		Bus busModel = (Bus) session.getAttribute("BusObject");
		int busNo = 0;
		int operatorId = 0;
		try {
			busNo = Integer.parseInt(req.getParameter("busNo"));
			operatorId = Integer.parseInt(req.getParameter("operatorId"));
		} catch (NumberFormatException e1) {
			e1.printStackTrace();
		}
		busModel.setBusNo(busNo);
		busModel.setOperatorId(operatorId);
		boolean busUpdateFlag = busDao.updateBusNoAndOperator(busModel);

		if (busUpdateFlag) {
			try {
				List<Bus> busList = busDao.viewAllBus();
				req.setAttribute("BusListAdmin", busList);
				RequestDispatcher rd = req.getRequestDispatcher("busList.jsp?updateBus=updated");
				rd.forward(req, res);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}
	}
}
