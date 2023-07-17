<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>직원 상세 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

    <div class="container col-6">
        <h2 class="text-center mt-3 mb-3">직원 상세 정보</h2>
        <div class="mb-3 row">
            <label for="inputMemberNum" class="col-sm-2 col-form-label">직원번호</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="inputMemberNum" value="${MemberDTO.memberNum}">
            </div>
        </div>
        <div class="mb-3 row">
            <label for="inputName" class="col-sm-2 col-form-label">직원명</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="inputName" value="${MemberDTO.name}">
            </div>
        </div>
        <div class="mb-3 row">
            <label for="inputRank" class="col-sm-2 col-form-label">직급</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="inputRank" value="${MemberDTO.rank}">
            </div>
        </div>
        <div class="mb-3 row">
            <label for="inputPhoneNumber" class="col-sm-2 col-form-label">전화번호</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="inputPhoneNumber" value="${MemberDTO.phoneNumber}">
            </div>
        </div>
        <div class="mb-3 row">
            <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
            <div class="col-sm-10">
                <input type="email" readonly class="form-control-plaintext" id="inputEmail" value="${MemberDTO.email}">
            </div>
        </div>
        <div class="mb-3 row">
            <label for="inputUpdateDate" class="col-sm-2 col-form-label">수정일</label>
            <div class="col-sm-10">
                <input type="email" readonly class="form-control-plaintext" id="inputUpdateDate" value="${MemberDTO.updateDate}">
            </div>
        </div>

        <a href="/member/list" class="btn btn-outline-secondary">돌아가기</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>