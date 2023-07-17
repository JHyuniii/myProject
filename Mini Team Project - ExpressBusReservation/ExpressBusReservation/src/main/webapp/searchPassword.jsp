<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<%--<c:choose> --%>
<%-- <c:when test="${userInfo eq null}">--%>
      <div class="page">
      <form action = "searchPassword.do" method="post">
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
               <p class = "first_p">비밀번호 &nbsp;&nbsp;<span>${password}</span></p> <%--비밀번호 추가하는곳 --%>
               
            </div>
         </div>
         <div class = "wrapper">
            <a href="#"><button class = "btn_password" id="passwordOK">로그인하기</button></a>
         </div>
      </div>
<%-- </c:when>--%>
<%-- </c:choose>--%>
</body>
</html>