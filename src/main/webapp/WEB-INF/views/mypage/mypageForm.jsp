<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<c:set var="root" value="/"></c:set>
<div class="mypage_wrap">
	<c:import url="mypage/mypageNav.jsp"></c:import>
	
	<div class="right-wrap-part">
		<div class="right-wrap-part-inside" >
			<c:choose>
				<c:when test="${category eq 'myinquiry' }">
					<c:import url="${root }myinquiry"></c:import>
				</c:when>
				<c:when test="${category eq 'myinquiryView' }">
					<c:import url="${root }myinquiryView"></c:import>
				</c:when>
				<c:when test="${category eq 'orderHistory' }">
					<c:import url="${root }orderHistory"></c:import>
				</c:when>
				<c:otherwise>
					<h3>안녕하세요. ${sessionScope.nickname }님</h3>
					<div class="recent_product">
						<h3>최근 본 상품</h3>
						<c:forEach var="pr" items="${prod}">
							<div
								onclick="javascript:loaction.href = '/homin/product?category=${pr.classification }&prodNo=${pr.product_no }'">
								<img src="/product_img/${pr.product_filename}"> <span>${pr.product_no }</span>
								<span>${pr.product_name }</span>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<c:if test = '${prod eq "" || prod eq null }'>
			<div class="warning_view">
				<img src="${pageContext.request.contextPath}/resources/image/warning.png">	
			</div>
			<div class="recent_product">
				<h3>최근 본 상품이 없습니다.</h3>
			</div>
		</c:if>
	</div>
</div>