package com.doctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.appointmentDao;
import com.db.DbConnect;
@WebServlet("/updateStaus")
public class UpdateStatus extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			int did=Integer.parseInt(req.getParameter("did"));
			String comment=req.getParameter("comment");
			HttpSession session=req.getSession();
			appointmentDao dao=new appointmentDao(DbConnect.myConnection());
			if(dao.updateComment(id, did, comment)) {
				session.setAttribute("Msg", "Comment Updated");
				resp.sendRedirect("Doctor/patient.jsp");
			}
			else {
				session.setAttribute("error", "Comment not Update");
				resp.sendRedirect("Doctor/patient.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
