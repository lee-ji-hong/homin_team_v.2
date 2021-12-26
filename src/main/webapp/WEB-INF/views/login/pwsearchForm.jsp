<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"/>
<link rel="stylesheet" href="${root }resources/css/index.css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function check(){
		var name = document.getElementById("id").value;
		var em = document.getElementById("email").value;
		if(name == '' || em == ''){
			alert('아이디와 이메일을 입력해주세요.');
			return;
		}
		var e = {
			email : em 
		}
		$.ajax({
			url : "sendAuth",
			type : "POST",
			data : JSON.stringify(e),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(){
				alert('이메일을 확인해 주세요.');
			},
			error : function(){
				alert('문제 발생');
			}
		})
		$('#authNum').attr('style', "display:'';");
		$('#authNumCheck').attr('style', "display:'';");
		$('#search').attr('style', "display:'';");
		$('#idText').attr('style', "display:none;");
		$('#emailText').attr('style', "display:none;");
		$('#id').attr('style', "display:none;");
		$('#email').attr('style', "display:none;");
		$('#sendAuth').attr('style', "display:none;");
	}
	function authCheck(){
		var num = document.getElementById("authNumCheck").value;
		var id = document.getElementById("id").value;
		var email = document.getElementById("email").value;
		if (num == "") {
			alert('인증번호를 입력하세요.');
			return;
		}
		var a = {
				inputAuthNum : num
		}
		$.ajax({
			url : "authConfirm",
			type : "POST",
			data : JSON.stringify(a),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result){
				if(result.msg === '인증 완료'){
					location.href = "${root}memberCheck?id="+id+"&email="+email;
				}
				$('#msg').text(result.msg);
			},
			error : function(){
				alert('문제발생.');
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
		<p class="loginform_title_p">비밀번호 찾기</p>
	</div>
	<table>
		<tr id = "idText">
			<td><label class="form-title">아이디</label></td>
		</tr>
		<tr>
			<td><input class="loginform_id_input" type=text id="id" name='id' placeholder="아이디를입력하세요"/></td>
		</tr>
		
		<tr id = "emailText">
			<td class="form-title">이메일</td>
		</tr>
		<tr>
			<td><input class="loginform_id_input" type=text id="email" name='email' placeholder="이메일을 입력하세요"/></td>
		</tr>
		<tr id = "sendAuth">
			<td><input class="loginform_btn_ck" style="margin-top: 10px;" type = "button" value = "인증번호전송" onclick="check()"></td>
		</tr>
		<tr id = "authNum" style="display: none;">
			<td class="form-title" >인증번호</td>
		</tr>
		<tr>
			<td><input class="loginform_id_input" style = "display: none;" type=text id="authNumCheck" name='authNumCheck' placeholder="인증번호를 입력하세요"/></td>
		</tr>
		<tr>
			<td><label id = "msg"></label></td>
		</tr>
		<tr id = "search" style = "display: none;">
			<td colspan=2 align='center'style="font-weight: 600;" ><br>
				<input class="loginform_btn_ck" type="button" value='비밀번호 찾기' onclick="authCheck()"/>
			</td>
		</tr>
		<tr>
			<td colspan=2 align='center'style="font-weight: 600;"><br>
				<input class="loginform_btn_ck" type="button" value='취소' onclick="javascript:window.history.back()"/>
			</td>
		</tr>
	</table>
</div>

</center>