package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.appointmentDao;
import com.db.DbConnect;
import com.entity.Appointment;
@WebServlet("/appAppointment")
public class appointmentServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 	int  userId = Integer.parseInt(req.getParameter("userid"));
	        String fullName = req.getParameter("fullname");
	        String gender = req.getParameter("gender");
	        String age = req.getParameter("age");
	        String appoinDate = req.getParameter("appoint_date");
	        String email = req.getParameter("email");
	        String phNo = req.getParameter("phno");
	        String diseases = req.getParameter("diseases");
	        int doctorId = Integer.parseInt(req.getParameter("doct"));
	        String address = req.getParameter("address");
	        String status = req.getParameter("status");

	      
	        Appointment ap=new Appointment(userId, fullName, gender, age, appoinDate, email, phNo, diseases,
	        		doctorId, address, "Pending");
	        appointmentDao dao=new appointmentDao(DbConnect.myConnection());
	        
	        HttpSession session=req.getSession();
	        System.out.println("servlet test");
	        if(dao.addAppointment(ap)) {
	        	session.setAttribute("Msg","Appointment Booked");
				resp.sendRedirect("user_appointment.jsp");
			} else {
				session.setAttribute("error", "Something wrongr");
				resp.sendRedirect("user_appointment.jsp");
	        
			}     
	}
	
	
}
