<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Post View</title>
<link href="./fontCss/*font.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style>
th {
	width: 15vw;
	text-align: center;
}

.btn-td {
	width: 45vw;
}

.btn-out {
	border: none;
}

.tr-head {
	text-align: center;
	font-weight: bold;
}

.table-bordered {
	border-collapse: collapse;
}

.table-bordered th, .table-bordered td {
	border: 1px solid #dee2e6;
	padding: 8px;
}

.table-bordered th:last-child, .table-bordered td:last-child {
	border-right-width: 0;
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
					<li class="nav-item"><a class="nav-link" href="todoList.jsp">TodoList</a></li>
					<li class="nav-item"><a class="nav-link"
						href="interestList.do">운동 저장 목록 🛒</a></li>
				</ul>
				<div class="d-flex">
					<li><button class="btn btn-outline-light"
							onclick="location.href='logout.do'">로그아웃</button></li>
					<li><button class="btn btn-outline-light"
							onclick="location.href='myPage.jsp'">마이페이지</button></li>
				</div>
			</div>
		</div>
	</nav>

	<div class="container col-9 mt-4">
		<div class="d-flex justify-content-between align-items-center">
			<div></div>
			<h2 class="mb-3">${requestScope.postDTO.title }</h2>
			<button type="button" class="btn btn-outline-danger btn-out"
				data-bs-toggle="modal" data-bs-target="#postReportModal">신고</button>
		</div>


		<table class="table align-middle table-bordered">
			<tbody>
				<tr>
					<th scope="row" class="table-light">글쓴이</th>
					<td><input class="form-control" list="datalistOptions"
						id="exampleDataList" name="part"
						value="${requestScope.postDTO.userId }" readonly></td>
				</tr>
				<tr>
					<th scope="row" class="table-light">제목</th>
					<td><textarea class="form-control" id="floatingTextarea2"
							name="goodPoint" style="height: 100px" readonly>${requestScope.postDTO.title }</textarea></td>
				</tr>
				<tr>
					<th scope="row" class="table-light">게시 날짜</th>
					<td colspan="2"><input class="form-control"
						id="exampleDataList" name="part"
						value="${requestScope.postDTO.createDate }" readonly></td>
				</tr>
				<tr>
					<th scope="row" class="table-light">조회수</th>
					<td colspan="2"><input class="form-control"
						id="exampleDataList" name="part"
						value="${requestScope.postDTO.views }" readonly></td>
				</tr>
				<tr>
					<th scope="row" class="table-light">내용</th>
					<td><c:choose>
							<c:when test="${requestScope.fileName eq null }">
								<textarea class="form-control" id="floatingTextarea2"
									style="height: 100px" readonly>${requestScope.postDTO.content }</textarea>
							</c:when>
							<c:when test="${requestScope.fileName ne null }">
								<img src="./healthPostIMG/${requestScope.fileName }"
									class="img-fluid" width="100vw" />
								<textarea class="form-control mt-2" id="floatingTextarea2"
									style="height: 100px" readonly>${requestScope.postDTO.content }</textarea>
							</c:when>
						</c:choose></td>
				</tr>
			</tbody>
		</table>

		<div class="row justify-content-center mt-3 mb-5">
			<div class="col-md-6">
				<div class="input-group">
					<c:if test="${sessionScope.id eq requestScope.postDTO.userId }">
						<button type="button" class="btn btn-light form-control"
							id="postDeleteBtn">글 삭제</button>
						<input type="hidden" id="hiddenPostNum"
							value="${requestScope.postNum }">
					</c:if>
					<button type="button" class="btn btn-secondary form-control"
						onclick="location.href='community.do'">목록으로 돌아가기</button>
				</div>
			</div>
		</div>

		<table class="table align-middle table-bordered text-center mb-5 mt-3"
			style="border: 1px solid #DEDEDE;">
			<thead>
				<h4 class="text-center">댓글</h4>
			</thead>
			<tbody>
				<tr>
					<form action="comment.do">
						<th scope="row">${sessionScope.id }</th>
						<td class="btn-td"><textarea class="form-control"
								id="floatingTextarea2" name="commentContent"
								style="height: 100px"></textarea></td>
						<td><button type="submit"
								class="btn btn-outline-secondary btn-out">댓글등록</button></td> <input
							type="hidden" name="postNum" value="${requestScope.postNum }">
					</form>
				</tr>

				<tr class="tr-head table-light">
					<td>작성자</td>
					<td>내용</td>
					<td>작성시각</td>
				</tr>

				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.userId}</td>
						<td>${list.commentContent}</td>
						<td>${list.commentCreateDate}</td>
						<td><button type="button"
								class="btn btn-outline-danger btn-out" data-bs-toggle="modal"
								data-bs-target="#commentReportModal"
								data-comment-num="${list.commentNum}">신고</button></td>
						<c:if test="${sessionScope.id eq list.userId }">
							<td><button type="button"
									class="btn btn-outline-secondary btn-out" id="commentDeleteBtn">삭제</button></td>
							<input type="hidden" id="hiddenCommentNum" value="${list.commentNum }">
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



	<!-- 게시물 신고 Modal -->
	<div class="modal fade" id="postReportModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">게시물 신고 🚨</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="postReport.do" method="post">
					<div class="modal-body">
						<div class="mb-1 mt-1">
							<div class="form-floating">
								<textarea class="form-control" id="floatingTextarea2"
									name="reportContents" style="height: 150px"></textarea>
								<label for="floatingTextarea2">신고 내용을 자세히 적어주세요. *무분별한
									신고는 자제해주세요.</label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-danger">신고 접수하기</button>

						<input type="hidden" name="postNum"
							value="${requestScope.postNum }">

						<%-- <input type="hidden" name="hiddenUserId" value="${requestScope.postDTO.userId }"> --%>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 댓글 신고 Modal -->
	<div class="modal fade" id="commentReportModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">댓글 신고 🚨</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="commentReport.do" method="post">
					<div class="modal-body">
						<div class="mb-1 mt-1">
							<div class="form-floating">
								<textarea class="form-control" id="floatingTextarea2"
									name="reportContents" style="height: 150px"></textarea>
								<label for="floatingTextarea2">신고 내용을 자세히 적어주세요. *무분별한
									신고는 자제해주세요.</label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-danger">신고 접수하기</button>
						<input type="hidden" name="commentNum" id="commentNum" value="" />
						<input type="hidden" name="postNum"
							value="${requestScope.postNum }">
						<%-- <input type="hidden" name="hiddenUserId" value="${requestScope.list.userId }"> --%>
					</div>
				</form>
			</div>
		</div>
	</div>





	<script>
		//댓글 삭제
		$('#commentDeleteBtn').on('click', function() {
			let commentNum = $('#hiddenCommentNum').val();
			console.log(commentNum);
			$.ajax({
				url : 'commentDelete.do',
				type : 'post',
				data : {
					"commentNum" : commentNum
				},
				dataType : 'text',
				success : function(result) {
					if (result > 0) {
						alert("댓글 삭제가 완료되었습니다.");
					} else {
						alert("글 삭제에 실패하였습니다. 다시 시도해주세요 :)");
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요 :)");
				}
			});
		});
		
		
		//게시물 삭제
		$('#postDeleteBtn').on('click', function() {
			let postNum = $('#hiddenPostNum').val();
			console.log(postNum);
			$.ajax({
				url : 'postDelete.do',
				type : 'post',
				data : {
					"postNum" : postNum
				},
				dataType : 'text',
				success : function(result) {
					if (result > 0) {
						alert("글 삭제가 완료되었습니다.");
						location.href = "community.do"
					} else {
						alert("글 삭제에 실패하였습니다. 다시 시도해주세요 :)");
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요 :)");
				}
			});
		});

		//댓글 num hidden으로 넘기기
		$("#commentReportModal").on("show.bs.modal", function(event) {
			var button = $(event.relatedTarget);
			var commentNum = button.data("comment-num");
			$("#commentNum").val(commentNum);
		});
	</script>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>