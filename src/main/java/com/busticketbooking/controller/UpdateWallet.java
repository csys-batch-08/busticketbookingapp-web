package com.busticketbooking.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.model.User;

@WebServlet("/WalletUpdate")
public class UpdateWallet extends HttpServlet  {

	UserDaoImpl userDao=new UserDaoImpl();
	
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
		HttpSession session=req.getSession();
		
		User userModel=(User)session.getAttribute("userModel"); 
//	    User userModel1=userDao.getUserDetailsById(userModel.getUserId());
	    
	    int amountEntered=Integer.parseInt(req.getParameter("amountentered"));
	    double totalAmount=amountEntered+userModel.getUserWallet();
	    
	    userModel.setUserWallet(totalAmount);
	    
	    boolean walletUpdateFlag=userDao.updateWallet(totalAmount, userModel.getUserContact());
	    PrintWriter out=res.getWriter();
	    
	    if(walletUpdateFlag) {
//	    User userModel2=new User(userModel1.getUserId(),userModel1.getUserName(),userModel1.getUserDOB(),userModel1.getUserEmail(),
//	  		  userModel1.getUserContact(),userModel1.getUserGender(),userModel1.getUserPassword(),totalAmount);
//	    session.setAttribute("user", userModel2);
	    	out.println("<script type=\"text/javascript\">");
			out.println("alert('Successfully Updated');");
			out.println("location='updateWallet.jsp';");
			out.println("</script>");
	    }
	}
	
}
