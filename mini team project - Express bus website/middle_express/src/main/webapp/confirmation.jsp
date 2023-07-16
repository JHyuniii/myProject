<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header_side/header_side_footer.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예매확인</title>
<link rel="stylesheet" href="css/confirmation.css?after">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<div class="headerMenu">
		<ul>
			<li>HOME</li>
			<li><select onchange="location.href=this.value">
					<option value="reservation.jsp">고속버스예매</option>
					<option selected=selected>예매확인</option>
					<option>운행정보</option>
					<option>상품 구매내역</option>
					<option value="guideMenu_reservation.jsp">이용안내</option>
					<option>공지사항</option>
					<option>고객센터</option>
					<option>전국고속버스운송사업조합</option>
					<option>터미널사업자협회</option>
			</select></li>
		</ul>
	</div>
	<section>
		<div id="titleBox">예매내역</div>

		<div class="container col-6 text-center">
			<div class="card border-warning" style="width: 18rem;">
				<img src="images/QRCodeImg.jpg" class="card-img-top">
				<div class="card-body">
					<h5 class="card-title">20230705-1103-392</h5>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><b>출발지</b> ${requestScope.startTerminal}</li>
					<li class="list-group-item"><b>도착지</b> ${requestScope.arriveTerminal}</li>
					<li class="list-group-item"><b>출발일시</b> ${requestScope.startTime}</li>
					<li class="list-group-item"><b>등급</b> ${requestScope.division}</li>
					<li class="list-group-item"><b>승차홈</b> ${requestScope.homeNumber}</li>
					<li class="list-group-item"><b>좌석번호</b> ${requestScope.sitNumber}</li>
					<div class="card-body">
						<a href="reservationWarning.do" class="btn card-link btn-outline-secondary">예매 취소</a>
						<a href="save.do" class="btn card-link btn-success">승차권 저장</a>
					</div>
			</div>
		</div>


		<ul id="information">
			<li>·과거 예매 내역은 출발일 날짜 기준 당일까지, 예매 취소 내역은 과거 3개월까지 조회 가능합니다.</li>
			<li>·<strong>홈티켓으로 발권된 내역은 변경이 불가</strong>하니 변경을 원하시면 취소 후 다시
				예매를 진행하시기 바랍니다.
			</li>
			<li>·마일리지 구매 승차권은 시간변경이 불가하니 변경을 원하시면 취소 후 다시 예매를 진행하시기 바랍니다.</li>
			<li>·마일리지 승차권 취소 시, 마일리지 수수료 정책에 따라 처리됩니다.
				<ul class="dash_list">
					<li>-출발 시간 이전 취소 시 100% 마일리지 환급</li>
					<li>-출발 시간 이후 취소 시 100% 마일리지 차감</li>
				</ul>
			</li>
			<li>·신용카드 예매 취소 또는 변경 시 일주일 내로 예매했던 카드로 청구 취소 처리가 되면서 반환됩니다.</li>
			<li>·<strong>시간변경은 취소 위약금을 부과하지 않습니다.</strong></li>
			<li>·모바일앱에서 예매하신 내역의 변경을 원하시면 고속버스 티머니 앱으로 접속하셔서 시도하시기 바랍니다.</li>
			<li>·모바일 환경에서는 홈티켓 발행 및 재발행 기능이 지원되지 않으니 PC로 접속하셔서 이용하시기 바랍니다.</li>
			<li>·프리패스의 경우, 사용 시작일 이전 취소가 가능하며 구매금액의 100%가 지급됩니다.<br>
				프리패스 사용 시작 1일 후까지 취소 가능하나, 승차권 발권 상태인 경우 취소 불가능합니다.
			</li>
			<li>·고속버스 정기권을 이용한 승차권 예매, 취소 안내
				<ul class="dash_list">
					<li>-정기권으로 예매한 승차권은 버스 출발 시간 전까지 취소 후 다시 승차권 예매가 가능합니다.</li>
					<li>-<strong>정기권으로 예매한 승차권을 취소하지 않고 출발 시간이 지났을 경우
							해당일의 동일 방향(편도) 재이용이 불가합니다.</strong></li>
					<li>-정기권을 이용한 승차권 예매 및 발권은 차량 좌석이 있는 경우에만 사용이 가능합니다.</li>
				</ul>
			</li>
		</ul>
	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>