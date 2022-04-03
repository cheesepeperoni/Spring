<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ajaxTest.jsp</title>
<script
	src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<script>
	$(function() { // $(document).ready 어쩌구 줄인거 //page ready 이벤트
		//on == addEventListener 와 같은 것
		$("#btn1").on("click", function() {
			$.ajax({
				url : "ajax1",
				method : "get",
				//async : false, // 동기식 호출
				data:{writer:$("#writer").val()},
				dataType : "json",
				success : function(data) {
					$('#result').append(data.content + "<br>")
					$('#result').append(data.writer + "<br>")
				} // 결과가 넘어오면 실행할 function (callback 함수)
			});
			$('#result').append("클릭됨<br>")
		}) // btn1 click end
		
		$('#btn2').on("click",function(){
			$.ajax({
				url:"ajax2",
				method:"post",
				data:JSON.stringify({writer:$("#writer").val()}),
				contentType:"application/json",
				dataType:"json",
				success:function(data){
					$('#result').append($("<p>").append(data.content)
												.append("<br>")
												.append(data.writer))
				}
			})
		})
		// 그룹 이벤트 : 위임 -> 동적으로 추가될 태그에도 미리 이벤트 지정
		// 부모 태그에 이벤트 지정
		$("#result").on("click","p",function(){
			$(this).remove();
		})
	}) // end of $(function (){ }
</script>
</head>
<body>
	<input name="writer" id="writer">
	<button type="button" id="btn1">문자열</button>
	<button type="button" id="btn2">파라미터</button>

	<div id="result"></div>
</body>
</html>