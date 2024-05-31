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
import com.entity.Doctor;

@WebServlet("/add_doctor")
public class AddDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String fullName=req.getParameter("fullname");
			String dob=req.getParameter("dob");
			String qualification=req.getParameter("qualification");
			String specialist=req.getParameter("specialist");
			String email=req.getParameter("email");
			String mobNo=req.getParameter("mobno");
			String password=req.getParameter("password");
			
			Doctor d=new Doctor(fullName, dob, qualification, specialist, email, mobNo, password);
			DoctorDao dao=new DoctorDao(DBConnect.getConn());
			boolean f=dao.registerDoctor(d);
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("sucMsg","Doctor added successfully");
				resp.sendRedirect("admin/doctor.jsp");
			}
			else
			{
				session.setAttribute("errorMsg","server failed to add");
				resp.sendRedirect("admin/doctor.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
