package com.busticketbooking.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.model.User;

@WebServlet("/SearchBus")
public class SearchBusController extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		UserDaoImpl userDao = new UserDaoImpl();
		User userModel = (User) session.getAttribute("userModel");
		// to find users age by DOB
		int userAge = userDao.findUserAge(userModel.getUserDOB());
		BusDaoImpl busDao = new BusDaoImpl();
		List<String> locationList = busDao.getLocations();
		if (locationList != null) {
			try {
				req.setAttribute("LocationList", locationList);
				session.setAttribute("UserAge", userAge);
				session.setAttribute("userHome", "homeSession");
				RequestDispatcher reqDispatcher = req.getRequestDispatcher("searchBus.jsp");
				reqDispatcher.forward(req, res);
			} catch (IOException | ServletException e) {
				e.getStackTrace();
			}
		}

	}
}
