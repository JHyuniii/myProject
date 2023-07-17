<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>직원 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>
    #goDetail {
        cursor: pointer;
    }
</style>

<body>

    <div class="container col-8">
        <h2 class="text-center mt-3">직원 목록</h2>

        <!-- 직원 등록 modal Button -->
        <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#insertModal">
            등록
        </button>

        <a href="#" class="btn btn-outline-success" id="updateButton">수정</a>
        <a href="#" class="btn btn-outline-warning" id="deleteButton">삭제</a>


        <!-- 직원 등록 Modal -->
        <div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="insertModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="insertModalLabel">직원 등록</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="/member/insert" method="post">
                            <div class="mb-3 row">
                                <label for="inputMemberNum" class="col-sm-2 col-form-label">직원번호</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputMemberNum" name="memberNum">
                                    <div class="form-text" id="memberNumCheckMsg"></div>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputName" class="col-sm-2 col-form-label">직원명</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputName" name="name">
                                    <div class="form-text" id="nameCheckMsg"></div>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputRank" class="col-sm-2 col-form-label">직급</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputRank" name="rank">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputPhoneNumber" class="col-sm-2 col-form-label">전화번호</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputPhoneNumber" name="phoneNumber">
                                    <div class="form-text" id="phoneNumberCheckMsg"></div>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="inputEmail" name="email">
                                    <div class="form-text" id="emailCheckMsg"></div>
                                </div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" id="submitBtn" class="btn btn-primary">등록</button>
                        </form>
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>

        <table class="table text-center table-hover">
            <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col">직원번호</th>
                    <th scope="col">직원명</th>
                    <th scope="col">직급</th>
                    <th scope="col">전화번호</th>
                    <th scope="col">이메일</th>
                    <th scope="col">수정일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="member" items="${list}">
                    <tr>
                        <td>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="${member.memberNum}"
                                    id="flexCheckDefault">
                            </div>
                        </td>
                        <td>${member.memberNum}</td>
                        <td id="goDetail" onclick="location.href='/member/detail?memberNum=${member.memberNum}'">${member.name}</td>
                        <td>${member.rank}</td>
                        <td>${member.phoneNumber}</td>
                        <td>${member.email}</td>
                        <td>${member.updateDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    $('#inputMemberNum').on('input', function () {
        this.value = this.value.replace(/\D/g, '');

        if (this.value.length > 3) {
            this.value = this.value.substring(0, 3);
        }
    });

    $('#inputMemberNum').on('blur', function () {
        if (this.value.length < 3 || isNaN(this.value)) {
            $('#memberNumCheckMsg').text('직원번호는 3자리 숫자로 입력해야 합니다.');
            $('#submitBtn').prop("disabled", true);
        } else {
            $('#memberNumCheckMsg').text('');
        }
    });

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

    $("#updateButton").click(function () {
        const checkedCheckbox = $("input.form-check-input:checked");

        if (checkedCheckbox.length === 1) {
            const memberNum = checkedCheckbox.val();
            const updateUrl = "/member/update?memberNum=" + memberNum;

            $("#updateButton").attr("href", updateUrl);
        } else {
            alert("수정할 항목을 1개 선택해 주세요.");
        }
    });

    $("#deleteButton").click(function () {
        const checkedCheckbox = $("input.form-check-input:checked");

        if (checkedCheckbox.length === 1) {
            const memberNum = checkedCheckbox.val();
            const deleteUrl = "/member/delete?memberNum=" + memberNum;

            $("#deleteButton").attr("href", deleteUrl);
        } else {
            alert("삭제할 항목을 1개 선택해 주세요.");
        }
    });


</script>

</html>