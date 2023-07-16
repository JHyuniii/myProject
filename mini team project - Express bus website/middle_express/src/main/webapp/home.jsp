<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header_side/header_side_footer.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/home.css?after">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://kit.fontawesome.com/064e428fcd.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<div id="menuList">
		<ul>
			<c:choose>
				<c:when test="${sessionScope.id eq null}">
					<li id="loginBtn"><a href="login.jsp">로그인</a></li>
					<li><a href="phoneCertification.jsp">회원가입</a></li>
					<li><a href="login.jsp">마이페이지</a></li>
				</c:when>
				<c:when test="${sessionScope.id ne null }">
					${sessionScope.id } 님 환영합니다!<br />
					<li id="loginBtn"><a href="logout.do">로그아웃</a><br /></li>
					<li><a href="myPage.jsp">마이페이지</a></li>
				</c:when>
			</c:choose>
			<li><a href=#>결제내역조회</a></li>
			<li><a href=#>사이트맵</a></li>
			<li><select>
					<option selected="selected">한국어</option>
					<option>English</option>
					<option>中文</option>
					<option>日本語</option>
			</select> <!-- <i class="xi-angle-down-min"> --></li>
		</ul>
	</div>
	<section>
		<img src="images/bus3.png">
		<p id="titleText">
			<span>즐거운 여행의 시작과 끝, 프리미엄 버스와 함께!</span>
		</p>
		<div id="line"></div>
		<div id="list">
			<input type="radio" id="reservation" name="mainTab" checked="checked">
			<div class="circle">
				<label for="reservation"><i class="xi-bus xi-4x"></i></label>
				<p>고속버스예매</p>
			</div>
			<input type="radio" id="confirm" name="mainTab">
			<div class="circle">
				<label for="confirm"><i class="xi-check-square-o xi-4x"></i></label>
				<p>예매확인</p>
			</div>
			<input type="radio" id="TOA" name="mainTab">
			<div class="circle">
				<label for="TOA"><i class="xi-timer-o xi-4x"></i></label>
				<p>도착시간안내</p>
			</div>
			<input type="radio" id="freePass" name="mainTab">
			<div class="circle">
				<label for="freePass"><i class="xi-theater xi-4x"></i></label>
				<p>프리패스</p>
			</div>
			<input type="radio" id="wheelchairSite" name="mainTab">
			<div class="circle">
				<label for="wheelchairSite"><i class="xi-wheelchair xi-4x"></i></label>
				<p>휠체어사이트</p>
			</div>
		</div>
		<div id="main_Tab">
			<div class="tabs">
				<input type="radio" id="oneway" name="tab" checked="checked">
				<label for="oneway">편도<span
					class="material-symbols-outlined">arrow_forward</span></label>
				<div id="onewayTypeBox">
					<input type="radio" id="direct" name="onewayType" checked="checked">
					<label for="direct">직통<i class="fa-solid fa-check"></i></label> <input
						type="radio" id="transfer" name="onewayType"> <label
						for="transfer">환승<i class="fa-solid fa-check"></i></label>
				</div>
				<input type="radio" id="roundtrip" name="tab"> <label
					for="roundtrip">왕복 <span class="material-symbols-outlined">sync_alt</span></label>
			</div>
			<div id="tabs_1">
				<div id="directIcon">
					<span class="material-symbols-outlined">sync_alt</span>
				</div>
				<div id="departure" class="position">
					<p>
						출발지<br>
						<span>선택</span>
					</p>
				</div>
				<div id="destination" class="position">
					<p>
						도착지<br>
						<span>선택</span>
					</p>
				</div>
				<c:set var="today" value="<%=new java.util.Date()%>" />
				<c:set var="tomorrow"
					value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000)%>" />
				<div id="date" class="position">
					<p>
						가는날<br>
						<%-- <span id="today_1"><fmt:formatDate value="${today}" pattern="yyyy/MM/dd일" /></span>
						<span id="tomorrow_1"><fmt:formatDate value="${tomorrow}" pattern="yyyy/MM/dd일" /></span>			 --%>
					</p>
					<div id="dayChoice">
						<input type="radio" id="today" name="day" checked="checked">
						<label id="todaybtn" for="today" onclick="today()">오늘</label> <input
							type="radio" id="tomorrow" name="day"> <label
							id="tomorrowbtn" for="tomorrow" onclick="tomorrow()">내일</label>
					</div>
					<input type="text" id="datepicker">
				</div>
				<!-- 왕복 체크 시 -->
				<div id="date2">
					<div id="go" class="position">
						<p>
							가는날<br> <input type="text" id="datepickerGo">
						</p>
					</div>
					<div id="come" class="position">
						<p>
							오는날<br> <input type="text" id="datepickerCome">
						</p>
					</div>
				</div>
				<div id="grade" class="position">
					<p>등급</p>
					<div id="grade_input">
						<input type="radio" id="all" name="gradeTab" checked="checked">
						<label for="all">전체 <i class="fa-solid fa-check"></i></label> <input
							type="radio" id="premium" name="gradeTab"> <label
							for="premium">프리미엄 <i class="fa-solid fa-crown"></i> <i
							class="fa-solid fa-check"></i></label> <input type="radio" id="honors"
							name="gradeTab"> <label for="honors">우등 <i
							class="fa-solid fa-bus"></i> <i class="fa-solid fa-check"></i></label> <input
							type="radio" id="general" name="gradeTab"> <label
							for="general">일반 <i class="fa-solid fa-bus-simple"></i> <i
							class="fa-solid fa-check"></i></label>
					</div>
				</div>
				<div id="inquiry">조회하기</div>
			</div>
		</div>
		<div id="main2_Tab">
			<p id="mainText">회원 로그인</p>
			<form action="login.do" method="post">
				<div class="loginBox">
					<p>
						아이디<br>
					</p>
					<input type="text" id="id" placeholder="이메일주소를 입력하세요.">
				</div>
				<div class="loginBox" id="pw">
					<p>
						비밀번호<br>
					</p>
					<input type="password" id="password" placeholder="비밀번호를 입력하세요.">
				</div>
				<input type="submit" value="로그인">
			</form>
			<div id="goMembership">
				<a href="#">아이디 찾기</a> <a href="#">비밀번호 찾기</a> <a href="#">회원가입</a>
			</div>
		</div>
		<div id="main3_Tab">
			<i class="fa-solid fa-clock-rotate-left"></i>
			<p>
				운행중인 고속버스의 도착시간을 안내해드립니다.<br> <span> 안내를 원하시는 노선을 선택하시고<br>
					버스의 현재 위치와 도착예정시간을 확인해보세요.
				</span>
			</p>
			<button>도착시간 안내</button>
		</div>
		<div id="underBox">
			<ul id="underMenu">
				<li><i class="fa-regular fa-note-sticky"></i>
				<p>예매안내</p></li>
				<li><i class="fa-solid fa-arrows-rotate"></i>
				<p>환승안내</p></li>
				<li><i class="fa-solid fa-tenge-sign"></i>
				<p>터미널안내</p></li>
			</ul>
		</div>
	</section>
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div id="modal_header">
				<p>출/도착지 선택</p>
				<div class="close-area">X</div>
			</div>
			<div id="positionBox" class="boxLine">
				<div id="departureBox">
					<p>
						출발지<br>
						<span></span>
					</p>
				</div>
				<div id="destinationBox">
					<p>
						도착지<br>
						<span></span>
					</p>
				</div>
			</div>
			<div id="inputBox" class="boxLine">
				<input type="text" placeholder="터미널/지역 이름을 검색하세요">
			</div>
			<div id="chiefDeparture" class="boxLine">
				<p>주요출발지</p>
				<p class="tag">
					<span>서울경부</span><span>센트럴시티(서울)</span><span>광주(유·스퀘어)</span><span>부산</span><span>부산사상</span><span>동서울</span><span>대전복합</span><span>전주</span><span>유성</span><span>천안</span><span>동대구</span><span>성남(분당)</span>
				</p>
			</div>
			<div id="zonning" class="boxLine">
				<c:forEach var="list" items="${requestScope.list }">
					<button type="button" class="btn btn-outline-warning mt-3">${list.t_name}</button>
				</c:forEach>
			</div>
		</div>
	</div>
	<script src="js/home.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>