package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DbConnect;
import com.entity.Doctor;
@WebServlet("/adddoc")
public class AddDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");
			String password = req.getParameter("password");
			
			Doctor d = new Doctor(fullName, dob, qualification, spec, email, mobno, password);
			
			DoctorDao dao= new DoctorDao(DbConnect.myConnection());
			HttpSession session = req.getSession();
			
			if(dao.registerDoctor(d)) {
				session.setAttribute("Msg", "Doctor Added Succefully");
				resp.sendRedirect("admin/doctor.jsp");
				
			}else {
				session.setAttribute("error", "Invalid email & password");
				resp.sendRedirect("admin/doctor.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
