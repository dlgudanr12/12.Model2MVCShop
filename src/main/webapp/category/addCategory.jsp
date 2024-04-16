<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<html>
<head>
<meta charset="euc-kr" />
<title>ī�װ� ���� ������</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<style>
body {
	padding-top: 50px;
}
body>div.container{
	border: 3px solid #DDDDDD;
}
</style>
</head>
<body>
<div class="container">
		<h1 class="bg-primary text-center">ī�װ� ����</h1>
		<form name="detailForm" class="form-horizontal">
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">ī�װ� �̸�</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="categoryName" name="categoryName" 
					value="" placeholder="ī�װ� �̸�">
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">ī�װ� ���κз�</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="categoryDetail" name="categoryDetail" 
					value="" placeholder="ī�װ� ���κз�">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >����</button>
		      		<button type="button" class="btn btn-primary"  >�ݱ�</button>
				</div>
			</div>
	</form>
</div>
</body>
</html>
<script type="text/javascript">
/* function fncSubmit(){
	$("form").attr("method", "post").attr("action",
	"/category/addCategory").submit();
}; */

$(function(){
	$("button:contains('����')").click(function(){
		/* fncSubmit(); */
		let categoryName = $("#categoryName").val();
		let categoryDetail = $("#categoryDetail").val();
		//alert(categoryName+"/"+categoryDetail);
		$.ajax("/categoryRest/json/addCategory",{
			method : "POST",
			dataType : "json",
			headers:{
				"Content-Type" : "application/json; charset=euc-kr"
			},
			data : JSON.stringify({
				categoryName : categoryName,
				categoryDetail : categoryDetail
			}),
			success:function(JSONData,status){
				console.log(JSONData.success);
			}
		})
		setTimeout(function(){
			if(opener){
				opener.location.reload(true);
			}
			window.close();
		}, 500);
	});
	
	$("button:contains('�ݱ�')").click(function(){
		window.close();
	});
});
</script>