<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<link
  rel="stylesheet"
  type="text/css"
  href="${pageContext.request.contextPath}/resources/css/reset.css"
/>
<link
  rel="stylesheet"
  type="text/css"
  href="${pageContext.request.contextPath}/resources/css/board.css"
/>
<link
  rel="stylesheet"
  type="text/css"
  href="${pageContext.request.contextPath}/resources/css/mypage.css"
/>


<style>
  .recent_product_no {
    margin: 0 auto;
    line-height: 58px;
    font-weight: 700;
    font-size: 18px;
  }

  .myinquiry_tr {
    width: 800px;
    display: flex;
    align-items: center;
    justify-content: space-around;
    padding: 15 50;
    font-weight: 600;
    font-size: 19;
    border-bottom: 1px solid #ddd;
    margin: 0;
  }

  .myinquiry_td_a {
    width: 490px;
    margin: 5px;
  }

  .myinquiry_td_b {
    width: 140px;
    margin: 5px;
  }

  .myinquiry_td_c {
    width: 140px;
    margin: 5px;
  }
</style>

<c:set var="root" value="/"></c:set>
	<div>
		<h3 style="font-size: 24; margin: 0 0 20 0px;">문의 내역</h3>
	</div>
	<div>
				<div style=" padding: 0 50;" class="basket_navbar">
					<div class="myinquiry_td_a">문의제목</div>
					<div class="myinquiry_td_b">날짜</div>
					<div class="myinquiry_td_c">답변유무</div>
					
					
				</div>
		</div>
<table>
	<c:choose>
		<c:when test="${myinquiry eq '[]' }">
		<div><hr></div>
		<div class="warning_view">
				<img src="${pageContext.request.contextPath}/resources/image/warning.png">	
		</div>
		<div class="recent_product_no">
			<h3>문의 내역이 없습니다.</h3>
		</div>	
		</c:when>
	</c:choose>
	
	<c:forEach var="list" items="${myinquiry }">
	<div><hr></div>
	<tbody style="  
    height: 100%;
/*     min-height: 668px; */
    display: flex;
    align-items: center;
    justify-content: flex-start; 
    margin: 0 auto;
    flex-direction: column;
    width: 900px;">
		<tr class="myinquiry_tr">
			<td class="myinquiry_td_a"><a href = "/homin/index?formpath=mypage&category=myinquiryView&no=${list.no }">${list.title }</a></td>
			<td class="myinquiry_td_b">${list.writeDate }</td>
			<c:choose>
				<c:when test = "${list.state eq 'waiting'}">
					<td class="myinquiry_td_c">대기중</td>
				</c:when>
				<c:otherwise>
					<td class="myinquiry_td_c">완료</td>
				</c:otherwise>
			</c:choose>
		</tr>
		</tbody>
	</c:forEach>
</table>




