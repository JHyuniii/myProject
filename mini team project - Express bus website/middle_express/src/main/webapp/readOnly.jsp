<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header_side/header_Notice.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="header_side/header_side.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		.page{position: absolute; top: 35%; left: 30vw; width: 55vw;}
		.noti{font-size: 24px; font-weight: nomal; margin-left:10vw;}
		.titlelabel{border-top:1px solid #DDD; border-bottom: 1px solid #DDD; font-size:16px; display: flex;}
		.titlelabel p{width:40vw; margin-left: 15px;}
		.titlelabel span{width:15vw; float:right; margin:15px; font-size: 14px; color: gray;}
		.btnscol1{width:100%; text-align: center; margin-top : 50px; margin-bottom: 200px;}
		.btnLbtn_normal{color: white; text-decoration: none; }
		.buttonClass{width:8vw; height: 7vh; border: none; background-color: #B0C4DE; color: white;}
		.buttonClass:hover{background-color : #778899;}
</style>
</head>
<body>
	<div class = "page">
		<div class="noti_wrap hide_mo">
			<p class="noti">고속버스 홈페이지의 새로운 소식을 확인하세요.</p>
		</div>
		<div class="board_view">
			<div class="titlelabel">
				<p> 개인정보 처리방침 약관 개정 안내</p>
				<span style ="text-align: right">
					
					2021.06.21
				</span>
			</div>
	
		</div>
		<div class="cont">
				<span style="font-size: 11pt;">﻿</span><br><div style="text-align: center;" align="center"><b><span style="font-size: 11pt;">비회원 예매 프로세스 변경 관련 안내 (12/30~)</span></b></div><span style="font-size: 11pt;">&nbsp;<br></span><br><span style="font-size: 11pt;">비회원 예매 프로세스가 기존 로그인 방식에서 인증 방식으로 변경됩니다.</span><br><span style="font-size: 11pt;"><br>고속버스티머니 APP 최신버전을 사용하시는 분들은, 홈페이지에서 비회원 예매한 내역을 APP에서 조회 시<br>기존 로그인 방식으로는 불가한 경우, 결제한 카드번호로 예매내역 조회를 부탁드립니다.&nbsp;</span><br>
		</div>
		
		
		
		<div class="btnscol1">
			<button class = "buttonClass" id = "mybuttondd" ><a href="Notice.jsp" class="btnLbtn_normal">목록</a></button>
		</div>
	</div>


	<script>
<%--버튼 아무데나 클릭하면 넘어감 --%>
const button = document.querySelector("#myButtondd");
button.addEventListener("click", function() {
  window.location.href = "Notice.jsp";
});
</script>
</body>
</html>