<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function daumPost() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
				
             	// 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
			}
		}).open();
	}

	function erchk() {
        if (document.getElementById("zipcode").value == "") {
			alert("우편 번호를 검색해서 입력하세요.");
            return false;
  		}else if (document.getElementById("addr2").value == ""){
			alert("상세주소를 입력하세요.");
            return false;
		  }else
		  	alert("주소지가 성공적으로 변경되었습니다.");
  	 		document.sub1.submit();
	}
</script>

<div class="mypage_wrap">
	<c:import url="mypage/mypageNav.jsp"></c:import>
	
	<div class="right-wrap-part">
		<h3 style=" font-size: 24; margin: 0 0 20 0px;">주소지 수정</h3>
		
		<form action="addr/updateProc" method="post" name="sub1">
		<hr>
		
			<div style="line-height: 3;  margin: 30px;">
				<div class="text-wrap">
					<div>우편번호</div>
					<div style="display: flex;">
						<div><input class="addre_modi_input" type=text name='zipcode' id="zipcode"	readonly="readonly" /></div>
						<div ><input class="member_management_search" type="button" value="검색"		onclick="daumPost()"></div>
					</div>
				</div>
				<div class="text-wrap">
					<div >주소</div>
					<div ><input style="width: 292;" class="addre_modi_input" type=text name='addr1' id="addr1" readonly="readonly"  /></div>
				</div>
				<div class="text-wrap">
					<div align='right'>상세주소</div>
					<div ><input style="width: 292;" class="addre_modi_input" type=text name='addr2' id="addr2"  /></div>
				</div>
				<div class="text-wrap" style="justify-content: flex-end;">
					<div class="member_management_btn">
					<input style="margin-right: 6px;" type=button	class="member_management_input"	value='수정' onclick="erchk()" /> 
					<input  class="member_management_input_bot" type=reset value='취소'	/>
					</div>
				</div>
			</div>
		</form>
		
	</div>
</div>