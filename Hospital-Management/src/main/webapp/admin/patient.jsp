<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.entity.Specialist"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Appointment"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Details</title>
<%@ include file="../component/all_css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3)
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-12">
				<div class="card card-paint">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Disease</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Address</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
								DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
								List<Appointment> list1 = dao.getAllAppointment();
								for (Appointment ap : list1) {
									Doctor d = dao2.getDoctorById(ap.getDoctorId());
								%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhno()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullName()%></td>
									<td><%=ap.getAddress()%></td>
									<td><%=ap.getStatus()%></td>
								</tr>

								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>