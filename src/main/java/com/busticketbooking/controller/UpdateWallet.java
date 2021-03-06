package com.busticketbooking.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.model.User;

@WebServlet("/WalletUpdate")
public class UpdateWallet extends HttpServlet {

	UserDaoImpl userDao = new UserDaoImpl();

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

		HttpSession session = req.getSession();
		User userModel = (User) session.getAttribute("userModel");
		int amountEntered = 0;
		try {
			amountEntered = Integer.parseInt(req.getParameter("amountentered"));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		double totalAmount = amountEntered + userModel.getUserWallet();
		userModel.setUserWallet(totalAmount);
		boolean walletUpdateFlag = userDao.updateWallet(totalAmount, userModel.getUserContact());
		if (walletUpdateFlag) {
			try {
				res.sendRedirect("updateWallet.jsp?recharged=success");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
