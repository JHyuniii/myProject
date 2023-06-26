<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header_side/header_Notice.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="header_side/header_side.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{position: absolute; top: 35%; left: 28%; width : 60vw;  }
	.container_search{margin-left: 60px;}
	.h2_title{font-weight: lighter; margin-left: 21%;}
	.Bus_search{width: 90%; height: 15vh; border: 1px solid #DDD; }
	.userSearch{background-color: #DDD; border: none;  height: 45px; width: 50%; margin:30px; margin-right:0; margin-left: 20%;}
	.searchSub{background-color: #B0C4DE; color: white; width:6.5vw; height: 6.2vh; border: none; margin-left: 0; left: 0;}
	::placeholder{font-size: 16px;}
	.searchSub:hover{background-color: #778899;}
	.board_list { border-top: 1px solid #999;}
	.board_list li { list-style-type: none; display: table; width: 95%; table-layout: fixed;  padding-right: 10px; font-size: 14px; color: #999; border-bottom: 1px solid #e6e6e6; vertical-align: top; -moz-box-sizing: border-box; box-sizing: border-box;}
	.board_list .num, .board_list .cont, .board_list .date { display: table-cell;}
	.board_list .num { width: 8%;}
	.board_list .date { width: 15%; padding-right: 10px; text-align: right; -moz-box-sizing: border-box; box-sizing: border-box;}
	.board_list .cont { width: auto;}
	.board_list .label { background: #f3f4f6; box-sizing: border-box;}	
	.board_list .label .num { }
	.board_list .cont { padding: 15px 15px 15px 0;}
	.board_list .cont p { font-size: 18px; color: #000;}
	.board_list .cont span { display: inline-block; width: 100%; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
	.board_list .num { padding-left: 18px;}
	.board_list { margin-top: 30px;}
	.board_list .cont{text-decoration: none;}
</style>

</head>
<body>
	<div class = "container">
		<h2 class = "h2_title">고속버스 홈페이지의 새로운 소식을 확인하세요.</h2>
	<form action = "" method = "post">
		<div class = "container_search">
				<div class = "Bus_search">
					<input type = "text" placeholder="검색어를 입력하세요" name = "userSearch" class = "userSearch" id="userSearch">
					<span style = "left:0"><input type = "submit" value ="검색" class = "searchSub" id = "searchSub"></span>
				</div>
			
		</div>
		<div class="board_list">
			<ul>	
						<li class="label"><span class="num">🌟</span> <a href="readNtc.jsp"
							class="cont"
							onclick="fnGoReadPage(20210719001);">
								<p>
									개인정보 처리방침 약관 개정 안내
								</p> <!--<span></span> -->
						</a> <span class="date">  2021.07.19
						</span></li>
					
						<li class="label"><span class="num">🌟</span> <a href="readMil.jsp"
							class="cont"
							onclick="fnGoReadPage(20191125001);">
								<p>
									프리미엄 고속버스 마일리지 소멸 유효기간 안내
								</p> <!--<span></span> -->
						</a> <span class="date">  2019.11.22
						</span></li>
					
						<li class="label"><span class="num">🌟</span> <a href="readMob.jsp"
							class="cont"
							onclick="fnGoReadPage(20190923001);">
								<p>
									고속/시외버스모바일 앱 명칭 변경에 따른 약관 개정 고지 
								</p> <!--<span></span> -->
						</a> <span class="date">  2019.09.23
						</span></li>
					
						<li class="label"><span class="num">🌟</span> <a href="readnoShow.jsp"
							class="cont"
							onclick="fnGoReadPage(20190822001);">
								<p>
									노쇼방지를 위한 동일카드 예매 횟수 변경 안내
								</p> <!--<span></span> -->
						</a> <span class="date">  2019.08.22
						</span></li>
					
						<li class="label"><span class="num">🌟</span> <a href="readCenter.jsp"
							class="cont"
							onclick="fnGoReadPage(20190809001);">
								<p>
									■ 고객센터 점심시간 운영 안내
								</p> <!--<span></span> -->
						</a> <span class="date">  2019.08.09
						</span></li>
					
						<li class="label"><span class="num">🌟</span> <a href="readList.jsp"
							class="cont"
							onclick="fnGoReadPage(20190226001);">
								<p>
									강원도 노선 업무 제휴 업체 리스트 (동부고속)
								</p> <!--<span></span> -->
						</a> <span class="date">  2019.02.26
						</span></li>
					
					
						<li><span class="num">4</span>
							<a href="readNewP.jsp" class="cont"
							onclick="fnGoReadPage(20210719001);">
								<p>
									개인정보 처리방침 약관 개정 안내
								</p> <!-- <span></span> -->
						</a> <span class="date">  2021.07.19
						</span></li>
					
						<li><span class="num">3</span>
							<a href="readNewp2.jsp" class="cont"
							onclick="fnGoReadPage(20210621001);">
								<p>
									개인정보 처리방침 약관 개정 안내
								</p> <!-- <span></span> -->
						</a> <span class="date">  2021.06.21
						</span></li>
					
						<li><span class="num">2</span>
							<a href="readOnly.jsp" class="cont"
							onclick="fnGoReadPage(20201231001);">
								<p>
									비회원 예매 프로세스 변경 관련 안내
								</p> <!-- <span></span> -->
						</a> <span class="date">  2020.12.31
						</span></li>
					
						<li><span class="num">1</span>
							<a href="readNewp3.jsp" class="cont"
							onclick="fnGoReadPage(20201207001);">
								<p>
									개인정보 처리방침 약관 개정 안내
								</p> <!-- <span></span> -->
						</a> <span class="date">  2020.12.07
						</span></li>
					
				
			</ul>
		</div>
		
		</form>
		
	</div>
</body>
</html>