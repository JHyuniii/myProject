<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>직원 정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>


<body>

    <div class="container col-6">
        <h2 class="text-center mt-3 mb-3">직원 정보 수정</h2>

        <form action="/member/update" method="post">
            <div class="mb-3 row">
                <label for="inputMemberNum" class="col-sm-2 col-form-label">직원번호</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputMemberNum" name="memberNum" value="${MemberDTO.memberNum}" readonly>
                    <div class="form-text" id="memberNumCheckMsg"></div>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputName" class="col-sm-2 col-form-label">직원명</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputName" name="name" value="${MemberDTO.name}">
                    <div class="form-text" id="nameCheckMsg"></div>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputRank" class="col-sm-2 col-form-label">직급</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputRank" name="rank" value="${MemberDTO.rank}">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputPhoneNumber" class="col-sm-2 col-form-label">전화번호</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputPhoneNumber" name="phoneNumber" value="${MemberDTO.phoneNumber}">
                    <div class="form-text" id="phoneNumberCheckMsg"></div>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="inputEmail" name="email" value="${MemberDTO.email}">
                    <div class="form-text" id="emailCheckMsg"></div>
                </div>
            </div>
            <button type="submit" id="submitBtn" class="btn btn-primary">수정 완료</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    $("#inputName").focusout(function () {
        let inputName = $(this);
        let checkName = /[a-zA-Zㄱ-힣]{1,10}/;

        if (checkName.test(inputName.val())) {
            $("#nameCheckMsg").text("");
            $('#submitBtn').prop("disabled", false);
        } else {
            $("#nameCheckMsg").text("유효하지 않은 이름입니다. 한글 또는 영문자 1~10자로 입력해 주세요.").css("color", "red");
            $('#submitBtn').prop("disabled", true);
        }
    });

    $("#inputPhoneNumber").focusout(function () {
        let inputPhoneNumber = $(this);
        let checkPhone = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;

        if (checkPhone.test(inputPhoneNumber.val())) {
            $("#phoneNumberCheckMsg").text("");
            $('#submitBtn').prop("disabled", false);
        } else {
            $("#phoneNumberCheckMsg").text("유효하지 않은 전화번호 형식입니다.").css("color", "red");
            $('#submitBtn').prop("disabled", true);
        }
    });

    $("#inputEmail").focusout(function () {
        let inputEmail = $(this);
        let checkPhone = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

        if (checkPhone.test(inputEmail.val())) {
            $("#emailCheckMsg").text("");
            $('#submitBtn').prop("disabled", false);
        } else {
            $("#emailCheckMsg").text("유효하지 않은 이메일 형식입니다.").css("color", "red");
            $('#submitBtn').prop("disabled", true);
        }
    });
</script>

</html>