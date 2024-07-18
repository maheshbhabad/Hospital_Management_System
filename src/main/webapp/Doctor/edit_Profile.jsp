<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.DoctorDao"%>
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

	<div class="container p-4">
		<div class="row">
			<p class="text-center fs-3">Edit Profile</p>
			<c:if test="${not empty Msg }">
				<p class="text-center text-success fs-3">${Msg}</p>
				<c:remove var="Msg" scope="session" />
			</c:if>

			<c:if test="${not empty error }">
				<p class="text-center text-danger fs-3">${error}</p>
				<c:remove var="error" scope="session" />
			</c:if>
			<div class="col-md-4 offset-md-1">
				<div class="card point-card">

					<div class="card-body">
						<p class="fs-4 text-center">Change Password</p>


						<form action="../ChangePassword" method="post">
							<div class="mb-3">
								<label class="form-Label">Enter New Password</label> <input
									required name="newpassword" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-Label">Enter Old Password</label> <input
									required name="oldpassword" type="password"
									class="form-control">
							</div>
							<input type="hidden" value="${docObj.id}" name="uid">
							<button type="submit" class="btn bg-success text-white ">Change
								Password</button>
						</form>

					</div>
				</div>
			</div>

			<div class="col-md-5 offset-md-1">
				<div class="card point-card">
					<div class="card-body">

						<form action="../editDoctorProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label><input type="text"
									required name="fullname" class="form-control"
									value="${docObj.fullName }">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label><input type="date" required
									name="dob" class="form-control" value="${docObj.dob }">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label><input
									type="text" required name="qualification" class="form-control"
									value="${docObj.qualification }">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label><select name="spec"
									value="${docObj.speciallist }" required class="form-control">
									<option>--select--</option>
									<%
									SpecialistDao dao = new SpecialistDao(DbConnect.myConnection());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>
								</select>

							</div>

							<div class="mb-3">
								<label class="form-label">Email</label><input type="text"
									readonly="readonly" required name="email" class="form-control"
									value="${docObj.email }">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile No</label><input type="text"
									required name="mobno" class="form-control"
									value="${docObj.mobNo}">
							</div>

							<input type="hidden" name="id" value="${ docObj.id}">

							<button type="submit " class="btn btn-success ">Update</button>
						</form>
					</div>
				</div>
			</div>

		</div>

	</div>

</body>
</html>