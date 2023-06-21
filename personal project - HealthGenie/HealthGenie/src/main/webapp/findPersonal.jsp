<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 / 비밀번호 찾기</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
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
				</ul>
				<div class="d-flex">
					<li>
						<button type="button" class="btn btn-outline-light"
							data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
						<!-- loginModal -->
						<div class="modal fade" id="loginModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">로그인</h1>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form action="login.do" method="post">
											<div class="mb-3">
												<label for="id" class="form-label">아이디</label> <input
													type="text" class="form-control" id="id" name="id">
											</div>
											<div class="mb-3">
												<label for="password" class="form-label">비밀번호</label> <input
													type="password" class="form-control" id="password"
													name="password">
											</div>
											<br>
											<h2 class="fs-5">도움</h2>
											<p>
												<a href="findId.jsp" data-bs-toggle="tooltip"
													title="Tooltip">아이디 / 비밀번호 찾기</a> 에서 도움을 받을 수 있습니다.
											</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-light"
											data-bs-dismiss="modal">닫기</button>
										<button type="button" class="btn btn-light"
											data-bs-dismiss="modal"
											onclick="location.hreef='joinMembership.jsp'">회원가입</button>
										<button type="submit" class="btn btn-secondary">로그인</button>
									</div>
									</form>
								</div>
							</div>
						</div>
					</li>
					<li><button class="btn btn-outline-light"
							onclick="location.href='joinMembership.jsp'">회원가입</button></li>
					<li><button class="btn btn-outline-light"
							onclick="location.href='community.do'">커뮤니티</button></li>
				</div>
			</div>
		</div>
	</nav>

	<div class="container mt-5">

		<p class="text-center">
		<div class="row">
			<div class="col-md-6 text-md-center">
				<div class="d-grid">
					<a class="btn btn-secondary w-100" data-bs-toggle="collapse"
						href="#multiCollapseExample1" role="button" aria-expanded="false"
						aria-controls="multiCollapseExample1">아이디 찾기</a>
				</div>
			</div>
			<div class="col-md-6 text-md-center">
				<div class="d-grid">
					<button class="btn btn-secondary w-100" type="button"
						data-bs-toggle="collapse" data-bs-target="#multiCollapseExample2"
						aria-expanded="false" aria-controls="multiCollapseExample2">비밀번호
						찾기</button>
				</div>
			</div>
		</div>
		</p>

		<div class="row">
			<div class="col">
				<div class="collapse multi-collapse" id="multiCollapseExample1">
					<form action="findId.do" method="post">
						<div class="card card-body">
							<div class="mb-3">
								<label for="phoneNumber" class="form-label">전화번호</label> <input
									type="text" class="form-control" id="phoneNumber"
									name="phoneNumber" aria-describedby="phoneNumberCheckMsg"
									placeholder="숫자만 입력하세요." required>
								<div id="phoneNumberCheckMsg" class="form-text"></div>
							</div>
							<div class="mb-3">
								<label for="birthday" class="form-label">생년월일</label> <input
									type="date" class="form-control" id="birth" name="birth">
							</div>
							<div class="d-grid">
								<button type="submit" class="btn btn-success mb-3 w-100">아이디
									찾기</button>
								<button type="reset" class="btn btn-light w-100">초기화</button>
							</div>
						</div>
					</form>
				</div>

				<c:choose>
					<c:when test="${requestScope.idExistence eq true}">
						<div class="card border-success mt-3" style="max-width: 40rem;">
							<div class="card-header">아이디 찾기 성공</div>
							<div class="card-body text-success">
								<h5 class="card-title">해당 정보로 가입된 아이디가 있습니다.</h5>
								<p class="card-text">${requestScope.searchId }입니다.</p>
								<p class="card-text">
									<button type="button" class="btn btn-outline-dark"
										data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
									하러가기
								</p>
							</div>
						</div>
					</c:when>
					<c:when test="${requestScope.idExistence eq false}">
						<div class="card border-danger mt-3 mb-5"
							style="max-width: 40rem;">
							<div class="card-header">아이디 찾기 실패</div>
							<div class="card-body text-danger">
								<h5 class="card-title">해당 정보로 가입된 아이디가 없습니다.</h5>
								<p class="card-text">
									<button class="btn btn-outline-dark"
										onclick="location.href='joinMembership.jsp'">회원가입</button>
									을 진행해주세요.
								</p>
							</div>
						</div>
					</c:when>
				</c:choose>
			</div>

			<div class="col">
				<div class="collapse multi-collapse" id="multiCollapseExample2">
					<form action="findPassword.do" method="post">
						<div class="card card-body">
							<div class="mb-3">
								<label for="id" class="form-label">아이디</label> <input
									type="text" class="form-control" id="id" name="id"
									aria-describedby="idCheckMsg" required>
								<div id="idCheckMsg" class="form-text"></div>
							</div>
							<div class="mb-3">
								<label for="phoneNumber" class="form-label">전화번호</label> <input
									type="text" class="form-control" id="phoneNumber"
									name="phoneNumber" aria-describedby="phoneNumberCheckMsg"
									placeholder="숫자만 입력하세요." required>
								<div id="phoneNumberCheckMsg" class="form-text"></div>
							</div>
							<div class="d-grid">
								<button type="submit" class="btn btn-success mb-3 w-100">비밀번호
									찾기</button>
								<button type="reset" class="btn btn-light w-100">초기화</button>
							</div>
						</div>
					</form>
				</div>
				<c:choose>
					<c:when test="${requestScope.passwordExistence eq true}">
						<div class="card border-success mt-3" style="max-width: 40rem;">
							<div class="card-header">비밀번호 찾기 성공</div>
							<div class="card-body text-success">
								<h5 class="card-title">해당 정보로 가입된 비밀번호가 있습니다.</h5>
								<p class="card-text">${requestScope.searchPassword }입니다.</p>
								<p class="card-text">
									<button type="button" class="btn btn-outline-dark"
										data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
									하러가기
								</p>
							</div>
						</div>
					</c:when>
					<c:when test="${requestScope.passwordExistence eq false}">
						<div class="card border-danger mt-3 mb-5"
							style="max-width: 40rem;">
							<div class="card-header">비밀번호 찾기 실패</div>
							<div class="card-body text-danger">
								<h5 class="card-title">해당 정보로 가입된 비밀번호가 없습니다.</h5>
								<p class="card-text">
									<button class="btn btn-outline-dark"
										onclick="location.href='joinMembership.jsp'">회원가입</button>
									을 진행해주세요.
								</p>
							</div>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>