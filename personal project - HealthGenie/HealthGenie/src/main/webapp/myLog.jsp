<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Log</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style>
.no-border-card {
	border: none;
}

.card:hover {
	transform: scale(1.05);
	transition: all 0.5s ease-in-out;
}

.card {
	cursor: pointer;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="Home.jsp"> <img
				src="./healthLogo/healthLogo.png" alt="Logo" width="30" height="27"
				class="d-inline-block align-text-top"> &nbsp;HealthGenie
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarScroll">
				<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
					style="--bs-scroll-height: 100px;">
					<li class="nav-item"><a class="nav-link"
						href="goalSetting.jsp">목표 설정하기</a></li>
					<li class="nav-item"><a class="nav-link"
						href="bodyInfoView.do">오늘 정보 입력하기</a></li>
					<li class="nav-item"><a class="nav-link" href="todoList.do">TodoList</a>
					</li>
				</ul>
				<div class="d-flex">
					<li><button class="btn btn-outline-light"
							onclick="location.href='logout.do'">로그아웃</button></li>
					<li><button class="btn btn-outline-light"
							onclick="location.href='community.do'">커뮤니티</button></li>
				</div>
			</div>
		</div>
	</nav>


	<div class="container mt-3 d-flex justify-content-center">
		<button type="button" class="btn btn-outline-secondary btn-lg"
			onclick="location.href='myLogWrite.jsp'" style="border: none;">✍🏻
			일지 작성하기</button>
	</div>

	<div class="container mt-3 myLog-list justify-content-center align-items-center">
		<div class="row row-cols-1 row-cols-md-4 g-3">
				<c:forEach var="log" items="${list}">
				<div class="col d-flex justify-content-center">
					<div class="card" style="width: 18rem;"
						onclick="location.href='myLogView.do?logId=${log.logId}'">
						<div class="d-flex justify-content-center align-items-center">
							<img src="./healthMyLogIMG/${log.fileName}" class="card-img-top mt-3"
								style="max-height: 150px; max-width: 150px; object-fit: cover;">
						</div>
						<div class="card-body text-center">
							<h5 class="card-title">${log.exerciseDate }</h5>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>