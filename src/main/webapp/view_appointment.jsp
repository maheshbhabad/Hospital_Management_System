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
<title>View Appointment</title>
<%@include file="Component/AllCss.jsp"%>
<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<div class="container-fluid p-5">
		<div class="row">
			<div class="col-md-12">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment
							List</p>

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
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("userObj");
								appointmentDao dao = new appointmentDao(DbConnect.myConnection());
								DoctorDao dao2 = new DoctorDao(DbConnect.myConnection());
								List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
								for (Appointment ap : list) {
									Doctor d = dao2.getDoctorById(ap.getDoctorId());
								%>
								<tr>
									<td><%=ap.getFullName()%></td>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullName()%></td>
									<td>
										<%
										if ("Pending".equals(ap.getStatus())) {
										%> <a href=""
										class="btn btn-sm btn-warning">Pending</a> <%
 } else {
 %> <%=ap.getStatus()%>
										<%
										}
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