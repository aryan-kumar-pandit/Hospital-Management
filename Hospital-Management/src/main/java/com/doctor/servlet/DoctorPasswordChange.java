package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;

@WebServlet("/doct_change_password")
public class DoctorPasswordChange extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uid = Integer.parseInt(req.getParameter("id"));
		String oldPassword = req.getParameter("oldpassword");
		String newPassword = req.getParameter("newpassword");
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.checkOldPassword(uid, oldPassword)) {
			if (dao.changePassword(uid, newPassword)) {
				session.setAttribute("sucMsg", "password changed sucessfully");
				resp.sendRedirect("doctor/edit_profile.jsp");
			} else {
				session.setAttribute("errorMsg", "something wrong on server");
				resp.sendRedirect("doctor/edit_profile.jsp");

			}
		} else {
			session.setAttribute("errorMsg", "Password mismatch");
			resp.sendRedirect("doctor/edit_profile.jsp");
		}
	}


}
