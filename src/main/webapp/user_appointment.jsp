<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>
<%@include file="Component/AllCss.jsp"%>
<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

img {
	width: 500px;
}
</style>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="" src="images/leady_doc.png">
			</div>

			<div class="col-md-6">
				<div class="card point-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty Msg }">
							<p class="text-center text-success fs-3">${Msg}</p>
							<c:remove var="Msg" scope="session" />
						</c:if>

						<c:if test="${not empty error }">
							<p class="text-center text-danger fs-3">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>

						<form action="appAppointment" class="row g-3" method="post">
							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									required type="text" class="form-control" name="fullname">
							</div>

							<div class="col-md-12">
								<label>Gender</label> <select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									required type="number" class="form-control" name="age">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									Date</label> <input type="date" class="form-control" required
									name="appoint_date">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									maxlength="10" required type="number" class="form-control"
									name="phno">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									required type="text" class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Doctor</label> <select
									required class="form-control" name="doct">
									<option class="value">--select--</option>
									<%
									DoctorDao dao = new DoctorDao(DbConnect.myConnection());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%>(<%=d.getSpeciallist()%>)</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="col-md-12">
								<label>Address</label>
								<textarea required class="form-control" name="address" rows="3"
									cols=""></textarea>
							</div>
							<c:if test="${empty userObj }">
								<a href="User_Login.jsp"
									class="col-md-6 offset-md-3 btn btn-success" >Submit</a>
							</c:if>
							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-success" >Submit</button>
							</c:if>

						</form>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>