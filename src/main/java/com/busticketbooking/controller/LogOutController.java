package com.busticketbooking.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogOutController extends HttpServlet{

	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		req.getSession().invalidate();
	    try {
			res.sendRedirect("index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
