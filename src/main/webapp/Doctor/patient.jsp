<%@page import="com.entity.User"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.appointmentDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.user.*"%>
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


	<div class="col-md-12">
		<div class="card point-card">
			<div class="card-body ">
				<p class="text-center fs-3">Patient Details</p>
				<c:if test="${not empty Msg }">
					<p class="text-center text-success fs-5">${Msg}</p>
					<c:remove var="Msg" scope="session" />
				</c:if>

				<c:if test="${not empty error }">
					<p class="text-center text-danger fs-5">${error}</p>
					<c:remove var="error" scope="session" />
				</c:if>

				<table class="table">
					<thead>
						<tr>
							<th class="col">Full Name</th>
							<th class="col">Gender</th>
							<th class="col">Age</th>
							<th class="col">Appointment Date</th>
							<th class="col">Email</th>
							<th class="col">Diseases</th>
							<th class="col">Status</th>
							<th class="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						Doctor doctor = (Doctor) session.getAttribute("docObj");
						appointmentDao dao = new appointmentDao(DbConnect.myConnection());

						List<Appointment> list = dao.getAllAppointmentByDoctorLogin(doctor.getId());
						for (Appointment ap : list) {
						%>
						<tr>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppoinDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>
							<td><%=ap.getStatus()%></td>
							<td>
								<%
								if ("Pending".equals(ap.getStatus())) {
								%> <a
								href="comment.jsp?id=<%=ap.getId()%>"
								class="btn btn-success btn-sm">Comment</a> <%
 							} else {
							%><a href="" class="btn btn-success btn-sm disabled">Comment</a>
 							<% }
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

</body>
</html>