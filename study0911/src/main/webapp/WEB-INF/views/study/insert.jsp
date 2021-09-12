<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 폰트 시작 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<!-- 폰트 끝 -->
</head>
<style>
div {
	font-family: 'Gowun Dodum', sans-serif;
	font-weight: bold;
}

.btn {
	font-weight: bold;
	border: 0px;
	background-color: #D2E1FF;
}

.btn:hover {
	background-color: #E0EBFF;
}
body{
	 align:center;
}
</style>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Register</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-8">
				<form role="form"
					action="${pageContext.request.contextPath }/study/insert"
					method="post">
					<div class="form-group">
						<label>Title</label> <input name="title" class="form-control">
					</div>
					<div class="form-group">
						<label>Content</label>
						<textarea name="content" class="form-control" rows="3"></textarea>
					</div>
					<div class="form-group">
						<label>Writer</label> <input name="writer" class="form-control"
							placeholder="Enter your name">
					</div>


					<button type="submit" class="btn btn-secondary">Submit
						Button</button>
					<button type="reset" class="btn btn-secondary">Reset
						Button</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>