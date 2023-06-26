<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>배차등록</title>
</head>
<body>
<form action="busRegisterOK.do">
   <table border="1">
      <tr>
         <td>회사명</td>
         <td>
            <select name="i_name">
               <c:forEach var="companyList" items="${companyList}">
                  <option value="${companyList.c_name }">${companyList.c_name }</option>
               </c:forEach>
            </select>
         </td>
      </tr>
      <tr>
         <td>차량번호</td>
         <td><input type="text" name="i_busNum" placeholder="예)12머3456"></td>
      </tr>
      <tr>
         <td>출발터미널</td>
         <td>
            <select name="b_startTerminal">
               <c:forEach var="terminalList" items="${terminalList}">
                  <option value="${terminalList.t_name }">${terminalList.t_name }</option>
               </c:forEach>
            </select>
         </td>
      </tr>
      <tr>
         <td>도착터미널</td>
         <td>
            <select name="b_arrivalTerminal">
               <c:forEach var="terminalList" items="${terminalList}">
                  <option value="${terminalList.t_name }">${terminalList.t_name }</option>
               </c:forEach>
            </select>
         </td>
      </tr>
      <tr>
         <td>출발일자</td>
         <td><input type="date" name="b_departureDate"></td>
      </tr>
      <tr>
         <td>출발시간</td>
         <td><input type="time" name="b_departureTime"></td>
      </tr>
      <tr>
         <td>도착일자</td>
         <td><input type="date" name="b_arrivalDate"></td>
      </tr>
      <tr>
         <td>도착시간</td>
         <td><input type="time" name="b_arrivalTime"></td>
      </tr>
      <tr>
         <td>버스등급</td>
         <td>
            <select name="i_grade">
               <option value="pri">프리미엄</option>
               <option value="hon">우등</option>
               <option value="nor">일반</option>
            </select>
         </td>
      </tr>
      <tr>
         <td>운임료</td>
         <td><input type="text" name="i_price"></td>
      </tr>
      <tr>
         <td colspan="2">
            <input type="submit" value="배차정보 등록">
            <input type="reset" value="전체지우기">
         </td>
      </tr>
   </table>
</form>
</body>
</html>