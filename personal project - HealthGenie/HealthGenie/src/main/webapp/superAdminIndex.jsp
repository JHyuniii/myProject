<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style>
.card img {
	width: 10vw;
}
.countSpan {
	font-style: italic;
	color: blue;
}
</style>

</head>
<body>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href=""> <img
				src="./healthLogo/healthLogo.png" alt="Logo" width="30" height="27"
				class="d-inline-block align-text-top"> &nbsp;HealthGenie -
				Admin ver.
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
				</ul>
				<div class="d-flex">
					<li><button class="btn btn-outline-light"
							onclick="location.href='logout.do'">로그아웃</button></li>
				</div>
			</div>
		</div>
	</nav>

	<div class="container col-6 mt-4">
		<div class="card text-center main-card border-dark">
			<div class="card-header text-bg-secondary">
				<b>관리자 페이지</b>
			</div>
			<div
				class="card-body d-flex flex-column align-items-center justify-content-center">
				<h5 class="card-title">관리자님 반갑습니다. 👷️</h5>
				<h6 style="color: gray">관리자명 ${sessionScope.superAdmin}</h6>
			</div>
		</div>
	</div>



	<div class="container col-9 mt-4 mb-5">
		<div class="row row-cols-1 row-cols-md-2 g-4">
			<div class="col">
				<div class="card superAdminCard text-center h-100">
					<img src="./superAdminIndexIMG/SuperMember.png"
						class="card-img-top mx-auto d-block m-auto mt-3" alt="...">
					<div class="card-body">
						<h5 class="card-title">
							<b>회원 관리</b>
						</h5>
						<h6 class="card-subtitle mb-2 text-muted">회원 조회, 회원 삭제</h6>
						<p class="card-text" style="font-size: 30px">현재 회원 수 🙆🏻‍♀️
							<span class="countSpan">${requestScope.dto.memberCount }</span> 명</p>
						<a href="memberManagement.do" class="btn btn-outline-dark">회원 목록 상세 보기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card superAdminCard text-center h-100">
					<c:if test="${requestScope.dto.qnaCount ne 0 }">
						<span
							class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
							style="width: 3rem; height: 3rem; line-height: 2.5rem; font-size: 15px">
							${requestScope.dto.qnaCount } <span class="visually-hidden">unread
								messages</span>
						</span>
					</c:if>
					<img src="./superAdminIndexIMG/SuperQnA.png"
						class="card-img-top mx-auto d-block m-auto mt-3" alt="...">
					<div class="card-body">
						<h5 class="card-title">
							<b>문의 관리</b>
						</h5>
						<h6 class="card-subtitle mb-2 text-muted">문의 쪽지 확인 및 답장</h6>
						<p class="card-text" style="font-size: 30px">미확인 문의 수 📩
							<span class="countSpan">${requestScope.dto.qnaCount }</span> 개</p>
						<a href="qnaAdminList.do" class="btn btn-outline-dark">문의 목록 상세 보기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card superAdminCard text-center h-100">
					<img src="./superAdminIndexIMG/SuperBoard.png"
						class="card-img-top mx-auto d-block m-auto mt-5" alt="...">
					<div class="card-body d-flex flex-column justify-content-center">
						<h5 class="card-title">
							<b>커뮤니티 게시글 관리</b>
						</h5>
						<p class="card-text" style="font-size: 30px">오늘 추가된 게시글 수 📄
							<span class="countSpan">${requestScope.dto.postCount }</span> 개</p>
						<!-- <a href="#" class="btn btn-outline-dark">게시글 관리하러 가기</a> -->
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card superAdminCard text-center h-100">
					<c:if test="${requestScope.dto.reportCount ne 0 }">
						<span
							class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
							style="width: 3rem; height: 3rem; line-height: 2.5rem; font-size: 15px">
							${requestScope.dto.reportCount } <span class="visually-hidden">unread
								messages</span>
						</span>
					</c:if>
					<img src="./superAdminIndexIMG/SuperSiren.png"
						class="card-img-top mx-auto d-block m-auto mt-3" alt="...">
					<div class="card-body">
						<h5 class="card-title">
							<b>신고 접수 관리</b>
						</h5>
						<h6 class="card-subtitle mb-2 text-muted">커뮤니티 게시글 및 댓글 신고 확인
							및 해결</h6>
						<p class="card-text" style="font-size: 30px">미확인 신고 개수 🚨
							<span class="countSpan">${requestScope.dto.reportCount }</span> 개</p>
						<a href="reportList.do" class="btn btn-outline-dark">신고 목록 상세 보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>