<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.appointmentDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor</title>
<%@include file="../Component/AllCss.jsp"%>
<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty docObj }">
		<c:redirect url="../Doctor_Login.jsp"></c:redirect>
	</c:if>
	<div class="container p-3">

		<div class="col-md-6 offset-md-3">
			<div class="card point-card">
				<div class="card-body">
					<p class="fs-4 text-center">Patient Comment</p>


					 <c:if test="${not empty Msg }">
						<p class="text-center text-success fs-3">${Msg}</p>
						<c:remove var="Msg" scope="session" />
					</c:if>

					<c:if test="${not empty error }">
						<p class="text-center text-danger fs-3">${error}</p>
						<c:remove var="error" scope="session" />
					</c:if> 
					<%
					int id = Integer.parseInt(request.getParameter("id"));
					appointmentDao dao = new appointmentDao(DbConnect.myConnection());
					Appointment ap = dao.getAppointmentsById(id);
					%>
					<form action="../updateStaus" class="row" method="post">
						<div class="col-md-6">
							<label>Patient Name</label> <input readonly
								value="<%=ap.getFullName()%>" type="text" class="form-control">
						</div>

						<div class="col-md-6">
							<label>Age</label> <input readonly value="<%=ap.getAge()%>"
								type="text" class="form-control">
						</div>

						<div class="col-md-6">
							<label>Mob No</label> <input readonly value="<%=ap.getPhNo()%>"
								type="text" class="form-control">
						</div>
						<div class="col-md-6">
							<label>Diseases</label> <input readonly
								value="<%=ap.getDiseases()%>" type="text" class="form-control">
						</div>

						<div class="col-md-12">
							<br> <label>Comment</label>
							<textarea required name="comment" row="3" class="form-control"></textarea>
						</div>

						<input type="hidden" name="id" value="<%=ap.getId()%>"> <input
							type="hidden" name="did" value="<%=ap.getDoctorId()%>">

						<button type="submit"
							class="btn btn-success offset-md-3 col-md-6 mt-3">Submit</button>
					</form>
				</div>
			</div>
		</div>

	</div>



</body>
</html>