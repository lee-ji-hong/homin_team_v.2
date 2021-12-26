<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"/>
<link rel="stylesheet" href="${root }resources/css/index.css" />


<center style="
	width: 1240px;
    margin: 0 auto;
    padding: 50 0 150 0px;">
<div class="loginform_wrap">
	<div style="margin: 10 0px;">
		<p class="loginform_title_p">아이디 찾기</p>
	</div>
	<table>
		<tr>
			<td><label class="form-title">아이디</label></td>
		</tr>
		<tr>
			<td><input class="loginform_id_input" type=text id="nickname" name='nickname' value = "${searchId }" readonly="readonly"></td>
		</tr>
		
		<tr>
			<td><label id="msg" style="color:red;"></label></td>
		</tr>
		<tr>
			<td colspan=2 align='center'style="font-weight: 600;"><br>
				<input class="loginform_btn_ck" type="button" value='로그인하기' onclick="location.href = '${root}index?formpath=login'"/>
			</td>
		</tr>
	</table>
</div>

</center>