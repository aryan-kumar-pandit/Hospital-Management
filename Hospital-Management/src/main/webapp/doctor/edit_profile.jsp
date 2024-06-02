<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@page import="com.dao.SpecialistDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.db.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Change Password</title>
<%@ include file="../component/all_css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3)
}
</style>
</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 ">
				<div class="card paint-card">
					<p class="fs-4 text-center">Change Password</p>
					<c:if test="${not empty sucMsg }">
						<p class="text-center text-success fs-5">${sucMsg }</p>
						<c:remove var="sucMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-5">${errorMsg }</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doct_change_password" method="post">
							<div class="mb-3">
								<label class="form-label">Enter New Password</label><input
									required name="newpassword" type="password"
									class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Enter Old Password</label><input
									required name="oldpassword" type="password"
									class="form-control">
							</div>
							<input type="hidden" value="${doctObj.id }" name="id">

							<button type="submit" class="btn bg-primary text-white col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-5 offset-md-2 ">
				<div class="card paint-card">
				<p class="fs-4 text-center">Edit Details</p>
				<c:if test="${not empty sucMsgd }">
						<p class="text-center text-success fs-5">${sucMsgd }</p>
						<c:remove var="sucMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsgd }">
						<p class="text-center text-danger fs-5">${errorMsgd }</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../edit_doctor_profile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label><input type="text"
									required name="fullname" class="form-control" value="${doctObj.fullName }">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label><input type="date" required
									name="dob" class="form-control" value="${doctObj.dob }">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification </label><input
									type="text" required name="qualification" class="form-control" value="${doctObj.qualification }">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist </label><select required
									name="specialist" class="form-control">
									<option>${doctObj.specialist }</option>
									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option>
										<%=s.getSpecialistName()%>
									</option>
									<%
									}
									%>

								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email </label><input type="text"
									required name="email" class="form-control" readonly value="${doctObj.email }">
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile No </label><input type="text"
									required name="mobno" class="form-control" value="${doctObj.mobNo }">
							</div>
							<input type="hidden" value="${doctObj.id }" name="id">
							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>