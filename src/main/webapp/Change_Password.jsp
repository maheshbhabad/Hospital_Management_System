<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<%@include file="Component/AllCss.jsp"%>
<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="User_Login.jsp"></c:redirect>
	</c:if>
	<%@include file="Component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-4 text-center">Change Password</p>
						<c:if test="${not empty Msg }">
							<p class="text-center text-success fs-3">${Msg}</p>
							<c:remove var="Msg" scope="session" />
						</c:if>

						<c:if test="${not empty error }">
							<p class="text-center text-danger fs-3">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>

						<form action="changePassword" method="post">
							<div class="mb-3">
								<label class="form-Label">Enter New Password</label> <input
									required name="newpassword" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-Label">Enter Old Password</label> <input
									required name="oldpassword" type="password"
									class="form-control">
							</div>
							<input type="hidden" value="${userObj.id}" name="uid">
							<button type="submit" class="btn bg-success text-white col-md-12">Change
								Password</button>
						</form>

					</div>
				</div>
			</div>

		</div>

	</div>



</body>
</html>