<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">한건 조회</h1>
                    </div>
	<table class="table table-hover table-dark" >
		<tr>
			<td>글넘버</td>
			<td>제목</td>
			<td>내용</td>
			<td>작성자</td>
		</tr>
		<tr>
			<td>${board.bno }</td>
			<td>${board.title }</td>
			<td>${board.content }</td>
			<td>${board.writer }</td>
		</tr>
	</table>
	</div>
		<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>