<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의 목록 - 관리자.ver</title>
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
		<h1 class="text-center mt-4">문의 관리 📩</h1>
		<h6 class="text-center mt-3">✔️ 접수가 오래 된 문의부터 차례대로 보여집니다.</h6>
		<div class="row">
			<div class="col">
				<h4 class="text-center mb-4">문의 목록</h4>
				<table class="table table-hover text-center">
					<thead class="table-light">
						<tr>
							<th scope="col">문의 날짜</th>
							<th scope="col">회원명</th>
							<th scope="col">제목</th>
							<th scope="col">답변 여부</th>
						</tr>
					</thead>

					<tbody class="table-group-divider">
						<c:forEach var="item" items="${list}">
							<tr class="qnaAdminListView" data-num="${item.qnANum }"
								style="cursor: pointer;">
								<th scope="row">${item.qnaDate}</th>
								<td>${item.sendUser}</td>
								<td>${item.qnaTitle}</td>
								<td><c:choose>
										<c:when test="${item.solve eq false }">
											<button type="button" class="btn btn-info">답변 대기</button>
										</c:when>
										<c:when test="${item.solve eq true }">
											<button type="button" class="btn btn-secondary">답변
												완료</button>
										</c:when>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="col" id="right-div">
				<h4 class="text-center">문의 내용 상세보기</h4>
			</div>
		</div>
	</div>


	<script>
		$('.qnaAdminListView').on('click', function() {
			var qnANum = $(this).data('num');
			console.log(qnANum);
			$.ajax({
				url : 'qnaAdminListView.do',
				type : 'GET',
				data : {
					qnANum : qnANum
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