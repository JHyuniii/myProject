<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header_side/header_side_footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="css/membership.css">
<%-- <style>
	<%@ include file="header_side/header_side.css" %>
</style> --%>
</head>
<body>
<section>
	<p id="titleText">회원정보를 입력해주세요.</p>
	<div id="information"> 
	<form action="membership.do" method="get">
		<div class="inputBox">
			<div class="box">
				<p>아이디</p>
				<input type="text" id="id" placeholder="아이디를 입력하세요.">
			</div>
			<div class="box">
				<p>비밀번호</p>
				<input type="password" id="password" placeholder="영문, 숫자 8자리 이상">
			</div>
			<div class="box">
				<p>비밀번호 확인</p>
				<input type="password" id="passwordCheck" placeholder="비밀번호를 재입력하세요.">
			</div>
			<div class="box">
				<p>이메일</p>
				<input type="email" id="email" placeholder="보조 이메일주소를 입력하세요.">
			</div>
			<div class="box">
				<p>출생년도</p>
				<select name="YOB" id="select">
					<option value="" disabled selected>선택하세요.</option>
					<c:set var="valueText" value="2009" />
					<c:forEach var="year" begin="1924" end="${valueText}" step="1">
						<option value="${valueText }">${valueText }</option>
						<c:set var = "valueText" value="${valueText-1 }" />
					</c:forEach>
				</select>
			</div>
			<div class="box" id="sexBox">
				<p>성별</p>
				<input type="radio" name="sex" value="f" id="f">
				<label for="f">여자 ♀</label>
				<input type="radio" name="sex" value="m" id="m">
				<label for="m">남자 ♂</label>
			</div>
			<h4>개인정보 수집 및 이용동의<span>(선택)</span></h4>
			<span class="check">
				<input type="checkbox" id="agree" class="checkBox">
				<label for="agree"><i class="xi-check"></i>동의</label>
			</span>
			<div class="scrollBox" id="scrollBox">
				<div class="terms_wrap">
					<h1>[필수] 개인정보 수집 및 이용에 관한 동의</h1>
					<table>
						<tr>
							<th>수집 및 이용목적</th>				
							<th>수집 및 이용 항목</th>				
							<th>보유기간</th>				
						</tr>
						<tr>
							<td>회원 관리 및 서비스 제공</td>
							<td>이메일주소, 비밀번호, 휴대전화번호</td>
							<td>동의 철회 또는 회원 탈퇴 시 까지 (단, 관련 법령에 별도의 규정이 있는 경우에는 그 기간을 따름)</td>
						</tr>
					</table>
					<p>동의를 거부할 경우 회원가입이 불가합니다.</p>
				</div>
			</div>	
		<input type="submit" value="회원가입">
		</div>
	</form>
	</div>
</section>
<script>

</script>
</body>
</html>