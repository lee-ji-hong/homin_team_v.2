<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test = "${sessionScope.id ne 'admin' }">
	<script>
		alert('잘못된 접근입니다.');
		window.history.back();
	</script>
</c:if>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		$("input[type='file']").change(function(e) {
			$('#preview').empty();
			var files = e.target.files;
			var arr = Array.prototype.slice.call(files);
			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
			}
			preview(arr);
		});
		function checkExtension(fileName, fileSize) {
			var regex = new RegExp("(.*?)\.(jpg|png|img)$");
			var maxSize = 52428800;
			if (fileSize >= maxSize) {
				alert('파일 사이즈 초과');
				$("input[type='file']").val(""); 
				return false;
			}
			if (!(regex.test(fileName))) {
				alert('사진만 등록 가능합니다.');
				$("input[type='file']").val(""); 
				return false;
			}
			return true;
		}
		function preview(arr) {
			arr.forEach(function(f) {
				
				var fileName = f.name;
				if (fileName.length > 10) {
					fileName = fileName.substring(0, 7) + "...";
				}
				var str = '<div style="display: inline-flex; padding: 10px;"><li>';
				if (f.type.match('image.*')) {
					var reader = new FileReader();
					reader.onload = function(e) {
						str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
						str += '</li></div>';
						$(str).appendTo('#preview');
					}
					reader.readAsDataURL(f);
				} else {
					str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
					$(str).appendTo('#preview');
				}
			});
		}
	});
</script>
<style>
	#preview{
	    outline: 2px dashed #92b0b3 ;
	    text-align: center;
	    width: 300px;
	    height: 300px;
	    background-color: white;
	}

</style>
</head>
	<body>
	<form action = "${root }productModifyProc" method="post" enctype="multipart/form-data">
		<div id="preview" >
			<img src = "/product_img/${productInfo.product_filename}">
		</div>
		<input type="file" name="product_filename">
		<div>
			<span>제품번호 : <input type = "text" name = "product_no" value = "${productInfo.product_no }" readonly="readonly"></span>
		</div>
		<div>
			<span>제품이름 : <input type = "text" name = "product_name" value = "${productInfo.product_name }"></span>
		</div>
		<div>
			<span>카테고리 : 
				<select name = "classification">
				<c:choose>
					<c:when test="${productInfo.classification eq 'dryer' }">
						<option value = "dryer" selected="selected">건조기</option>
						<option value = "aircleaner">공기청정기</option>
						<option value = "microwave">전기레인지</option>
						<option value = "refrigerator">냉장고</option>
						<option value = "washmachine">식기세척기</option>
						<option value = "waterpurifier">정수기</option>
					</c:when>
					<c:when test="${productInfo.classification eq 'aircleaner' }">
						<option value = "dryer">건조기</option>
						<option value = "aircleaner" selected="selected">공기청정기</option>
						<option value = "microwave">전기레인지</option>
						<option value = "refrigerator">냉장고</option>
						<option value = "washmachine">식기세척기</option>
						<option value = "waterpurifier">정수기</option>
					</c:when>
					<c:when test="${productInfo.classification eq 'microwave' }">
						<option value = "dryer">건조기</option>
						<option value = "aircleaner">공기청정기</option>
						<option value = "microwave" selected="selected">전기레인지</option>
						<option value = "refrigerator">냉장고</option>
						<option value = "washmachine">식기세척기</option>
						<option value = "waterpurifier">정수기</option>
					</c:when>
					<c:when test="${productInfo.classification eq 'refrigerator' }">
						<option value = "dryer">건조기</option>
						<option value = "aircleaner">공기청정기</option>
						<option value = "microwave">전기레인지</option>
						<option value = "refrigerator" selected="selected">냉장고</option>
						<option value = "washmachine">식기세척기</option>
						<option value = "waterpurifier">정수기</option>
					</c:when>
					<c:when test="${productInfo.classification eq 'washmachine' }">
						<option value = "dryer">건조기</option>
						<option value = "aircleaner">공기청정기</option>
						<option value = "microwave">전기레인지</option>
						<option value = "refrigerator">냉장고</option>
						<option value = "washmachine" selected="selected">식기세척기</option>
						<option value = "waterpurifier">정수기</option>
					</c:when>
					<c:when test="${productInfo.classification eq 'waterpurifier' }">
						<option value = "dryer">건조기</option>
						<option value = "aircleaner">공기청정기</option>
						<option value = "microwave">전기레인지</option>
						<option value = "refrigerator">냉장고</option>
						<option value = "washmachine">식기세척기</option>
						<option value = "waterpurifier" selected="selected">정수기</option>
					</c:when>
				</c:choose>
				</select>
			</span>
		</div>
		<div>
			<span>제품가격 : <input type = "text" name = "price" value = "${productInfo.price }"></span>
		</div>
		<input type = "submit" value = "수정">
		</form>
	</body>
</html>