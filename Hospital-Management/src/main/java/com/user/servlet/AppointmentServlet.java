package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/add_appointment")
public class AppointmentServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId=Integer.parseInt(req.getParameter("userid"));
		String fullName=req.getParameter("fullname");
		String gender=req.getParameter("gender");
		String age=req.getParameter("age");
		String appoint_date=req.getParameter("appoint_date");
		String email=req.getParameter("email");
		String phno=req.getParameter("phno");
		String diseases=req.getParameter("diseases");
		int doctor_id=Integer.parseInt(req.getParameter("doct"));
		String address=req.getParameter("address");
		
		Appointment ap=new Appointment(userId, fullName, gender, age, appoint_date, email, phno, diseases, doctor_id, address, "Pending");
		AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
		boolean f=dao.addAppointment(ap);
		HttpSession session=req.getSession();
		
		if(f)
		{
			session.setAttribute("sucMsg", "Appointment successfull");
			resp.sendRedirect("user_appointment.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("user_appointment.jsp");
			
		}
	}

}
