package com.busticketbooking.controller;

import java.io.IOException;
import java.time.LocalDateTime;

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
			
			BusDaoImpl busDao=new BusDaoImpl();
			
			public void service(HttpServletRequest req,HttpServletResponse res) {
				HttpSession session=req.getSession();
				
				Bus busModel=(Bus) session.getAttribute("busModell");
				
				int busId=busModel.getBusId();
				System.out.println(busId);
				Bus bus=busDao.findBusDetailsUsingID(busId);
				
				int busNo=Integer.parseInt(req.getParameter("busNo"));
				System.out.println(busNo);
				int operatorId=Integer.parseInt(req.getParameter("operatorId"));
				System.out.println(operatorId);
				
				
				Bus bus1=new Bus(busId,busNo,operatorId,bus.getBusCategory(),bus.getFromCity(),bus.getToCity(),bus.getDeparture(),
						bus.getArrival(),bus.getSeaterFare(),bus.getTotalseat(),bus.getSeatStatus());
				boolean busUpdateFlag=busDao.updateBusNoAndOperator(bus1);
				
				if(busUpdateFlag) {
					try {
						session.setAttribute("AdminHome", "UpdateBusSession");
						req.getRequestDispatcher("BusList.jsp").forward(req,res);
					} catch (ServletException e) {
						System.out.println(e.getMessage());
					} catch (IOException e) {
						System.out.println(e.getMessage());
					}
				}
			}
}
