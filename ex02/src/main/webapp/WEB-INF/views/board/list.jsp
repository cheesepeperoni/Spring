<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="/WEB-INF/views/includes/header.jsp"%>
<!-- DataTables CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- DataTables JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시판</h1>
	</div>

	<table id="board" class="table table-hover table-dark">
		<thead>
			<tr>
				<th>bno</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>regdate</th>
				<th>update</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="board">
				<tr>
					<td>${board.bno}</td>
					<td><a href="get?${board.bno }">${board.title }</a></td>
					<td>${board.content }</td>
					<td>${board.writer }</td>
					<td><fmt:formatDate value="${board.regdate }" type="both"
							dateStyle="short" timeStyle="short" /></td>
					<td><fmt:formatDate value="${board.updatedate}" type="both"
							dateStyle="short" timeStyle="short" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script>
	$(function(){
		$("#board").DataTable();
	});
	
	$(document).ready(function(){
		var result ='<c:out value="${result}"/>';
		
		
	});
</script>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>