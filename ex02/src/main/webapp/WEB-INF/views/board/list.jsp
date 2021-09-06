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
.btn {
	font-weight: bold;
}

.btn:hover {
	background-color: #c8c8c8;
}

#pageButton {
	text-align: center;
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
					<td><a href="${board.bno }" class="move">${board.title }</a></td>
					<td><c:out value="${board.writer }" /></td>
					<td><c:out value="${board.content }" /></td>
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
	<br>
	<br>
	<!-- 폼 -->
	<form id="actionForm" action="list" method="get">
		<select name="type" style="width: 100px;">
			<option value="" ${empty pageMaker.cri.type?selected:""}>SELECT</option>
			<option value="T" ${pageMaker.cri.type=='T'?selected:""}>TITLE</option>
			<option value="C" ${pageMaker.cri.type=='C'?selected:""}>CONTENT</option>
			<option value="W" ${pageMaker.cri.type=='W'?selected:""}>WRITER</option>
			<option value="TC" ${pageMaker.cri.type=='TC'?selected:""}>TITLE
				OR CONTENT</option>
			<option value="TW" ${pageMaker.cri.type=='TW'?selected:""}>TITLE
				OR WRITER</option>
			<option value="TWC" ${pageMaker.cri.type=='TWC'?selected:""}>TITLE
				OR CONTENT OR WRITER</option>
		</select> <input name="keyword" value="${pageMaker.cri.keyword}"> <input
			type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<button class="btn btn-secondary"
			style="background: #EFEFEF; border: 0;">Search</button>
	</form>
	<div id="pageButton">
		<c:if test="${pageMaker.prev}">
			<a class="btn btn-default" href="${pageMaker.startPage-1}"
				style="background: #EFEFEF; border: 0">이전</a>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
			var="num">
			<a href="${num}">${num}</a>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<a class="btn btn-default" href="${pageMaker.endPage+1}"
				style="background: #EFEFEF; border: 0">다음</a>
		</c:if>
	</div>
</div>
<script>
	$(function() {
		var actionForm = $("#actionForm")

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							var bno = $(this).attr("href")
							actionForm
									.append('<input type="hidden" name="bno" value="'+ bno +'">')
							actionForm.attr("action", "get")
							actionForm.submit();
						});

		$("#pageButton a").on("click", function(e) {
			e.preventDefault(); //a, submit
			var p = $(this).attr("href")
			$('[name="pageNum"]').val(p)
			actionForm.submit();
		})
		//$("#board").DataTable();
	});
</script>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>