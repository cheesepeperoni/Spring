<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			action="${pageContext.request.contextPath }/board/register"
			method="post">
			<div class="form-group">
				<label>Title</label> <input name="title" class="form-control">
				<p class="help-block">Example block-level help text here.</p>			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea name="content" class="form-control" rows="3"></textarea>
			</div>
			<div class="form-group">
				<label>Writer</label> <input name="writer" class="form-control"
					placeholder="Enter text">
			</div>


			<button type="submit" class="btn btn-default">Submit Button</button>
			<button type="reset" class="btn btn-default">Reset Button</button>
		</form>
	</div>
</div>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>