<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<style>
	input{appearance:auto;}
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<c:if test="${not empty msg }">
	<script>
		alert('${msg}');
		location.href='${root}index?formpath=rental&category=dryer'
	</script>
</c:if>
<div class="bascket_test">
	<c:import url="mypage/mypageNav.jsp"></c:import>

	<section>
		<h3>장바구니</h3>
		<table>
			<thead>
				<tr>
					<td>NO</td><td>제품이름</td><td>제품사진</td><td>제품번호</td><td>제품명</td><td>가격</td><td>구매/삭제</td>
				</tr>
				
			</thead>
				<c:set var="prNo" value="0"></c:set>
				<c:forEach var="bDto" items="${basket }">
				<c:set var="prNo" value="${prNo + 1 }"></c:set>
				<tbody>
					<tr>
						<td>${prNo }</td>
						<c:choose>
							<c:when test="${bDto.classification eq 'dryer' }">	
								<td>건조기</td>
							</c:when>
							<c:when test="${bDto.classification eq 'waterpurifier' }">
								<td>정수기</td>
							</c:when>
							<c:when test="${bDto.classification eq 'aircleaner' }">
								<td>공기청정기</td>
							</c:when>
							<c:when test="${bDto.classification eq 'washmachine' }">
								<td>식기세척기</td>
							</c:when>
							<c:when test="${bDto.classification eq 'microwave' }">
								<td>전기레인지</td>
							</c:when>
						<c:otherwise>
								<td>얼음정수기/냉장고</td>
							</c:otherwise>
						</c:choose>
						<td><img src = "/product_img/${bDto.product_img}" style="width: 150px;height: 150px;"
								onclick = "location.href='${root}index?formpath=product&category=${bDto.classification }&prodNo=${bDto.product_no }'"></td>
						<td>${bDto.product_no }</td>
						<td><strong>${bDto.product_name }</strong></td>
						<td>${bDto.price }</td>
						<td><input type="button" value="구매" onclick="location.href='${root}index?formpath=product&category=${bDto.classification }&prodNo=${bDto.product_no }';"></td>
						<td><input type="button" value="삭제" onclick="location.href='deleteBasket?no=${bDto.product_no}';"></td>
				</c:forEach>
				</tbody>
		</table>
	</section>
</div>