<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header_side/header_side_footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="css/guideMenu_refund.css?after">
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
					<option selected = selected>승차권 환불안내</option>
					<option value="guideMenu_crew.jsp">국민안전 승무원제 안내</option>
					<option value="guideMenu_transportCompany.jsp">고속버스 운송회사 안내</option>
				</select>
			</li>
		</ul>
	</div>
	<section>
		<p id="Text1">카드결제, 계좌이체, 프리미엄 마일리지로 예매한<br>고속버스 승차권 환불 규정에 대한 안내입니다.</p>
		<p id="Text2">승차권 환불 규정</p>
		<div id="circle"><img src="images/guideMenu_refund_icon.png"></div>
		<ul id="refundText">
			<li>승차권을 환불하신 후(승객용) 승차권을 교부 받으시면 정상적으로 환불 처리가 되었음을 의미하며 안심하셔도 됩니다.</li>
			<li>신용카드의 청구 및 환불은 결제일에 일괄적으로 정산처리됩니다. (카드사, 개인 결제일자별 차이가 있습니다.)</li>
			<li>신용카드 결제일에 청구되는 금액은 원칙적으로 사용금액(+)에서 환불금액(-)을 차감한 금액입니다. (카드사 사정에 의해 모두 청구한 후 환불금액만 따로 계좌로 입금될 수도 있습니다. 따라서 결제일을 전후하여 신용카드사에서 발송한 청구서와 계좌(통장)의 입출금 내역을 같이 확인하시기 바랍니다.)</li>
			<li>승차권 구입일자와 환불일자가 다르면 다음 결제일에 환불될 수도 있습니다.</li>
			<li>고속조합에서는 고객의 개별적인 승인취소 요청에 대해 처리해드리지 않사오니 양해 부탁드립니다.</li>
			<li>카드사 홈페이지에서 고속버스승차권의 이용내역을 조회하실 경우 가급적 결제일을 전후하여 청구내역(거래승인내역이 아님)을 조회하시기 바랍니다. 또한 카드사의 사정에 따라 환불내역이 조회되지 않을 수 있습니다.</li>
			<li>신용카드 승차권의 환불은 구입했을 당시의 신용카드로 환불됩니다. 타인의 신용카드로 구입한 승차권 환불 시 본인은 환불 받으실 수 없습니다.</li>
			<li>계좌이체 예매취소 시 즉시 예매 당시의 출금계좌로 입금되나 장애 발생 시 최대 1시간까지 입금이 지연될 수도 있습니다.</li>
			<li>프리미엄 마일리지로 예매한 승차권 취소 시, 마일리지 수수료 정책에 따라 처리됩니다.<br>
					- 출발시간 이전 취소 시 100% 마일리지 환급<br>
					- 출발시간 이후 취소 시 100% 마일리지 차감
			</li>
		</ul>
	</section>
</body>
</html>