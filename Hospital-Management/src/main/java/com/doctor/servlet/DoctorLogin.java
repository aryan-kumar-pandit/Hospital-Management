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
import com.entity.Doctor;
import com.entity.User;

@WebServlet("/doctorlogin")
public class DoctorLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			HttpSession session = req.getSession();

			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			Doctor doc = dao.login(email, password);
			if (doc != null) {
				session.setAttribute("doctObj", doc);
				resp.sendRedirect("doctor/index.jsp");
			} else {
				session.setAttribute("errorMsg", "invalid Doctor");
				resp.sendRedirect("doctor_login.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
