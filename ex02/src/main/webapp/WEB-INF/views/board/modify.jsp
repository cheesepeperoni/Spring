<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">등록 페이지</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<form role="form"
			action="${pageContext.request.contextPath }/board/modify" method="post">
			<div class="form-group">
				<label>Bno</label> <input name="bno" class="form-control" value='<c:out value="${board.bno }"/>'>
				<p class="help-block">Example block-level help text here.</p>
			</div>
			<div class="form-group">
				<label>Title</label> <input name="title" class="form-control" value='<c:out value="${board.title }"/>'>
				<p class="help-block">Example block-level help text here.</p>
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea name="content" class="form-control" rows="3" value='<c:out value="${board.content }"/>'></textarea>
			</div>
			<div class="form-group">
				<label>Writer</label> <input name="writer" class="form-control" value='<c:out value="${board.writer }"/>'
					placeholder="Enter text">
			</div>
			<div class="form-group">
				<label>RegDate</label> <input name="regdate" class="form-control"
					value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate }" type="both"
							dateStyle="short" timeStyle="short"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>Update date</label> <input name="updatedate" class="form-control"
					value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate }" type="both"
							dateStyle="short" timeStyle="short"/>' readonly="readonly">
			</div>


			<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
			<button type="submit" data-oper='remove' class="btn btn-default">Remove</button>
			<button type="submit" data-oper='list' class="btn btn-default">List</button>
		</form>
	</div>
</div>
<script>
$(document).ready(function(){
	var formObj =$("form");
	
	$('button').on("click",function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action","/board/remove");
		}else if(operation === 'list'){
			self.location="${pageContext.request.contextPath }/board/list"
			return;
		}
		formObj.submit();
	})
	
})
</script>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>