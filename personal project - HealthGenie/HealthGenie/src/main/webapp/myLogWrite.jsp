<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Log Write</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style>
.preview-image {
	max-width: 300px; /* 원하는 너비로 조정 */
	max-height: 200px; /* 원하는 높이로 조정 */
	margin-top: 10px; /* 이미지 간격 조정 */
}

h3 {
	font-size: 20px;
}
</style>
</head>
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
						href="bodyInfoView.do">오늘 정보 기록하기</a></li>
					<li class="nav-item"><a class="nav-link" href="todoList.jsp">TodoList</a></li>
				</ul>
				<div class="d-flex">
					<li><button class="btn btn-outline-light"
							onclick="location.href='logout.do'">로그아웃</button></li>
					<li><button class="btn btn-outline-light"
							onclick="location.href='myPage.jsp'">마이페이지</button></li>
					<li><button class="btn btn-outline-light"
							onclick="location.href='community.do'">커뮤니티</button></li>
				</div>
			</div>
		</div>
	</nav>

	<form action="myLogWrite.do" method="post"
		enctype="multipart/form-data">
		<div class="container mt-4 mb-5">
		<h1 class="text-center mb-4">📔오늘의 일지 작성</h1>
			<div class="card">
				<div class="row justify-content-center mb-3 mt-3">
					<div class="col-md-6">
						<h3>작성 일자</h3>
						<div class="input-group">
							<span class="input-group-text">일자</span> <input type="date"
								aria-label="First name" class="form-control" name="exerciseDate">
						</div>
					</div>
				</div>

				<div class="row justify-content-center">
					<div class="col-md-6">
						<label for="exampleDataList" class="form-label"><h3>운동
								부위</h3></label> <input class="form-control" list="datalistOptions"
							id="exampleDataList" placeholder="부위를 입력하세요..." name="part">
						<datalist id="datalistOptions">
							<option value="등">
							<option value="가슴">
							<option value="어깨">
							<option value="이두">
							<option value="삼두">
							<option value="허벅지">
							<option value="허리">
							<option value="목">
							<option value="유산소">
							<option value="종아리">
						</datalist>
					</div>
				</div>

				<div class="row justify-content-center">
					<div class="col-md-6">
						<div class="mb-3 mt-3">
							<label for="formFileMultiple" class="form-label"><h3>오늘의
									인증샷</h3></label> <input class="form-control" type="file"
								id="formFileMultiple" accept="image/*" name="fileName" multiple>
							<div id="previewContainer"></div>
						</div>
					</div>
				</div>

				<div class="row justify-content-center">
					<div class="col-md-6">
						<h3>오늘 돌아보기</h3>
						<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea2" name="goodPoint" style="height: 100px"></textarea>
							<label for="floatingTextarea2">오늘 잘한점👍</label>
						</div>
					</div>
				</div>

				<div class="row justify-content-center mt-3 mb-3">
					<div class="col-md-6">
						<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea2" name="badPoint" style="height: 100px"></textarea>
							<label for="floatingTextarea2">오늘 아쉬운점👎</label>
						</div>
					</div>
				</div>

				<div class="row justify-content-center">
					<div class="col-md-6">
						<h3>식단 기록</h3>
						<div class="input-group">
							<span class="input-group-text">오늘의 식단</span> <input type="text"
								aria-label="First name" class="form-control" name="morningFood"
								placeholder="아침"> <input type="text"
								aria-label="Last name" class="form-control" name="lunchFood"
								placeholder="점심"> <input type="text"
								aria-label="Last name" class="form-control" name="dinnerFood"
								placeholder="저녁">
						</div>
					</div>
				</div>

				<div class="row justify-content-center mt-3 mb-3">
					<div class="col-md-6">
						<div class="input-group">
							<button type="button" class="btn btn-light form-control"
								onclick="history.back()">뒤로가기</button>
							<button type="submit" class="btn btn-secondary form-control">일지
								작성 완료하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>

<script>
	document.getElementById('formFileMultiple').addEventListener(
			'change',
			function(e) {
				var files = e.target.files;
				var previewContainer = document
						.getElementById('previewContainer');

				previewContainer.innerHTML = '';

				if (files.length > 1) {
					alert('한 게시물당 한장 이상 올릴 수 없습니다.');

					e.target.value = '';

					return;
				}

				for (var i = 0; i < files.length; i++) {
					var file = files[i];
					var reader = new FileReader();

					reader.onload = (function(file) {
						return function(e) {
							var img = document.createElement('img');
							img.src = e.target.result;
							img.classList.add('preview-image');
							previewContainer.appendChild(img);
						};
					})(file);

					reader.readAsDataURL(file);
				}
			});
</script>

</html>