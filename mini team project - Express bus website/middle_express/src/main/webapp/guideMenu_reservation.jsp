<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header_side/header_side_footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예매 안내</title>
<link rel="stylesheet" href="css/guideMenu_reservation.css?after">
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
					<option selected = selected>예매 안내</option>
					<option value="guideMenu_refund.jsp">승차권 환불안내</option>
					<option value="guideMenu_crew.jsp">국민안전 승무원제 안내</option>
					<option value="guideMenu_transportCompany.jsp">고속버스 운송회사 안내</option>
				</select>
			</li>
		</ul>
	</div>
	<section>
		<p id="Text1">홈페이지를 통한 예매는 <br>당일 출발하는 차량의 출발시간 한 시간 이전까지 예매 가능합니다.</p>
		<h3 id="Text2">승차권 예매/발권</h3>
		<ul id="guideText">
			<li>
				<img src="images/guideMenu_icon1.png">
				<p>예매하신 승차권의 창구발권은 출발시간 이전에 출발지 터미널에서 발권이 가능하며 예매에 사용하신 신용카드를 지참해주시기 바랍니다.</p>
			</li>
			<li>
				<img src="images/guideMenu_icon2.png">
				<p>예매에 사용하신 신용카드를 분실하고 신용카드 번호를 인지 못하신 경우에는 승차권에 대한 어떠한 변경/취소 불가하오니 주의하시기 바랍니다.</p>
			</li>
			<li>
				<img src="images/guideMenu_icon3.png">
				<p>승차권 예매 서비스는 실시간으로 온라인 처리가 되므로 예매 시 회선장애나 기타 통신장애로 인하여 성공여부를 확인하지 못하였을 경우 반드시 본 홈페이지의 <span onclick="document.location.href='confirmation.jsp'" id="goConfirmation">예매확인/취소/변경</span> 메뉴에서 성공여부를 확인하셔야 합니다.</p>
			</li>
			<li>
				<img src="images/guideMenu_icon4.png">
				<p>출발시간이 지난 후에는 승차권 발권이 불가합니다. 창구 발권 시 반드시 출발시간 이전에 터미널에 도착하셔서 발권 받으시기 바랍니다.</p>
			</li>
			<li>
				<img src="images/guideMenu_icon5.png">
				<p>홈페이지의 ‘홈티켓’서비스를 이용해서 인쇄하시면 별도의 창구발권이 필요없습니다.</p>
			</li>
			<li>
				<img src="images/guideMenu_icon6.png">
				<p>예매시 ‘모바일티켓’ 발권을 선택하시면 별도 발권절차 없이 고속버스 모바일앱으로 승차가 가능합니다.</p>
			</li>
		</ul>
		<h3 id="Text2">수수료</h3>
		<p id="Text3">·승차권 예매를 취소하실 경우 출발일자를 기준으로 취소 수수료가 부과됩니다.</p>
		<div id="Table">
			<div class="terms_wrap">
				<h1>취소수수료</h1>
				<table>
					<tr>
						<th>취소시기</th>
						<th>수수료</th>
					</tr>
					<tr>
						<td>예매 당일 또는 승차일 2일전 취소<br>
							(단, 당일출발차량 예매 후 1시간 이후 취소는 수수료 발생)</td>
						<td>없음</td>
					</tr>
					<tr>
						<td>예매 후 출발일 1일 전일부터 지정차 출발 1시간 전 취소<br>
							(단, 당일출발차량 예매 후 1시간 이내 취소는 수수료 없음)</td>
						<td>승차권 요금의 5%</td>
					</tr>
					<tr>
						<td>예매 후 지정차 출발 1시간 이내 취소<br>
							(단, 당일출발차량 예매 후 1시간 이후 취소는 수수료 발생)</td>
						<td>승차권 요금의 10%</td>
					</tr>
					<tr>
						<td>예매하신 지정차 출발 후 목적지 도착예정시간 전 취소</td>
						<td>승차권 요금의 30%</td>
					</tr>
					<tr>
						<td>마일리지 구매 승차권 : 출발시간 이전 취소</td>
						<td>마일리지 100% 환급</td>
					</tr>
					<tr>
						<td>마일리지 구매 승차권 : 출발시간 이후 취소</td>
						<td>마일리지 100% 차감</td>
					</tr>
				</table>
				<p id="Text3">·승차권 예매내역을 변경할 경우 어떠한 수수료도 부과되지 않습니다. 변경은 시간/매수/등급 변경이 출발시간 1시간 이전 1회에 한해서 가능합니다.
					예매 사항의 변경 시 일자변경은 불가하오니 최초예매시 주의하시기 바랍니다.</p>
				<p id="Text3">·마일리지 구매 승차권은 시간변경이 불가하니 변경을 원하시면 취소 후 다시 예매를 진행하시기 바랍니다.</p>
			</div>
		</div>	
	</section>
</body>
</html>