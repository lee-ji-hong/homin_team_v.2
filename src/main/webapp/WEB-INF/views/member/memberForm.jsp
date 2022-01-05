<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/mypage.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/mypage_admin.css"
    />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script>
   function ajaxIsExist() {
      var i = document.getElementById('id').value;
      var d = {
         id : i
      }
      $.ajax({
         url : "isExistId",
         type : "POST",
         data : JSON.stringify(d), //문자열을 json타입으로 변환
         contentType : "application/json; charset=utf-8", //보낼 데이터 유형
         dataType : 'json', //return 타입 json으로 지정
         success : function(result) {
            $('#msg').text(result.msg)
         },
         error : function() {
            alert("문제 발생")
         }
      })
   }
$(function(){
   $("#pw").blur(function() {
      var pw = $("#pw").val();
       var num = pw.search(/[0-9]/g);
       var eng = pw.search(/[a-z]/ig);
       var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

       if(pw == "") {
         $('#msg2').css('display', 'none');
         $('#msg3').css('display', 'none');
         $('#msg4').css('display', 'none');

       }
       else if(pw.length < 8 || pw.length > 20){
         $('#msg2').css('display', 'block');
         $('#msg3').css('display', 'none');
         $('#msg4').css('display', 'none');
         $('#pw').focus();
        
       }else if(pw.search(/\s/) != -1){
         $('#msg2').css('display', 'none');
         $('#msg3').css('display', 'block');
         $('#msg4').css('display', 'none');
         $('#pw').focus();

       }else if(num < 0 || eng < 0 || spe < 0 ){
         $('#msg2').css('display', 'none');
         $('#msg3').css('display', 'none');
         $('#msg4').css('display', 'block');
         $('#pw').focus();

       }else {
         $('#msg2').css('display', 'none');
         $('#msg3').css('display', 'none');
         $('#msg4').css('display', 'none');
       }
   });

   $("#pwOk").blur(function() {
      var pw = $("#pw").val();
      var pwOk = $("#pwOk").val();

      if(pwOk == "") {
         $('#msg5').css('display', 'none');
         return;
       }else if(pw != pwOk) {
          $('#msg5').css('display', 'block');
         return;
       }else {
         $('#msg5').css('display', 'none');
       }
   });

});
   function sendAuth() {
      var e = document.getElementById('email').value;
      if (e == "") {
         $('#msg').text('이메일을 입력하세요.');
         return;
      }
      var s = {
         email : e
      }
      $.ajax({
         url : "sendAuth",
         type : "POST",
         data : JSON.stringify(s),
         contentType : "application/json;charset=utf-8",
         dataType : "json",
         success : function(result) {
            $('#msg').text(result.msg)
         },
         error : function() {
            $('#msg').text('인증번호 전송 Error')
         }
      })
   }

   function sendAuthConfirm() {
      var i = document.getElementById('inputAuthNum').value;
      if (i == "") {
         $('#msg').text('인증번호를 입력하세요.');
         return;
      }
      var s = {
         inputAuthNum : i
      }
      $.ajax({
         url : "authConfirm",
         type : "POST",
         data : JSON.stringify(s),
         contentType : "application/json;charset=utf-8",
         dataType : "json",
         success : function(result) {
            $('#msg').text(result.msg)
         },
         error : function() {
            $('#msg').text('인증번호 확인 Error')
         }
      })
   }
   
   function daumPost() {
      new daum.Postcode({
         onComplete : function(data) {
            var addr = "";
            if (data.userSelectedType === "R") {//도로명 주소일 경우( R )
               addr = data.roadAddress;
            } else {//지번일 경우( J )
               addr = data.jibunAddress;
            }
            document.getElementById("zipcode").value = data.zonecode;
            document.getElementById("addr1").value = addr;
            document.getElementById("addr2").focus();
         }
      }).open();
   }
</script>
<script>
   src="https//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
</head>
<body>
<div>
   <a href="/homin"><img src="/product_img/logo2.png" style="height:100px"></a>

</div>
<hr>
 <div
      class="mypage_wrap"
      style="display: flex; flex-direction: column; align-items: center"
    >

   <div style="text-align: center; margin-right: 70">
        <h3 style="font-size: 24; margin: 0 0 20 0px">회원가입</h3>
        <p>MY LG ID 가입을 위해 정보를 입력해주세요.</p>
   <p>모두 필수 항목 입니다.</p>
      </div>
   
   <h3>
      <font color="red" id="msg">${msg }</font>
   </h3>
   <form action="memberProc" method="post" accept-charset="utf-8">
      <table style="line-height: 3; margin: 0 auto;">
         <tr>
            <td class="form_modify_text" align='right' >아이디</td>
            <td><input class="form_modify_input" type=text name='id' id="id" placeholder='아이디를 입력해주세요'
                     required data-valid="false" /></td>
            <td colspan="2"><input style="height:40px;" class="form_modify_btn" type="button"  value="중복 확인"
               onclick="ajaxIsExist()"></td>
         </tr>
         <tr>
            <td class="form_modify_text" align='right' width=120>이름</td>
            <td colspan="3"><input class="form_modify_input" type=text name='nickname' />
         </tr>
         <tr>
            <td class="form_modify_text" align='right' height=40>패스워드</td>
            <td><input class="form_modify_input" type="password" id="pw" name='pw' placeholder='pw 입력' /></td>
         </tr>
         <tr>
            <td colspan="2" style="text-align: center;"> <span style="display: none;" id = "msg2">비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.</span></td>
         </tr>
         <tr>
            <td colspan="2" style="text-align: center;"> <span style="display: none;" id = "msg3">비밀번호는 공백 없이 입력해주세요.</span></td>
         </tr>
         <tr>  
            <td colspan="2" style="text-align: center;"><span style="display: none;" id = "msg4">비밀번호는 영문,숫자, 특수문자를 혼합하여 입력해주세요</span></td>
         </tr>
         <tr>
            <td class="form_modify_text" align='right'>패스워드 확인</td>
            <td><input class="form_modify_input" type="password" id="pwOk" name='pwOk' placeholder='pw 입력' /></td>
                     <td><span style="display: none;" id = "msg5">두 패스워드가 맞지 않습니다.</span></td>
         </tr>
         <tr>
            <td class="form_modify_text" align='right' height=40>E-Mail</td>
            <td><input type=text name='email' id="email" class="form_modify_input" placeholder='E-Mail 입력' /></td>
            <td colspan="2"><input type="button" style="height:40px; width:100px;" class="form_modify_btn" value="인증번호 전송"   onclick="sendAuth()"></td>
         </tr>
         <tr>
            <td  class="form_modify_text" align='right'>인증번호</td>
            <td><input type=text name='authNum' id="inputAuthNum" class="form_modify_input" placeholder='인증번호 입력' /></td>
            <td colspan="2"><input class="form_modify_btn" style="height:40px; width:100px;" type="button"  value="인증번호 확인"   onclick="sendAuthConfirm()"></td>
         </tr>
         <tr>
            <td class="form_modify_text"  align='right'>우편번호</td>
            <td><input type=text name='zipcode' id="zipcode" class="form_modify_input" readonly="readonly" /></td>
            <td colspan="2"><input type="button" style="height:40px; width:100px;" class="form_modify_btn" value="우편번호 검색"      onclick="daumPost()"></td>
         </tr>
         <tr>
            <td class="form_modify_text" align='right'>주소</td>
            <td colspan="3"><input type=text name='addr1' id="addr1" readonly="readonly" class="form_modify_input" /></td>
         </tr>
         <tr>
            <td class="form_modify_text" align='right'>상세주소</td>
            <td colspan="3"><input type=text name='addr2' id="addr2" class="form_modify_input" /></td>
         </tr>
         <tr>
            <td class="form_modify_text" align='right'>휴대폰번호</td>
            <td colspan='3'><input type=text name='phone' class="form_modify_input"
                              placeholder='-는 생략하고 입력' />
         </tr>
         <tr style="max-width: 300px;">
            <td align='center' height=40 colspan=4>
            <input   class="form_modify_btn" type=submit   value='가입하기' style="width: 300px; height: 45px;margin-left: 20px; margin-top: 20px;" /> 
         </td>
         </tr>
         
      </table>
      <table style="width:1915px;">
      <tr>
            <td style="height:50px;"><%@ include file="/WEB-INF/views/common/footer.jspf" %></td>
         </tr>
      </table>
   </form>
   </div>
   </body>
</html>