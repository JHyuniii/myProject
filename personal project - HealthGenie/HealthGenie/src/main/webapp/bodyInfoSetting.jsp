<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오늘의 몸 정보 기록하기</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
<script src="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style>
#myChart {
	width: 1500px !important;
	height: 300px !important;
}

.input-group {
	width: 300px; /* 원하는 가로 크기 조절 */
	margin-right: auto; /* 입력 폼을 가운데 정렬합니다. */
	margin-left: auto;
}

.modal-btn {
	border: none;
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
					<li class="nav-item"><a class="nav-link" href="todoList.do">TodoList</a>
					</li>
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


	<div class="container col-9 mt-5">
		<div class="card text-center">
			<div class="card-body">
				<h5 class="card-title">Body info setting</h5>
				<p class="card-text">오늘을 기록해보세요.</p>

				<form action="bodyInfoSetting.do" method="post">
					<div class="input-group mb-3">
						<span class="input-group-text">기록할 날짜</span> <input type="date"
							class="form-control" name="bodyInfoDate">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text">오늘의 체중</span> <input type="text"
							class="form-control text-end" name="weight"> <span
							class="input-group-text">Kg</span>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">오늘의 근육량</span> <input type="text"
							class="form-control text-end" name="muscleMass"> <span
							class="input-group-text">%</span>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">신장</span> <input type="text"
							class="form-control text-end" name=height> <span
							class="input-group-text">cm</span>
					</div>

					<button type="submit" class="btn btn-dark">기록 완료</button>
				</form>
			</div>
		</div>

		<h3 class="mt-5">변화 그래프</h3>
		<div class="ct-chart ct-perfect-fourth" id="myChart"></div>

		<h3 class="mt-5">변화 표</h3>
		<table class="table table-hover table-bordered mb-5">
			<thead class="table-light">
				<tr class="text-center">
					<th scope="col">날짜</th>
					<th scope="col">체중</th>
					<th scope="col">체중 전날대비</th>
					<th scope="col">근육량</th>
					<th scope="col">근육량 전날대비</th>
					<th scope="col">BMI</th>
				</tr>
			</thead>

			<tbody>
				<c:choose>
					<c:when test="${requestScope.list ne null}">
						<c:forEach var="view" items="${list}">
							<tr class="text-center">
								<td>${view.bodyInfoDate}</td>
								<td>${view.weight}kg</td>
								<td>${view.weightDifference }</td>
								<td>${view.muscleMass}%</td>
								<td>${view.muscleMassDifference }</td>
								<td>${view.bmi }
									<button type="button" class="btn btn-outline-light modal-btn"
										data-bs-toggle="modal" data-bs-target="#exampleModal">
										ℹ️</button>
								</td>
							</tr>
						</c:forEach>

						<c:forEach var="view" items="${list}" varStatus="status">
							<div class="goal-data" data-weight="${view.weight}"
								data-muscle-mass="${view.muscleMass}"
								data-date="${view.bodyInfoDate}"></div>
						</c:forEach>

					</c:when>
					<c:when test="${requestScope.list eq none }">
						이전 기록이 없습니다, 앞으로 내 몸을 기록해보세요.
					</c:when>
				</c:choose>
			</tbody>
		</table>

		<a href="bodyInfoDelete.do" class="btn btn-light">기록 모두 삭제하기</a>

		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content text-center">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">ℹ️ bmi 정보</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						🟡 저체중 : 20미만 <br> 🟢 정상 : 20~24 <br> 🟠 과체중 : 25~29 <br>
						🔴 비만 : 30 이상 <br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script>
		//HTML 요소 선택
		var goalElements = document.querySelectorAll('.goal-data');

		//데이터 추출
		var data = {
			labels : [],
			series : [ [], [] ]
		// 두 개의 빈 배열을 추가합니다.
		};

		//요소에서 데이터 읽기
		goalElements.forEach(function(element) {
			var weight = parseFloat(element.dataset.weight);
			var muscle = parseFloat(element.dataset.muscleMass);
			var date = element.dataset.date;

			// 데이터 추가 (역순으로 추가)
			data.labels.unshift(date); // 날짜를 맨 앞에 추가
			data.series[0].unshift({
				x : date,
				y : weight
			}); // 첫 번째 배열에 몸무게 데이터 추가
			data.series[1].unshift({
				x : date,
				y : muscle
			}); // 두 번째 배열에 근육량 데이터 추가
		});

		// 차트 옵션 설정
		var options = {
			width : 1100,
			/* height : 350, */
			lineSmooth : false, // 선을 부드럽게 그리지 않음
		};

		// 차트 생성
		new Chartist.Line('.ct-chart', data, options);
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>