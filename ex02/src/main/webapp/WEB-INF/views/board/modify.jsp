<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      <h1 class="page-header">Modify Page</h1>
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
   <div class="col-lg-12">
      <form role="form" action="${pageContext.request.contextPath }/board/modify" method="post">
         <div class="form-group">
            <label>Bno</label> <input name="bno" class="form-control"  readonly="readonly" value='<c:out value="${board.bno }"/>'>
         </div>
         <div class="form-group">
            <label>Title</label> <input name="title" class="form-control" value='<c:out value="${board.title }"/>'>
         </div>
         <div class="form-group">
            <label>Content</label>
            <textarea name="content" class="form-control" rows="3" ><c:out value="${board.content }"/></textarea>
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
         <button class="btn btn-secondary" onclick="modify()">Modify</button>
        <%--  <button formaction="${pageContext.request.contextPath}/board/delete" class="btn btn-default">Delete</button> --%>
         <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath }/board/list'">List</button>
      </form> 
   </div>
</div> 
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<script>
	function modify(){
		alert("수정 완료!");
	}
</script>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>