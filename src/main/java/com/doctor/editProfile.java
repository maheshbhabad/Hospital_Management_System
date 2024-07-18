package com.doctor;

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
@WebServlet("/editDoctorProfile")
public class editProfile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String spec = req.getParameter("spec");
		
			String mobno = req.getParameter("mobno");
			
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			Doctor d = new Doctor(id,fullName, dob, qualification, spec,"", mobno,"");
			
			DoctorDao dao= new DoctorDao(DbConnect.myConnection());
			HttpSession session = req.getSession();
			
			if(dao.editDoctorProfile(d)) {
				Doctor updateDoctor = dao.getDoctorById(id);
				session.setAttribute("Msg", "Doctor Update Succefully");
				session.setAttribute("docObj", updateDoctor);
				resp.sendRedirect("Doctor/edit_Profile.jsp");
				
			}else {
				session.setAttribute("error", "Something wrong");
				resp.sendRedirect("Doctor/edit_Profile.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
