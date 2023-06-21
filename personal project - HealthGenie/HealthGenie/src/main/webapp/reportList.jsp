<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신고 목록 - 관리자.ver</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style>
.table-group-divider tr {
	/* 	cursor: pointer; */
	height: 35px;
	line-height: 35px;
}

.write-btn {
	border: none;
}

thead th {
	font-size: 18px;
	height: 45px;
	line-height: 45px;
}
</style>


</head>
<body>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="superAdminIndex.do"> <img
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



	<div class="container mb-5">
		<h1 class="text-center mt-4">신고 목록 관리 🚨</h1>
		<h6 class="text-center mt-3">무분별한 신고 내역은 없는지 확인 부탁드립니다.</h6>
		<div class="row">
			<div class="col">
				<h4 class="text-center mb-4">신고 접수 목록</h4>
				<table class="table table-hover text-center">
					<thead class="table-light">
						<tr>
							<th scope="col">구분</th>
							<th scope="col">신고 접수 날짜</th>
							<th scope="col">확인 여부</th>
						</tr>
					</thead>

					<tbody class="table-group-divider">
						<c:forEach var="report" items="${requestScope.reportList}">
							<c:choose>
								<c:when test="${report.postNum == null or report.postNum == ''}">
									<tr class="reportNum" data-num="${report.commentNum }"
										style="cursor: pointer;">
										<th scope="row">댓글</th>
										<td>${report.reportDate}</td>
										<td><c:choose>
												<c:when test="${report.solve eq false }">
													<button type="button" class="btn btn-info">대기</button>
												</c:when>
												<c:when test="${report.solve eq true }">
													<button type="button" class="btn btn-secondary">신고
														처리 완료</button>
												</c:when>
											</c:choose></td>
									</tr>
								</c:when>
								<c:when
									test="${report.commentNum == null or report.commentNum == ''}">
									<tr class="reportNum" data-num="${report.postNum }"
										style="cursor: pointer;">
										<th scope="row">게시물</th>
										<td>${report.reportDate}</td>
										<td><c:choose>
												<c:when test="${report.solve eq false }">
													<button type="button" class="btn btn-info">대기</button>
												</c:when>
												<c:when test="${report.solve eq true }">
													<button type="button" class="btn btn-secondary">신고
														처리 완료</button>
												</c:when>
											</c:choose></td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="col" id="right-div">
				<h4 class="text-center">신고 상세 내용</h4>
			</div>
		</div>
	</div>

	<script>
		$('.reportNum').on('click', function() {
			var reportNum = $(this).data('num');
			console.log(reportNum);
			$.ajax({
				url : 'reportView.do',
				type : 'GET',
				data : {
					reportNum : reportNum
				},
				dataType : 'html',
				success : function(response) {
					$('#right-div').html(response).show();
				},
				error : function(xhr, status, error) {
					console.error(error);
				}
			});
		});
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>