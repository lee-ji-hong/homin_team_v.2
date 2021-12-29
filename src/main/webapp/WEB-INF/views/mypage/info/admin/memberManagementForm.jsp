<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<c:url var="root" value="/" />
<!DOCTYPE html>
<html>
  <head>
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
  </head>
  <c:if test="${sessionScope.id ne 'admin' }">
    <script>
      alert("잘못된 접근입니다.");
      window.history.back();
    </script>
  </c:if>
  <body>
    <div class="mypage_wrap">
      <div>
        <h3 style="font-size: 24; margin: 0 0 20 0px">사용자 관리</h3>
      </div>
      <form class="membermanage_wrap" action="#" method="get">
        <div class="membermanage_table">
          <div>
            <div class="membermanage_table_wrap">
              <div>
                <input type="hidden" name="formpath" value="memberManagement" />
                <select class="review_underbar_1" name="select">
                  <option value="id">아이디</option>
                  <option value="nickname">이름</option>
                </select>
              </div>
              <div>
                <input class="review_underbar_2" type="text" name="search" />
                <input
                  class="review_underbar_3"
                  type="submit"
                  name="searchBtn"
                  value="검색"
                />
              </div>
            </div>
          </div>
        </div>
      </form>
      <c:if test="${not empty msg }">
        <script>
          alert("${msg}");
        </script>
      </c:if>
      <div class="membermanage_navbar">
        <div>번호</div>
        <div>아이디</div>
        <div>이름</div>
        <div>전화번호</div>
        <div>이메일</div>
      </div>
      <c:forEach var="list" items="${memberList }">
        <c:if test="${list.id ne 'admin' }">
          <div class="membermanage_component">
            <span>${list.no }</span>
            <span>
              <a href="${root }index?formpath=memberView&id=${list.id}"
                >${list.id }</a
              >
            </span>
            <span>${list.nickname }</span>
            <span>${list.phone }</span>
            <span>${list.email }</span>
          </div>
        </c:if>
      </c:forEach>
      <div style="margin: 50px; font-size: 20; text-align: center">${page}</div>
    </div>
  </body>
</html>



