<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
					<li id="loginBtn"><a href="login.jsp">로그인</a></li>
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
					</li>
				</ul>
			</div>
		</div>
	</header>