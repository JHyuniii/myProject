<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header_side/header_side_footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="css/guideMenu_crew.css?after">
</head>
<body>
	<div class="headerMenu">
		<ul>
			<li>HOME</li>
			<li>
				<select onchange="location.href=this.value">
					<option>고속버스예매</option>
					<option value="confirmation.jsp">예매확인</option>
					<option>운행정보</option>
					<option>상품 구매내역</option>
					<option selected = selected>이용안내</option>
					<option>공지사항</option>
					<option>고객센터</option>
					<option>전국고속버스운송사업조합</option>
					<option>터미널사업자협회</option>
				</select>
			</li>
			<li>
				<select onchange="location.href=this.value">
					<option value="guideMenu_reservation.jsp">예매 안내</option>
					<option value="guideMenu_refund.jsp">승차권 환불안내</option>
					<option selected = selected>국민안전 승무원제 안내</option>
					<option value="guideMenu_transportCompany.jsp">고속버스 운송회사 안내</option>
				</select>
			</li>
		</ul>
	</div>
	<section>
		<p id="Text1">국민안전 승무원제<br><span>국민안전 승무원제 해당 좌석은 3번 좌석입니다.</span></p>
		<p id="Text2">국민안전 승무원제란?</p>
		<p id="Text3">3번 좌석을 이용하는 승객이 교통사고나 화재가 발생하였을경우 <span>다른 승객들의 안전을 확보하는데 도움을 주고</span> 고속버스의 이상 운행 및 이상 징후 포착시 운전기사에게 알려 <span>교통사고를 예방하고 피해를 최소화하고자</span> 도입한 자율적 참여제도입니다.</p>
		<p id="Text2">혜택</p>
		<p id="Text3">고속버스 통합 홈페이지 (www.kobus.co.kr) 또는 모바일 앱 회원으로 가입후 해당 노선의 프리미엄 <span>고속버스 3번 좌석</span>을 예매하였을 경우 <span>요금의 2% 마일리지 적립 및 추가로 1% 마일리지가 적립</span>됩니다.</p>
		<ul id="crewList">
			<li>온라인 예매 시 국민안전 승무원 좌석의 동의 여부를 확인 후 동의 시에만 마일리지 추가 적립됩니다.</li>
			<li>프리미엄 요금할인 노선과 비회원 및 터미널 현장 예매로 이용하였을 경우 적립되지 않습니다.</li>
		</ul>
		<img src="images/guideMenu_crew.png">
	</section>
</body>
</html>