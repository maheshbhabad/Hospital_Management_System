<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-house-medical"></i>MEDI HOME</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<c:if test="${empty userObj }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="Admin_Login.jsp"><i
							class="fa-solid fa-right-to-bracket"></i>ADMIN</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="Doctor_Login.jsp">DOCTOR</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="">APPOINTMENT</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="User_Login.jsp">USER</a></li>

				</c:if>



				<c:if test="${not empty userObj }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="">APPOINTMENT</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="">VIEW APPOINTMENT</a></li>
					<div class="dropdown">

						<button class="btn btn-success dropdown-toggle " type="button"
							id="dropdownMenubutton1" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-solid fa-circle-user"></i>${userObj.fullName}</button>

						<ul class="dropdown-menu" aria-lebelledly="navbarDropdown">
							<li><a class="dropdown-item" href="#">Change Password</a></li>
							<li><a class="dropdown-item" href="userlogout">Logout</a></li>
						</ul>
						</li>
					</div>
				</c:if>


			</ul>

		</div>
	</div>
</nav>