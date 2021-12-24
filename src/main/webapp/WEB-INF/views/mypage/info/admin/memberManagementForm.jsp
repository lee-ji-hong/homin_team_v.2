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
<c:if test = "${sessionScope.id ne 'admin' }">
	<script>
		alert('잘못된 접근입니다.');
		window.history.back();
	</script>
</c:if>
<body>
	회원 관리 폼
	<c:if test="${not empty msg }">
		<script>
			alert('${msg}');
		</script>
	</c:if>
	<c:forEach var="list" items="${memberList }">
	<c:if test = "${list.id ne 'admin' }">
		<div>
			<span>번호 ${list.no }</span> <span><a
				href="${root }index?formpath=memberView&id=${list.id}">Id
					${list.id }</a></span> <span>nick ${list.nickname }</span> <span>phone
				${list.phone }</span> <span>email ${list.email }</span>
		</div>
	</c:if>
	</c:forEach>
	${page }
	<form action="#" method="get">
		<table>
			<tr>
				<td>
					<input class="review_underbar_2" type="hidden" name='formpath' value = "memberManagement">
					<select  class="review_underbar_1" name="select">
						<option value="id">아이디</option>
						<option value="nickname">이름</option>
					</select>
					<input class="review_underbar_2" type=text name='search'/>
					<input class="review_underbar_3" type=submit name='searchBtn' value='검색' style="width: 80px; "/>
				</td>
			</tr>
		</table>
		</form>
</body>
</html>