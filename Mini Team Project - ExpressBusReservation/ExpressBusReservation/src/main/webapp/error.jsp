<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>error</title>
</head>
<body>
<script>
<%-- 	alert('<%=request.getAttribute("errMSG")%>');
	location.href = '<%=request.getAttribute("url")%>'; --%>
	
	alert(${errMSG});
	location.href = ${url};
</script>
</body>
</html>