<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css"/>
<c:url var="root" value="/" />
<c:if test="${msg ne null }">
	<script>alert('${msg}');</script>
</c:if>
<style>
div#wrapper {
	width: 800;
	margin: 0 auto;
}

.form-title {
    color: rgb(86, 196, 196);
    font-weight: bold;
    line-height: 2;
}

.loginform_id_input {
    width: 350px;
    height: 50px;
    font-size: 15px;
    border: 1.5px solid #ddd;
    border-radius: 4px;
    font-family: "Noto Sans KR", "Noto Sans CJK KR", "맑은 고딕", "Malgun Gothic", sans-serif;
    font-size: 15px;
    line-height: 21px;
}

 .loginform_btn_ck {
    color: #FFFFFF;
    background-color: rgb(86, 196, 196);
    padding: 12px 0;
    font-size: 15;
    width: 86px;
    height: 25px;
    border-radius: 4px;
    border: none;
    font-weight: 600;
}
.right-wrap-part h3{
	font-weight: bold;
    font-size: 25px;
    display: inline-block;
    text-align: center;
    color: rgb(86, 196, 196);
    padding-top: 8px;
    line-height: 2.5;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("#submitCheck").click(function() {
			var pw = $('#pw').val();
			var pwOk = $('#pwOk').val();
			
			if(pw == ''){
				$('#pw').focus();
				return;
			}
			if(pwOk == ''){
				$('#pwOk').focus();
				return;
			}
			if(pw != pwOk){
				alert('입력하신 정보가 일치하지 않습니다.');
				$('#pw').val('');
				$('#pwOk').val('');
				return;
			}
			$('#f').submit();
		});
	});
</script>
<center>
<div class="mypage_wrap">
<div class="right-wrap-part">
<h3>비밀번호 확인</h3>
 <p style=" color: grey;">개인 정보를 안전하게 보호하기 위해 비밀번호를 한번 더 입력해 주세요.</p>
<form action="boardModify" method="post" id = "f">
<input type="hidden" name="no" value="${no }" />
<div>
	<div>
		<div class="form-title">패스워드 </div>
		<div><input class="loginform_id_input" type=password name='pw' id = "pw" placeholder='PW 입력'/></div>
	</div>
	<div>
		<div class="form-title">패스워드 확인</div>
		<div><input class="loginform_id_input" type=password name='pwOk'  id = "pwOk" placeholder='PW 입력'/></div>
	</div>
	<div>
		<div style=" margin-top: 20px;">
			<input class=" loginform_btn_ck" type=button value='확인' style="width: 86px; " id = "submitCheck"/>
			<input class=" loginform_btn_ck" type=reset value='취소' onclick = "javascript:history.back()" style="width: 86px; "/> 
		</div>
	</div>
</div>
</form>
</div>
</div>
</center>