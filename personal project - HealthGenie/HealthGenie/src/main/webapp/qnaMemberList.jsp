<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의 목록</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style>
.table-group-divider tr {
	cursor: pointer;
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
				</ul>
				<div class="d-flex">
					<li><button class="btn btn-outline-light"
							onclick="location.href='myPage.do'">마이페이지</button></li>
					<li><button class="btn btn-outline-light"
							onclick="location.href='logout.do'">로그아웃</button></li>
					<li><button class="btn btn-outline-light"
							onclick="location.href='community.do'">커뮤니티</button></li>
				</div>
			</div>
		</div>
	</nav>

	<div class="container col-8 mt-4">
		<h1 class="text-center mb-4">문의 사항 목록 🙋🏻‍♂️🙋🏻‍♀️</h1>
		<table class="table table-hover text-center">
			<thead class="table-light">
				<tr>
					<th scope="col">문의 날짜</th>
					<th scope="col">제목</th>
					<th scope="col">답변 여부</th>
				</tr>
			</thead>

			<tbody class="table-group-divider">
				<c:forEach var="item" items="${list}">
					<tr data-bs-toggle="modal" data-bs-target="#qnaModal"
							class="qnaMemberView" data-num="${item.qnANum}" >
						<td>${item.qnaDate}</td>
						<th scope="row">${item.qnaTitle}</th>
						<td><c:choose>
								<c:when test="${item.solve eq false }">
									<button type="button" class="btn btn-info">문의 진행중</button>
								</c:when>
								<c:when test="${item.solve eq true }">
									<button type="button" class="btn btn-secondary">답변 완료</button>
								</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<!-- 다음과 같이 기본 구성 구조의 모달을 추가합니다. -->
	<div class="modal" tabindex="-1" id="qnaModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">문의사항 보기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id="qnaModalContent">
					<!-- 여기서 jQuery를 사용하여 로드된 내용을 채울 예정입니다. -->
				</div>
			</div>
		</div>
	</div>

	<script>
		$('.qnaMemberView').on('click', function() {
			var qnaNum = $(this).data('num');
			console.log(qnaNum);
			$.ajax({
				url : 'qnaMemberView.do',
				type : 'GET',
				data : {
					qnaNum : qnaNum
				},
				dataType : 'html',
				success : function(response) {
					$('#qnaModalContent').html(response).show();
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