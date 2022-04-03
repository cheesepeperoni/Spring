<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- multiple="multiple" 파일 여러개 올리는 법  -->
<form method="post" enctype="multipart/form-data" action="uploadFormAction">
	<input type="file" name="uploadFile" multiple="multiple">
	<button>등록</button>
</form>
</body>
</html>