<%-- <%@page import="com.expressbus.www.DTO.memManageDTO"%>--%>
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
   <form action = "searchId.do" method="post">
      <div class = "container">
         <div class = "container-box">
            <div class = "find_id">
               <label for="email" class ="email_label">이메일</label><br>
               <input type="email" name = "email" id = "email" class="email_input" size = "40" placeholder="이메일 찾기" >
            </div>
            <div>
               <input type="submit" value = "확인" class = "email_submit">   
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
               <p class = "first_p">회원님의 아이디는 다음과 같습니다.</p>
               <div class = "comtainer_content_box">
                  <h3>아이디 : ${id}</h3>             
               </div>
               
                  <p>→ 개인정보 보호를 위하여 일부 글자가 *로 표시됩니다.</p>
            </div>
         </div>
         <div class = "wrapper">
            <a href="#"><button class = "btn_password" >비밀번호 찾기</button></a>
            <a href="#"><button class = "btn_login">로그인</button></a>
         </div>
      </div>
   <%-- </c:when>--%>
<%-- </c:choose>--%>
</body>
</html>