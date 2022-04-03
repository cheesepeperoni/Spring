<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<form role="form" id="frm" action="${pageContext.request.contextPath }/board/register"
			method="post">
			<!-- form/data가 중요함-->
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

			<!-- 글 등록 버튼 -->
			<button type="button" id="btnRegister" class="btn btn-secondary">Submit
				Button</button>
			<button type="reset" class="btn btn-secondary">Reset Button</button>
			<br>
		 
		</form>

		<!-- 파일 업로드 -->
		<div class="form-group"></div>
		<input type="file" name='uploadFile' multiple="multiple">
		<div class='uploadResult'></div><br>
		<button type="button" id="uploadBtn">첨부파일 등록</button>
		<ul id="uploaded"></ul>
		<!-- END OF FILE  -->
	</div>
</div>
<script>
$(function(){
	
    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    var maxSize = 5242880; //5MB

    function checkExtension(fileName, fileSize) {

       if (fileSize >= maxSize) {
          alert("파일 사이즈 초과");
          return false;
       }

       if (regex.test(fileName)) {
          alert("해당 종류의 파일은 업로드할 수 없습니다.");
          return false;
       }
       return true;
    }
	
	
	$('#uploadBtn').on("click",function(e){
		var formData = new FormData(document.frm);
	    //for 문을 따로 쓸 필요없이 form을 써서 넣어주기*/
	    var inputFile = $("input[name= 'uploadFile']");
		var files = inputFile[0].files;
		//console.log(files);
		for(var i =0; i<files.length; i++){
			if(!checkExtension(files[i].name, files[i].size))
				return;
			formData.append("uploadFile",files[i]);
		} 
		// formData
		$.ajax({
			processData:false,
			contentType:false,
			url:"../uploadAjaxAction",
			data:formData,
			method:"post",
			success:function(datas){ // datas 하던 result하던 상관없음
				var str = "";
				for(i=0; i<datas.length;i++){
					
				  var obj = datas[i];
				  var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
		          var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		              
		          str += "<li><div>";
		          str += "<span> "+ obj.fileName+"</span>";
		          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
		          str += "<img src='../resources/img/attach.png'></a>";
		          str += "</div>";
		          str +"</li>";
							 
				}
			$('#uploaded').html(str);
				alert("Uploaded");
			}
		});
	});
	
	$("#btnRegister").on("click",function(){
		var str ="";
		$("#uploaded li").each(function(i,obj){	// i=index 
			var jobj = $(obj);	//제이쿼리 객체로 변환 
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		    str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		    str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		    str += "<input type='hidden' name='attachList["+i+"].fileType' value='1'>";//+ jobj.data("type")+"'>";
			
		});
		$("#frm").append(str).submit();
	})
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