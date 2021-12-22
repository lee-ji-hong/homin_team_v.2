<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<c:if test="${not empty msg }">
	<script>alert('${msg}')</script>
</c:if>
<style>
table {
	width: 400; height: 200;
}
</style>
<div class="mypage_wrap" >
	<c:import url="mypage/mypageNav.jsp"></c:import>
	
	<c:choose>
		<c:when test="${postCode eq null }">
	<div class="right-wrap-part">
				<div>
					<h3  style=" font-size: 24; margin: 0 0 20 0px;">주소지 등록하기</h3>
					<hr>
					<input type="button" value="주소 등록" onclick="location.href='${root}index?formpath=addr/registerAdForm'">
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="right-wrap-part">
				<div>
					<h3 style=" font-size: 24; margin: 0 0 20 0px;">주소지 관리</h3>
				</div>
				<section>
				<hr>
					<div style="line-height: 3;  margin: 30px;">
						<div class="text-wrap">
							<div>아이디</div>
							<div>${postCode.id }</div>
						</div>
						<div class="text-wrap">
							<div>우편번호</div>
							<div>${postCode.zipcode }</div>
						</div>
						<div class="text-wrap">
							<div>주소</div>
							<div>${postCode.addr1 }</div>
						</div>
						<div class="text-wrap">
							<div>상세주소</div>
							<div>${postCode.addr2 }</div>
						</div>
						<div style="justify-content: flex-end;">
							<div class="member_management_btn">
								<input style="margin-right: 6px;"  class="member_management_input" type="button" value="수정" onclick="location.href='${root}index?formpath=addr/updateAdForm'">
								<input  class="member_management_input_bot" type="button" value="주소삭제" onclick="location.href='${root}index?formpath=addr/confirmPw'">
							</div>
						</div>
					</div>
				</section>
	</div>
		</c:otherwise>
	</c:choose>	
</div>