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
	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>

		<c:if test="${not empty Msg }">
			<p class="text-center text-success fs-5">${Msg}</p>
			<c:remove var="Msg" scope="session" />
		</c:if>

		<c:if test="${not empty error }">
			<p class="text-center text-danger fs-5">${error}</p>
			<c:remove var="error" scope="session" />
		</c:if>

		<div class="row">
			<div class="col-md-4">
				<div class="card point-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class=" fs-4 text-center">
							Doctor <br>5
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card point-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class=" fs-4 text-center">
							User <br>49
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card point-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br>556
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4 mt-2">
				<div class="card point-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist <br>5
						</p>
					</div>
				</div>
			</div>


		</div>
	</div>
	</div>
</body>
</html>