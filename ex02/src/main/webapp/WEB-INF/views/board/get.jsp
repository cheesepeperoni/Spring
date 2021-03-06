<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>

<style>
.btn {
   font-weight: bold;
   border: 0px;
   background-color: #D2E1FF;
}

.btn:hover {
   background-color: #E0EBFF;
}
#deleteReply,#modifyReply{
   text-align:center;
   width:40px; 
   height:30px;
   padding:0px;
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
            <form role="form"
               action="${pageContext.request.contextPath}/board/modify"
               method="get">
               <div class="form-group">
                  <label>Bno</label><input name="bno" class="form-control"
                     value='<c:out value="${board.bno}"/>' readonly="readonly">
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
                  <label>Writer</label><input name="writer" class="form-control"
                     readonly="readonly" value='<c:out value="${board.writer}" />'>
               </div>
               <!-- 0906 -->
               <%--  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                <input type="hidden" name="amount" value="${pageMaker.cri.amount}"> --%>

               <button type="submit" class="btn btn-secondary">Modify</button>
               <button type="submit" formaction="delete" class="btn btn-secondary">Delete</button>
               <button type="button" class="btn btn-secondary"
                  onclick="location.href='${pageContext.request.contextPath}/board/list?pageNum=${cri.pageNum}&amount=${cri.amount}'">List</button>
            </form>
            <br>
            <!-- ?????? ?????? -->
            <div class="panel-heading" align="center">
               <form id="replyForm">
                  <input type="hidden" name="bno" value="${board.bno}">
                  WRITER: <input name="replyer" placeholder="Enter Your name"
                     style="width: 120px;"> CONTENT: <input name="reply">
                  <button type="button" id="savaReply"
                     style="border: 0px; height: 30px; border-radius: 7px;">REPLY
                     SUBMIT</button>
               </form>
            </div>
            <!-- ?????? ?????? ?????? ???????????? -->
            <c:forEach items="${board.attachList}" var="attach">
               <a href="download?uuid=${attach.uuid}">${attach.fileName}</a>
            </c:forEach>
            <!-- ?????? ?????? -->
            <div class="row">
               <div class="col-lg-12">
                  <h2 class="page-header" style="font-weight: bold">REPLY LIST</h2>
                  <ul class="chat">
                  
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
   <script>
      let bno = "${board.bno}";
      $(function() {
         // ?????? ??????
         $("#savaReply").on("click",function() {
         $.ajax({
            url : "../reply/",
            method : "post",
            data : $('#replyForm').serialize(),
            dataType : "json",
            success : function(data) {
               console.log(data);
               str = '<li class="left clearfix">'
                     + '<div>'
                     + '<div class="header">'
                     + '<strong class="primary-font">'
                     + data.replyer
                     + '</strong>'
                     + '   <small class="pull-right text-muted">'
                     + data.replydate
                     + '</small>'
                     + '</div>'
                     + '      <p>'
                     + data.reply
                     + '</p>'
                     + '   </div>'
                     + '   </li>';
               $(".chat").append(str);
            }
         });
      });

         // ?????? ??????
         $.ajax({
            url : "../reply/", // method(or type):"get"
            data : {
               bno : bno
            }, //"bno=145"
            dataType : "json", // ??????????????? json
            success : function(datas) {
               //console.log(datas);
               str = "";
               for (i = 0; i < datas.list.length; i++) {
                  str += '';
                  str += '<li class="left clearfix">' + '<div>'
                        + '<div class="header">'
                        + '   <strong class="primary-font">'
                        + datas.list[i].replyer + '</strong>'
                        + '   <small class="pull-right text-muted">'
                        + datas.list[i].replydate + '</small>'
                        + '</div>' + '      <p>' + datas.list[i].reply
                        
                        + '</p>' + '   </div>' 
                        + '<button type="submit" id="modifyReply" class="btn btn-secondary">'
                        +'??????'+'</button>'
                        +'&nbsp;'
                        + '<button type="submit" id="deleteReply" class="btn btn-secondary">'
                        +'??????'+'</button>'
                        + '   </li>';
               }
               $(".chat").html(str);
            }
         });
      })
   </script>
   <br> <br>
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
   <br> <br> <br> <br> <br> <br> <br> <br>
   <br> <br> <br> <br> <br> <br> <br> <br>
   <br> <br> <br> <br> <br> <br> <br> <br>
   <br> <br> <br> <br> <br> <br> <br> <br>
   <%@include file="/WEB-INF/views/includes/footer.jsp"%>