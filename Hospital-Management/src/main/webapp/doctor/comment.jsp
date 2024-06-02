<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Appointment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor's Comment</title>
<%@include file="../component/all_css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3)
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
		url("../img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Comment</p>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
						Appointment ap = dao.getAppointmentById(id);
						%>

						<form class="row" action="../update_status" method="post">
							<div class="col-md-6">
								<label class="form-label">Patient Name</label><input type="text"
									readonly value="<%=ap.getFullName()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label class="form-label">Age</label><input type="text" readonly
									value="<%=ap.getAge()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label class="form-label">Mob No</label><input
									type="text" readonly value="<%=ap.getPhno()%>"
									class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label class="form-label">Diseases</label><input
									type="text" readonly value="<%=ap.getDiseases()%>"
									class="form-control">
							</div>

							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea required name="comm" rows="3" cols=""
									class="form-control"></textarea>
							</div>
							<input type="hidden" name="id" value="<%=ap.getId()%>">
							<input type="hidden" name="did" value="<%=ap.getDoctorId()%>">
							<button type="submit" class="mt-3 btn btn-primary col-md-12">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>