package com.busticketbooking.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
	
	
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
		
		PrintWriter out=res.getWriter();

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

			res.sendRedirect("addBus.jsp?infomsg=successfully added");
			
//			out.println("<script type=\"text/javascript\">");
//			out.println("alert('Successfully Added');");
//			out.println("location='addBus.jsp';");
//			out.println("</script>");
		}
	}
}
