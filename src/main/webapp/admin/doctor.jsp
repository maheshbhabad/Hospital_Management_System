<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.entity.Specialist"%>
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

	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-4">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<c:if test="${not empty Msg }">
							<p class="text-center text-success fs-3" role="alert">${Msg}</p>
							<c:remove var="Msg" scope="session" />
						</c:if>

						<c:if test="${not empty error }">
							<p class="text-center text-danger fs-3">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>

						<form action="../adddoc" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label><input type="text"
									required name="fullname" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label><input type="date" required
									name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label><input
									type="text" required name="qualification" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label><select name="spec"
									required class="form-control">
									<option>--select--</option>
									<%
									SpecialistDao dao = new SpecialistDao(DbConnect.myConnection());
									List<Specialist> list = dao.getAllSpecialist();
									for(Specialist s:list){
									%>
									<option><%=s.getSpecialistName() %></option>
									<%
									}
									%>
								</select>

							</div>

							<div class="mb-3">
								<label class="form-label">Email</label><input type="text"
									required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile No</label><input type="text"
									required name="mobno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label><input type="password"
									required name="password" class="form-control">
							</div>

							<button class="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>


			<div class="col-md-8">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>

						<table class="table">
							<thead>
								<tr>
									<th class="col">Full Name</th>
									<th class="col">DOB</th>
									<th class="col">Qualification</th>
									<th class="col">Specialist</th>
									<th class="col">Email</th>
									<th class="col">Mob No</th>
									<th class="col">Action</th>
								</tr>
							</thead>

						</table>
					</div>
				</div>
			</div>

		</div>
	</div>


</body>
</html>