<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header_side/header_question.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="header_side/header_side.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<style>
	body{ }
	.container{position: absolute; top: 35%; left: 28%; width : 70vw; }
	.container_search{margin-left: 60px;}
	.h2_title{font-weight: lighter; margin-left: 14%;}
	.userSearch{background-color: #DDD; border: none;  height: 45px; width: 50%; margin:30px; margin-right:0; margin-left: 20%;}
	.searchSub{background-color: #B0C4DE; color: white; width:6.5vw; height: 6.2vh; border: none; margin-left: 0; left: 0;}
	::placeholder{font-size: 16px;}
	.searchSub:hover{background-color: #778899;}
	.Bus_search{width: 90%; height: 15vh; border: 1px solid #DDD; }
	.search_wraptype2custom_input{width: 60%; background-color: #F5F5F5;; height: 50%; margin: 0 auto; margin-top: 20px;}
	.paymentselect-box{width:100%; height: 100%;}
	#bltnCtgCd{width:100%; height: 100%; background-color: #F5F5F5; border: none; padding-left:5px;}
	#bltnCtgCd option{height: 60px;}
	
	.wrapper{width:100%;  height: auto; top: 65%; left: 24%; width : 70vw; position: absolute; padding-bottom: 150px;}
	.wrapper_box{position: static; }
	.wrapper_question{display:flex; height: 60px; align-items: center;}
	.hidden_question{display: flex; height: auto;}
	
	.left_question{width: 5%; text-align: center;}
	.leftleft{width: 5%; text-align: center; padding-top: 15px;}
	.right_question{width: 90%; margin: 10px;}
	.right_question1{width: 85%; margin: 10px;  margin-top:0;border-top : 1px solid #DCDCDC; padding-top:15px;}
	.hidden_question{display:none;visibility: hidden; visibility:visible;}
	.right_question span{float: right; cursor: pointer; }
	
	</style>
	
</head>
<body>
	<div class = "container">
		<h2 class = "h2_title">고객님들이 자주 문의하시는 질문과 답변내용입니다.</h2>
	<form action = "" method = "post">
		<div class = "Bus_search">
			<div class="search_wraptype2custom_input">
			<div class="box_inputForm click_box inselect">
				<div class="paymentselect-box">
					<select name="bltnCtgCd" id="bltnCtgCd" title="질문 선택">
						
							<option value="0"  >전체</option>
						
							<option value="1"  >예매</option>
						
							<option value="2"  >조회/변경/취소</option>
						
							<option value="3"  >결제</option>
						
							<option value="4"  >홈티켓</option>
						
							<option value="5"  >고속버스 운행</option>
						
							<option value="6"  >회원</option>
						
							<option value="7"  >기타</option>
						
					</select>
				</div>
			</div>
		</div>
			
			
		</div>
	</form>
	</div>
	<div  class = "wrapper">
		<div class = "wrapper_box" id = "wrapper_box">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				예매 가능 기간 및 명절 연휴 예매 기간은 언제입니까? <span id = "downgoto" onclick = "downSpan()">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question">
			<div class = "leftleft" id = "leftleft">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				예매 가능일자와 관련하여 따로 정해진 기간은 없으며, 배차 정보가 입력되어 있는 경우에 조회/예매가 가능합니다.<br>
				배차정보는 각 출발지 터미널에서 입력합니다. 다음달 배차정보는 전월 20일경에 입력하고 있으나, 출발지 터미널에 따라 기간이 달라질 수 있습니다.<br><br>
				
				명절의 경우 접속과다로 인한 부하를 방지하기 위하여 특송기간 전용 홈페이지로 전환하여 운영하지만 예매 기간은 동일하게 적용됩니다.<br><br>
				
				배차정보에 관한 더 자세한 사항은 출발지 터미널에 문의해주시기 바랍니다.
			</div>	
		</div>
		</div>
		<div class = "wrapper_box" id = "wrapper_box1">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				노선조희시 "배차정보가 존재하지 않습니다."라는 문구가 나타납니다. <span id = "downgoto1"">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question1">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				배차정보가 아직 입력되어 있지 않은 상태이며, 배차 정보가 입력되어 있어야만 조회/예매가 가능합니다.<br><br>
				배차정보는 각 출발지 터미널에서 입력합니다. 다음달 배차정보는 전월 20일경에 입력하고 있으나, 출발지 터미널에 따라 기간이 달라질 수 있습니다.<br>
				배차정보에 관한 더 자세한 사항은 출발지 터미널에 문의해주시기 바랍니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box2">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				홈페이지 예매 후 터미널 창구에서의 승차권 발권은 어떻게 할 수 있습니까? <span id = "downgoto2">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question2">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				카드결제를 통한 예매의 경우 예매시 사용하신 카드를 지참하셔야 하며, 기타 결제수단을 통한 예매의 경우에는 본인 휴대폰번호와 생년월일 정보를 창구에서 말씀하시면 승차권 발권이 가능합니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box3">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				"이 구간은 홈페이지 예매가 불가능합니다." 라는 문구가 나타납니다. <span id = "downgoto3">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question3">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				일부 소도시 터미널은 신용카드 발권을 도입하지 않고 있습니다. 전산센터 입장에서는 신용카드 발권 도입을 권유하고 있지만 터미널의 권한이라 임의로 바꿀 수 없는 사항 입니다.<br>
				한 구간의 경우 홈페이지를 통한 예매는 불가하고, 터미널에 직접 방문하셔서 승차권을 발권하셔야 합니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box4">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				고객센터의 상담원 연결을 통한 예매가 가능 합니까? <span id = "downgoto4">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question4">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				예매는 홈페이지, 모바일, 터미널에서 본인이 직접 하셔야 하며, 상담원 연결을 통한 예매는 불가합니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box5">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				예매시 "카드인증실패" 문구가 나타납니다. <span id = "downgoto5">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question5">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				카드에 대한 문제나 정보입력상에 오류가 있을 경우 예매 진행이 어려울 수 있습니다.<br>
				연체, 카드사용중지, 사용한도초과, 주민번호오류, 유효기간 입력오류 등의 경우가 있을 수 있으며, 이에 대한 자세한 사항은 해당 카드사를 통해 확인해주시기 바랍니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box6">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				예매한 승차권은 어떠헥 발권 할 수 있습니까? <span id = "downgoto6">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question6">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				예매하신 승차권 발권은 예매에 사용한 카드를 소지 후 출발시간 이전에 해당 터미널 매표창구에서 발권할 수 있습니다.<br>
				발권시 예매에 사용한 카드를 제시하시면 바로 발권이 가능합니다. 또한 왕복으로 예매를 하시면 해당 터미널에서 왕복 발권도 가능합니다. 다만 출발지나 도착지 외의 터미널에서의 발권은 불가합니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box7">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				예매 가능 시간은 언제합니까? <span id = "downgoto7">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question7">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				예매에 특별히 정해진 시간은 없으며, 해당 출발지 터미널의 배차정보가 입력되어 있으면 홈페이지 또는 고속버스모바일앱을 통해 예매가 가능합니다.<br>
				고속버스모바일앱과 관련된 정보는 http://www.epassmobile.co.kr에서 확인 가능합니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box8">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				고속버스 승차권도 할인 요금을 적용 받을 수 있습니까? <span id = "downgoto8">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question8">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				고속버스 요금할인은 일반적으로 아동/중고생으로 구분되어 있으나 예외적으로 일부 고속사의 노선별 운영정책에 따라 대학생 할인 요금이 적용되는 노선이 있으며, 고속버스 요금할인 정책은 노선별, 구간별로 고속사마다 다르게 운영되고 있습니다. 홈페이지에서 할인 요금이 적용되는 노선은 예매 좌석 선택 시 권종이 표기되어 있는 것으로 확인하실 수 있습니다. 예매하시는 노선이 할인 적용 노선일 경우 검표 시 학생증(청소년증) 제시를 요청할 수 있으므로 탑승시 반드시 학생증(청소년증)을 지참하시기 바랍니다. 학생증(청소년증) 미 지참 시 일반요금으로 부과될 수 있습니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box9">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				한번에 예매 가능한 승차권 매수는 어떻게 됩니까? <span id = "downgoto9">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question9">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				1회 최대 예매 매수는 6매입니다.(일부 시외우등 노선에 한정하여 10매까지 예매가능)
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box10">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				환승지에서 다른 차량으로 환승하는 노선을 예매하고 싶습니다. <span id = "downgoto10">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question10">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				홈페이지에서 예매 진행 시 "환승" 구분을 선택 후 출발지/도착지를 설정하여 조회하시기 바랍니다.<br>
				먼저 [출발지→환승지] 노선에 대한 예매가 진행되며, 완료 후 이어서 [환승지→도착지]노선 예매가 가능합니다.<br>
				환승 노선을 예매하시면 중간 환승지에서 다른 차량으로 환승이 필요하니 참고하시기 바랍니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box11">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				홈페이지에서 예매 후 고속버스모바일앱에서 승차권 조회 및 사용이 가능합니까? <span id = "downgoto11">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question11">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				홈페이지에서 예매 진행 시 "모바일티켓"으로 예매할 수 있습니다.<br>
				"모바일티켓"으로 예매하셔야만 모바일앱에서 조회 및 사용이 가능하며 "일반티켓"으로 예매하시면 모바일앱에서는 조회되지 않으니 참고하시기 바랍니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box12">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				예매사항의 변경시 날짜 변경이 불가한 이유는 무엇입니까? <span id = "downgoto12">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question12">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				무분별한 날짜 변경으로 인한 승차권 부족 현상을 방지하기 위하여 예매 변경 시 날짜 변경이 불가하도록 제한하고 있으니 양해 부탁드립니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box13">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				예매한 승차권의 시간 변경은 어떻게 할 수 있습니까? <span id = "downgoto13">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question13">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				시간변경은 동일 날짜/노선에 한하여 차량 출발시간 1시간 이전까지 시간변경 기능을 통해 가능합니다.(1회 가능)
				시간변경 기능은 [예매확인]→[예매 확인/취소/변경] 메뉴에서 확인하실 수 있습니다.<br><br>
				
				시간변경 기능의 절차는 기존 예매한 티켓을 취소 후 재결제 하는 방식으로 이루어지며, 해당 기능을 통해 재결제할 경우 수수료가 부과되지 않습니다.<br><br>
				
				차량 출발 1시간 이내 티켓이라면, 예매 취소 후 다시 예매하셔야 합니다.<br><br>
				
				예매 취소 후 재예매를 하실 경우 "고속버스운송약관"에 따라 취소 수수료 부과 및 좌석 부족으로 승차권 예매가 불가할 수 있는 점 양해부탁드립니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box14">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				승차권의 영수증 발급은 어떻게 할 수 있습니까? <span id = "downgoto14">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question14">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				승차권 예매 후 바로 영수증 출력이 가능합니다.<br>
				영수증은 [예매확인]→[예매 확인/취소/변경] 메뉴로 이동하여 확인하실 수 있으며, 홈페이지에서 예매하지 않은 승차권 영수증의 경우 [예매확인]→[영수증 발행] 메뉴로 이동하여 확인하시기 바랍니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box15">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				예매한 승차권의 내역 조회가 불가합니다. <span id = "downgoto15">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question15">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				고객님께서 비회원으로 예매하신 승차권을 회원 가입하여 예매 승차권을 조회하시면 조회가 불가합니다. 비회원으로 예매하신 경우 예매한 휴대폰 번호+ 비밀번호 4자리 입력 후 예매 내역을 확인할 수 있습니다.<br><br>

				내역 조회가 되지 않을 경우 이용 터미널 매표소로 문의해주시기 바랍니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box16">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				예매 승차권의 취소 수수료는 어떻게 부과됩니까? <span id = "downgoto16">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question16">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				1. 취소수수료 없음<br>
				- 차량출발일 2일전까지 취소할 경우<br>
				- 당일 출발 차량 예매 후 1시간 이내 취소할 경우<br><br>
				
				2. 취소수수료 5%부과<br>
				- 차량출발일 전일 부터 차량 출발전 1시간 전 까지 취소할 경우<br><br>
				
				3. 취소수수료 10%부과<br>
				- 차량 출발전 1시간 이내부터 차량 출발 전 까지 취소할 경우<br><br>
				
				4. 취소수수료 30%부과<br>
				- 예매 차량 출발 후 도착예정시간(배차시간+소요시간) 전 까지 취소할 경우<br><br>
				
				※ 차량 출발 후 도착 전까지 홈페이지 및 출발지 터미널에서 취소가 가능하며, 차량 도착 이후에는 100% 위약금이 발생합니다.(모든 티켓 동일)<br><br>
				
				※예매 취소 및 환급에 대한 규정은 고속버스 운송약관에 따르며, 자세한 사항은 고속버스 운송약관을 통해서 확인하실 수 있습니다.
			</div>	
		</div>
		</div>
		
		<div class = "wrapper_box" id = "wrapper_box17">
		<div class = "wrapper_question">
			<div class = "left_question">🔍</div>
			<div class = "right_question">
				홈페이지에서 승차권 취소 후 완료시점이 궁금합니다. <span id = "downgoto17">👇</span>
			</div>
		</div>
		<div class = "hidden_question" id = "hidden_question17">
			<div class = "leftleft" id = "leftleft1">
				<span>A.</span>
			</div>
			<div class = "right_question1">
				승차권을 예매하신 후 당일 취소 하실 경우 대부분의 신용카드사에서는 승인 취소 문자가 발송되고 있습니다. 그러나 예매일과 취소일이 다를 경우 약 3~5일 가량 소요됩니다.<br><br>

				취소 수수료가 부과되는 경우 취소 수수료 재정산일이 소요되어 취소 처리 기간이 3~5일가량 소요될 수 있으며, 만약 취소 일자에 잔액부족 또는 승인한도 부족으로 수수료가 결제되지 못했다면 취소가 지연될 수 있습니다.
			</div>	
		</div>
		</div>
		
		
		
	</div>
	
	
	
	
	<script>
	 const downgoto = document.querySelector("#downgoto");
	 const downgoto1 = document.querySelector("#downgoto1");
	 const downgoto2 = document.querySelector("#downgoto2");
	 const downgoto3 = document.querySelector("#downgoto3");
	 const downgoto4 = document.querySelector("#downgoto4");
	 const downgoto5 = document.querySelector("#downgoto5");
	 const downgoto6 = document.querySelector("#downgoto6");
	 const downgoto7 = document.querySelector("#downgoto7");
	 const downgoto8 = document.querySelector("#downgoto8");
	 const downgoto9 = document.querySelector("#downgoto9");
	 const downgoto10 = document.querySelector("#downgoto10");
	 const downgoto11 = document.querySelector("#downgoto11");
	 const downgoto12 = document.querySelector("#downgoto12");
	 const downgoto13 = document.querySelector("#downgoto13");
	 const downgoto14 = document.querySelector("#downgoto14");
	 const downgoto15 = document.querySelector("#downgoto15");
	 const downgoto16 = document.querySelector("#downgoto16");
	 const downgoto17 = document.querySelector("#downgoto17");
	 
	 
	 const hidden_question = document.querySelector("#hidden_question");
	 const hidden_question1 = document.querySelector("#hidden_question1");
	 const hidden_question2 = document.querySelector("#hidden_question2");
	 const hidden_question3 = document.querySelector("#hidden_question3");
	 const hidden_question4 = document.querySelector("#hidden_question4");
	 const hidden_question5 = document.querySelector("#hidden_question5");
	 const hidden_question6 = document.querySelector("#hidden_question6");
	 const hidden_question7 = document.querySelector("#hidden_question7");
	 const hidden_question8 = document.querySelector("#hidden_question8");
	 const hidden_question9 = document.querySelector("#hidden_question9");
	 const hidden_question10 = document.querySelector("#hidden_question10");
	 const hidden_question11 = document.querySelector("#hidden_question11");
	 const hidden_question12 = document.querySelector("#hidden_question12");
	 const hidden_question13 = document.querySelector("#hidden_question13");
	 const hidden_question14 = document.querySelector("#hidden_question14");
	 const hidden_question15 = document.querySelector("#hidden_question15");
	 const hidden_question16 = document.querySelector("#hidden_question16");
	 const hidden_question17 = document.querySelector("#hidden_question17");
	 
	 const wrapper_box = document.querySelector("#wrapper_box");
	 const wrapper_box1 = document.querySelector("#wrapper_box1");
	 const wrapper_box2 = document.querySelector("#wrapper_box2");
	 const wrapper_box3 = document.querySelector("#wrapper_box3");
	 const wrapper_box4 = document.querySelector("#wrapper_box4");
	 const wrapper_box5 = document.querySelector("#wrapper_box5");
	 const wrapper_box6 = document.querySelector("#wrapper_box6");
	 const wrapper_box7 = document.querySelector("#wrapper_box7");
	 const wrapper_box8 = document.querySelector("#wrapper_box8");
	 const wrapper_box9 = document.querySelector("#wrapper_box9");
	 const wrapper_box10 = document.querySelector("#wrapper_box10");
	 const wrapper_box11 = document.querySelector("#wrapper_box11");
	 const wrapper_box12 = document.querySelector("#wrapper_box12");
	 const wrapper_box13 = document.querySelector("#wrapper_box13");
	 const wrapper_box14 = document.querySelector("#wrapper_box14");
	 const wrapper_box15 = document.querySelector("#wrapper_box15");
	 const wrapper_box16 = document.querySelector("#wrapper_box16");
	 const wrapper_box17 = document.querySelector("#wrapper_box17");
	 
	 downgoto.addEventListener("click", function(){
		 if (downgoto.innerHTML == "👇") {
			 	hidden_question.style.display = "block";
			 	hidden_question.style.display = "flex";
			 	hidden_question.style.visibility = "visible";
			 	wrapper_box.style.border = "3px solid purple";
			    downgoto.innerHTML = "☝";
			  } 
		 else {
			    downgoto.innerHTML = "👇";
			    wrapper_box.style.border = "none"
				hidden_question.style.display = "none";
			  }
	 });
	 downgoto1.addEventListener("click", function(){
		 if (downgoto1.innerHTML == "👇") {
			 	hidden_question1.style.display = "block";
			 	hidden_question1.style.display = "flex";
			 	hidden_question1.style.visibility = "visible";
			 	wrapper_box1.style.border = "3px solid purple";
			    downgoto1.innerHTML = "☝";
			  } 
		 else {
			    downgoto1.innerHTML = "👇";
				hidden_question1.style.display = "none";
				wrapper_box1.style.border = "none";
			  }
	 });
	 downgoto2.addEventListener("click", function(){
		 if (downgoto2.innerHTML == "👇") {
			 	hidden_question2.style.display = "block";
			 	hidden_question2.style.display = "flex";
			 	hidden_question2.style.visibility = "visible";
			 	wrapper_box2.style.border = "3px solid purple";
			    downgoto2.innerHTML = "☝";
			  } 
		 else {
			    downgoto2.innerHTML = "👇";
				hidden_question2.style.display = "none";
				wrapper_box2.style.border = "none";
			  }
	 });
	 downgoto3.addEventListener("click", function(){
		 if (downgoto3.innerHTML == "👇") {
			 	hidden_question3.style.display = "block";
			 	hidden_question3.style.display = "flex";
			 	hidden_question3.style.visibility = "visible";
			 	wrapper_box3.style.border = "3px solid purple";
			    downgoto3.innerHTML = "☝";
			  } 
		 else {
			    downgoto3.innerHTML = "👇";
				hidden_question3.style.display = "none";
				wrapper_box3.style.border = "none";
			  }
	 });
	 downgoto4.addEventListener("click", function(){
		 if (downgoto4.innerHTML == "👇") {
			 	hidden_question4.style.display = "block";
			 	hidden_question4.style.display = "flex";
			 	hidden_question4.style.visibility = "visible";
			 	wrapper_box4.style.border = "3px solid purple";
			    downgoto4.innerHTML = "☝";
			  } 
		 else {
			    downgoto4.innerHTML = "👇";
				hidden_question4.style.display = "none";
				wrapper_box4.style.border = "none";
			  }
	 });
	 downgoto5.addEventListener("click", function(){
		 if (downgoto5.innerHTML == "👇") {
			 	hidden_question5.style.display = "block";
			 	hidden_question5.style.display = "flex";
			 	hidden_question5.style.visibility = "visible";
			 	wrapper_box5.style.border = "3px solid purple";
			    downgoto5.innerHTML = "☝";
			  } 
		 else {
			    downgoto5.innerHTML = "👇";
				hidden_question5.style.display = "none";
				wrapper_box5.style.border = "none";
			  }
	 });
	 downgoto6.addEventListener("click", function(){
		 if (downgoto6.innerHTML == "👇") {
			 	hidden_question6.style.display = "block";
			 	hidden_question6.style.display = "flex";
			 	hidden_question6.style.visibility = "visible";
			 	wrapper_box6.style.border = "3px solid purple";
			    downgoto6.innerHTML = "☝";
			  } 
		 else {
			    downgoto6.innerHTML = "👇";
				hidden_question6.style.display = "none";
				wrapper_box6.style.border = "none";
			  }
	 });
	 downgoto7.addEventListener("click", function(){
		 if (downgoto7.innerHTML == "👇") {
			 	hidden_question7.style.display = "block";
			 	hidden_question7.style.display = "flex";
			 	hidden_question7.style.visibility = "visible";
			 	wrapper_box7.style.border = "3px solid purple";
			    downgoto7.innerHTML = "☝";
			  } 
		 else {
			    downgoto7.innerHTML = "👇";
				hidden_question7.style.display = "none";
				wrapper_box7.style.border = "none";
			  }
	 });
	 downgoto8.addEventListener("click", function(){
		 if (downgoto8.innerHTML == "👇") {
			 	hidden_question8.style.display = "block";
			 	hidden_question8.style.display = "flex";
			 	hidden_question8.style.visibility = "visible";
			 	wrapper_box8.style.border = "3px solid purple";
			    downgoto8.innerHTML = "☝";
			  } 
		 else {
			    downgoto8.innerHTML = "👇";
				hidden_question8.style.display = "none";
				wrapper_box8.style.border = "none";
			  }
	 });
	 downgoto9.addEventListener("click", function(){
		 if (downgoto9.innerHTML == "👇") {
			 	hidden_question9.style.display = "block";
			 	hidden_question9.style.display = "flex";
			 	hidden_question9.style.visibility = "visible";
			 	wrapper_box9.style.border = "3px solid purple";
			    downgoto9.innerHTML = "☝";
			  } 
		 else {
			    downgoto9.innerHTML = "👇";
				hidden_question9.style.display = "none";
				wrapper_box9.style.border = "none";
			  }
	 });
	 downgoto10.addEventListener("click", function(){
		 if (downgoto10.innerHTML == "👇") {
			 	hidden_question10.style.display = "block";
			 	hidden_question10.style.display = "flex";
			 	hidden_question10.style.visibility = "visible";
			 	wrapper_box10.style.border = "3px solid purple";
			    downgoto10.innerHTML = "☝";
			  } 
		 else {
			    downgoto10.innerHTML = "👇";
				hidden_question10.style.display = "none";
				wrapper_box10.style.border = "none";
			  }
	 });
	 downgoto11.addEventListener("click", function(){
		 if (downgoto11.innerHTML == "👇") {
			 	hidden_question11.style.display = "block";
			 	hidden_question11.style.display = "flex";
			 	hidden_question11.style.visibility = "visible";
			 	wrapper_box11.style.border = "3px solid purple";
			    downgoto11.innerHTML = "☝";
			  } 
		 else {
			    downgoto11.innerHTML = "👇";
				hidden_question11.style.display = "none";
				wrapper_box11.style.border = "none";
			  }
	 });
	 downgoto12.addEventListener("click", function(){
		 if (downgoto12.innerHTML == "👇") {
			 	hidden_question12.style.display = "block";
			 	hidden_question12.style.display = "flex";
			 	hidden_question12.style.visibility = "visible";
			 	wrapper_box12.style.border = "3px solid purple";
			    downgoto12.innerHTML = "☝";
			  } 
		 else {
			    downgoto12.innerHTML = "👇";
				hidden_question12.style.display = "none";
				wrapper_box12.style.border = "none";
			  }
	 });
	 downgoto13.addEventListener("click", function(){
		 if (downgoto13.innerHTML == "👇") {
			 	hidden_question13.style.display = "block";
			 	hidden_question13.style.display = "flex";
			 	hidden_question13.style.visibility = "visible";
			 	wrapper_box13.style.border = "3px solid purple";
			    downgoto13.innerHTML = "☝";
			  } 
		 else {
			    downgoto13.innerHTML = "👇";
				hidden_question13.style.display = "none";
				wrapper_box13.style.border = "none";
			  }
	 });
	 downgoto14.addEventListener("click", function(){
		 if (downgoto14.innerHTML == "👇") {
			 	hidden_question14.style.display = "block";
			 	hidden_question14.style.display = "flex";
			 	hidden_question14.style.visibility = "visible";
			 	wrapper_box14.style.border = "3px solid purple";
			    downgoto14.innerHTML = "☝";
			  } 
		 else {
			    downgoto14.innerHTML = "👇";
				hidden_question14.style.display = "none";
				wrapper_box14.style.border = "none";
			  }
	 });
	 downgoto15.addEventListener("click", function(){
		 if (downgoto15.innerHTML == "👇") {
			 	hidden_question15.style.display = "block";
			 	hidden_question15.style.display = "flex";
			 	hidden_question15.style.visibility = "visible";
			 	wrapper_box15.style.border = "3px solid purple";
			    downgoto15.innerHTML = "☝";
			  } 
		 else {
			    downgoto15.innerHTML = "👇";
				hidden_question15.style.display = "none";
				wrapper_box15.style.border = "none";
			  }
	 });
	 downgoto16.addEventListener("click", function(){
		 if (downgoto16.innerHTML == "👇") {
			 	hidden_question16.style.display = "block";
			 	hidden_question16.style.display = "flex";
			 	hidden_question16.style.visibility = "visible";
			 	wrapper_box16.style.border = "3px solid purple";
			    downgoto16.innerHTML = "☝";
			  } 
		 else {
			    downgoto16.innerHTML = "👇";
				hidden_question16.style.display = "none";
				wrapper_box16.style.border = "none";
			  }
	 });
	 downgoto17.addEventListener("click", function(){
		 if (downgoto17.innerHTML == "👇") {
			 	hidden_question17.style.display = "block";
			 	hidden_question17.style.display = "flex";
			 	hidden_question17.style.visibility = "visible";
			 	wrapper_box17.style.border = "3px solid purple";
			    downgoto17.innerHTML = "☝";
			  } 
		 else {
			    downgoto17.innerHTML = "👇";
				hidden_question17.style.display = "none";
				wrapper_box17.style.border = "none";
			  }
	 });
	 
	 
	 
	</script>
</body>
</html>