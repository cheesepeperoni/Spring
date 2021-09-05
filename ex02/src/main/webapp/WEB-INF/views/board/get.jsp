<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
      <h1 class="page-header">Board read</h1>
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">BOARD READ PAGE</div>
         <div class="panel-body">
            <form role="form" action="${pageContext.request.contextPath}/board/modify" method="get">
               <div class="form-group">
                  <label>Bno</label><input name="bno" class="form-control" value='<c:out value="${board.bno}"/>'
                     readonly="readonly">
               </div>
               <div class="form-group">
                  <label>Title</label><input name="title" class="form-control"
                     value='<c:out value="${board.title}"/>' readonly="readonly">
               </div>
               <div class="form-group">
                  <label>Content</label>
                  <textarea name="content" class="form-control" rows="3"
                     readonly="readonly"><c:out value="${board.content}" /></textarea>
               </div>
               <div class="form-group">
                  <label>Writer</label><input name="writer" class="form-control" readonly="readonly"
                     value='<c:out value="${board.writer}" />'>
               </div>
               <button type="submit" class="btn btn-secondary">Modify</button>
               <button type="button" formaction="${pageContext.request.contextPath}/board/delete" class="btn btn-secondary">Delete</button>
               <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath }/board/list'">List</button>
            </form>
         </div>
      </div>
   </div>
</div>
<br><br>
<!-- <script>
   $(document).ready(function () {
      var operForm = $('#operForm');

      $("button[data-oper='modify']").on("click", function (e) {
         operForm.attr("action", "${pageContext.request.contextPath }/board/modify").submit();
      });
      $("button[data-oper='list']").on("click", function (e) {
         operForm.find("#bno").remove();
         operForm.attr("action", "${pageContext.request.contextPath }/board/list")
         operForm.submit();
      });
   });
</script> -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>