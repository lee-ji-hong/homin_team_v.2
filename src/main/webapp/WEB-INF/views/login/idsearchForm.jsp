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
		var name = document.getElementById("nickname").value;
		var em = document.getElementById("email").value;
		if(name == '' || em == ''){
			alert('빈칸이 없어야합니다.');
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
		<p class="loginform_title_p">아이디 찾기</p>
	</div>
<form action="${root }idsearchProc" id="f"  method="post">
	<table>
		<tr>
			<td><label class="form-title">이름</label></td>
		</tr>
		<tr>
			<td><input class="loginform_id_input" type=text id="nickname" name='nickname' placeholder="이름을입력하세요"/></td>
		</tr>
		
		<tr>
			<td class="form-title">이메일</td>
		</tr>
		<tr>
			<td><input class="loginform_id_input" type=text id="email" name='email' placeholder="이메일을 입력하세요"/></td>
		</tr>
		<tr>
			<td><label id="msg" style="color:red;"></label></td>
		</tr>
		<tr>
			<td colspan=2 align='center'style="font-weight: 600;"><br>
				<input class="loginform_btn_ck" type="button" value='아이디 찾기' onclick="check()"/>
			</td>
		</tr>
		<tr>
			<td colspan=2 align='center'style="font-weight: 600;"><br>
				<input class="loginform_btn_ck" type="button" value='취소' onclick="javascript:window.history.back()"/>
			</td>
		</tr>
	</table>
</form>
</div>

</center>