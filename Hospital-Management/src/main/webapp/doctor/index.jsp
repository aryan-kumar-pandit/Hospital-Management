<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/all_css.jsp"%>
</head>
<body>
<c:if test="${empty doctObj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>
	<%@include file="navbar.jsp"%>
	<h1>Doctor dashboard</h1>
</body>
</html>