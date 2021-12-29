<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<script>
	function orderCancle(uid){
		 if (confirm("정말 삭제하시겠습니까?") == true){
			 $.ajax({
				url : "cancle",
				data : uid,
				type : "POST",
				success : function(){
					alert("성공");
					window.location.reload();
				},
				error : function(){
					alert("문제")
				}
			 })
		 }
	}
</script>

<style>
.orderhistory-btn-wrap{
	display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.orderhistory-btn-wrap input{
	width: 70px;
    height: 35px;
    border-radius: 6px;
    border: 2px solid #ddd;
    margin: 5px;
}
</style>

	<div>
		<h3 style="font-size: 24; margin: 0 0 20 0px;">주문 내역</h3>
	</div>
	<div class="recent_product_comment">
		<h2 style="font-size:15px; margin-left: 15px; line-height: 3;">최근 2주 이내에 구매한 상품입니다.</h2>
	</div>
	<c:choose>
		<c:when test="${myOrder eq '[]' }">
		<div><hr></div>
		<div class="warning_view">
				<img src="${pageContext.request.contextPath}/resources/image/warning.png">	
			</div>
		<div class="recent_product_no">
			<h3>구매한 제품이 없습니다.</h3>
		</div>
			
		</c:when>
	</c:choose>
<c:forEach var="order" items="${myOrder }">
<div><hr></div>
	<div onclick = "location.href='${root}product?category=${order.classification}&prodNo=${order.product_no}'">
		<div style="display: flex; margin: 20px; border-bottom: 1px solid #ddd; justify-content: space-between;">
			<div style="    margin: 15px"><img src = "/product_img/${order.productImg}" style="width:144px; height: 144px"></div>
			<div style=" line-height: 3; ">
				<div>주문번호:${order.uid }</div>
				<div>제품명:${order.productName }</div>
				<div>가격:${order.amount }원</div>
			</div>
			<div class="orderhistory-btn-wrap">
				<input type = "button" value = "주문 취소" onclick = "orderCancle('${order.uid}')">
				<input type = "button" value = "후기 작성" onclick = "location.href = '${root }index?formpath=write&product_img=${order.productImg}&category=${order.classification }&order_no=${order.uid }'">
			</div>
			
		</div>
		
	</div>
	
</c:forEach>

