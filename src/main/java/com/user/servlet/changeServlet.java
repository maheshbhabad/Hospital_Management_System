package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Userdao;
import com.db.DbConnect;
@WebServlet("/changePassword")
public class changeServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid = Integer.parseInt(req.getParameter("uid"));
		String oldpassword = req.getParameter("oldpassword");
		String newpassword = req.getParameter("newpassword");
		
		Userdao dao=new Userdao(DbConnect.myConnection());
		HttpSession session= req.getSession();
		
		
		
		if(dao.checkOldPass(uid, oldpassword)) {
			if(dao.changePass(uid, newpassword)){
				session.setAttribute("Msg","PassWord Change");
				resp.sendRedirect("Change_Password.jsp");
			}
			else {
				session.setAttribute("error","Incorrect PassWord");

				resp.sendRedirect("Change_Password.jsp");
			}
		}else {
			session.setAttribute("error","Incorrect PassWord");
			resp.sendRedirect("Change_Password.jsp");
		}

		
	}
	

}
