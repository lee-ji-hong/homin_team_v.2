<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty msg }">
	<script>
		alert('${msg}');
	</script>
</c:if>
<html>
<body>
<div align="center" >
	<table id="layout" style=" background: #fafafa; width: 100%;">
		<tr>
			<td id="layout_header" style="height:100px;"><%@ include file="common/top.jsp" %></td>
		</tr>
		<tr>
			<td style="height:400px; border-top: 1px solid #ddd;"><c:import url="/${formpath }" /> </td>
		</tr>
		<tr>
			<td style="height:50px; border-top: 1px solid #ddd;"><%@ include file="common/footer.jspf" %></td>
		</tr>
	</table>
	</div>
</body>
</html>
