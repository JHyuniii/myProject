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
	<div class="mb-3">
		<label for="userId" class="form-label">작성자</label> <input type="text"
			class="form-control" id="userId" name="userId"
			value="${sessionScope.id }" readonly>
	</div>
	<div class="mb-3">
		<div class="form-floating">
			<textarea class="form-control" id="floatingTextarea" name="qnaTitle"
				readonly>문의 드립니다.</textarea>
			<label for="floatingTextarea">제목</label>
		</div>
	</div>
	<div class="mb-3">
		<div class="form-floating">
			<textarea class="form-control" id="floatingTextarea2"
				name="qnaContents" style="height: 150px" readonly>${requestScope.dto.qnaContents }</textarea>
			<label for="floatingTextarea2">문의 내용을 자세히 적어주세요.</label>
		</div>
	</div>

<c:if test="${requestScope.dto.solve eq true  }">
	<div class="modal-header">
		<h5 class="modal-title">답변 내용</h5>
		<button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close"></button>
	</div>
	<div class="modal-body">
		<div class="mb-3">
			<label for="userId" class="form-label">작성자</label> <input type="text"
				class="form-control" id="sendUser" name="sendUser"
				value="${requestScope.qnaAdminDTO.sendUser } (관리자)" readonly>
		</div>
		<div class="mb-3">
			<div class="form-floating">
				<textarea class="form-control" id="floatingTextarea" name="qnaTitle"
					readonly>${requestScope.qnaAdminDTO.qnaTitle }</textarea>
				<label for="floatingTextarea">제목</label>
			</div>
		</div>
		<div class="mb-3">
			<div class="form-floating">
				<textarea class="form-control" id="floatingTextarea2"
					name="qnaContents" style="height: 150px" readonly>${requestScope.qnaAdminDTO.qnaContents }</textarea>
				<label for="floatingTextarea2">문의 사항에 대한 답변입니다.</label>
			</div>
		</div>
	</div>
</c:if>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>