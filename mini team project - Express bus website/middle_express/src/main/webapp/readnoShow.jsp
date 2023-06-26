<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header_side/header_Notice.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="header_side/header_side.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<style>
		.pagecustomer{position: absolute; top: 35%; left: 30vw; width: 55vw;}
		.btnscol1{width:100%; text-align: center; margin-top : 50px; margin-bottom: 200px;}
		.btnLbtn_normal{color: white; text-decoration: none; }
		.buttonClass{width:8vw; height: 7vh; border: none; background-color: #B0C4DE; color: white;}
		.buttonClass:hover{background-color : #778899;}
		.noti{font-size: 24px; font-weight: nomal; margin-left:10vw;}
		.titlelabel{border-top:1px solid #DDD; border-bottom: 1px solid #DDD; font-size:16px; display: flex;}
		.titlelabel p{width:60vw;}
		.titlelabel span{width:15vw; float:right; margin:15px; font-size: 14px; color: gray; text-align: right;}
		
	</style>
</head>
<body>
	<div class="pagecustomer">

		<input type="hidden" id="pageIdx" name="pageIdx" value="1" />
		<input type="hidden" id="srchNtcTlNm" name="srchNtcTlNm" value="" />
		<input type="hidden" id="srchLngCd" name="srchLngCd" value="" />
		<input type="hidden" id="srchBltnYn" name="srchBltnYn" value="" />
		
		<div class="noti_wrap hide_mo">
			<p class="noti">고속버스 홈페이지의 새로운 소식을 확인하세요.</p>
		</div>
		<div class="board_view">
			<div class="titlelabel">
				<p>🌟 노쇼방지를 위한 동일카드 예매 횟수 변경 안내</p>
				<span>
					
					2019.08.22
				</span>
			</div>
			
			<div class="cont">
				<p>&nbsp;</p><div><b>[노쇼 방지를 위한 동일 카드 예매 횟수 변경 안내]</b></div><div><br></div><div>○ 적용일 : <b>2019년 8월 17일부터~<br><br></b></div><div>○ 대상 : <b>KOBUS 홈페이지, 고속버스 티머니 APP 예매</b> (터미널 매표소 발권 시는 제외)</div><div><br>○ 변경 내용 :</div><div>- 홈페이지, 모바일 APP 예매 시 출발일 기준 동일 카드로 4회 초과 예매 제한. (1회 - 최대 6장 예매 가능)&nbsp;</div><div>- 홈페이지, 모바일 APP 예매 시 동일 출발일 터미널 매표소 발권 횟수 포함하여 4회 초과 제한.</div><div>&nbsp; (단, 터미널 매표소 발권 시에는 홈페이지, 모바일 APP 예매 횟수 상관없이 발권 가능)</div>
			</div>
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