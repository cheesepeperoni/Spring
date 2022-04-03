<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
	color: #505050;
}

.btn {
	font-weight: bold;
	border: 0px;
	background-color: #D2E1FF;
}

.btn:hover {
	background-color: #E0EBFF;
}

thead {
	background: #E0EBFF;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">도서대여관리</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">BOARD READ PAGE</div>
					<div class="panel-body">
						<form role="form"
							action="${pageContext.request.contextPath}/book/modify"
							method="post">
							<div class="form-group">
								<label>도서번호</label><input name="bno" class="form-control"
									value='<c:out value="${book.bookNo}"/>' readonly="readonly">
							</div>
							<div class="form-group">
								<label>도서명</label><input name="title" class="form-control"
									value='<c:out value="${book.bookName}"/>'>
							</div>
							<div class="form-group">
								<label>도서표지</label><input name="title" class="form-control"
									value='<c:out value="${book.bookCoverimg}"/>'>
							</div>
							<div class="form-group">
								<label>출판일자</label><input name="title" class="form-control"
									value='<c:out value="${book.bookDate}"/>'>
							</div>
							<div class="form-group">
								<label>금액</label><input name="title" class="form-control"
									value='<c:out value="${book.bookPrice}"/>'>
							</div>
							<div class="form-group">
								<label>출판사</label><input name="title" class="form-control"
									value='<c:out value="${book.bookPublisher}"/>'>
							</div>
							<div class="form-group">
								<label>도서소개</label>
								<textarea name="content" class="form-control" rows="3"><c:out
										value="${book.bookInfo}" /></textarea>
							</div>
			
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>