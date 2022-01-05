<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css"/>
<script>
	function check() {
		var p = document.getElementById('pw').value;
		var po = document.getElementById('pwOk').value;
		
		if (p == "" || p == null){
			alert('비밀번호를 입력해주세요');
			return;			
		}
		if (p != po){
			alert('비밀번호가 일치하지 않습니다');
			return;			
		}
		
		document.getElementById('f').submit();
	}
</script>
<div class="mypage_wrap">
	<c:import url="${root }mypage/mypageNav"></c:import>
	
	<div class="right-wrap-part" style="align-items: center;">
		<h1 style="    
		font-weight: bold;
    	font-size: 25px;
   	    display: inline-block;
    	text-align: center;
    	color: black;
    	padding-top: 8px;
    	line-height: 2.5;">회원정보 수정</h1><br>
		<h3><font color="red" id="msg">${msg }</font></h3>
	
		<form action="updateProc" id="f" method="post">
		<div>
			<div class="member_modi_wrap">
				<div class="member_modi_text">아이디</div>
				<div ><input class="member_modi_input" type=text name='id' id="id" value="${userInfo.id }" readonly="readonly"/></div>
			</div>
			<div class="member_modi_wrap">
				<div class="member_modi_text">패스워드</div>
				<div><input class="member_modi_input" type="password" name='pw' id="pw" placeholder='pw 입력' /></div>
				
			</div>
			<div class="member_modi_wrap">
				<div class="member_modi_text">패스워드 확인</div>
				<div><input class="member_modi_input"  type="password" name='pwOk' id="pwOk" placeholder='pw 입력' /></div>
			</div>
			<div class="member_modi_wrap">
				<div class="member_modi_text">이름</div>
				<div><input class="member_modi_input" type=text name='nickname' value="${userInfo.nickname }"/></div>
			</div>
			<div class="member_modi_wrap">
				<div class="member_modi_text">E-Mail</div>
				<div><input class="member_modi_input" type=text name='email' id="email" value="${userInfo.email }" /></div>
			</div>
			<div class="member_modi_wrap">
				<div class="member_modi_text"> 휴대폰번호</div>
				<div><input class="member_modi_input" type=text name='phone' value="${userInfo.phone }"/></div>
			</div>
			<div>
				<div style="
				padding: 30 0;    
				align-items: center;
			    justify-content: center;
			    display: flex;">
					<input class="member_modi_btn" type="button" value='수정' onclick="check()"/> 
					<input class="member_modi_btnn" type=reset value='취소'	onclick = "javascript:window.history.back()" />
				</div>
			</div>
		</div>
	</form>
	</div>
</div>