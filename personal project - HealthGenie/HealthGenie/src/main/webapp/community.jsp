<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>community</title>
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
						href="goalSetting.jsp">목표 설정하기</a></li>
					<li class="nav-item"><a class="nav-link"
						href="bodyInfoView.do">오늘 정보 기록하기</a></li>
					<li class="nav-item"><a class="nav-link" href="todoList.do">TodoList</a></li>
				</ul>
				<div class="d-flex">
					<c:if test="${sessionScope.id eq null }">
						<li><button class="btn btn-outline-light"
								data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button></li>
					</c:if>
					<c:if test="${sessionScope.id ne null }">
						<li><button class="btn btn-outline-light"
								onclick="location.href='logout.do'">로그아웃</button></li>

					</c:if>
					<li><button class="btn btn-outline-light"
							onclick="location.href='myPage.jsp'">마이페이지</button></li>
				</div>
			</div>
		</div>
	</nav>

	<div class="container col-10 mt-5">
		<h1 class="text-center mb-5">🏋️‍♀️Health Care Communit‍y️🏋️‍♀️</h1>
		<table class="table table-hover text-center">
			<thead class="table-light">
				<tr>
					<th scope="col">작성자</th>
					<th scope="col">제목</th>
					<th scope="col">작성일자</th>
					<th scope="col">조회수</th>
					<th scope="col">댓글수</th>
				</tr>
			</thead>

			<tbody class="table-group-divider">
				<c:forEach var="list" items="${list}">
					<tr onclick="location.href='postView.do?postNum=${list.postNum }'">
						<th scope="row">${list.userId}</th>
						<td>${list.title}</td>
						<td>${list.createDate}</td>
						<td>${list.views}</td>
						<td>${list.commentCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<c:choose>
			<c:when test="${sessionScope.id ne null }">
				<button type="button"
					class="btn btn-outline-secondary write-btn btn-m"
					onclick="location.href='writePost.jsp'">글쓰기✏️</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-outline-secondary write-btn"
					data-bs-toggle="modal" data-bs-target="#loginModal">로그인하고
					글쓰러 가기✏️</button>

				<!-- loginModal -->
				<div class="modal fade" id="loginModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">로그인</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
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
			</c:otherwise>
		</c:choose>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>