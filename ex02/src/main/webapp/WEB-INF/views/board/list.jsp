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
<style>
.btn{
	font-weight:bold;
}
.btn:hover{
	background-color:#c8c8c8;
}
</style>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board List</h1>
	</div>

	<table id="board" class="table table-hover table-striped">
		<thead>
			<tr>
				<th>NUMBER</th>
				<th>TITLE</th>
				<th>WRITER</th>
				<th>CONTENTS</th>
				<th>REGDATE</th>
				<th>UPDATE-DATE</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="board">
				<tr>
					<td><c:out value="${board.bno}" /></td>
					<td><a href="get?bno=${board.bno }">${board.title }</a></td>
					<td><c:out value="${board.writer }"/></td>
					<td><c:out value="${board.content }"/></td>
					<td><fmt:formatDate value="${board.regdate }" type="both"
							dateStyle="short" timeStyle="short" /></td>
					<td><fmt:formatDate value="${board.updatedate}" type="both"
							dateStyle="short" timeStyle="short" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<button type="button" class="btn btn-secondary"
		 onclick="location.href='${pageContext.request.contextPath }/board/register'">등록</button>
</div>
<script>
	$(function(){
		$("#board").DataTable();
	});
	
	$(document).ready(function(){
		var result ='<c:out value="${result}"/>';
		checkModal(result);
		
		function checkModal(result){
			if(result===''){
				return;
			}
			if(parseInt(result)>0){
				$(".modla-body").html(
						"게시글 "+parseInt(result)+" 번이 등록되었습니다");
			}
				$(".modal-body").modal("show");			
		}
		$("#regBtn").on("click",function(){
			self.location ="${pageContext.request.contextPath}/board/register";
		});
		
		
	});
</script>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>