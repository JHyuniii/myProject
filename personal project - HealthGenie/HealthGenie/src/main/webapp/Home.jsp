<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HealthGenie</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">
<style>
#banner {
	width: 100vw;
	height: 40vh;
	border: 1px solid black;
}

.home-c-img {
	opacity: 0.5;
}

.carousel {
	cursor: pointer;
}

.offcanvas-body {
	height: 500px; /* 원하는 세로 길이로 조절 */
}

#main_carousel {
	background: -moz-linear-gradient(top, #DEDEDE 0%, #F3F8FF 100%);
	background: -webkit-linear-gradient(top, #DEDEDE 0%, #F3F8FF 100%);
	background: linear-gradient(to bottom, #DEDEDE 0%, #F3F8FF 100%);
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="js/Home.js"></script>
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
					<c:choose>
						<c:when test="${sessionScope.id ne null }">
							<li><button class="btn btn-outline-light"
									onclick="location.href='myPage.do'">마이페이지</button></li>
							<li><button class="btn btn-outline-light"
									onclick="location.href='logout.do'">로그아웃</button></li>
						</c:when>
						<c:otherwise>
							<li>
								<button type="button" class="btn btn-outline-light"
									data-bs-toggle="modal" data-bs-target="#loginModal">
									로그인</button> <!-- loginModal -->
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
												<form action="login.do" method="post" id="loginForm">
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
												<button type="submit" class="btn btn-secondary"
													id="loginSubmitBtn">로그인</button>
											</div>
											</form>
										</div>
									</div>
								</div>
							</li>

							<li><button class="btn btn-outline-light"
									onclick="location.href='joinMembership.jsp'">회원가입</button></li>
							<li><button type="button" class="btn btn-outline-light"
									data-bs-toggle="modal" data-bs-target="#loginModal">마이페이지</button></li>
						</c:otherwise>
					</c:choose>
					<li><button class="btn btn-outline-light"
							onclick="location.href='community.do'">커뮤니티</button></li>
				</div>
			</div>
		</div>
	</nav>

	<div class="offcanvas offcanvas-start show text-bg-dark"
		data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions"
		aria-labelledby="offcanvasWithBothOptionsLabel">
		<div class="offcanvas-header">
			<div class="d-flex flex-column align-items-start">
				<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel"
					style="font-size: 1.5rem;">
					<a class="navbar-brand" href="Home.jsp"> <img
						src="./healthLogo/healthLogo.png" alt="Logo" width="30"
						height="27" class="d-inline-block align-text-top">
						&nbsp;HealthGenie
					</a>
				</h5>
				<br>
				<h5 class="offcanvas-title mt-5" id="offcanvasWithBothOptionsLabel"
					style="font-size: 1.5rem;">전체 메뉴 보기</h5>
			</div>
		</div>

		<div class="offcanvas-body">
			<ul class="nav flex-column nav-pills">
				<li class="nav-item"><a class="nav-link active bg-secondary"
					aria-current="page" href="Home.jsp" style="font-size: 1.2rem;">Home</a></li>
				<li class="nav-item"><a class="nav-link text-light"
					href="community.do" style="font-size: 1.2rem;">커뮤니티</a></li>

				<c:choose>
					<c:when test="${sessionScope.id ne null }">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-light"
							data-bs-toggle="dropdown" href="MyPage.do" role="button"
							aria-expanded="false" style="font-size: 1.2rem;">My Page</a>
							<ul class="dropdown-menu bg-secondary text-secondary">
								<li><a class="dropdown-item" href="#"
									style="font-size: 1.2rem;">내 정보 관리</a></li>
								<li><a class="dropdown-item" href="goalSetting.jsp"
									style="font-size: 1.2rem;">목표 설정</a></li>
								<li><a class="dropdown-item" href="bodyInfoSetting.jsp"
									style="font-size: 1.2rem;">오늘 몸 기록 하기</a></li>
								<li><a class="dropdown-item" href="myLog.do"
									style="font-size: 1.2rem;">나의 일지</a></li>
								<li><a class="dropdown-item" href="todoList.jsp"
									style="font-size: 1.2rem;">운동 TodoList</a></li>
								<li><a class="dropdown-item" href="interestList.jsp"
									style="font-size: 1.2rem;">관심 운동 목록</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="#" style="font-size: 1.2rem;" data-bs-toggle="modal"
							data-bs-target="#exampleModal">문의사항</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-light"
							data-bs-toggle="dropdown" href="" role="button"
							aria-expanded="false" style="font-size: 1.2rem;">My Page</a>
							<ul class="dropdown-menu bg-secondary text-secondary">
								<li><a class="dropdown-item" href="#"
									style="font-size: 1.2rem;" data-bs-toggle="modal"
									data-bs-target="#loginModal">내 정보 관리</a></li>
								<li><a class="dropdown-item" href=""
									style="font-size: 1.2rem;" data-bs-toggle="modal"
									data-bs-target="#loginModal">목표 설정</a></li>
								<li><a class="dropdown-item" href=""
									style="font-size: 1.2rem;" data-bs-toggle="modal"
									data-bs-target="#loginModal">오늘 몸 기록 하기</a></li>
								<li><a class="dropdown-item" href=""
									style="font-size: 1.2rem;" data-bs-toggle="modal"
									data-bs-target="#loginModal">나의 일지</a></li>
								<li><a class="dropdown-item" href=""
									style="font-size: 1.2rem;" data-bs-toggle="modal"
									data-bs-target="#loginModal">운동 TodoList</a></li>
								<li><a class="dropdown-item" href=""
									style="font-size: 1.2rem;" data-bs-toggle="modal"
									data-bs-target="#loginModal">관심 운동 목록</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="#" style="font-size: 1.2rem;" data-bs-toggle="modal"
							data-bs-target="#loginModal">문의사항</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>

	<!-- qna Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">문의사항 보내기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="qnaSendForAdmin.do" method="post">
					<div class="modal-body">
						<div class="mb-3">
							<label for="userId" class="form-label">작성자</label> <input
								type="text" class="form-control" id="userId" name="userId"
								value="${sessionScope.id }" readonly>
						</div>
						<div class="mb-3">
							<div class="form-floating">
								<textarea class="form-control" id="floatingTextarea"
									name="qnaTitle"></textarea>
								<label for="floatingTextarea">제목</label>
							</div>
						</div>
						<div class="mb-3">
							<div class="form-floating">
								<textarea class="form-control" id="floatingTextarea2"
									name="qnaContents" style="height: 150px"></textarea>
								<label for="floatingTextarea2">문의 내용을 자세히 적어주세요.</label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">보내기</button>
					</div>
				</form>
			</div>
		</div>
	</div>




	<div id="carouselExampleCaptions" class="carousel slide carousel-dark"
		data-bs-ride="carousel" data-bs-interval="4000">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div id="main_carousel" style="width: 100vw; height: 40vh;" data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasWithBothOptions"
					aria-controls="offcanvasWithBothOptions">
					<img src="./healthLogo/healthLogo.png"
						style="width: 10vw; height: 18vh; margin-left: 45%; margin-top: 2%;">
					<div class="carousel-caption d-none d-md-block">
						<h2 style="font-style: italic; margin-left: 3%">HealthGenie🪄</h2>
						<h5 style="margin-left:1%;">당신의 건강 관리 도우미</h5>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img src="./HomeIMG/배경3.JPG" class="d-block home-c-img"
					style="width: 100vw; height: 40vh;" data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasWithBothOptions"
					aria-controls="offcanvasWithBothOptions">
				<div class="carousel-caption d-none d-md-block" style="font-size: 20px">
					<h5><b>운동 정보 제공 및 관리</b></h5>
					<p>운동 방법을 제공받고, 내 몸 상태를 편하게 기록하며 관리하세요.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="./HomeIMG/배경4.JPG" class="d-block home-c-img"
					style="width: 100vw; height: 40vh;" data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasWithBothOptions"
					aria-controls="offcanvasWithBothOptions">
				<div class="carousel-caption d-none d-md-block" style="font-size: 20px">
					<h5><b>넓은 소통의 기회</b></h5>
					<p>전용 커뮤니티에서 운동과 관련한 깊고 넓은 정보를 나눠보세요.</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container text-center mt-3">
		<div class="alert alert-light" role="alert" style="font-size: 20px">원하는 부위를 클릭하여 운동 정보를
			확인해보세요! 👇🏻</div>
	</div>

	<div class="container text-center home-btn">
		<button type="button" class="btn btn-outline-secondary me-2" id="back"
			onclick="loadExercise('back')">등</button>
		<button type="button" class="btn btn-outline-secondary me-2"
			id="cardio" onclick="loadExercise('cardio')">유산소</button>
		<button type="button" class="btn btn-outline-secondary me-2"
			id="chest" onclick="loadExercise('chest')">가슴</button>
		<button type="button" class="btn btn-outline-secondary me-2"
			id="lower arms" onclick="loadExercise('lower arms')">삼두</button>
		<button type="button" class="btn btn-outline-secondary me-2"
			id="lower legs" onclick="loadExercise('lower legs')">종아리</button>
		<button type="button" class="btn btn-outline-secondary me-2" id="neck"
			onclick="loadExercise('neck')">목</button>
		<button type="button" class="btn btn-outline-secondary me-2"
			id="shoulders" onclick="loadExercise('shoulders')">어깨</button>
		<button type="button" class="btn btn-outline-secondary me-2"
			id="upper arms" onclick="loadExercise('upper arms')">이두</button>
		<button type="button" class="btn btn-outline-secondary me-2"
			id="upper legs" onclick="loadExercise('upper legs')">허벅지</button>
		<button type="button" class="btn btn-outline-secondary me-2"
			id="waist" onclick="loadExercise('waist')">허리</button>
	</div>


	<div class="container text-center mt-3" id="cardContainer">
		<!-- 카드들이 동적으로 추가될 공간 -->
	</div>

	<c:if test="${requestScope.joinSuccessMsg eq true }">
		<script>
			alert("회원가입에 성공하셨습니다. 로그인 해주세요.");
		</script>
	</c:if>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>


</html>