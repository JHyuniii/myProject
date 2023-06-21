<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Log View</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">


<style>
#previewContainer img {
	max-width: 100%;
	height
	auto;
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
						href="bodyInfoView.do">오늘 정보 기록하기</a></li>
					<li class="nav-item"><a class="nav-link" href="todoList.do">TodoList</a></li>
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

	<div class="container mt-4">
		<div class="card">
			<div class="row justify-content-center mb-3 mt-4">
				<div class="col-md-6">
					<h1 class="text-center">${requestScope.dto.exerciseDate }의일지</h1>
				</div>
			</div>

			<div class="row justify-content-center">
				<div class="col-md-6">
					<label for="exampleDataList" class="form-label"><h3>운동
							부위</h3></label> <input class="form-control" list="datalistOptions"
						id="exampleDataList" name="part" value="${requestScope.dto.part }"
						readonly>
				</div>
			</div>

			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="mb-3 mt-3">
						<label for="formFileMultiple" class="form-label"><h3>오늘의
								인증샷</h3></label>
						<div id="previewContainer">
							<img src="./healthMyLogIMG/${requestScope.dto.fileName }" />
						</div>
					</div>
				</div>
			</div>

			<div class="row justify-content-center">
				<div class="col-md-6">
					<h3>오늘 돌아보기</h3>
					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea2" name="goodPoint" style="height: 100px"
							readonly>${requestScope.dto.goodPoint }</textarea>
						<label for="floatingTextarea2">오늘 잘한점👍</label>
					</div>
				</div>
			</div>

			<div class="row justify-content-center mt-3 mb-3">
				<div class="col-md-6">
					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea2" name="badPoint" style="height: 100px"
							readonly>${requestScope.dto.badPoint }</textarea>
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
							placeholder="아침" value="${requestScope.dto.morningFood }"
							readonly> <input type="text" aria-label="Last name"
							class="form-control" name="lunchFood" placeholder="점심"
							value="${requestScope.dto.lunchFood }" readonly> <input
							type="text" aria-label="Last name" class="form-control"
							name="dinnerFood" placeholder="저녁"
							value="${requestScope.dto.dinnerFood }" readonly>
					</div>
				</div>
			</div>

			<div class="row justify-content-center mt-5 mb-3">
				<div class="col-md-6">
					<div class="input-group">
						<button type="button" class="btn btn-light form-control" id="myLogDeleteBtn">
							일지 삭제하기</button>
						<input type="hidden" id="hiddenLogId" value="${requestScope.dto.logId }">
						<button type="button" class="btn btn-secondary form-control"
							onclick="history.back()">뒤로가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		//게시물 삭제
		$('#myLogDeleteBtn').on('click', function() {
			let logId = $('#hiddenLogId').val();
			console.log(logId);
			$.ajax({
				url : 'myLogDelete.do',
				type : 'post',
				data : {
					"logId" : logId
				},
				dataType : 'text',
				success : function(result) {
					if (result > 0) {
						alert("일지 삭제가 완료되었습니다.");
						location.href = "myLogList.do"
					} else {
						alert("일지 삭제에 실패하였습니다. 다시 시도해주세요 :)");
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요 :)");
				}
			});
		});
	</script>


	<script>
		src = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity = "sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin = "anonymous"
	</script>
</body>
</html>