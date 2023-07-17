<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="header_side/header_side_footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
      <h2 style = "text-align: center">안전한 고속버스 홈페이지 사용을 위하여<br>새로운 비밀번호로 교체하세요.</h2>
      <div class = "container-box">
         <div class = "present">
            <label for = "pre">현재 비밀번호</label>
            <input type = "password" class = "password_pre" name="password" id = "pre" placeholder="현재 비밀번호를 입력하세요">
         </div>
         <div class = "present">
            <label for = "pre">새 비밀번호</label>
            <input type = "password" class = "password_info" name="newPassword" id = "pre" placeholder="영문, 숫자 8자리 이상">
         </div>
         <div class = "present">
            <label for = "pre">새 비밀번호 확인</label>
            <input type = "password" class = "passwordOK_info" id = "pre" placeholder="새 비밀번호를 재입력하세요">
         </div>
         <ul>
            <li>비밀번호 변경 시 고속버스 모바일앱 에서도 동일하게 적용됩니다.</li>
         </ul>
      </div>
      <div>
         <input type="submit" value = "비밀번호 변경" class = "btn_sub">
      </div>
   </div>
</form>
</body>
</html>