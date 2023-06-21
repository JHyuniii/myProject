<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
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
		<h1 class="text-center mb-3">👥 회원가입️</h1>
		<div class="card p-4 mx-auto mb-5 mt-3">
			<form class="row justify-content-center" action="joinMembership.do"
				method="post">
				<!-- 클래스 추가 및 수정된 부분 -->
				<div class="col-md-6">
					<!-- 클래스 추가 -->
					<div class="mb-3">
						<label for="id" class="form-label">아이디</label> <input type="text"
							class="form-control" id="inputId" name="id"
							aria-describedby="idCheckMsg" placeholder="8자리 이하만 입력해주세요."
							oninput="limitIdLength();" required>
						<div id="idCheckMsg" class="form-text" style="color: red;"></div>
					</div>
					<div class="mb-3">
						<label for="inputPassword" class="form-label">비밀번호</label> <input
							type="password" class="form-control" id="inputPassword"
							name="password" placeholder="8자리 이상 입력하세요." required>
						<div id="passwordCheckMsg" class="form-text"></div>
					</div>
					<div class="mb-3">
						<label for="inputPassword2" class="form-label">비밀번호 확인</label> <input
							type="password" class="form-control" id="inputPassword2"
							name="password2" placeholder="비밀번호 재입력" required>
						<div id="passwordCheckMsg2" class="form-text"></div>
					</div>
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

					<div class="col-auto d-flex justify-content-center">
						<div class="btn-group w-100" role="group" aria-label="Gender">
							<input type="radio" class="btn-check btn-lg" name="gender"
								id="success-outlined" value="F" autocomplete="off" checked>
							<label class="btn btn-outline-danger w-50" for="success-outlined">여성</label>

							<input type="radio" class="btn-check btn-lg" name="gender"
								id="danger-outlined" value="M" autocomplete="off"> <label
								class="btn btn-outline-primary w-50" for="danger-outlined">남성</label>
						</div>
					</div>

					<div class="d-grid mx-auto mt-5">
						<button type="submit" class="btn btn-secondary mb-3">회원가입</button>
						<button type="reset" class="btn btn-light">초기화</button>
					</div>
			</form>
		</div>
	</div>

	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
	function limitIdLength() {
			const idInput = $('#inputId');
			if (idInput.val().length > 8) {
				idInput[0].setCustomValidity("아이디는 최대 8글자까지 입력 가능합니다.");
				$('#idCheckMsg').text("아이디는 최대 8글자까지 입력 가능합니다.").css('color',
						'red');
			} else {
				idInput[0].setCustomValidity("");
				$('#idCheckMsg').text("");
			}
		}

		$('#inputId').on('input', limitIdLength);

		//아이디 중복 검사
		$('#inputId').on(
				'focusout',
				function() {
					let inputId = $('#inputId').val();

					if (inputId.length > 8) {
						return;
					}

					$.ajax({
						url : "idCheck.do",
						type : "post",
						data : {
							"id" : inputId
						},
						dataType : 'text',
						success : function(result) {
							if (result < 0) {
								$("#idCheckMsg").html('사용할 수 없는 아이디 입니다.').css(
										'color', 'red');
							} else {
								$("#idCheckMsg").html('사용할 수 있는 아이디 입니다.').css(
										'color', 'green');
							}
						},
						error : function() {
							alert("오류가 발생했습니다. 다시 시도해주세요 :)");
						}
					});
				});

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

		//전화번호 숫자만 입력 받기
		$('#phoneNumber').on(
				'input',
				function() {
					var phoneNumber = this.value;

					if (!/^\d*$/.test(phoneNumber)) {
						this.value = phoneNumber.replace(/\D+/g, '');

						$('#phoneNumberCheckMsg').text('숫자만 입력해 주세요.').css(
								'color', 'red'); // 글자 색상을 빨간색으로 변경
					} else {
						$('#phoneNumberCheckMsg').text('').css('color', ''); // 기본 색상으로 변경
					}
				});

		//핸드폰 번호 중복 검사
		$('#phoneNumber')
				.on(
						'focusout',
						function() {
							let phoneNumber = $('#phoneNumber').val();
							$
									.ajax({
										url : "phoneNumberCheck.do",
										type : "post",
										data : {
											"phoneNumber" : phoneNumber
										},
										dataType : 'text',
										success : function(result) {
											if (result < 0) {
												$("#phoneNumberCheckMsg")
														.html(
																'이미 가입된 전화번호 입니다. <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#loginModal" style="border:none;">로그인</button> 하러 가기</a>');

												$('input[type="submit"]').prop(
														'disabled', true);
											} else {
												$("#phoneNumberCheckMsg").html(
														'');
												$('input[type="submit"]').prop(
														'disabled', false);
											}
										},
										error : function() {
											alert("오류가 발생했습니다. 다시 시도해주세요 :)");
										}
									})
						})
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>