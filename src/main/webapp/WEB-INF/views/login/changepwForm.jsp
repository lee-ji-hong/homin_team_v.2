<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"/>
<link rel="stylesheet" href="${root }resources/css/index.css" />

<c:if test="${not empty msg }">
	<script>
		alert('${msg}');
	</script>
</c:if>
<script>
	function check(){
		var pw = document.getElementById("pw").value;
		var pwc = document.getElementById("pwConfirm").value;
		if(pw == '' || pwc == ''){
			alert('빈칸이 없어야합니다.');
			return;
		}
		
		if(pw != pwc){
			alert('패스워드가 일치하지 않습니다.');
			return;
		}
		document.getElementById('f').submit();
	}
</script>

<center style="
	width: 1240px;
    margin: 0 auto;
    padding: 50 0 150 0px;">
<div class="loginform_wrap">
	<div style="margin: 10 0px;">
		<p class="loginform_title_p">비밀번호 재설정</p>
	</div>
<form action="${root }pwChange" id="f"  method="post">
	<table>
		<tr>
			<td><label class="form-title">아이디</label></td>
		</tr>
		<tr>
			<td><input class="loginform_id_input" type=text id="id" name='id'  value = "${idcheck }" readonly="readonly"></td>
		</tr>
		<tr>
			<td><label class="form-title">새 비밀번호</label></td>
		</tr>
		<tr>
			<td><input class="loginform_id_input" type=password id="pw" name='pw' placeholder="비밀번호를입력하세요"/></td>
		</tr>
		
		<tr>
			<td class="form-title">비밀번호확인</td>
		</tr>
		<tr>
			<td><input class="loginform_id_input" type=password id="pwConfirm" name='pwConfirm' placeholder="비밀번호 확인"/></td>
		</tr>
		<tr>
			<td colspan=2 align='center'style="font-weight: 600;"><br>
				<input class="loginform_btn_ck" type="button" value='비밀번호 재설정' onclick="check()"/>
			</td>
		</tr>
		<tr>
			<td colspan=2 align='center'style="font-weight: 600;"><br>
				<input class="loginform_btn_ck" type="button" value='취소' onclick="location.href='${root}index?formpath=login'"/>
			</td>
		</tr>
	</table>
</form>
</div>

</center>