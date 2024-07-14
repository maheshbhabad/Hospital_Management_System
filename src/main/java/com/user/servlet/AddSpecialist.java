package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DbConnect;
@WebServlet("/addSpecial")
public class AddSpecialist extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specName = req.getParameter("specName");
		
		SpecialistDao dao=new SpecialistDao(DbConnect.myConnection());
		boolean f=dao.addSpecialist(specName);
		
		HttpSession session= req.getSession();
		
		if (f) {
			session.setAttribute("Msg","Specialist Added");
			resp.sendRedirect("admin/home.jsp");
		} else {
			session.setAttribute("error", "Something wrong on server");
			resp.sendRedirect("admin/home.jsp");
	}
}
}

