<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">List</h1>
	</div>
	<table id="board" class="table table-hover table-striped">
		<thead>
			<tr>
				<th>ID</th>
				<td><input id="id" type="text"></td>
			</tr>
			<tr>
				<th>PASSWORD</th>
				<td><input id="password" type="text"></td>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input id="name" type="text"></td>
			</tr>
			<tr>
				<th>PHONE</th>
				<td><input id="phone" type="text"></td>
			</tr>
			<tr>
				<th>BIRTH</th>
				<td><input id="birth" type="text"></td>
			</tr>
			<tr>
				<th>ADDRESS</th>
				<td><input id="address" type="text"></td>
			</tr>
		</thead>
	</table>
	<br>
	<button type="button" onClick="paintTable()">SEARCH</button>
	<button type="button" onClick="saveInfo()" id="save-btn">SUBMIT</button>

	<table class="table table-hover table-striped">
		<thead>
			<tr>
				<th>ID</th>
				<th>PASSWORD</th>
				<th>NAME</th>
				<th>PHONE</th>
				<th>BIRTH</th>
				<th>ADDRESS</th>
			</tr>
		</thead>
		<tbody id="content">
		</tbody>
	</table>
</div>
<script>
	// 테이블 조회
	function paintTable() {
		let content = '';

		$.ajax({
			url : 'getList',
			type : 'post',
			dataType : 'json',
			success : function(data) {
				for (let i = 0; i < data.length; i++) {
					content += '<tr><td>' + data[i].id + '</td>';
					content += '<td>' + data[i].password + '</td>';
					content += '<td>' + data[i].name + '</td>';
					content += '<td>' + data[i].phone + '</td>';
					content += '<td>' + data[i].birth + '</td>';
					content += '<td>' + data[i].address + '</td></tr>';
				}
				$('#content').html(content);
			},
			error : function() {
				alert("실패!");
			}
		});
	}

	// 등록 & 수정
	function saveInfo() {
		const param = {
			id : $('#id').val(),
			password : $('#password').val(),
			name : $('#name').val(),
			phone : $('#phone').val(),
			birth : $('#birth').val(),
			address : $('#address').val()
		};
		console.log(JSON.stringify(param));
		
		if ($("#save-btn").html() == 'SUBMIT') {
			$.ajax({
				url : 'insertInfo',
				type : 'post',
				data : JSON.stringify(param),
				dataType : 'json',
				contentType : 'application/json;charset=UTF-8',
				success : function(result) {
					if (result === true) {
						paintTable();
					}
				},
				error : function() {
					alert("실패!");
				}
			});
		} else if ($("#save-btn").html() == 'MODIFY') {
			$.ajax({
				url : 'modifyInfo',
				type : 'post',
				data : JSON.stringify(param),
				dataType : 'json',
				contentType : 'application/json;charset=UTF-8',
				success : function(result) {
					if (result === 1) {
						paintTable();
					}
				},
				error : function() {
					alert("실패!");
				}
			});
		}

	}

	$('#content').on("click", "tr", function(event) {
		console.log($('#save-btn').html());
		$('#save-btn').html('MODIFY');
		console.log($(this).children());
		$.each($(this).children(), function(index, el) {
			$('thead input').eq(index).val(el.innerHTML);
		});
	})
</script>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>