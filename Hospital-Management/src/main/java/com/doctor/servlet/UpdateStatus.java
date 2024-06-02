package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBConnect;

@WebServlet("/update_status")
public class UpdateStatus extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			String comment=req.getParameter("comm");
			int id=Integer.parseInt(req.getParameter("id"));
			int doctor_id=Integer.parseInt(req.getParameter("did"));
			AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
			boolean f=dao.updateComment(id, doctor_id, comment);
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("sucMsg", "Comment Updated");
				resp.sendRedirect("doctor/patient.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "something wrong on server");
				resp.sendRedirect("doctor/patient.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
