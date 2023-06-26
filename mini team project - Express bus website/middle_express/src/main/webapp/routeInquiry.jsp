<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
	body{padding:0;}
	.page{width:62%; height: 100%; margin: 0 auto;}
	.left_right{display: flex;}
	.mob_h2{text-align: center; font-weight: normal;}
	.left_box{width: 280px; height: 63vh; border:1px solid black; float: left; background-color:#F2C438; color : #F0F1F2; font-weight: bold;}
	.rigth_box{width: 60vw; height: 63vh; border: 1px solid black; float : right; margin-left:15px;}
	.section{flox:none; margin-left:18%;}
	.section_contents>li{list-style-type:none; line-height: 1.8;}
	.section_contents>li:before{content : "\2022"; font-size: 0.7em;}
	.inner_ModifyTag{text-decoration: none; color : white;}
	.rigth_box_header{border: 1px solid black; height: 60px;}
	.right_box_refresh{float: left; border-right:1px solid black; width:80px; height: 100%;}
	.btn_refresh{width:100%; height: 100%;}
	.data{font-size: 17px;padding-bottom: 20px; padding-left:10px;}
	.leftmargin{margin:15px;}
	.router_Departure>span{border-radius:50%; background-color:white; padding:10px; margin-top: 15px; font-weight: bold; color: #F2C438;}
	.router_Departure{font-size: 1.2em;}
	.router_Arrival>span{border-radius:50%; background-color:white; padding:10px; margin-top: 15px; font-weight: bold; color: #F2C438;}
	.router_Arrival{font-size:1.2em;}
	.timeRequired{font-size: 12px; float: left; margin-left : 30%;}
	.Distance{font-size: 12px; float : left; margin-left : 30%;}
	.inner_Modify{padding:15px; border-bottom: 1px solid #F0F1F2;}
	.Rateinformation{padding-bottom: 15px; padding-left : 15px; border-bottom: 1px solid #F0F1F2;}
	.honors{padding-bottom:15px; padding-left : 15px;}
	.honors>span{float:right; margin-right : 5px;}
	.data_content{width:85%; text-align: center; }
	.left_days{display: flex;}
	.left_days_div{width: 80px; border-right: 1px solid black; height: 56.8vh;}
	.left_days_div>p{ padding: 3px; text-align: right; margin-right:5px;}
	.noselect{text-decoration: none; color : #F2C438; font-weight: bold; }
	.left_days_div>p:hover{ background-color: #F2C438; color:#F0F1F2; }
	.noselect:hover{background-color: #F2C438; color:#F0F1F2; }   
	.left_days_div>p.night:hover a{ color : #F0F1F2;}
	.left_days_div>p.sun:hover a{ color : #F0F1F2;}
	.bustime_head{border: 1px solid black; margin:0; padding:10px; width:44vw;}
	.start_bus_wrap{margin-left:3%;}
	.bus_info{margin-left:14%;}
	.bus_Rating{margin-left:14%;}
	.discount{margin-left:14%;}
	.TheRemainingSeats{margin-left:14%;}
	.bus_time{display: none; }
</style>

</head>
<body>
	<h2 class = "mob_h2">배차조회</h2>
	<div class = "page">
		<div class = "left_right">
		<%-- left --%>
		<div class = "left_box">
			<div class = "leftmargin">
			<h3 class="data" id ="leftdata">2023. 5. 3. 수<%--출발일 --%></h3>
				<div class = "router_wrap" id="router_wrap">
					<div class = "inner">
						<p class="router_Departure" id="router_Departure"><span>출발</span> 강진<%--출발지 --%></p>
						<p class="router_Arrival" id ="router_Arrival"><span>도착</span> 정안(휴)상행<%--도착지 --%></p>
					</div>
					<div class="inner_wrap">
						<span class ="timeRequired">2시간 40분 소요<%-- 소요시간 --%></span><br>
						<span class ="Distance">270km<%-- 거리 --%></span>
					</div>
					<br>
					<div class="inner_Modify">
						<a href="#" class="inner_ModifyTag" onclick="">수정</a>
					</div>
				</div>	
				<div class = "left_price" id="left_price">
					<p class = "Rateinformation">요금정보<span>(일반요금)</span></p>
					<p class = "honors" id = "honors">우등<%--우등--%><span>26,500</span></p>
					<p class = "high_speed" id="high_speed"><%--고속--%></p>
					<p class = "high_honors" id="high_night"><%--심야우등 --%></p>
					<p class = "high_night" id ="high_night"><%--심야고속 --%></p>
					<p class = "high_night_ExtraCharge" id="high_night_ExtraCharge"><%--심야고속할증--%></p>
				</div>
				</div>
		</div>
		<%-- left 끝 --%>
		
		<%-- right --%>
		<div class = "rigth_box">
			<div class = "rigth_box_header"> 
			<%-- 오른쪽 헤더 --%>
				<div class = "right_box_refresh">
					<button type ="button" class="btn_refresh" id = "btn_refresh"><%--새로고침 --%></button>
				</div>
				<div class="data_header">
					<span class ="data_content" id="data_content"><%-- 헤더 가운데 날짜 --%></span>
					<span class = "calender"><%--달력--%></span>				
				</div>
			</div>
			<div class = "left_days">
				<%--출발 시간(누르면 그 시간으로 이동)--%>
				<div class = "left_days_div">
					<p class="night" ><a href="#" class="noselect" data-time="01">1</a></p>
					<p class="night" ><a href="#" class="noselect" data-time="03">3</a></p>
					<p class="night" ><a href="#" class="noselect" data-time="05">5</a></p>
					<p class="sun" ><a href="#" class="noselect" data-time="07">7</a></p>
					<p class="sun" ><a href="#" class="noselect" data-time="09">9</a></p>
					<p class="sun" ><a href="#" class="noselect" data-time="11">11</a></p>
					<p class="sun" ><a href="#" class="noselect" data-time="13">13</a></p>
					<p class="sun" ><a href="#" class="noselect" data-time="15">15</a></p>
					<p class="sun" ><a href="#" class="noselect" data-time="17">17</a></p>
					<p class="sun" ><a href="#" class="noselect" data-time="19">19</a></p>
					<p class="night" ><a href="#" class="noselect" data-time="21">21</a></p>
					<p class="night" ><a href="#" class="noselect" data-time="23">23</a></p>
				
				</div>
				<div class = "bus_wrap">
					<p class = "bustime_head">
						<span class = "start_bus_wrap">출발</span>
						<span class = "bus_info">고속사</span>
						<span class = "bus_Rating">등급</span>
						<span class = "discount">할인</span>
						<span class = "TheRemainingSeats">잔여석</span>
					</p>
					<div class = "bus_time">
						<div class="bus_time_contents">
							<p><span class = "text_blue">출발예정 60분전</span> 배차 차량은 고속버스 모바일앱을 통하여 예매할 수 있습니다.<br>
								곧 출발하는 버스탑승을 하시려면 지금 바로 고속버스 모바일앱으로 접속하세요.<br>
								임시차량은 공동운수협정차량이 운행될 수도 있습니다.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<%-- right 끝 --%>
	</div>
		<div class ="section">
			<ul class ="section_contents">
				<li> 심야고속 및 심야우등의 할증 요금은 당일 02:00부터 04:00 사이 출발차량</li>
				<li> 노선에 따라 심야요금과 심야할증요금이 동일할 수도 있음</li>
				<li> 마일리지 구매 승차권은 프리미엄/편도 노선(일부노선 제외)에 한정하며 각 1매씩 예매 가능(*회원대상)</li>
				<li> 유아 카시트 가능(🛒) 표시된 차량에만 유아 카시트 장착 가능 (본인 소유의 유아 카시트 준비)</li>
				<li> 소요(도착)시간은 도로 사정에 따라 지연될 수 있음</li>
				<li> 휠체어 탑승 가능(👨‍🦽) 표시된 차량에만 휠체어 동반 탑승 가능 (전동식 휠체어만 탑승 가능)</li>
				<li> 휠체어 좌석 예매는 wkobus 사이트에서 예매 가능하며, 휠체어 좌석 예매는 출발일로 부터 3일 전까지만 가능<br>(*휠체어 좌석 예매가 없을 시 출발일 이틀 전부터 일반석 예매 가능)</li>
			</ul>
		</div>
		<script>
		const pTags = document.querySelectorAll('p');
		  pTags.forEach(pTag => {
		    pTag.addEventListener('click', function(event) {
		      const aTag = event.currentTarget.querySelector('a');
		      aTag.click();
		    });
		  });
			
		</script>
</body>
</html>