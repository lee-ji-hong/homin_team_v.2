<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<c:if test="${not empty msg }">
	<script>
		alert('${msg}');
	</script>
</c:if>
<style>
.noticeform_btn_ck{
    margin-top: 50px;
    width: 80px;
    height: 50px;
    border: 1.5px solid #ddd;
    border-radius: 4px;
    font-family: "Noto Sans KR", "Noto Sans CJK KR", "맑은 고딕", "Malgun Gothic", sans-serif;
    font-size: 17px;
    line-height: 21px;
}
</style>
 <section class="content_section" style="padding: 20 0px;">
        <div class="content_row_1" style="width: auto;">
          <table class="board_table">
            <caption>
              문의사항 게시판
            </caption>
            <thead>
              <tr>
                <th>구분</th>
                <th>제목</th>
                <th>작성일</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="all" items="${all }">
			<tr>
				<c:choose>
					<c:when test="${all.division eq 'system' }">
						<td>시스템</td>
					</c:when>
					<c:when test="${all.division eq 'product' }">
						<td>상품</td>
					</c:when>
					<c:when test="${all.division eq 'event' }">
						<td>이벤트</td>
					</c:when>
					<c:when test="${all.division eq 'etc' }">
						<td>기타</td>
					</c:when>
					<c:when test="${all.division eq 'service' }">
						<td>서비스</td>
					</c:when>
				</c:choose>
				<td><a href = "index?formpath=servicecenter&list=noticeView&num=${all.no }">${all.title }</a></td>
				<td>${all.writedate }</td>
			</tr>
		</c:forEach>
            </tbody>
          </table>
          <c:if test = "${sessionScope.id eq 'admin' }">
          	<input class="noticeform_btn_ck" type = "button" value = "등록" onclick = "location.href='${root}index?formpath=servicecenter&list=noticeWrite'">
          </c:if>
        </div>
        
      </section>
      
      
