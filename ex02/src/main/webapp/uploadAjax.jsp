<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadAjax.jsp</title>

</head>
<body>
<div>
<form name="frm">
	<input type="text" name="writer">
	<input type="text" name="content">
</form>
	<input type="file" name="uploadFile" multiple="multiple">
</div>
	<button type="button" id="uploadBtn">UPLOAD</button>


<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
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
		/* var inputFile = $("input[name= 'uploadFile']");
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
			url:"uploadAjaxAction",
			data:formData,
			method:"post",
			success:function(result){
				alert("Uploaded");
			}
		});
	});
});
</script>
</body>
</html>