<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<c:if test="${not empty msg }">
	<script>alert('${msg}')</script>
</c:if>
<style>
table {
	width: 600; height: 200;
	align:"center"
}


h3 {
	font-size: 24;
	margin: 0 0 20 0px;
	}
</style>
<div class="mypage_wrap">
	<c:import url="mypage/mypageNav.jsp"></c:import>
		
	<div class="right-wrap-part" style="    
/* 	border: 1px solid; */
	justify-content: space-between;
	">
	
		<div>
			<h3>회원 관리 정보</h3>
		</div>
		<section>
		<hr>
			<div>
				<h4>MY LG ID 회원 정보</h4>
			</div>
			<div>
				<p>MY LG ID 홈페이지에서 회원 정보를 변경할 수 있습니다.</p>
			</div>
			<div style="line-height: 3;">
				<div class="text-wrap">
					<div>아이디</div><div>${allDto.id }</div>
				</div>
				<div class="text-wrap">
					<div>비밀번호</div><div>******</div>
				</div>
				<div class="text-wrap">
					<div>이름</div><div>${allDto.nickname }</div>
				</div>
				<div class="text-wrap">
					<div>휴대폰번호</div><div>${allDto.phone }</div>
				</div>
				<div class="text-wrap">
					<div>이메일</div><div>${allDto.email }</div>
				</div>
				<div class="text-wrap" style="justify-content: flex-end;">
					<div class="member_management_btn" >
						<input type="button" class="member_management_input"
								value="수정" onclick="location.href='${root}index?formpath=mgmt/confirmPwForUdMb'">
					</div>
					<div class="member_management_btn" >
					<input type="button"   class="member_management_input_bot"
								value="회원탈퇴" onclick="location.href='${root}index?formpath=mgmt/confirmPw'">
					</div>
				</div>
				</div>
				
				<table style="color: #ddd; line-height: 1.89;">
				<tr><td>회원 탈퇴는 본인 확인 절차 후, 진행됩니다.<br></td></tr>
				<tr><td>회원 탈퇴 후에도 MY LG ID 회원은 유지되며, 계속 이용할 수 있습니다.<br></td></tr>
				<tr><td>회원 탈퇴 시, 홈인에서 받은 각종 할인 쿠폰 및 이벤트 혜택 등은 자동으로 소멸합니다.<br></td></tr>
				<tr><td>다음에서 회원 탈퇴 처리는 유보될 수 있습니다.<br></td></tr>
				<tr><td>1. 회원이 상품 주문 또는, 서비스를 신청 중인 경우.<br></td></tr>
				<tr><td>- 회원이 직접 주문/신청 내역을 전부 삭제할 때까지, 탈퇴 처리는 유보될 수 있습니다.<br></td></tr>
				<tr><td>2. 제휴사가 서비스를 진행 예정 또는, 진행 중인 경우.<br></td></tr>
				<tr><td>- 회원과 제휴사 간에 진행 취소가 결정될 때까지, 탈퇴 처리는 유보될 수 있습니다.<br></td></tr>
				
				
					<tr>
					
					</tr>
				</table>
		</section>
	</div>
</div>
