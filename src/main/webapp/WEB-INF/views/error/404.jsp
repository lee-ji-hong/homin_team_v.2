<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width:800px; height: 800px; margin: 0px auto; display: flex; flex-direction: column; text-align: center">
	<img src = "${root }resources/image/logo2.png">
	<h1>404..</h1>
	<input type = "button" onclick = "javascript:location.href='${root}index?formpath=home'" value = "메인으로 돌아가기."
	style="width: 400px; height: 70px; margin: 0px auto; border-radius: 30px; font-size: 25px; color: white;
	background-color: skyblue;"
	>
</div>
</body>
</html>