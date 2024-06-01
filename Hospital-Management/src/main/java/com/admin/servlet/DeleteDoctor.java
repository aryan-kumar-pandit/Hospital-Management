package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;

@WebServlet("/delete_doctor")
public class DeleteDoctor extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));

		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		boolean f = dao.deleteDoctor(id);
		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("sucMsg", "Doctor deleted successfully");
			resp.sendRedirect("admin/view_doctor.jsp");
		} else {
			session.setAttribute("errorMsg", "server failed to delete");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
	}
}
