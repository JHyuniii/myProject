<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신고 처리 목록</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

</head>
<body>
	<p class="text-center mb-2">운영 규정 위반으로 삭제조치 되었습니다.</p>
	<table class="table table-hover text-center">
		<thead class="table-light">
			<tr>
				<th scope="col">구분</th>
				<th scope="col">신고 대상</th>
				<th scope="col">삭제 날짜</th>
			</tr>
		</thead>

		<tbody class="table-group-divider">
			<c:forEach var="item" items="${reportMessageList}">
				<tr>
					<c:if test="${item.title eq null }">
						<th scope="row">댓글</th>
						<td>${item.commentContent }</td>
						<td>${item.deleteDate }</td>
					</c:if>
					<c:if test="${item.commentContent eq null }">
						<th scope="row">게시물</th>
						<td>${item.title }</td>
						<td>${item.deleteDate }</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<%-- <div class="mb-3">
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
	</div> --%>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>