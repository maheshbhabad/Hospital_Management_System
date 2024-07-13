<%@page import="com.db.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index page</title>
<%@include file="Component/AllCss.jsp"%>
<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>


</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	
	
	<div id="carouselExampleIndicators" class="carousel slide">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/bed.png" class="d-block w-100" alt="..."
					height=500px>
			</div>
			<div class="carousel-item">
				<img src="images/doc3.jpg" class="d-block w-100" alt="..."
					height=500px>
			</div>
			<div class="carousel-item">
				<img src="images/Doctor2.jpg" class="d-block w-100" alt="..."
					height=500px>
			</div>
			<div class="carousel-item">
				<img src="images/heart.jpeg" class="d-block w-100" alt="..."
					height=500px>
			</div>
			<div class="carousel-item">
				<img src="images/hospital.jpeg" class="d-block w-100" alt="..."
					height=500px>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<div class="container p-3">
		<p class="text-center fs-2">Key Feartures of our Hospital</p>

		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem any text type here related health medical all
									feature are post here.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem any text type here related health medical all
									feature are post here.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem any text type here related health medical all
									feature are post here.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem any text type here related health medical all
									feature are post here.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<img alt=" " src="images/person.jpg">
			</div>

		</div>
	</div>
	<hr>

	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>
		<div class="row">
			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="" src="images/team2.jpeg" width="250px" height="300px">
						<p class="fw-bold fs-5">Mahesh Bhabad</p>
						<p class=" fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="" src="images/team4.jpeg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Ravi Kadam</p>
						<p class=" fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="" src="images/team1.jpeg" width="250px" height="300px">
						<p class="fw-bold fs-5">DR.Shreya Khandare</p>
						<p class=" fs-7">(Senior Doctor)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="" src="images/team3.jpeg" width="250px" height="300px">
						<p class="fw-bold fs-5">Sahili Nepale</p>
						<p class=" fs-7">(Neural Doctor)</p>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>

<%@include file="Component/footer.jsp" %>
</body>
</html>