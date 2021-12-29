<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <meta charset="UTF-8" />
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



    <title>Insert title here</title>
    <c:if test="${sessionScope.id ne 'admin' }">
      <script>
        alert("잘못된 접근입니다.");
        window.history.back();
      </script>
    </c:if>
    <script>
      function deleteMember() {
        if (confirm("정말 삭제하시겠습니까?") == true) {
          location.href = "${root}deleteMember?id=${member.id}";
        } else {
          return;
        }
      }
      function modifyMember() {
        if (confirm("회원 정보를 수정하시겠습니까?") == true) {
          document.getElementById("f").submit();
        } else {
          return;
        }
      }
      function daumPost() {
        new daum.Postcode({
          onComplete: function (data) {
            var addr = "";
            if (data.userSelectedType === "R") {
              //도로명 주소일 경우( R )
              addr = data.roadAddress;
            } else {
              //지번일 경우( J )
              addr = data.jibunAddress;
            }
            document.getElementById("zipcode").value = data.zonecode;
            document.getElementById("addr1").value = addr;
            document.getElementById("addr2").focus();
          },
        }).open();
      }
    </script>
  </head>
  <body>
    <div
      class="mypage_wrap"
      style="display: flex; flex-direction: column; align-items: center"
    >
      <div style="text-align: center; margin-right: 70">
        <h3 style="font-size: 24; margin: 0 0 20 0px">회원 정보 수정</h3>
      </div>
      <form id="f" action="modifyMember" method="post">
        <div>
          <div class="form_modify_text">아이디</div>
          <div>
            <input
              class="form_modify_input"
              type="text"
              value="${member.id}"
              name="id"
              readonly
            />
          </div>
        </div>

        <div>
          <div class="form_modify_text">비밀번호</div>
          <div>
            <input
              class="form_modify_input"
              type="text"
              value="${member.pw}"
              name="pw"
            />
          </div>
        </div>
        <div>
          <div class="form_modify_text">이름</div>
          <div>
            <input
              class="form_modify_input"
              type="text"
              value="${member.nickname } "
              name="nickname"
            />
          </div>
        </div>
        <div>
          <div class="form_modify_text">전화번호</div>
          <div>
            <input
              class="form_modify_input"
              type="text"
              value="${member.phone } "
              name="phone"
            />
          </div>
        </div>
        <div>
          <div class="form_modify_text">이메일</div>
          <div>
            <input
              class="form_modify_input"
              type="text"
              value="${member.email } "
              name="email"
            />
          </div>
        </div>
        <div>
          <div class="form_modify_text">우편번호</div>
          <div>
            <input
              class="form_modify_input"
              type="text"
              value="${addr.zipcode }"
              name="zipcode"
              id="zipcode"
              readonly
            />
            <input
              class="form_modify_btn"
              type="button"
              value="검색"
              onclick="daumPost()"
            />
          </div>
        </div>
        <div>
          <div class="form_modify_text">주소</div>
          <div>
            <input
              class="form_modify_input"
              type="text"
              value="${addr.addr1 }"
              name="addr1"
              id="addr1"
              readonly
            />
          </div>
        </div>
        <div>
          <div class="form_modify_text">상세주소</div>
          <div>
            <input
              class="form_modify_input"
              type="text"
              value="${addr.addr2 }"
              name="addr2"
              id="addr2"
            />
          </div>
        </div>

        <div class="form_modify_wrap">
          <input
            class="form_modify_btn"
            type="button"
            value="수정"
            onclick="modifyMember()"
          />
          <input
            class="form_modify_btn_delete"
            type="button"
            value="삭제"
            onclick="deleteMember()"
          />
        </div>
      </form>
    </div>
  </body>



</html>
