<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="header_side/myPageOK.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<header>
		<div id="headerBox">
			<!-- 자바스크립트로 영역마다 바뀌게 해야함 -->
			<div id="line"></div>
			<p id="titleText">마이페이지</p>
			<!--  -->
			<div id="menuList">
				<ul>
					<li id="loginBtn"><a href="#">로그인</a></li>
					<li><a href="phoneCertification.jsp">회원가입</a></li>
					<li><a href=#>마이페이지</a></li>
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
			<div class = "container_OK">
					<div class = "container-box">
						<span class="fileABC">📄</span><br>
						<p>나의 예매내역</p><br>
						<span>${userInfo.buy }테스트</span><br><br>
						<hr>
						<a href = "#" class="OKABC">예매확인/변경/취소<span class= "span_b"> ></span></a>
					</div>
					<div class = "container-box">
						<span class= "cardABC">📇</span>
						<p>나의 예매내역</p><br>
						<span>${userInfo.buy }테스트</span><br><br>
						<hr>
						<div>
							<a href = "#" class="InquiryABC">결제내역조회<span class= "span_b"> ></span></a>
							<a href = "#" class="buyABC">구매내역확인<span class= "span_b"> ></span></a>				
						</div>
					</div>
			</div>
			
		</div>
	</header>
<div class="wrapper">
	<div id="sideL">
		<div id="goHome">
		<i class="xi-bus xi-4x"></i>
		<!-- <img alt="버스" src="images/BusIcon.png"> -->
		<p>고속버스통합예매</p>
		</div>
		<div id="menu">
			<ul>
				<li><span>고속버스예매</span></li>
				<li><span>예매확인</span></li>
				<li><span>운행정보</span></li>
				<li><span>고속버스 프리패스/정기권</span></li>
				<li><span>이용안내</span></li>
				<li><span>공지사항</span></li>
				<li><span>고객센터</span></li>
				<li><span>전국고속버스운송사업조합</span></li>
				<li><span>터미널사업자협회</span></li>
			</ul>
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
	</div>
</div>