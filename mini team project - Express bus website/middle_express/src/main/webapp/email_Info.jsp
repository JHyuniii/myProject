<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header_side/header_email.jsp" %>      
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
	.container-box{border: 1px solid #D3D3D3; padding : 50px;}
	.present{background-color: #D3D3D3; margin: 15px;}
	.email_info, .password_pre{background-color: #D3D3D3; border:none; padding-top:10px;}
	.presize{width : 30vw; font-weight: bold; color: #696969; font-size:16px;}
	::placeholder{font-size: 18px; color : #808080;}
	input[type="email"], input[type="password"]{height: 30px;}
	.email_sub{width:15vw; height: 5vh; margin-top:30px; border:none;margin-left: 35%; margin-right:40%; background-color: #B0C4DE; color: white; font-size:15px;} 
	.email_sub:hover{background-color:#778899;}
	input[type="password"], input[type="email"]{width : 47vw;}
	.h2_blue{text-align: center;}
</style>

</head>
<body>
<div class = "container">
	<form action = "chgEmail.do" method = "post" id="myForm" >
		<h2 class = "h2_blue">현재 사이트에 등록된 비밀번호와 변경하실 새로운 이메일주소를 입력하세요.</h2>
		<div class = "container-box">
			<div class = "present">
				<div style = "padding:10px;">
					<label for = "pre" class = "presize">비밀번호</label><br>
					<input type = "password"  class = "password_pre" name = "" id = "pre" placeholder="현재 사이트에 등록된 비밀번호를 입력하세요.">
				</div>
			</div>
			
			<div class = "present">
				<div style = "padding:10px;">
					<label for = "email" class = "presize">이메일</label><br>
					<input type = "email"  class = "email_info" name = "" id = "email" placeholder="이메일 주소를 입력하세요.">				
				</div>
			</div>
		</div>
		<input type= "submit" value = "변경하기" class = "email_sub" id = "email_sub">
	</form>
</div>
<script>
const form = document.querySelector("#myForm");
const emailSub = document.querySelector("#email_sub");
const password_pre = document.querySelector("#pre");
const email_pre = document.querySelector("#email");

form.addEventListener("submit", function(event){
  event.preventDefault();

  if (password_pre.value === "") {
    alert("비밀번호를 입력하세요");
    password_pre.focus();
    return;
  } else if (email_pre.value === "") {
    alert("이메일을 입력하세요");
    email_pre.focus();
    return;
  }

  form.submit();
});

emailSub.addEventListener("click", function(){
  if (password_pre.value !== "" && email_pre.value !== "") {
    alert("이메일이 성공적으로 변경되었습니다.");
  }else{
	  return false;
  }
});

</script>
</body>
</html>