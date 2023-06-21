<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>목표 설정</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style>
.input-group {
	width: 300px; /* 원하는 가로 크기 조절 */
	margin-right: auto; /* 입력 폼을 가운데 정렬합니다. */
	margin-left: auto;
}

.input-group-text {
	width: 120px;
}

.input-end {
	width: 50px;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="Home.jsp"> <img
				src="./healthLogo/healthLogo.png" alt="Logo" width="30" height="27"
				class="d-inline-block align-text-top"> &nbsp;Health Care
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
						href="bodyInfoView.do">오늘 정보 기록하기</a></li>
					<li class="nav-item"><a class="nav-link" href="todoList.jsp">TodoList</a></li>
					<li class="nav-item"><a class="nav-link" href="myLog.do">나의
							일지</a></li>
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


	<div class="container col-8 mt-5">
		<div class="card text-center">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
						data-bs-target="#home-tab-pane" type="button" role="tab"
						aria-controls="home-tab-pane" aria-selected="true"
						onclick="location.href = 'preventGoalView.do'">현재 목표🏅</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#profile-tab-pane" type="button" role="tab"
						aria-controls="profile-tab-pane" aria-selected="false">목표
						새로 설정하기</button>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home-tab-pane"
					role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					<c:choose>
						<c:when test="${preventGoal ne null }">
							<h5 class="card-title mt-3">${requestScope.preventGoal.setDate }
								에 설정한 목표 입니다.</h5>

							<div class="input-group col-sm-3 mt-3 mb-1">
								<span class="input-group-text" id="basic-addon3">목표 체중</span> <input
									type="text" class="form-control" id="basic-url"
									aria-describedby="basic-addon3"
									value="${requestScope.preventGoal.goalWeight }Kg" readonly>
							</div>
							<div class="input-group col-sm-3 mb-1">
								<span class="input-group-text" id="basic-addon3">목표 근육량</span> <input
									type="text" class="form-control" id="basic-url"
									aria-describedby="basic-addon3"
									value="${requestScope.preventGoal.goalMuscleMass }%" readonly>
							</div>
							<div class="input-group col-sm-3 mb-3">
								<span class="input-group-text" id="basic-addon3">목표 달성날짜</span>
								<input type="text" class="form-control" id="basic-url"
									aria-describedby="basic-addon3"
									value="${requestScope.preventGoal.goalDate }" readonly>
							</div>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-outline-primary mt-3 mb-3"
								onclick="location.href='preventGoalView.do'">현재 목표 확인하기</button>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
					aria-labelledby="profile-tab" tabindex="0">
					<form action="goalSetting.do" method="post">
						<div class="input-group mb-3 mt-4">
							<span class="input-group-text">기록할 날짜</span> <input type="date"
								class="form-control" name="goalDate">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text">목표 체중</span> <input type="text"
								class="form-control text-end" name="goalWeight"> <span
								class="input-group-text input-end">Kg</span>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text">목표 근육량</span> <input type="text"
								class="form-control text-end" name="goalMuscleMass"> <span
								class="input-group-text input-end">%</span>
						</div>

						<button type="submit" class="btn btn-dark mb-3">기록 완료</button>
					</form>
				</div>
			</div>
		</div>

		<table class="table table-valign-middle mt-5">
			<thead>
				<tr class="text-center table-active">
					<th scope="col">목표 날짜</th>
					<th scope="col">목표 체중</th>
					<th scope="col">목표 근육량</th>
					<th scope="col">달성여부</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:choose>
					<c:when test="${requestScope.goalView eq true }">
						<c:forEach var="goal" items="${list}">
							<tr class="text-center align-middle">
								<th scope="row" class="table-active">${goal.goalDate }</th>
								<td>${goal.goalWeight }</td>
								<td>${goal.goalMuscleMass }</td>
								<td>
									<form action="goalAchievement.do" method="post">
										<c:if test="${goal.achievement eq true}">
											<div
												class="form-check form-switch d-flex justify-content-center">
												<input class="form-check-input align-self-center"
													type="checkbox" name="achievement" role="switch"
													id="flexSwitchCheckChecked" checked>
											</div>
										</c:if>
										<c:if test="${goal.achievement eq false}">
											<div
												class="form-check form-switch d-flex justify-content-center">
												<input class="form-check-input align-self-center"
													type="checkbox" name="achievement" role="switch"
													id="flexSwitchCheckChecked">
											</div>
										</c:if>
								</td>
								<td>
									<button type="submit" class="btn btn-light">달성 여부 변경하기</button>
								</td>
							</tr>
							<input type="hidden" name="hiddenGoalWeight"
								value="${goal.goalWeight }">
							<input type="hidden" name="hiddenGoalMuscleMass"
								value="${goal.goalMuscleMass }">
							<input type="hidden" name="hiddenGoalDate"
								value="${goal.goalDate }">
							</form>
						</c:forEach>
					</c:when>
					<c:when test="${requestScope.goalView eq false }">
			설정한 목표가 없습니다, 목표를 설정해주세요!
		</c:when>
				</c:choose>
			</tbody>
		</table>
		<button type="button" class="btn btn-secondary"
			onclick="location.href='goalView.do'">이전에 설정한 내 목표 보기</button>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>