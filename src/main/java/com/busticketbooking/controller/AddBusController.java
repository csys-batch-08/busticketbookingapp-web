package com.busticketbooking.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.model.Bus;



@WebServlet("/addbus")
public class AddBusController extends HttpServlet {

	DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
	BusDaoImpl busDao=new BusDaoImpl();
	
	
	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();

		String busCategory=req.getParameter("busCategory").toLowerCase();
		String fromCity=req.getParameter("fromCity").toLowerCase();
		String toCity=req.getParameter("toCity").toLowerCase();
		LocalDateTime departure=LocalDateTime.parse(req.getParameter("departure"));
		LocalDateTime arrival=LocalDateTime.parse(req.getParameter("arrival"));
		int seaterFare=Integer.parseInt(req.getParameter("seaterFare"));
		int totalSeat=Integer.parseInt(req.getParameter("totalSeat"));
		String status=req.getParameter("seatStatus").toLowerCase();
		
		Bus busmodel = new Bus(0,0,0,busCategory, fromCity, toCity,
				departure, arrival, seaterFare, totalSeat,status);
		boolean busInsertFlag=busDao.insertBus(busmodel);
				
		if(busInsertFlag) {
			try {
				session.setAttribute("AdminHome", "AddBusSession");
				req.getRequestDispatcher("AddBus.jsp").forward(req,res);
			} catch (ServletException e) {
				System.out.println(e.getMessage());
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		
		
		
	}
}
