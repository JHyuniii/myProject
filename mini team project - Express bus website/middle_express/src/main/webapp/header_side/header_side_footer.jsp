<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="header_side/header_side.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<header>
		<div id="headerBox">
			<!-- 자바스크립트로 영역마다 바뀌게 해야함 -->
			<div id="line"></div>
			<p id="titleText">회원가입</p>
			<ul id="stage">
				<li id="active">약관동의<i class="xi-long-arrow-right"></i></li>
				<li>본인인증<i class="xi-long-arrow-right"></i></li>
				<li>정보입력<i class="xi-long-arrow-right"></i></li>
				<li>가입완료</li>
			</ul>
			<!--  -->
			<div id="menuList">
				<ul>
					<c:choose>
						<c:when test="${sessionScope.id eq null}">
							<li id="loginBtn"><a href="login.jsp">로그인</a></li>
							<li><a href="phoneCertification.jsp">회원가입</a></li>	
							<li><a href="login.jsp">마이페이지</a></li>	
						</c:when>
						<c:when test="${sessionScope.id ne null }">
							${sessionScope.id } 님 환영합니다!<br/>
							<li id="loginBtn"><a href="logout.do">로그아웃</a><br/></li>
							<li><a href="myPage.jsp">마이페이지</a></li>
						</c:when>
					</c:choose>
					<li><a href=#>결제내역조회</a></li>
					<li><a href=#>사이트맵</a></li>
					<li>
						<select>
							<option selected="selected">한국어</option>
							<option>English</option>
							<option>中文</option>
							<option>日本語</option>
						</select>
						<!-- <i class="xi-angle-down-min"> -->
					</li>
				</ul>
			</div>
		</div>
	</header>
	
	<div id="sideL">
		<div id="goHome" onclick="document.location.href='home.jsp'">
		<i class="xi-bus xi-4x"></i>
		<!-- <img alt="버스" src="images/BusIcon.png"> -->
		<p>고속버스통합예매</p>
		</div>
		<div id="menu">
			<ul>
				<li><a href="reservation.jsp">고속버스예매</a></li>
				<li><a href="confirmation.jsp">예매확인/취소/변경</a></li>
				<li><a href="#">운행정보</a></li>
				<li><a href="#">상품 구매내역</a></li>
				<li>
					<a href="#"><label for="guide_menu">이용안내</label></a>
					<input id="guide_menu" type="checkbox" value="이용안내">
					<ul class="menu2">
						<li><a href="guideMenu_reservation.jsp">예매 안내</a></li>					
						<li><a href="#">승차권 환불안내</a></li>					
						<li><a href="#">국민안전 승무원제 안내</a></li>					
						<li><a href="#">고속버스 운송회사 안내</a></li>					
					</ul>
				</li>
				<li><a href="notice/Notice.jsp">공지사항</a></li>
				<li><a href="#">고객센터</a></li>
				<li><a href="#">전국고속버스운송사업조합</a></li>
				<li><a href="#">터미널사업자협회</a></li>
			</ul>
		</div>
		<div id="wheelchair">
			<p id="smallText">휠체어 좌석<br>예매 사이트</p>
			<p id="bigText">함께가요!<br>행복여행</p>
			<img alt="wheelchair" src="images/wheelchair.png">
		</div>
		<div id="Tmoney">
			<p id="smallText">예매부터 탑승까지!</p>
			<p id="bigText">고속버스<br>티머니</p>
			<img alt="wheelchair" src="images/Tmoney.png">
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="header_side/header_side.js"></script>