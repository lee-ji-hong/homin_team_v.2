<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${root }resources/css/index.css" />
<c:url var="root" value="/"/>
<c:if test="${not empty sessionScope.id }">
	<script>
		location.href='/homin/';
	</script>
</c:if>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function idPwCheck() {
		i = document.getElementById('id').value;
		p = document.getElementById('pw').value;
		
		if (i == ""){
			alert('아이디를 입력해주세요');
			return;			
		}
		if (p == ""){
			alert('비밀번호를 입력해주세요');
			return;			
		}
		
		var inputI = {"id":i, "pw":p}
		$.ajax({
			url: "idPwCheck", type: "POST",
			data: JSON.stringify(inputI), // 문자열 데이터를 JSON 객체로 변환
			contentType: "application/json; charset=utf-8", // 보낼 데이터의 타입 설정
			dataType: "json", // 받을 데이터의 자료형을 설정
			
			success : function(result){
				$('#msg').text(result.msg);
				if (result.msg == "" || result.msg == null)
					document.getElementById('f').submit();
			},
			error : function(){
				alert('로그인 에러발생');
			}
		})
	}
</script>

<center style="
	width: 1240px;
    margin: 0 auto;
    padding: 50 0 150 0px;">
<div class="loginform_wrap">
	<div style="margin: 10 0px;">
		<p class="loginform_title_p">LOGIN</p>
	</div>
<form action="${root }loginProc" id="f"  method="post">
	<table>
		<tr>
			<td><label class="form-title">ID</label></td>
		</tr>
		<tr>
			<td><input class="loginform_id_input" type=text id="id" name='id' placeholder="아이디를 입력하세요"/></td>
		</tr>
		
		<tr>
			<td class="form-title">PASSWORD</td>
		</tr>
		<tr>
			<td><input class="loginform_id_input" type=password id="pw" name='pw' placeholder="비밀번호를 입력하세요"/></td>
		</tr>
		<tr>
			<td><label id="msg" style="color:red;"></label></td>
		</tr>
		<tr>
		
			<td colspan=2 align='center'style="font-weight: 600;"><br>
				<input class="loginform_btn_ck" type="button" value='로그인' onclick="idPwCheck()"/>
				
			</td>
		</tr>
		<tr>
		
			<td colspan=2 align='center'class="hr-sect" >
				<span style="padding: 0 16px;">또는</span>
			</td>
		</tr>
		<c:set var="redirectUri" value="http://localhost:8085/homin/kakaoLogin"/>
		<%-- <c:set var="restKey" value="6b699a51ed025c4bd6a42e5026901e43"/> --%>
		<c:set var="restKey" value="560f7dc954c6a55108395d3bedeae1b5"/>
		<tr>
			<td colspan="2" align="center"><br>
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=${restKey }&redirect_uri=${redirectUri }&response_type=code"> 
					<input class="loginform_btn_cr" type="button" value='카카오톡으로로그인' />
				</a>
			</td>
		</tr>
		<tr>
			<td colspan=2 align='center'><br>
				<a href="${root }member">회원가입</a> |
				<a href="${root }index?formpath=idsearch">아이디 찾기</a> |
				<a href="${root }index?formpath=pwsearch">비밀번호 찾기</a>
			</td>
		</tr>
	</table>
</form>
</div>

</center>
