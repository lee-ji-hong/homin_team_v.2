<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage_admin.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" /> 
<c:url var="root" value="/" />
<c:if test = "${sessionScope.id ne 'admin' }">
	<script>
		alert('잘못된 접근입니다.');
		location.href = '${root}index?formpath=servicecenter&list=faq';
	</script>
</c:if>
<style>
.inquiry-textfo{
    line-height: 4;
    font-size: 19px;
    font-weight: 500;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

.inquiry-text_top{

	display: flex;
   
    line-height: 48px;
    color: #222;
    border-bottom: 2px solid #ddd;
    justify-content: space-around;
    align-items: center;
    background: #f6f6f6;
    font-weight: 600;
    font-size:19px;
}
</style>
<center style="padding:0px;">
<div class="mypage_wrap">

<table style="width:1240px; width: 1240px;display: flex;flex-direction: column;margin: 0 auto;">
	<tr  class="inquiry-text_top" >
		<td style="width: 150px; " align="center">no</td>
		<td style="width: 210px; " align="center">문의 유형</td>
		<td style="width: 260px; " align="center">제목</td>
		<td style="width: 210px; " align="center">작성자</td>
		<td style="width: 200px; " align="center">작성 시간</td>
		<td style="width: 210px; " align="center">상태</td>
	</tr>
	<c:forEach var="list" items="${inquiryList }">
		<tr class="inquiry-textfo">
			<td style="width: 150px; " align="center">${list.no }</td>
			<td style="width: 210px; " align="center">${list.inquiryType }</td>
			<td><div style="width: 260px; id="${list.no }" class="title"><a href = '${root }index?formpath=servicecenter&list=inquiryViewProc&num=${list.no }'>${list.title }</a></div></td>
			<td style="width: 210px; " align="center">${list.id }</td>
			<td style="width: 200px;" align="center">${list.writeDate }</td>
			<td style="width: 210px; " align="center">${list.state }</td>
		</tr>
	</c:forEach>
	<tr><td colspan=6><hr/></tr>
</table>
<div style="margin: 50px;font-size: 20; text-align: center;">${page}</div>
<form class="membermanage_table_wrap" action="${root }index?formpath=servicecenter&list=inquiryAnswer" method="post">
	<div>
		<div>
			
			
				<select class="review_underbar_1" name="select">
					<option value="waiting">답변 대기중.</option>
					<option value="complete">답변 완료.</option>
				</select>
				<input class="review_underbar_2" type=submit name='searchBtn' value='검색' style="width: 80px; "/>
			
		</div>
	</div>
</form>
</div>
</center>