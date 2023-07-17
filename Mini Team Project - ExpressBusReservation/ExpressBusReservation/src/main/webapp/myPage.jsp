<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>  
<%-- <%@ include file="header_side/myPageOK.jsp" %> --%>
<%@ include file="header_side/myPageOK.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/myPageOK.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.page{position: absolute; top: 400; margin-left: 30%;}
	.mypage{}
	.btnBox{float:right;}
	.container{width: 50vw; height: 10vh; border-bottom: 1px solid #DCDCDC; margin : 30px;}
	.detail{font-size : 18px;}
	.strong_br{line-height: 2.3}
	.password_Info, .btn_sm_link_blue{color : #778899; text-decoration: none;}
	.email_Info{color : #778899; text-decoration: none;}
	.span_b{color: #87CEFA;}
	
	/*모달창*/
	
	.btn_close{float:right; margin:5px;}
	.close:before {transform: rotate(45deg);}
	.close:after {transform: rotate(-45deg);}
	.close:before, .close:after {position: absolute; content: ''; width: 2px; height: 16px; background-color: #000;}
    .close {position: absolute;   top: 10px;  right: 10px; width: 20px;  height: 20px; cursor: pointer;}
    .modalPage {
            position: fixed;
            top: 50%;
            left: 56%;
            transform: translate(-50%, -50%);
            z-index: 1000;
            width: 500px;
            height: 400px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.5);
            padding: 20px;
            display: none;
        }
		.accent{color: #5F9EA0;}
		.cont{margin:15px;}
		.inner{width: 100%; height: 15vh; border: 1px solid #DCDCDC; margin-top: 30px;}
		.present{background-color: #D3D3D3; margin: 15px; width: 95%; align-items: center;}
		::placeholder{font-size: 18px; color : #808080;}
		.password_pre{background-color: #D3D3D3; border:none; padding-top:10px; width: 100%;}
		.btns{text-align: center;}
		.btn_reset, .btn_goto{width: 10vw; height: 5vh; color: white; border: none;}
		.btn_reset{background-color: #D3D3D3;}
		.btn_goto{background-color: #B0C4DE;}
		.btn_reset:hover{background-color: gray;}
		.btn_goto:hover{background-color: #778899;}
</style>
</head>
<body>
	<div class="page">
		<!-- 나의 계정정보 -->
		<div class="myPage">
			<div class = "container">
				<strong class = "strong_br">계정정보</strong><br> <span class = "detail">${userInfo.id}테스트</span> <%--유저 아이디 --%>
					<div class="btnBox">
						<a href="chgPw.jsp" class="password_Info">비밀번호 변경 <span class= "span_b">></span></a>&nbsp;&nbsp;&nbsp;  <a href="#" class="btn_sm_link_blue" onclick = "showModal()">회원탈퇴<span class= "span_b"> ></span></a>
					</div>
			</div>
			<div class = "container">
				<strong class = "strong_br">이메일주소</strong><br> <span class="detail">${userInfo.email }테스트</span>
					<div class="btnBox">
						<a href="email_Info.jsp" class="email_Info">이메일주소 변경 <span class= "span_b">></span></a>
					</div>
			</div>
			
		</div>
		<!-- //나의 계정정보 -->
		<!-- 모달창(회원탈퇴) -->
		<div class="modalPage">
		<div class="close" onclick="hideModal()"></div>
		<form action = "" method="post">
		<div class="cont">
			<p class="txt">
				<span class="accent">알림</span><br><br>탈퇴하시려면 사이트에 등록된 비밀번호를 입력하신 후, <br>회원탈퇴 버튼을 클릭해주세요. <br>탈퇴하시면 모든 데이터가 삭제됩니다.<br>고속버스 통합 회원을 탈퇴하시겠습니까?
			</p>
			<div class="border-box box_withdrawal">
	            <div class="inner">
	                <div class = "present">
						<div style = "padding:10px;">
								<label for = "pre" class = "presize">비밀번호</label><br>
								<input type = "password"  class = "password_pre" name = "password" id = "pre" placeholder="현재 사이트에 등록된 비밀번호를 입력하세요.">
						</div>
					</div>
	            </div>
	        </div> 
		</div>
		<div class="btns">
			<!-- 버튼이 1개일경우 class="col1" 추가 -->
			<input type="reset" class="btn_reset" value="취소" id = "btn_reset">
			<input type="submit" class="btn_goto" id="btn_goto" value = "회원탈퇴">
		</div>
		</form>
	</div>
	<!-- //모달창(회원탈퇴) -->
	</div>
<script>
function showModal() {
   document.querySelector(".modalPage").style.display = "block";
}

function hideModal() {
	document.querySelector(".modalPage").style.display = "none";
}

const btn_goto = document.querySelector("#btn_goto");
const btn_reset = document.querySelector("#btn_reset");
btn_goto.addEventListener("click", function(){
	alert("회원탈퇴가 정상적으로 완료되었습니다.");
});
btn_reset.addEventListener("click", function(){
	document.querySelector(".modalPage").style.display = "none";
});

</script>
</body>
</html>