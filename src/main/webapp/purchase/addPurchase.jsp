<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>���� Ȯ��</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
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
		<h1 class="bg-primary text-center">��ǰ ����</h1>
		<form name="detailForm" class="form-horizontal">
			<h5 class="text-muted">
				&nbsp; ������ ���� <strong class="text-info">����</strong>�� �Ǿ����ϴ�.
			</h5>
		
		
			<%-- <div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.prodNo }</strong>
					</span>
				</div>
			</div> --%>
		
			 <div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">��ǰ�� </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.prodName }</strong>
					</span>
					<input class="prodNo" type="hidden" value="${purchase.purchaseProd.prodNo }"/>
				</div>
			</div>
		
			<%--<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">��ǰ������ </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.prodDetail }</strong>
					</span>
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">�������� </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.manuDate }</strong>
					</span>
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">���� </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.price }&nbsp;��</strong>
					</span>
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">������� </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${purchase.purchaseProd.regDate }</strong>
					</span>
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">��ǰ ���� </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.purchaseProd.prodQuantity }&nbsp; ��</strong>
					</span>
				</div>
			</div> --%>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.buyer.userId }</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
				<div class="col-sm-4">
				<span id="helpBlock" class="help-block"> 
					<c:if test="${purchase.paymentOption==1}"><strong>���ݱ���</strong></c:if>
					<c:if test="${purchase.paymentOption==2}"><strong>�ſ뱸��</strong></c:if>
				</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.receiverName }</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.receiverPhone }</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.divyAddr }</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.divyRequest }</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">����������</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.divyDate }</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">���� ����</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${purchase.tranQuantity }&nbsp; ��</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary"  >Ȯ��</button>
		      		<button type="button" class="btn btn-primary"  >�߰�����</button>
				</div>
			</div>
	</form>
</div>

</body>
</html>
<script type="text/javascript">
	$(function() {
		var prodNo=$("input.prodNo").val();
		$("button:contains('Ȯ��')").on(
				"click",
				function() {
					self.location = "/purchase/listPurchase";
				})

		$("button:contains('�߰�����')").on("click", function() {
			self.location = "/purchase/addPurchase/"+prodNo;
		})
	});
</script>