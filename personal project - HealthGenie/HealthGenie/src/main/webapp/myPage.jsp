<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style>
#myModal {
	display: none;
}

.card-header b {
	font-size: 20px;
}

.main-card .card-body {
	min-height: 18vh;
	/* 원하는 높이 값으로 설정 */
}

.main-card .card-body h5.card-title {
	font-size: 24px;
	/* 제목 글씨 크기를 조절합니다 */
}

.main-card .card-body p.card-text {
	font-size: 19px;
	/* 본문 글씨 크기를 조절합니다 */
}

.card img {
	width: 13vw;
}

.info-card:hover {
	transform: scale(1.05);
	transition: all 0.5s ease-in-out;
}

.info-card {
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
						href="interestList.do">운동 저장 목록 🛒</a></li>
					<li class="nav-item"><a class="nav-link"
						href="qnaMemberList.do">문의 목록 보기</a></li>
					<li class="nav-item"><button type="button" class="btn"
							id="reportListBtn" data-bs-toggle="modal"
							data-bs-target="#reportListModal" data-userid="${sessionScope.id }">
							🔔 <span class="badge text-bg-secondary">${requestScope.reportCnt }</span>
						</button></li>
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

	<!-- reportListModal -->
	<div class="modal" tabindex="-1" id="reportListModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">알림</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id="reportListModalContent">
					<!-- 여기서 jQuery를 사용하여 로드된 내용을 채울 예정입니다. -->
				</div>
			</div>
		</div>
	</div>

	<!-- Button trigger modal -->
	<button type="button" id="myModal" class="btn btn-primary"
		data-bs-toggle="modal" data-bs-target="#exampleModal"></button>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">환영합니다!</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">${sessionScope.id }님, 반갑습니다. 오늘도 건강한 하루 보내세요 :)</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container col-6 mt-4">
		<div class="card text-center main-card">
			<div class="card-header">
				<b>MyPage🏠</b>
			</div>
			<div
				class="card-body d-flex flex-column align-items-center justify-content-center">
				<h5 class=" card-title">${sessionScope.id}님</h5>
				<br>
				<p class="card-text">🕐 함께 건강을 챙긴 시간 +
					<span style="color: blue; font-style: italic;">${requestScope.memberDate}</span> 일</p>
			</div>
			<div class="card-footer text-muted">
				<a href="modifyMembership.do" class="btn btn-light">회원 정보 수정</a>
			</div>
		</div>
	</div>


	<div class="container col-11 mt-4">
		<div class="row justify-content-center">
			<div class="col-lg-3 mb-4">
				<div class="card h-100 info-card" style="width: 18rem;"
					onclick="location.href='goalSetting.jsp'">
					<img src="./myPageIMG/bodyGoal.png"
						class="card-img-top mx-auto d-block m-auto" alt="...">
					<div
						class="card-body text-center d-flex flex-column justify-content-between">
						<div>
							<h5 class="card-title mb-3">
								<b>세세한 목표 설정</b>
							</h5>
							<p class="card-text mb-0">
								목표 체중과 근육량을 등록해보세요.<br>달성 여부도 관리하고 확인해드립니다.
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 mb-3">
				<div class="card h-100 info-card" style="width: 18rem;"
					onclick="location.href='bodyInfoView.do'">
					<img src="./myPageIMG/bodyInfo.png"
						class="card-img-top mx-auto d-block m-auto" alt="...">
					<div
						class="card-body text-center d-flex flex-column justify-content-between">
						<div>
							<h5 class="card-title mb-3">
								<b>매일의 몸상태 기록</b>
							</h5>
							<p class="card-text mb-0">
								매일매일 달라지는<br>내 몸의 체중과 근육량을 기록해보세요.<br>그래프로 보기 쉽게 기록되고,<br>BMI도
								한눈에 확인 할 수 있습니다.
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 mb-3">
				<div class="card h-100 info-card" style="width: 18rem;"
					onclick="location.href='todoList.jsp'">
					<img src="./myPageIMG/TodoList.png"
						class="card-img-top mx-auto d-block m-auto" alt="...">
					<div
						class="card-body text-center d-flex flex-column justify-content-between">
						<div>
							<h5 class="card-title mb-3">
								<b>운동 투두리스트 관리</b>
							</h5>
							<p class="card-text mb-0">
								그날 그날 운동 뭐할지 계획하고,<br>투두리스트를 작성하여 관리해보세요.<br>효율적인 운동
								시간이 보장됩니다.
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 mb-3">
				<div class="card h-100 info-card" style="width: 18rem;"
					onclick="location.href='myLog.do'">
					<img src="./myPageIMG/Diary.png"
						class="card-img-top mx-auto d-block m-auto" alt="...">
					<div
						class="card-body text-center d-flex flex-column justify-content-between">
						<div>
							<h5 class="card-title mb-3">
								<b>운동 일지 작성</b>
							</h5>
							<p class="card-text mb-0">
								매일 운동 일지를 작성하며<br>체계적인 몸 기록을 해보세요.<br>잘한점과 못한점까지 모두
								기록하며<br>돌아보는 시간을 갖게 해줍니다.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		$('#reportListBtn').on('click', function() {
			var userId = $(this).data('userid');
			console.log(userId);
			$.ajax({
				url : 'reportListMyPage.do',
				type : 'GET',
				data : {
					userId : userId
				// userId 속성값을 사용하여 데이터를 보낸다
				},
				dataType : 'html',
				success : function(response) {
					 $('#reportListModalContent').html(response).show();
				},
				error : function(xhr, status, error) {
					console.error(error);
				}
			});
		});
	</script>

	<script>
		$(document).ready(function() {
			$("#myModal").click();
		});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>

</html>