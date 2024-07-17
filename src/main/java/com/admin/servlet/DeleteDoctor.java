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
@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		DoctorDao dao = new DoctorDao(DbConnect.myConnection());
		HttpSession session = req.getSession();
		
		if(dao.DeleteDoctor(id)) {
			
			session.setAttribute("Msg", "Doctor Delete Succefully");
			resp.sendRedirect("admin/doctor.jsp");
		}else {
			session.setAttribute("error", "Doctor not Delete");
			resp.sendRedirect("admin/doctor.jsp");
		}
	}
	
	

}
