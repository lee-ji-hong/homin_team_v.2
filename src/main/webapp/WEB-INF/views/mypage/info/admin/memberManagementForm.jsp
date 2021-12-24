<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<c:url var="root" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.membermanage_wrap{
    max-width: 1240px;
    padding: 50px;
    margin: 0 auto;
    /* display: flex; */
    /* justify-content: space-between; */
    background: #eee;
    border-radius: 4px;
}
.membermanage_table{
	display: flex;
    justify-content: space-around;
    width: 100%;
    align-items: center;
    
}
.membermanage_navbar{
	display: flex;
    font-size: 13px;
    line-height: 48px;
    color: #222;
    border-bottom: 2px solid #ddd;
    justify-content: space-around;
    align-items: center;
    background: #f6f6f6;
    font-weight: 600;
    margin-top: 40px;
}

.membermanage_component{
	display: flex;
    font-size: 13px;
    line-height: 48px;
    color: #222;
    border-bottom: 2px solid #ddd;
    justify-content: space-around;
    align-items: center;
    font-weight: 600;
}

.membermanage_component span{
width:225px;
text-align:center;
}
</style>
<title>Insert title here</title>
</head>
<c:if test = "${sessionScope.id ne 'admin' }">
	<script>
		alert('잘못된 접근입니다.');
		window.history.back();
	</script>
</c:if>
<body>
<div class="mypage_wrap">
	<div>
		<h3 style="font-size: 24; margin: 0 0 20 0px;">사용자 관리</h3>
	</div>
	<form class="membermanage_wrap" action="#" method="get">
		<table class="membermanage_table" >
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
	<c:if test="${not empty msg }">
		<script>
			alert('${msg}');
			location.href = '${root}index?formpath=rental&category=dryer'
		</script>
	</c:if>
	<div class="membermanage_navbar">
					<div>번호</div>
					<div>아이디</div>
					<div>이름</div>
					<div>전화번호</div>
					<div>이메일</div>
					
		</div>
	<c:forEach var="list" items="${memberList }">
	<div>
		
		<div class="membermanage_component">
			<span >${list.no }</span> 
			<span>
				<a href="${root }index?formpath=memberView&id=${list.id}">${list.id }</a>
			</span> 
			<span>${list.nickname }</span> 
			<span>${list.phone }</span> 
			<span>${list.email }</span>
		</div>
	</div>
	</c:forEach>
	<div style="margin: 50px; text-align: center;">
	${page }
	</div>
	
</div>
</body>
</html>