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
			
			BusDaoImpl busDao=new BusDaoImpl();
			
			@Override
			public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
				
				HttpSession session=req.getSession();
				 PrintWriter out=res.getWriter();
				 
				Bus busModel=(Bus) session.getAttribute("BusObject");
				
				int busId=busModel.getBusId();
				Bus bus=busDao.findBusDetailsUsingID(busId);
				
				int busNo=Integer.parseInt(req.getParameter("busNo"));
				int operatorId=Integer.parseInt(req.getParameter("operatorId"));
				
				busModel.setBusNo(busNo);
				busModel.setOperatorId(operatorId);
				
//				Bus bus1=new Bus(busId,busNo,operatorId,bus.getBusCategory(),bus.getFromCity(),bus.getToCity(),bus.getDeparture(),
//						bus.getArrival(),bus.getSeaterFare(),bus.getTotalseat(),bus.getSeatStatus());
				boolean busUpdateFlag=busDao.updateBusNoAndOperator(busModel);
				
				if(busUpdateFlag) {
					
					try {
						List<Bus> busList=busDao.viewAllBus();
						req.setAttribute("BusListAdmin", busList);
						RequestDispatcher rd = req.getRequestDispatcher("busList.jsp?updateBus=updated");
							rd.forward(req, res);
						} catch (ServletException | IOException e) {
							e.printStackTrace();
						} 
//					out.println("<script type=\"text/javascript\">");
//					out.println("alert('Successfully Updated');");
//					out.println("location='BusList';");
//					out.println("</script>");

				}
			}
}
