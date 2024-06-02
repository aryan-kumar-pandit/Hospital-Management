<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="../component/all_css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3)
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4 fw-bold text">Patient Details</p>
						<c:if test="${not empty sucMsg }">
							<p class="text-center text-success fs-5">${sucMsg }</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg }</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile No</th>
									<th scope="col">Disease</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								Doctor d = (Doctor) session.getAttribute("doctObj");
								AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
								List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
								for (Appointment ap : list) {
								%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhno()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=ap.getStatus()%></td>
									<td>
									<%
									if("Pending".equals(ap.getStatus()))
									{%>
										<a href="comment.jsp?id=<%=ap.getId()%>"
										class="btn btn-sm btn-success">Comment</a>
									<%}
									else {%>
										<a href="#"
										class="btn btn-sm btn-success disabled">Comment</a>
									<%}
									%>
									
									</td>
									
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