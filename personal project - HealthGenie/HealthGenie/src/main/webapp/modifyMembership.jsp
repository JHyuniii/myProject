<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 수정</title>
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
												<a href="findPersonal.jsp" data-bs-toggle="tooltip"
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
							onclick="location.href='community.do'">커뮤니티</button></li>
				</div>
			</div>
		</div>
	</nav>

	<div class="container mt-3">
		<h1 class="text-center mb-3">정보 수정️</h1>
		<div class="card p-4 mx-auto mb-5 mt-3">
			<form class="row justify-content-center" action="modifyMembershipOK.do"
				method="post">
				<!-- 클래스 추가 및 수정된 부분 -->
				<div class="col-md-6">
					<!-- 클래스 추가 -->
					<div class="mb-3">
						<label for="id" class="form-label">아이디</label> <input type="text"
							class="form-control" id="inputId" name="id"
							aria-describedby="idCheckMsg"
							value="${requestScope.memberDTO.userId }" readonly>
						<div id="idCheckMsg" class="form-text" style="color: red;"></div>
					</div>
					<div class="mb-3">
						<label for="inputPassword" class="form-label">비밀번호</label> <input
							type="password" class="form-control" id="inputPassword"
							name="password" value="${requestScope.memberDTO.password }">
							<div id="passwordCheckMsg" class="form-text"></div>
					</div>
					<div class="mb-3">
						<label for="inputPassword2" class="form-label">비밀번호 확인</label> <input
							type="password" class="form-control" id="inputPassword2"
							name="password2">
							<div id="passwordCheckMsg2" class="form-text"></div>
					</div>
					<div class="mb-3">
						<label for="phoneNumber" class="form-label">전화번호</label> <input
							type="text" class="form-control" id="phoneNumber"
							name="phoneNumber" value="${requestScope.memberDTO.phoneNumber }">
					</div>

					<div class="mb-3">
						<label for="birthday" class="form-label">생년월일</label> <input
							type="text" class="form-control" id="birth" name="birth"
							value="${requestScope.memberDTO.birth }" readonly>
					</div>

					<div class="col-auto d-flex justify-content-center">
						<div class="btn-group w-100" role="group" aria-label="Gender">
							<c:choose>
								<c:when test="${requestScope.memberDTO.gender eq 'F' }">
									<input type="radio" class="btn-check btn-lg" name="gender"
										id="success-outlined" value="F" autocomplete="off" checked>
									<label class="btn btn-outline-danger w-50"
										for="success-outlined">여성</label>
									<input type="radio" class="btn-check btn-lg" name="gender"
										id="danger-outlined" value="M" autocomplete="off">
									<label class="btn btn-outline-primary w-50"
										for="danger-outlined">남성</label>
								</c:when>
								<c:otherwise>
									<input type="radio" class="btn-check btn-lg" name="gender"
										id="success-outlined" value="F" autocomplete="off">
									<label class="btn btn-outline-danger w-50"
										for="success-outlined">여성</label>
									<input type="radio" class="btn-check btn-lg" name="gender"
										id="danger-outlined" value="M" autocomplete="off" checked>
									<label class="btn btn-outline-primary w-50"
										for="danger-outlined">남성</label>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="d-grid mx-auto mt-5">
						<button type="submit" class="btn btn-secondary mb-3">수정 완료</button>
						<button type="button" class="btn btn-light" onclick="location.href='myPage.do'">뒤로 가기</button>
					</div>
			</form>
		</div>
	</div>

	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
		//비밀번호 유효성 체크
		$('#inputPassword, #inputPassword2').on(
				'input',
				function() {
					var inputPassword = $('#inputPassword').val();
					var inputPassword2 = $('#inputPassword2').val();

					if (inputPassword.length < 8) {
						$('#passwordCheckMsg').text('비밀번호가 8자리 이상이어야 합니다.')
								.css('color', 'red');
					} else if (inputPassword !== inputPassword2) {
						$('#passwordCheckMsg').text('').css('color', '');
						$('#passwordCheckMsg2').text('비밀번호가 일치하지 않습니다.').css(
								'color', 'red');
					} else {
						$('#passwordCheckMsg').text('').css('color', '');
						$('#passwordCheckMsg2').text('').css('color', '');
					}
				});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>