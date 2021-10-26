<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 폰트 시작 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<!-- 폰트 끝 -->
</head>
 <style>
div {
	 font-family: 'Gowun Dodum', sans-serif;
	 font-weight:bold;
	 color:#505050;
	}
.btn {
	font-weight: bold;
	border: 0px;
	background-color: #D2E1FF;
}

.btn:hover {
	background-color: #E0EBFF;
}
thead{
	background:#E0EBFF;
}
</style>
</head>
<body>
<div class="container">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">💖삐나새💖</h1>
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
					action="${pageContext.request.contextPath}/study/modify"
					method="post">
					<div class="form-group">
						<label>Bno</label><input name="bno" class="form-control"
							value='<c:out value="${study.bno}"/>' readonly="readonly" >
					</div>
					<div class="form-group">
						<label>Title</label><input name="title" class="form-control"
							value='<c:out value="${study.title}"/>'>
					</div>
					<div class="form-group">
						<label>Content</label>
						<textarea name="content" class="form-control" rows="3"
							><c:out value="${study.content}"/></textarea>
					</div>
					<div class="form-group">
						<label>Writer</label><input name="writer" class="form-control"
							 value='<c:out value="${study.writer}" />'>
					</div>
					<!-- 0906 -->
					<%--  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			       <input type="hidden" name="amount" value="${pageMaker.cri.amount}"> --%>
				
					<button type="submit" class="btn btn-secondary">Modify</button>
					<button type="submit"
						formaction="delete" class="btn btn-secondary">Delete</button>
					<button type="button" class="btn btn-secondary" 
					 onclick="location.href='${pageContext.request.contextPath}/study/list'">List</button>
				</form>
				<br>
				
				<!-- 댓글 등록 하는 div -->
				<div class="panel-heading" align="center">
					<form id="replyForm">
						<input type="hidden" name="bno" value="${study.bno}">
						WRITER: <input name="replyer" placeholder="Enter Your name" style="width: 120px;">
						CONTENT: <input name="reply">
						<button type="button" id="savaReply" style="border:0px; height:30px; border-radius:7px;">REPLY SUBMIT</button>
					</form>
				</div>
				<!-- END OF REPLY -->
				<!-- REPLY LIST -->
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header" style="font-weight:bold">REPLY LIST</h2>
						<div class="chat">
						</div>
					</div>
				</div>
				<!-- END OF REPLY LIST -->
			</div>
		</div>
	</div>
</div>
</div>
<script>
let bno = "${study.bno}";
$(function(){
	// 등록 처리
	$("#savaReply").on("click",function(){
		$.ajax({
			url:"../reply/",
			method:"post",
			data:$('#replyForm').serialize(),
			dataType:"json",
			success:function(data){
				console.log(data);
				str ='<li class="left clearfix">'
					   +'<div>'
					   +'<div class="header">'
					   +'	<strong class="primary-font">'+data.replyer+'</strong>'
					   +'	<small class="pull-right text-muted">'+data.replydate+'</small>'
					   +	'</div>'
					   +'		<p>'+ data.reply+'</p>'
					   +'	</div>'
					   +'	</li>';
			 $(".chat").append(str);
			}
		});
	});
		// 목록 조회
		$.ajax({	
			url:"../reply/",	// method(or type):"get"
			data:{bno:bno},		//"bno=145"
			dataType:"json",	// 응답결과가 json
			success:function(datas){
				//console.log(datas);
				str ="";
				for(i=0;i<datas.length;i++){
					str +='';
				str+='<div class="left clearfix">'
				   +'<div>'
				   +'<div class="header">'
				   +'	<strong class="primary-font">'+datas[i].replyer+'</strong>'
				   +'	<small class="pull-right text-muted">'+datas[i].replydate+'</small>'
				   +	'</div>'
				   +'		<p>'+ datas[i].reply+'</p>'
				   + '<button type="submit" id="modifyReply" class="btn btn-secondary">'
                   + 'Modify'+'</button>'
                   + '&nbsp;'
                   + '<button type="submit" id="deleteReply" class="btn btn-secondary">'
                   + 'Delete'+'</button>'
                   + '   </div>';

				   +'	</div>'
				   +'	</li>';
				}	// END OF SUCCESS
				$(".chat").html(str);
			} // END OF SUCCESS
		}); // ENF OF AJAX
		
	}) // END OF FUNCTION
</script>
</body>
</html>