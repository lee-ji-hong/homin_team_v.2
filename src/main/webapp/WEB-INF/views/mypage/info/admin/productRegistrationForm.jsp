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
			//div 내용 비워주기
			$('#preview').empty();
			var files = e.target.files;
			var arr = Array.prototype.slice.call(files);
			//업로드 가능 파일인지 체크
			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
			}
			preview(arr);
		});//file change
		function checkExtension(fileName, fileSize) {
			var regex = new RegExp("(.*?)\.(jpg|png|img)$");
			var maxSize = 52428800; //50MB
			if (fileSize >= maxSize) {
				alert('파일 사이즈 초과');
				$("input[type='file']").val(""); //파일 초기화
				return false;
			}
			if (!(regex.test(fileName))) {
				alert('사진만 등록 가능합니다.');
				$("input[type='file']").val(""); //파일 초기화
				return false;
			}
			return true;
		}
		function preview(arr) {
			arr.forEach(function(f) {
				//파일명이 길면 파일명...으로 처리
				var fileName = f.name;
				if (fileName.length > 10) {
					fileName = fileName.substring(0, 7) + "...";
				}
				//div에 이미지 추가
				var str = '<div style="display: inline-flex; padding: 10px;"><li>';
				//이미지 파일 미리보기
				if (f.type.match('image.*')) {
					var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
					reader.onload = function(e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
						//str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
						str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
						str += '</li></div>';
						$(str).appendTo('#preview');
					}
					reader.readAsDataURL(f);
				} else {
					str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
					$(str).appendTo('#preview');
				}
			});//arr.forEach
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
	<form action = "${root }productInsert" method="post" enctype="multipart/form-data">
		<div id="preview" >
		</div>
		<input type="file" name="product_filename">
		<div>
			<span>제품번호 : <input type = "text" name = "product_no"></span>
		</div>
		<div>
			<span>제품이름 : <input type = "text" name = "product_name"></span>
		</div>
		<div>
			<span>카테고리 : 
				<select name = "classification">
					<option value = "dryer">건조기</option>
					<option value = "aircleaner">공기청정기</option>
					<option value = "microwave">전기레인지</option>
					<option value = "refrigerator">냉장고</option>
					<option value = "washmachine">식기세척기</option>
					<option value = "waterpurifier">정수기</option>
				</select>
			</span>
		</div>
		<div>
			<span>제품가격 : <input type = "text" name = "price"></span>
		</div>
		<input type = "submit" value = "등록">
	</form>
</body>
</html>