<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header_side/header_side_footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="css/guideMenu_transportCompany.css?after">
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
					<option value="guideMenu_crew.jsp">국민안전 승무원제 안내</option>
					<option selected = selected>고속버스 운송회사 안내</option>
				</select>
			</li>
		</ul>
	</div>
	<section>
		<p id="Text1">고속버스 운송회사 목록입니다.<br><span>각 운송사별 홈페이지에서 자세한 정보 확인이 가능합니다.</span></p>
		<div id="Table">
			<div class="terms_wrap">
				<table id="companyTable">
					<tr>
						<th>고속회사</th>
						<th>주소</th>
						<th>전화번호</th>
					</tr>
					<tr>
						<td>전국고속버스운송사업조합</td>
						<td>서울시 서초구 반포동 19-4서울고속터미널 9층</td>
						<td colspan="2">02)536-6461 <span>바로가기 ></span></td>
					</tr>
					<tr>
						<td>금호고속(주)</td>
						<td>광주광역시 서구 무진대로 904(광천동,광천터미널)</td>
						<td colspan="2">1544-4888 <span onclick="document.location.href='https://www.kumhobuslines.co.kr/fr/main/main'">바로가기 ></span></td>
					</tr>
					<tr>
						<td>(주)동부고속</td>
						<td>서울특별시 서초구 신반포로 194, 924호<br>
							(반포동, 서울고속버스터미널)</td>
						<td colspan="2">1688-3287 <span onclick="document.location.href='http://www.dongbubus.com/jsp/express/main/index.jsp'">바로가기 ></span></td>
					</tr>
					<tr>
						<td>(주)동양고속</td>
						<td>경기도 안양시 동안구 홍안대로 67(호계동)</td>
						<td colspan="2">02)535-3111 <span onclick="document.location.href='http://www.dyexpress.co.kr/'">바로가기 ></span></td>
					</tr>
					<tr>
						<td>(주)삼화고속</td>
						<td>인천광역시 중구 서해대로 418번길 70(신흥동3가,2층)</td>
						<td colspan="2">032)508-1580 <span onclick="document.location.href='http://www.samhwaexpress.co.kr/'">바로가기 ></span></td>
					</tr>
				</table>
			</div>
		</div>	
	</section>
</body>
</html>