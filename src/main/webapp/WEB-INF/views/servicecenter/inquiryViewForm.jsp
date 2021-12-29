<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/view.css" /> 
<c:url var="root" value="/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.board_view_inquiry_top{
		padding: 20px 15px;
		font-size: 2rem;
		display: flex;
		justify-content: flex-start;
		align-items: center;
	}
	.board_view_inquiry_bottom{
		padding: 22px;
		border-bottom: 1px dashed #ddd;
		font-size: 0;
		display: flex;
		justify-content: flex-start;
		align-items: center;
		padding-bottom: 22px;
		background-color: #f9f9f9;
		border-top: 1px solid #ddd;
	}
	</style>
<title>Insert title here</title>
</head>
<body>


<section class="content_section">
	<div class="board_view"> 
	<form action="" method="post">
		<input type="hidden" name="no" value="${view.no }" />
		<div>
			<div class="board_view_sub">
				<div class="title" ><h2>${view.title }</h2></div>
				<div class="info">
					<dl>
						<dt>작성일</dt>
						<dd>${view.writeDate }</dd>
					</dl>
					<dl>
                        <dt>글쓴이</dt>
                        <dd>${view.id }</dd>
                    </dl>
                    
				</div>
			</div>
			
			 <!-- 이미지 사진  -->
			 
			<c:forEach var="file" items="${fileName }">
				<div>
					<div  style="width: 650px; height: 300px" >
						<img src="/img/${file }" style="width: 500px; height: 500px;">
					</div>
				</div>
			</c:forEach>
			
			 <!-- 글자  -->   
			
				<div class="cont">
				<pre>${view.content }</pre>
				</div>
			
		</div>
	</form>
	
	
	<form class="board-comment-wrap" action = "${root }inquiryAnswerProc" method = "post" accept-charset="euc-kr">
		<input type = "hidden" name = "no" value = "${view.no }">
		<p>답변</p>
		<div class= "board-comment-text">
			<div class="board-comment-text-in">

				<c:choose>
					<c:when test="${view.answer ne 'null'}">
						<textarea id="answer" name="answer" cols="50" rows="2" placeholder = "${view.answer }"></textarea>
					</c:when>
					<c:otherwise>
						<textarea id="answer" name="answer" cols="50" rows="2" placeholder = "답변 등록."></textarea>
					</c:otherwise>
				</c:choose>
				<input type="submit" value="답변 등록">
			</div>
		</div>
		
	</form>

</div>	
</section>	

</body>
</html>

