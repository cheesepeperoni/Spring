<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>

<style>
.btn{
	font-weight:bold;
	border:0px;
	background-color:#D2E1FF;	
}
.btn:hover{
	background-color:#E0EBFF;	
}
</style>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Register</h1>
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
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea name="content" class="form-control" rows="3"></textarea>
			</div>
			<div class="form-group">
				<label>Writer</label> <input name="writer" class="form-control"
					placeholder="Enter your name">
			</div>


			<button type="submit" class="btn btn-secondary">Submit Button</button>
			<button type="reset" class="btn btn-secondary">Reset Button</button>
		</form>
	</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>