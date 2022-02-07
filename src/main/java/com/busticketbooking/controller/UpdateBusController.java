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

@WebServlet("/updateBusPage")
public class UpdateBusController extends HttpServlet {

	BusDaoImpl busDao = new BusDaoImpl();

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {

		HttpSession session = req.getSession();
		Bus busModel = (Bus) session.getAttribute("BusObject");
		String busCategory = req.getParameter("busCategory").toLowerCase();
		String fromCity = req.getParameter("fromCity").toLowerCase();
		String toCity = req.getParameter("toCity").toLowerCase();
		LocalDateTime departure = LocalDateTime.parse(req.getParameter("departure"));
		LocalDateTime arrival = LocalDateTime.parse(req.getParameter("arrival"));
		int seaterFare = Integer.parseInt(req.getParameter("seaterFare"));
		int totalSeat = Integer.parseInt(req.getParameter("totalSeat"));
		String status = req.getParameter("seatStatus");

		busModel.setBusCategory(busCategory);
		busModel.setFromCity(fromCity);
		busModel.setToCity(toCity);
		busModel.setDeparture(departure);
		busModel.setArrival(arrival);
		busModel.setSeaterFare(seaterFare);
		busModel.setTotalseat(totalSeat);
		busModel.setSeatStatus(status);
		boolean busUpdateFlag = busDao.updateBus(busModel);
		if (busUpdateFlag) {
			try {
				List<Bus> busList = busDao.viewAllBus();
				req.setAttribute("BusListAdmin", busList);
				RequestDispatcher rd = req.getRequestDispatcher("busList.jsp?infomsg=Updated");
				rd.forward(req, res);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}
	}
}
