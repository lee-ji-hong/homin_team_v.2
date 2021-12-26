<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css"/>
<script>
	$(function(){
	$("#pw").blur(function() {
		var pw = $("#pw").val();
 		var num = pw.search(/[0-9]/g);
 		var eng = pw.search(/[a-z]/ig);
 		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		 if(pw == "") {
			

		}
		else if(pw.length < 8 || pw.length > 20){
		   alert('비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.');
		    return;
			$('#pw').focus();
		  
		 
		}else if(pw.search(/\s/) != -1){
		   alert('비밀번호는 공백 없이 입력해주세요.');
		   return;
		   $('#pw').focus();

		}else if(num < 0 || eng < 0 || spe < 0 ){
		   alert('비밀번호는 영문,숫자, 특수문자를 혼합하여 입력해주세요.');
		   return;
		   $('#pw').focus();

		}else {
		   
		}
	});
});

	function check() {
		var p = document.getElementById('pw').value;
		var po = document.getElementById('pwOk').value;
		
	
		if (p == "" || p == null){
			alert('비밀번호를 입력해주세요.');
			return false;			
		}
		if (p != po){
			alert('두 비밀번호가 일치하지 않습니다.');
			return false;			
		}

		if (document.getElementById("nickname").value == ""){
			alert('수정하실 이름을 입력해주세요.');
            return false;
		}else if (document.getElementById("email").value == ""){
			alert('수정하실 이메일을 입력해주세요.');
            return false;
		}else if (document.getElementById("phone").value == ""){
			alert('수정하실 전화번호를 입력해주세요.');
            return false;
		}else
			document.getElementById("f").submit();
	}

	
</script>

<div class="mypage_wrap">
	<c:import url="/WEB-INF/views/mypage/mypageNav.jsp"></c:import>
	
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
	
		<form action="mgmt/updateProc" id="f" method="post">
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
				<div><input class="member_modi_input" type=text name='nickname' id="nickname" value="${userInfo.nickname }"/></div>
			</div>
			<div class="member_modi_wrap">
				<div class="member_modi_text">E-Mail</div>
				<div><input class="member_modi_input" type=text name='email' id="email" value="${userInfo.email }" /></div>
			</div>
			<div class="member_modi_wrap">
				<div class="member_modi_text">휴대폰번호</div>
				<div><input class="member_modi_input" type=text name='phone' id="phone" value="${userInfo.phone }"/></div>
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