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
		.page{position: absolute; top: 35%; left: 30vw; width: 55vw;}
		.noti{font-size: 24px; font-weight: nomal; margin-left:10vw;}
		.titlelabel{border-top:1px solid #DDD; border-bottom: 1px solid #DDD; font-size:16px; display: flex;}
		.titlelabel p{width:40vw;}
		.titlelabel span{width:15vw; float:right; margin:15px; font-size: 14px; color: gray;}
		.btnscol1{width:100%; text-align: center; margin-top : 50px; margin-bottom: 200px;}
		.btnLbtn_normal{color: white; text-decoration: none; }
		.buttonClass{width:8vw; height: 7vh; border: none; background-color: #B0C4DE; color: white;}
		.buttonClass:hover{background-color : #778899;}
		.page_b{position: absolute; top:55%; width: 55vw; left: 27vw;}
		.img_cl{width: 60vw; height: 70vh;}
	</style>
</head>
<body>
	<div class = "page">
		<div class="noti_wrap hide_mo">
			<p class="noti">고속버스 홈페이지의 새로운 소식을 확인하세요.</p>
		</div>
		<div class="board_view">
			<div class="titlelabel">
				<p>🌟 강원도 노선 업무 제휴 업체 리스트(동부고속)</p>
				<span style ="text-align: right">
					
					2019.02.26
				</span>
			</div>
	
		</div>
	</div>
	<div class= "page_b">
		<img src = "images/im4.png" alt="img4" class = "img_cl">
		<img src = "images/im5.png" alt="img5" class = "img_cl">
		<img src = "images/im6.png" alt="img6" class = "img_cl">
		<img src = "images/im7.png" alt="img7" class = "img_cl">
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