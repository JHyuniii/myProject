<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TodoList</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/dark.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style>
.todo-submit {
	background-color: transparent;
	border: none;
}

.card-todo {
	border: none;
}

.input-date-todo {
	width: 35vw;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="Home.jsp"> <img
				src="./healthLogo/healthLogo.png" alt="Logo" width="30" height="27"
				class="d-inline-block align-text-top"> &nbsp;HealthGenie
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarScroll">
				<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
					style="--bs-scroll-height: 100px;">
					<li class="nav-item"><a class="nav-link"
						href="goalSetting.jsp">목표 설정하기</a></li>
					<li class="nav-item"><a class="nav-link"
						href="bodyInfoView.do">오늘 정보 기록하기</a></li>
				</ul>
				<div class="d-flex">
					<li><button class="btn btn-outline-light"
							onclick="location.href='logout.do'">로그아웃</button></li>
					<li><button class="btn btn-outline-light"
							onclick="location.href='myPage.jsp'">마이페이지</button></li>
					<li><button class="btn btn-outline-light"
							onclick="location.href='community.do'">커뮤니티</button></li>
				</div>
			</div>
		</div>
	</nav>

	<div class="container">
		<h1 class="text-center mt-4 mb-4">📝 Todo-List‍️</h1>
	<!-- 	<form id="inputForm" action="todoList.do"> -->
			<div class="card">
				<div class="row">
					<div class="col-6 mt-4">
						<div class="card card-todo">
							<div class="col-12 text-center position-relative">
								<label class="form-label" for="todoDate">작성했던 일정을 보고 싶은
									날짜나, 새로 추가하고 싶은 날짜를 선택해주세요. 🗓</label> <input
									class="mt-3 input-date-todo form-control mx-auto" id="todoDate"
									pattern="\d{4}-\d{2}-\d{2}" required th:field="*{todoDate}"
									type="date" value="" onchange="displayDate()" name="todoDate"
									placeholder="click!"> <span id="todoShowbtn"
									style="position: absolute; bottom: -65%; right: 10%;"></span>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="card card-todo">
							<div class="card-body text-center">
								<h2>
									<b><p id="selectedDate"></p></b>
								</h2>
								<div class="col-md-6 mx-auto">
									<div id="inputgroup-container">
										<c:if test="${requestScope.list ne null }">
											<c:forEach var="item" items="${list }">
												<script>
													window.onload = function() {
														var inputDate = document
																.getElementById("todoDate");
														inputDate.value = '${item.todoDate}';

														var selectedDate = document
																.getElementById("selectedDate");
														selectedDate.innerText = '${item.todoDate}';
													};
												</script>
												<div class="form-check">
													<c:if test="${item.completed eq  true}">
														<input class="form-check-input" type="checkbox"
															value="${item.todoListId }" id="flexCheckChecked" checked>
														<label class="form-check-label" for="">
															${item.list }</label>
													</c:if>
													<c:if test="${item.completed eq false }">
														<input class="form-check-input" type="checkbox"
															value="${item.todoListId }" id="flexCheckChecked">
														<label class="form-check-label" for="">
															${item.list }</label>
													</c:if>
												</div>
											</c:forEach>
										</c:if>
										<c:if test="${requestScope.list eq null }">
											<script>
												window.onload = function() {
													var inputDate = document
															.getElementById("todoDate");
													inputDate.value = '${item.todoDate}';

													var selectedDate = document
															.getElementById("selectedDate");
													selectedDate.innerText = '${item.todoDate}';
												};
											</script>
											<h5>
												이전에 세워둔 계획이 없습니다.<br>계획을 추가해보세요✔️
											</h5>
										</c:if>

										<div class="input-group mt-3 mb-3">
											<input type="text" class="form-control text-end" name="list"
												id="list"> <span class="input-group-text"><input
												type="button" value="+" onclick="addInputGroup()"
												class="todo-submit" id="todo-submit"></span>
										</div>
									</div>
								</div>
								<button type="button" class="btn btn-success" id="inputForm">계획
									완료</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 	</form> -->
	</div>

	<script>
	  $('input[type="checkbox"]').on("click", function(event) {
	      let todoListId = $(this).val(); // 선택된 체크박스의 값을 가져옵니다.
	      console.log(todoListId);
	      
	      let completed;
	      
	      if ($('#flexCheckChecked').prop('checked')) {
	    	    console.log('체크박스가 체크되어 있습니다.');
	    	    completed = true;
	    	  } else {
	    	    console.log('체크박스가 체크되어 있지 않습니다.');
	    	    completed = false;
	    	  }
	      
	      $.ajax({
				url : "todoListCompleted.do",
				type : "post",
				data : {
					"todoListId" : todoListId,
					"completed" : completed
				},
				dataType : "text",
				success : function(result) {
					if (result < 0) {
						console.log("todoListCompleted result: 실패");
					} else {
						console.log("todoListCompleted result: 성공");
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요 :)");
				}
			});
	    });
	
	
	
		$("#inputForm").on("click", function(event) {
			/* event.preventDefault(); */

			let todoDate = $("#todoDate").val();
			let lists = $("input[name='list']").map(function() {
				return $(this).val();
			}).get();
			let listsText = lists.join("|||"); // 구분자로 ||| 사용

			$.ajax({
				url : "todoList.do",
				type : "post",
				data : {
					"todoDate" : todoDate,
					"lists" : listsText
				},
				dataType : "text",
				success : function(result) {
					if (result < 0) {
						console.log("todo-submit result: 실패");
					} else {
						console.log("todo-submit result: 성공");
						location.reload();
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요 :)");
				}
			});
		});

		function addInputGroup() {
			let newInputGroup = document.createElement('div');
			newInputGroup.className = 'input-group mb-3';

			let inputText = document.createElement('input');
			inputText.type = 'text';
			inputText.className = 'form-control text-end';
			inputText.name = 'list';

			let inputGroupText = document.createElement('span');
			inputGroupText.className = 'input-group-text';
			let inputSubmit = document.createElement('input');
			inputSubmit.type = 'button';
			inputSubmit.value = '+';
			inputSubmit.onclick = addInputGroup;
			inputGroupText.appendChild(inputSubmit);
			inputSubmit.className = 'todo-submit';

			newInputGroup.appendChild(inputText);
			newInputGroup.appendChild(inputGroupText);

			let lastSubmit = document.getElementsByClassName("todo-submit");
			if (lastSubmit.length > 0) {
				lastSubmit[lastSubmit.length - 1].onclick = ""; // 이전 +버튼 클릭 이벤트 제거
				lastSubmit[lastSubmit.length - 1].disabled = true; // 이전 +버튼 비활성화
			}

			document.getElementById("inputgroup-container").appendChild(
					newInputGroup);
		}

		function displayDate() {
			var selectedDate = document.getElementById("todoDate").value;
			document.getElementById("selectedDate").innerText = selectedDate;

			var todoShowbtn = document.getElementById("todoShowbtn");

			todoShowbtn.innerHTML = '<button type="button" class="btn btn-success" onclick="goToLocation()">계획 보기</button>';
		}

		function goToLocation() {
			var selectedDate = document.getElementById("todoDate").value;
			location.href = "todoListShow.do?todoDate=" + selectedDate;
		}

		var fp = flatpickr(document.getElementById("todoDate"), {
			"locale" : "ko"
		});

		var dateSelector = document.querySelector('.dateSelector');
		dateSelector.flatpickr();
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>