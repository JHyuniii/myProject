<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>  
<%@ include file="header_side/header_side_footer.jsp" %>  
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="header_side/header_side.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{position: absolute; top : 350px; left : 30vw; }
	.container h2{font-weight: lighter;}
	.container-box{border: 1px solid #D3D3D3; padding : 50px; width: 50vw;}
	.present{background-color: #D3D3D3; margin: 15px;}
	.password_pre, .password_info, .passwordOK_info{background-color: #D3D3D3; border:none; padding-top:10px; font-size:17px;}
	.presize{width : 30vw; font-weight: bold; color: #696969; font-size:16px;}
	.p-size{margin : 15px; font-size: 13px; color : #696969;}
	.h2_blue{text-align: center;}
	input[type="password"]{width:45vw;}
	.btn_sub{border: none;width: 15vw; margin-left:37%; margin-right: 37%;height: 5vh; margin-top:30px;background-color: #B0C4DE; color: white; font-size:15px;}
	.btn_sub:hover{background-color: #778899;}
</style>


</head>
<body>
<form action = "chgPw.do" method="post">
	<div class = "container">
		<h2 class = "h2_blue">안전한 고속버스 홈페이지 사용을 위하여<br>새로운 비밀번호로 교체하세요.</h2>
		<div class = "container-box">
			<div class = "present">
				<div style = "padding:10px;">
					<label for = "pre" class = "presize">현재 비밀번호</label><br>
					<input type = "password" class = "password_pre" name = "password" id = "prePassword" placeholder="현재 비밀번호를 입력하세요">
				</div>
			</div>
			<div class = "present">
				<div style = "padding:10px;">
					<label for = "newPassword" class = "presize">새 비밀번호</label><br>
					<input type = "password" class = "password_info"  name = "newPassword" id = "newPassword" placeholder="영문, 숫자 8자리 이상">
				</div>
			</div>
			<div class = "present">
				<div style = "padding:10px;">
					<label for = "newPasswordOK" class = "presize">새 비밀번호 확인</label><br>
					<input type = "password" class = "passwordOK_info"  id = "newPasswordOK" placeholder="새 비밀번호를 재입력하세요">
				</div>
			</div>
		</div>
		<div>
			<input type="submit" value = "비밀번호 변경" class = "btn_sub">
		</div>
	</div>
</form>
<script>
const form = document.querySelector("form");
const pre_Password = document.querySelector("#prePassword");
const new_Password = document.querySelector("#newPassword");
const new_PasswordOK = document.querySelector("#newPasswordOK");
form.addEventListener("submit", function(event) {
       event.preventDefault();
    if (pre_Password.value === "") {
        alert("현재 비밀번호를 입력하세요.");
        return;
    }else if(!new_Password.value){
    	alert("새 비밀번호를 입력해주세요");
    	new_Password.focus();
    	return;
    }else if(!new_PasswordOK.value){
    	alert("새 비밀번호 확인을 입력해주세요.");
    	new_PasswordOK.focus();
    	return;
    }else if(new_Password.value !== newPasswordOK.value){
    	alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    	new_Password.focus();
    	return;
    }
    form.submit();
    
});

	
</script>
</body>
</html>