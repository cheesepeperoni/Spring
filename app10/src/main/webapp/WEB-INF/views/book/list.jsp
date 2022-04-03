<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	 font-weight:bold;
	 color:#505050;
	}
.btn {
	font-weight: bold;
	border: 0px;
	background-color: #D2E1FF;
}

.btn:hover {
	background-color: #E0EBFF;
}
thead{
	background:#E0EBFF;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<h2>도서 조회</h2>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>도서번호</th>
					<th>도서명</th>
					<th>표지</th>
					<th>출판일자</th>
					<th>금액</th>
					<th>출판사</th>
					<th>도서소개</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${book }" var="book">
					<tr>
						<td>${book.bookNo}</td>
						<td>${book.bookName }</td>
						<td>${book.bookCoverimg }</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${book.bookDate }" /></td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${book.bookPrice }" /></td>
						<td>${book.bookPublisher }</td>
						<td>${book.bookInfo }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br><br><br>
<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>