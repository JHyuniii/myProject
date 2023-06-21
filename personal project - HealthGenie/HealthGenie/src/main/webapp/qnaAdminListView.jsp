<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

</head>
<body>
	<h4 class="text-center mb-4">문의 내용 상세보기</h4>
	<div class="card p-4 mx-auto">
		<div class="mb-3">
			<label for="userId" class="form-label">작성자</label> <input type="text"
				class="form-control" id="userId" name="userId"
				value="${requestScope.qnaDTO.sendUser }" readonly>
		</div>
		<div class="mb-3">
			<div class="form-floating">
				<textarea class="form-control" id="floatingTextarea" name="qnaTitle"
					readonly>${requestScope.qnaDTO.qnaTitle }</textarea>
				<label for="floatingTextarea">제목</label>
			</div>
		</div>
		<div class="mb-3">
			<div class="form-floating">
				<textarea class="form-control" id="floatingTextarea2"
					name="qnaContents" style="height: 150px" readonly>${requestScope.qnaDTO.qnaContents }</textarea>
				<label for="floatingTextarea2">문의 내용을 자세히 적어주세요.</label>
			</div>
		</div>
	</div>


	<c:if test="${requestScope.qnaDTO.solve eq true}">
		<h4 class="text-center mt-4 mb-4">보낸 답변 확인 📨</h4>
		<div class="card p-4 mx-auto">
			<div class="mb-3">
				<label for="userId" class="form-label">받는 이</label> <input
					type="text" class="form-control" id="receiveUser"
					name="receiveUser" value="${requestScope.qnaDTO.sendUser }"
					readonly>
			</div>
			<div class="mb-3">
				<label for="userId" class="form-label">작성자</label> <input
					type="text" class="form-control" id="sendUser" name="sendUser"
					value="${sessionScope.superAdmin } (관리자)" readonly>
			</div>
			<div class="mb-3">
				<div class="form-floating">
					<textarea class="form-control" id="floatingTextarea"
						name="qnaTitle" readonly>[답변 드립니다.] ${requestScope.qnaDTO.qnaTitle }</textarea>
					<label for="floatingTextarea">제목</label>
				</div>
			</div>
			<div class="mb-3">
				<div class="form-floating">
					<textarea class="form-control" id="floatingTextarea2"
						name="qnaContents" style="height: 150px" readonly>${requestScope.qnaDTO.qnaContents }</textarea>
					<label for="floatingTextarea2">답변 한 문의사항 입니다.</label>
				</div>
			</div>
		</div>
	</c:if>



	<c:if test="${requestScope.qnaDTO.solve eq false }">
		<h4 class="text-center mt-4 mb-4">답변 보내기 📨</h4>
		<form action="qnaSendForMember.do" method="post">
			<div class="card p-4 mx-auto">
				<div class="mb-3">
					<label for="userId" class="form-label">받는 이</label> <input
						type="text" class="form-control" id="receiveUser"
						name="receiveUser" value="${requestScope.qnaDTO.sendUser }"
						readonly>
				</div>
				<div class="mb-3">
					<label for="userId" class="form-label">작성자</label> <input
						type="text" class="form-control" id="sendUser" name="sendUser"
						value="${sessionScope.superAdmin } (관리자)" readonly>
				</div>
				<div class="mb-3">
					<div class="form-floating">
						<textarea class="form-control" id="floatingTextarea"
							name="qnaTitle" readonly>[답변 드립니다.] ${requestScope.qnaDTO.qnaTitle }</textarea>
						<label for="floatingTextarea">제목</label>
					</div>
				</div>
				<div class="mb-3">
					<div class="form-floating">
						<textarea class="form-control" id="floatingTextarea2"
							name="qnaContents" style="height: 150px"></textarea>
						<label for="floatingTextarea2">문의 사항에 대한 답변을 적어주세요.</label>
					</div>
				</div>
				<div class="d-grid mx-auto mt-1">
					<button type="submit" class="btn btn-outline-secondary">답변
						등록</button>

					<input type="hidden" name="hiddenQnAnum"
						value="${requestScope.qnaDTO.qnANum }">
				</div>
			</div>
		</form>
	</c:if>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>