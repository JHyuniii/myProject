<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="header_side/header_side_footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.page{    position: absolute;
			    width: 80%;
			    top: 35vh;
			    margin: 0 auto;
			    padding: 0;
			    left: 20vw;}
	.container{ border: 1px solid #DCDCDC; display: flex; padding : 20px; width: 60vw; margin:0 auto;}
	.id_label{font-size:16px; padding:10px; padding-top:10px; color: #gray;}
	.id_input{padding: 10px; margin-top: 10px; border:none; background-color:#F0F8FF;}
	::placeholder{color:#778899; font-size: 16px;}
	.find_password{background-color: #F0F8FF;}
	.id_submit{width:15vw; height: 10vh; margin-left: 10px; color: white; background-color:#778899; border:none; font-size: 1.5em;}
	.container-box{margin: 0 auto; display: flex;}
	.h3_email{left: 40vw; font-weight: lighter; width: 80%; text-align: center; margin-left:5vw;}
	
	.page_wrap{ position: absolute;
			    width: 80%;
			    top: 65vh;
			   
			    padding: 0;
			    left: 20vw; }
	.container_wrap{ border: 1px solid #DCDCDC; display: flex; padding : 20px; width: 60vw; margin:0 auto;}
	.container_content{ margin-left : 20%;}
	.first_p{padding:10px;}
	.wrapper{ margin: 10px;left: 50vw;width: 80%;}
	.btn_password{width: 13vw; height: 8vh; margin-right: 15px; background-color:#B0C4DE; color: white; border: none; margin-left: 32vw;}
	.btn_password>a{text-decoration: none; color:white;}
	.btn_login>a{text-decoration: none; color:white;}
	.btn_login:hover{background-color:#778899;}
	.btn_password:hover{background-color:#778899;}
	
	
	
</style>
</head>
<body>
<%--<c:choose> --%>
<%-- <c:when test="${userInfo eq null}">--%>
		<div class="page">
		<form action = "" method="post">
				<h2 class = "h3_email">회원가입 시 입력한 정보를 입력하세요.</h2>
			<div class = "container">
				<div class = "container-box">
					<div class = "find_password">
						<label for="id" class ="id_label">아이디</label><br>
						<input type="text" name = "id" id = "id" class="id_input" size = "40" placeholder="아이디를 입력하세요" >
					</div>
					<div>
						<input type="submit" value = "확인" class = "id_submit">	
					</div>
				</div>
			</div>
		</form>
		</div>
<%--</c:when> --%>
<%-- <c:when test="${userInfo ne null }">--%>
	
		<div class = "page_wrap">
			<div class = "container_wrap">
				<div class="container_content">
					<p class = "first_p">비밀번호 &nbsp;&nbsp;<span>${userInfo.password}</span></p> <%--비밀번호 추가하는곳 --%>
					
				</div>
			</div>
			<div class = "wrapper">
				<a href="#"><button class = "btn_password" id="passwordOK">로그인하기</button></a>
			</div>
		</div>
<%-- </c:when>--%>
<%-- </c:choose>--%>
<script>
	
</script>
</body>
</html>