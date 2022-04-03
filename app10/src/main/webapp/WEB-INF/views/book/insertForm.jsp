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
</head>
<body>
<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
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
					action="${pageContext.request.contextPath }/book/insertForm"
					method="post">
					<div class="form-group">
						<label>도서번호</label><input name="bookNo" value="${book}" readonly="readonly" class="form-control">
					</div>
					<div class="form-group">
						<label>도서명</label><input name="bookName" class="form-control">
					</div>
					<div class="form-group">
						<label>도서표지</label> <input name="bookCoverimg" class="form-control">
					</div>
					<div class="form-group">
						<label>출판일자</label> <input name="bookDate" class="form-control">
					</div>
					<div class="form-group">
						<label>금액</label> <input name="bookPrice" class="form-control">
					</div>
					<div class="form-group">
						<label>출판사</label> <input name="bookPublisher" class="form-control">
					</div>
					<div class="form-group">
						<label>도서소개</label> 
						<textarea name="bookInfo" class="form-control" rows="3"></textarea>
					</div>
					<button type="submit" id="register" class="btn btn-secondary">등록
						Button</button>
					<button type="button" class="btn btn-secondary"
					onclick="location.href='${pageContext.request.contextPath}/book/list'">조회
						Button</button>
				</form>
			</div>
		</div>
	</div>
	<br><br>
<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
<script>
$(function(){
	$('#register').on("click",function(){
		alert('도서 등록이 완료 되었습니다')
	})
})
</script>
</body>
</html>