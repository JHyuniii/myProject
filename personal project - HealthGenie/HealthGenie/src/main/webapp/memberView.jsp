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
	<h4 class="text-center mb-4">회원 상세 정보</h4>
	<div class="card p-4 mx-auto">
		<div class="mb-3">
			<label for="id" class="form-label">아이디</label> <input type="text"
				class="form-control" id="inputId" name="id"
				value="${requestScope.memberDTO.userId }" readonly>
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">비밀번호</label> <input
				type="text" class="form-control" id="password" name="password"
				value="${requestScope.memberDTO.password }" readonly>
		</div>
		<div class="mb-3">
			<label for="phoneNumber" class="form-label">전화번호</label> <input
				type="text" class="form-control" id="phoneNumber" name="phoneNumber"
				value="${requestScope.memberDTO.phoneNumber }" readonly>
		</div>

		<div class="mb-3">
			<label for="birthday" class="form-label">생년월일</label> <input
				type="text" class="form-control" id="birth" name="birth"
				value="${requestScope.memberDTO.birth }" readonly>
		</div>

		<div class="col-auto d-flex justify-content-center mb-3">
			<div class="btn-group w-100" role="group" aria-label="Gender">
				<c:choose>
					<c:when test="${requestScope.memberDTO.gender eq 'F' }">
						<input type="radio" class="btn-check btn-lg" name="gender"
							id="success-outlined" value="F" autocomplete="off" checked>
						<label class="btn btn-outline-danger w-50" for="success-outlined">여성</label>
						<input type="radio" class="btn-check btn-lg" name="gender"
							id="danger-outlined" value="M" autocomplete="off" disabled>
						<label class="btn btn-outline-primary w-50" for="danger-outlined">남성</label>
					</c:when>
					<c:when test="${requestScope.memberDTO.gender eq 'M' }">
						<input type="radio" class="btn-check btn-lg" name="gender"
						id="success-outlined" value="F" autocomplete="off" disabled>
					<label class="btn btn-outline-danger w-50" for="success-outlined">여성</label>
					<input type="radio" class="btn-check btn-lg" name="gender"
						id="danger-outlined" value="M" autocomplete="off" checked>
					<label class="btn btn-outline-primary w-50" for="danger-outlined">남성</label>
					</c:when>
				</c:choose>
			</div>
		</div>

		<div>가입 날짜 : ${requestScope.memberDTO.createDate }</div>

		<div class="d-grid mx-auto">
			<button type="submit" class="btn btn-secondary mt-3 memberDelete">회원 삭제</button>
			<input type="hidden" id="hiddenMemeberNum" name="hiddenMemberNum" value="${requestScope.memberDTO.memberNum }">
		</div>
	</div>


	<script>
	$('.memberDelete').on('click', function() {
		let memberNum = $('#hiddenMemeberNum').val();
			console.log(memberNum);
      $.ajax({
          url: 'memberDelete.do',
          type: 'post',
          data: { "memberNum": memberNum },
          dataType: 'text',
          success: function(result) {
              if(result > 0){
            	  alert("회원 삭제가 완료되었습니다.");
            	  location.reload();
              } else {
            	  alert("회원 삭제에 실패하였습니다. 다시 시도해주세요 :)");
              }
          },
          error: function() {
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