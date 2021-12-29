<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="/"></c:set>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
<script>
	function deleteInquiry() {
		if(confirm("정말 삭제하시겠습니까?") == true){
			location.href='/homin/deleteInquiry?inquiryNo=${inquiryView.no}';
		}else{
			return false;
		}
	}
</script>

<div class="inquiry_test" style="width: 800px;  margin-top: 15px;">
	<div class="inquiry_test_head">
		<div style="
		    display: flex;
		    justify-content: space-between;
		    width: 800;">
			<h3>문의 내용</h3>
			<input style="width: 50px;
		    height: 35px;
		    border-radius: 6px;
		    border: 2px solid #ddd;"type = button value = "삭제" style="width: 50px; height: 20px;" onclick = "deleteInquiry();">
		</div>
	</div>
	<hr>
		<div>
			<div class="inquiry_test_type">
				<div class="inquiry_test_type_p">
					<p>문의 유형</p>
				</div>
				<c:choose>
					<c:when test="${inquiryView.inquiryType eq 'member' }">
						<div>회원</div>
					</c:when>
					<c:when test="${inquiryView.inquiryType eq 'order' }">
						<div>주문/신청</div>
					</c:when>
					<c:when test="${inquiryView.inquiryType eq 'product' }">
						<div>상품</div>
					</c:when>
					<c:when test="${inquiryView.inquiryType eq 'delivery' }">
						<div>배송</div>
					</c:when>
					<c:when test="${inquiryView.inquiryType eq 'exchange' }">
						<div>교환/환불/반품</div>
					</c:when>
					<c:when test="${inquiryView.inquiryType eq 'etc' }">
						<div>기타</div>
					</c:when>
				</c:choose>
			</div>
			<div class=" main_inquirytype_title">
				<div class="inquiry_test_type_p">
					<p>문의 제목</p>
				</div>
				<div>
					${inquiryView.title }
				</div>
			</div>
			<div style="display: flex; flex-direction: row; height: 600px;">
				<div class="inquiry_test_type_p ">
					<p>문의 내용</p>
				</div>
				<div class="nn">
					
					<div class="inquirytype_text" style="margin-bottom: 20px;">
						${inquiryView.content }
					</div>
					<c:forEach var="img" items="${inquiryImg }">
						<div >
							<img src = "/img/${img }" style="width: 300px; max-width: 500px; height: 300px; max-height: 300px;">
						</div>
					</c:forEach>
				</div>
			</div>
			<hr/>
			<div class=" main_inquirytype_photo">
				<div class="inquiry_test_type_p">
					<p>답변</p>
				</div>
			</div>
			<div class="cus_under_box">
				<c:choose>
					<c:when test="${inquiryView.answer eq 'null' }">
						<p>답변 대기중 입니다.</p>
					</c:when>
					<c:otherwise>
						<p>${inquiryView.answer }</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="cus_under_btn">
			<input class="cus_under_btn_input" type="button" id="writeBtn"
				value="목록" onclick = "window.history.back();">
		</div>
</div>