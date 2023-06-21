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
	<h4 class="text-center mb-4">신고 내용 상세보기</h4>
	<div class="card p-4 mx-auto">
		<div class="mb-3">
			<label for="userId" class="form-label">신고 대상 회원</label> <input
				type="text" class="form-control" id="userId" name="userId"
				value="${requestScope.reportDTO.userId }" readonly>
		</div>
		<div class="mb-3">
			<div class="form-floating">
				<textarea class="form-control" id="floatingTextarea" name="qnaTitle"
					readonly>${requestScope.reportDTO.reportDate }</textarea>
				<label for="floatingTextarea">신고 날짜</label>
			</div>
		</div>
		<div class="mb-3">
			<div class="form-floating">
				<textarea class="form-control" id="floatingTextarea2"
					name="qnaContents" style="height: 150px" readonly>${requestScope.reportDTO.reportContents }</textarea>
				<label for="floatingTextarea2">신고 내용</label>
			</div>
		</div>

		<div class="d-flex justify-content-between mt-1">
			<button type="button" class="btn btn-outline-secondary" id="reportDeleteBtn">신고
				접수 확인 및 삭제 처리 진행</button>
			<button type="button" class="btn btn-outline-secondary">신고
				반려</button>
				
			<input type="hidden" id="hiddenUserId" value="${requestScope.reportDTO.userId }">
			
			<c:if test="${requestScope.reportDTO.postNum == null or requestScope.reportDTO.postNum == ''}">
				<input type="hidden" id="hiddenReportNum" value="c_${requestScope.reportDTO.commentNum }">
			</c:if>
			<c:if test="${requestScope.reportDTO.commentNum == null or requestScope.reportDTO.commentNum == ''}">
				<input type="hidden" id="hiddenReportNum" value="p_${requestScope.reportDTO.postNum }">
			</c:if>
			
		</div>

	</div>



	<script>
		$('#reportDeleteBtn').on('click', function() {
			
			// 요소를 찾음
			var hiddenUserIdBox = document.getElementById("hiddenUserId");
			// 값 가져오기
			var hiddenUserId = hiddenUserIdBox.value;
			// 값 처리
			console.log("hiddenUserId value:", hiddenUserId);
			
			// 요소를 찾음
			var hiddenReportNumBox = document.getElementById("hiddenReportNum");
			// 값 가져오기
			var hiddenReportNum = hiddenReportNumBox.value;
			// 값 처리
			console.log("hiddenReportNum value:", hiddenReportNum);
			
			
			$.ajax({
				url : 'reportDelete.do',
				type : 'post',
				data : {
					"hiddenUserId" : hiddenUserId,
					"hiddenReportNum" : hiddenReportNum
				},
				dataType : 'text',
				success : function(result) {
					if (result > 0) {
						location.reload();
						alert("신고 처리가 완료되었습니다.");
					} else {
						alert("신고 처리에 실패하였습니다. 다시 시도해주세요 :)");
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요 :)");
				}
			});
		});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>