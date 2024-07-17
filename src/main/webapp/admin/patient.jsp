<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.appointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="../Component/AllCss.jsp"%>
<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty adminObj }">
		<c:redirect url="../Admin_Login.jsp"></c:redirect>
	</c:if>


	<div class="col-md-12">
		<div class="card point-card">
			<div class="card-body ">
				<p class="text-center fs-3">Patient Details</p>


				<table class="table">
					<thead>
						<tr>
							<th class="col">Full Name</th>
							<th class="col">Gender</th>
							<th class="col">Age</th>
							<th class="col">Appointment</th>
							<th class="col">Email</th>
							<th class="col">Mob No</th>
							<th class="col">Diseases</th>
							<th class="col">Doctor Name</th>
							<th class="col">Address</th>
							<th class="col">Status</th>
			
						</tr>
					</thead>
					<tbody>
						<%
						appointmentDao dao = new appointmentDao(DbConnect.myConnection());
						DoctorDao dao2 = new DoctorDao(DbConnect.myConnection());
						List<Appointment> list = dao.getAllAppointment();
						for (Appointment ap : list) {
							Doctor d = dao2.getDoctorById(ap.getDoctorId());
						%>
						<tr>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppoinDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
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


</body>
</html>