<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.db.DBConnect"%>
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
	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>
		<c:if test="${not empty sucMsg }">
			<p class="text-center text-success fs-3" role="alert">${sucMsg }</p>
			<c:remove var="sucMsg" scope="session" />
		</c:if>

		<c:if test="${not empty errorMsg }">
			<p class="text-center text-danger fs-3">${errorMsg }</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>

		<%
		AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
		DoctorDao dao1=new DoctorDao(DBConnect.getConn());
		SpecialistDao dao2=new SpecialistDao(DBConnect.getConn());
		UserDao dao3=new UserDao(DBConnect.getConn());
		%>

		<div class="row">
			<div class="col-md-4 ">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor<br><%=dao1.countDoctor() %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							User<br><%=dao3.countUser() %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-regular fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment<br><%=dao.countAppointment() %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-2">
				<div class="card paint-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="fa-regular fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist<br><%=dao2.countSpecialist() %>
						</p>
					</div>
				</div>
			</div>

		</div>

	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Doctor Type</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addspecialist" method="post">
						<div class="form-group">
							<label>Enter Specialist Name</label><input type="text"
								name="specName" class="form-control">
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">ADD</button>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
</body>
</html>