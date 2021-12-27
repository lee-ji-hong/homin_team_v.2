<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css"/>
<c:set var="root" value="/"></c:set>

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

<c:if test="${empty sessionScope.id }">
	<script>
		location.href='/homin/';
	</script>
</c:if>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function pwCheck() {
		i = document.getElementById('id').value;
		p = document.getElementById('pw').value;
		
		if (p == ""){
			alert('비밀번호를 입력해주세요');
			return;			
		}
		
		var inputI = {"id":i, "pw":p}
		$.ajax({
			url: "pwCheckProc", type: "POST",
			data: JSON.stringify(inputI), // 문자열 데이터를 JSON 객체로 변환
			contentType: "application/json; charset=utf-8", // 보낼 데이터의 타입 설정
			dataType: "json", // 받을 데이터의 자료형을 설정
			
			success : function(result){
				$('#msg').text(result.msg);
				if (result.msg == "" || result.msg == null)
					document.getElementById('f').submit();
			},
			error : function(){
				alert('회원탈퇴 에러발생');
			}
		})
	}
</script>

<center>
<div class="mypage_wrap">
	<c:import url="mypage/mypageNav.jsp"></c:import>
	<div class="right-wrap-part">
	   	<h3>비밀번호 확인</h3>
	    <p style=" color: grey;">개인 정보를 안전하게 보호하기 위해 비밀번호를 한번 더 입력해 주세요.</p>
		<form action="mgmt/deleteProc" id="f" method="post">
			<div>
				<div>
					<div><label class="form-title">MY LG ID (이메일)</label></div>
				</div>
				<div>
					<div><input class="loginform_id_input" type=text id="id" name='id' value="${sessionScope.id }" readonly="readonly"/></div>
				</div>
				<div>
					<div class="form-title">비밀번호</div>
				</div>
				<div>
					<div><input class="loginform_id_input" type=password id="pw" name='pw' placeholder="비밀번호"/></div>
					
				</div>
				<div>
					<div><label id="msg" style="color:red;"></label></div>
				</div>
				<div>
					<div align='center'><br>
						<input type="button" style="width:86px" class=" loginform_btn_ck" value='확인'  onclick="pwCheck()"/>
					</div>
				</div>
			</div>
		</form>
	            
	</div>
</div>
</center>
