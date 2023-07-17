<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header_side/header_side_footer.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매수 및 좌석선택</title>
<link rel="stylesheet" href="css/reservation.css?after">
<script src="https://kit.fontawesome.com/064e428fcd.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id="headerMenu">
		<ul>
			<li>HOME</li>
			<li>
				<select>
					<option>고속버스예매</option>
					<option>예매확인</option>
					<option>운행정보</option>
					<option>상품 구매내역</option>
					<option>이용안내</option>
					<option>공지사항</option>
					<option>고객센터</option>
					<option>전국고속버스운송사업조합</option>
					<option>터미널사업자협회</option>
				</select>
			</li>
		</ul>
	</div>
<form action="reservation.do" method="post">
	<section>
		<p id="titleText">매수 및 좌석선택</p>
		<div id="leftBox">
			<!-- 선택한 날짜 들어오게 스크립트 -->
			<p id="date">2023.5.2.화</p>
			<!-- 선택한 출발,도착지 들어오게 스크립 -->
			<div id="departure" class="circleText"><div class="circle">출발</div>성남(분당)</div>
			<div id="destination" class="circleText"><div class="circle">도착</div>낙동강(휴)하행</div>
			<!-- 선택한 티켓 정보 넣어 -->
			<div id="information">
				<p>
					고속사 <span>속리산고속(주)</span><br>
					등급 <span>우등</span><br>
					출발 <span>07:30</span>
				</p>
			</div>
		</div>
		<div id="rightBox">
			<div id="boxHeader">
				<p>잔여 26석 / 전체 28석</p>
			</div>
			<div id="boxSide">
				<ul>
		<li>
			<p>일반<br><span id="general">0</span></p>
			<div class="countBtn">
				<input type="button" onclick="count('plus','general')" value="+">
				<input type="button" onclick="count('minus','general')" value="-">
			</div>
		</li>
		<li>
			<p>초등생<br><span id="elementary">0</span></p>
			<div class="countBtn">
				<input type="button" onclick="count('plus','elementary')" value="+">
				<input type="button" onclick="count('minus','elementary')" value="-">
			</div>
		</li>
		<li>
			<p>보훈<br><span id="patriotism">0</span></p>
			<div class="countBtn">
				<input type="button" onclick="count('plus','patriotism')" value="+">
				<input type="button" onclick="count('minus','patriotism')" value="-">
			</div>
		</li>
				</ul>
			</div>
			<div id="seatImg">
				<img alt="busSeat" src="images/busSeat.png">
				<div id="seatList">
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2801" value="1">
						<label for="seatNum2801">1</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2802" value="2">
						<label for="seatNum2802">2</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2803" value="3">
						<label for="seatNum2803">3</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2804" value="4">
						<label for="seatNum2804">4</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2805" value="5">
						<label for="seatNum2805">5</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2806" value="6">
						<label for="seatNum2806">6</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2807" value="7">
						<label for="seatNum2807">7</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2808" value="8">
						<label for="seatNum2808">8</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2809" value="9">
						<label for="seatNum2809">9</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2810" value="10">
						<label for="seatNum2810">10</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2811" value="11">
						<label for="seatNum2811">11</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2812" value="12">
						<label for="seatNum2812">12</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2813" value="13">
						<label for="seatNum2813">13</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2814" value="14">
						<label for="seatNum2814">14</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2815" value="15">
						<label for="seatNum2815">15</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2816" value="16">
						<label for="seatNum2816">16</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2817" value="17">
						<label for="seatNum2817">17</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2818" value="18">
						<label for="seatNum2818">18</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2819" value="19">
						<label for="seatNum2819">19</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2820" value="20">
						<label for="seatNum2820">20</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2821" value="21">
						<label for="seatNum2821">21</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2822" value="22">
						<label for="seatNum2822">22</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2823" value="23">
						<label for="seatNum2823">23</label>
					</span>
					<span class="seat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2824" value="24">
						<label for="seatNum2824">24</label>
					</span>
					<span class="seat lastSeat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2825" value="25">
						<label for="seatNum2825">25</label>
					</span>
					<span class="seat lastSeat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2826" value="26">
						<label for="seatNum2826">26</label>
					</span>
					<span class="seat lastSeat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2827" value="27">
						<label for="seatNum2827">27</label>
					</span>
					<span class="seat lastSeat">
						<input type="checkbox" name="seatBox" class="seatNum" id="seatNum2828" value="28">
						<label for="seatNum2828">28</label>
					</span>
				</div>
			</div>
			<div id="seatChoice">
				<div id="seatNum">
					<p>선택좌석<br><span id="choiceSeatNum">좌석을 선택해주세요</span></p>
				</div>
				<div id="charge">
					<p id="totalCharge">탑승인원 및 요금<span id="ch"><span id="ChargeTotal">0</span>원</span></p>
					<p>일반 <span id="generalCount">0</span>명<span id="ch"><span id="generalCharge">0</span>원</span></p>
					<p>초등생 <span id="elementaryCount">0</span>명<span id="ch"><span id="elementaryCharge">0</span>원</span></p>
					<p>보훈 <span id="patriotismCount">0</span>명<span id="ch"><span id="patriotismCharge">0</span>원</span></p>
				</div>
				<div id="discount">
					<p>할인선택</p>
					<input type="radio" name="discountBtn" id="discountbox">
					<label for="discountbox"><i class="fa-regular fa-circle-check"></i> 할인미적용</label>
					<p id="smallTxt">- 가장 높은 할인율이 자동 적용됩니다. (중복불가)</p>
				</div>
				<p id="total">총 결제금액 <span id="TotalPriceBox"><span id="TotalPrice">0</span>원</span></p>
			</div>
				<input type="submit" value="선택완료">
		</div>
	</section>
</form>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/reservation.js"></script>
</body>
</html>