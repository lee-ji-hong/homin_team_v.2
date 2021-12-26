<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<style>
	input{appearance:auto;}
	
	.basket_btnbb{
	width: 70px;
    height: 35px;
    border-radius: 6px;
    border: 2px solid #ddd;
    margin: 5px;
	}
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
<div class="mypage_wrap">
	<c:import url="mypage/mypageNav.jsp"></c:import>
	<div class="right-wrap-part" style="    /* 	border: 1px solid; */justify-content: space-between;">
	<div>
		<h3 style="font-size: 24; margin: 0 0 20 0px;">장바구니</h3>
	</div>
	<section>
	<hr>
		<div>
				<div style="text-align: center;" class="basket_navbar">
					<div style="width:50px">NO</div>
					<div style="width:150px">제품이름</div>
					<div style="width:150px">제품사진</div>
<!-- 					<div>제품번호</div> -->
					<div style="width:350px">제품명</div>
					<div style="width:100px">가격</div>
					<div style="width:100px">구매/삭제</div>
				</div>
		</div>
		<table>
			
				<c:set var="prNo" value="0"></c:set>
				<c:forEach var="bDto" items="${basket }">
				<c:set var="prNo" value="${prNo + 1 }"></c:set>
				
				<tbody>
					<tr style="text-align: center;" class="basket_component">
						<td style="width:50px">${prNo }</td>
						<c:choose>
							<c:when test="${bDto.classification eq 'dryer' }">	
								<td style="width:150px">건조기</td>
							</c:when>
							<c:when test="${bDto.classification eq 'waterpurifier' }">
								<td style="width:150px">정수기</td>
							</c:when>
							<c:when test="${bDto.classification eq 'aircleaner' }">
								<td style="width:150px">공기청정기</td>
							</c:when>
							<c:when test="${bDto.classification eq 'washmachine' }">
								<td style="width:150px">식기세척기</td>
							</c:when>
							<c:when test="${bDto.classification eq 'microwave' }">
								<td style="width:150px">전기레인지</td>
							</c:when>
						<c:otherwise>
								<td style="width:150px">얼음정수기/냉장고</td>
							</c:otherwise>
						</c:choose>

						<td ><img src = "/product_img/${bDto.product_img}" style="width: 150px; margin-right: 10px; height: 150px;"
								onclick = "location.href='${root}product?category=${bDto.classification }&prodNo=${bDto.product_no }'"></td>
						<td style="width: 350px; display: flex; text-align: left; flex-direction: column;" >
							<p style="line-height:1.5;"> ${bDto.product_no }</p>
							<strong>${bDto.product_name }</strong>
						</td>
						<td style="width:100px">${bDto.price }</td>
						<td style="width:100px">
							<input class="basket_btnbb" type="button" value="구매" onclick="location.href='${root}index?formpath=product&category=${bDto.classification }&prodNo=${bDto.product_no }';">
							<input  class="basket_btnbb" type="button" value="삭제" onclick="location.href='deleteBasket?no=${bDto.product_no}';">
						</td>
						

				</c:forEach>
					</tr>
				</tbody>
		</table>
	</section>
</div>
</div>