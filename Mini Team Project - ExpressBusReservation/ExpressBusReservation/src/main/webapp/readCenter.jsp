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
				<p>🌟 고객센터 점심시간 운영 안내</p>
				<span>
					
					2019.08.09
				</span>
			</div>
			
			<div class="cont">
				<p>&nbsp;</p><div>안녕하십니까. 티머니 입니다.</div><div>항상 저희 티머니를 이용해주시는 고객님께 깊은 감사를 드립니다.</div><div><br></div><div><b>2019년 9월 1일부터 고객센터 점심시간이 다음과 같이 운영되어 안내드리오니 이용에 참고하여 주시기 바랍니다.&nbsp;</b></div><div><br></div><div><b>■ 고객센터 점심시간 운영 안내</b></div><div><br></div><div><b>○ 점심시간 : 12시~13시</b></div><div>○ 상담 제한 안내</div><div><b>- 점심시간에는 ARS 안내, 문자서비스, 장애 상담만 가능합니다.</b></div><div><b>- 일반 상담 업무는 제한되며, 13시 이후부터 모든 상담이 가능합니다.</b></div><div><br></div><div>앞으로 더 좋은 상담 품질 서비스가 제공될 수 있도록 노력하겠습니다.</div><div><br></div><div>감사합니다.</div><div><br></div><p>&nbsp;</p>
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