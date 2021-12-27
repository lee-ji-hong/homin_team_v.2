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
		<div class="right-wrap-part-inside" >
					<h3>안녕하세요. ${sessionScope.nickname }님 합리적인 쇼핑을 홈인과 함께해보세요.</h3>		
		</div>
		<div class="recent_product">
						<h3>최근 본 상품</h3>
						
						<div class="recent_product_comment">
						<h2 style="font-size:15px; margin-left: 15px;">최근 본 상품은 최대 24시간,5개까지 유지되며, 삭제된 상품 및 로그인 전 확인한 상품은 일부 제한 될 수 있습니다.</h2>
						</div>
						<c:forEach var="pr" items="${prod}">
							<div class="mypage_recent_productlist"
								onclick="location.href='/homin/product?category=${pr.classification }&prodNo=${pr.product_no }'" style="cursor: pointer;">
								<img style="height:250px;" src="/product_img/${pr.product_filename}"> 
								<div class="mypage_recent_productlist_text">
									<span>제품코드 : ${pr.product_no }</span>
									<span>제품명 : ${pr.product_name }</span>
								</div>
							</div>
						</c:forEach>
		</div>
				</c:otherwise>
			</c:choose>
		<c:if test = '${prod eq "" || prod eq null }'>
			<div class="warning_view">
				<img src="${pageContext.request.contextPath}/resources/image/warning.png">	
			</div>
			<div class="recent_product_no">
				<h3>최근 본 상품이 없습니다.</h3>
			</div>
		</c:if>

	</div>
</div>