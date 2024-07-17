package com.doctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.Userdao;
import com.db.DbConnect;
import com.entity.Doctor;
import com.entity.User;
@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();
		
		DoctorDao dao = new DoctorDao(DbConnect.myConnection());
		Doctor doc = dao.Login(email, password);
		
		if (doc!=null) {
			session.setAttribute("docObj", doc);
			resp.sendRedirect("Doctor/index.jsp");
		} else {
			session.setAttribute("error", "Invalid Email & password");
			resp.sendRedirect("Doctor_Login.jsp");
		
	}
	
}
}
