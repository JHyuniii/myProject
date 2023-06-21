<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 중복확인</title>
</head>
<body>
	<form action="checkRedundancy.do" method="post">
    아이디 : <input type="text" name="idCheck" placeholder="아이디를 입력하세요." required>
    <input type="submit" value="중복 확인">
</form>
<c:if test="${checkId eq -1}">
    <script>alert("해당 아이디는 사용중입니다. 다른 아이디를 입력해주세요.");</script>
</c:if>
<c:if test="${checkId eq 1}">
    <form action="joinMembership.jsp" method="post">
        <input type="hidden" name="hiddenId" value="${okId }">
        해당 아이디는 사용할 수 있습니다. <br>
        <input type="submit" value="이 아이디로 가입하기">
    </form>
</c:if>
</body>
</html>