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
					<h3>안녕하세요. ${sessionScope.nickname }님 합리적인 쇼핑을 홈인과 함께해보세요.</h3>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="recent_product">
			<h3>최근 본 상품 </h3>
		</div>
		<div class="warning_view">
			<img src="${pageContext.request.contextPath}/resources/image/warning.png">	
		</div>
		<div class="warning_view__comment">
			<h3>최근 본 상품이 없습니다.</h3>
		</div>
	</div>
</div>