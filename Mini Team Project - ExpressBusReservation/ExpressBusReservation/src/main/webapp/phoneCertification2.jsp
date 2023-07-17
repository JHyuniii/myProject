<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header_side/header_side_footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>본인인증</title>
<link rel="stylesheet" href="css/phoneCertification2.css">
</head>
<body>
<section>
	<p id="titleText">본인인증을 위한 휴대폰번호를 입력해주세요.</p>
	<div class="inputBox">
		<div id="box">
			<p>휴대폰번호</p>
			<input type="text" id="phoneNum" placeholder="휴대폰번호를 입력하세요.	">
		</div>
	</div>
	<input type="button" id="sendNum" value="인증번호 발송">
</section>
</body>
</html>