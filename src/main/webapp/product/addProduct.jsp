<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
Product productVO = (Product) request.getAttribute("productVO");
%> --%>

<html>
<head>
<meta charset="euc-kr" />
<title>��ǰ���</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

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
<script type="text/javascript" src="../javascript/calendar.js"></script>

<style>
body {
	padding-top: 50px;
}
body>div.container{
	border: 3px solid #DDDDDD;
}
a[href='#']{
	color: black;
}
</style>

</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- <form name="detailForm" method="post" enctype="multipart/form-data"> -->
	<div class="container">
		<h1 class="bg-primary text-center">��ǰ���</h1>
		<form name="detailForm" class="form-horizontal">

			<!-- <table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37" /></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">��ǰ���</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table> -->

			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${product.prodName }</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${product.prodDetail}</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">�з�</label>
				<div class="col-sm-4">
					<select id="ctgrNo" name="ctgrNo" class="form-control" style="width: 140px">
					<option value="0"  ${( product.ctgrNo==0 ) ? "selected" : "" } >��ü</option>
					<c:forEach var="category" items="${listCategory }">
						<option value="${category.categoryNo }"  ${product.ctgrNo==category.categoryNo ? "selected" : "" }>${category.categoryName }</option>
					</c:forEach>
				</select>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${product.manuDate }</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">����</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${product.price }&nbsp;��</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <c:forEach var="fileName"
							items="${product.fileList}">
							<img src="/images/uploadFiles/${fileName }" height="200" align="absmiddle" />
							<br />
						</c:forEach>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">��� ����</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${product.prodQuantity}&nbsp;��</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<a class="btn btn-primary btn" href="#" role="button">Ȯ��</a> <a
						class="btn btn-primary btn" href="#" role="button">�߰����</a>
				</div>
			</div>
		</form>
	</div>

		<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">��ǰ�� <imgsrc ="/images/ct_icon_red.gif" width="3"
							height="3" align="absmiddle"></td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="105"><%=productVO.getProdName() %></td>
								<td width="105">${product.prodName}</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">��ǰ������ <img src="/images/ct_icon_red.gif" width="3"
						height="3" align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${product.prodDetail}</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">�������� <img src="/images/ct_icon_red.gif" width="3"
						height="3" align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${product.manuDate }</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">���� <img src="/images/ct_icon_red.gif" width="3"
						height="3" align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${product.price }&nbsp;��</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">��ǰ�̹���</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01"><c:forEach var="fileName" items="${product.fileList}">
							<img src="/images/uploadFiles/${fileName }" height="200" align="absmiddle" />
							<br />
						</c:forEach></td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">��� ����</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${product.prodQuantity}&nbsp;��</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
				<tr>
					<td width="53%"></td>
					<td align="right">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
									<!-- <a
								href="/product/listProduct/manage">Ȯ��</a></td> --> Ȯ��
								<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
								<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
									<!-- <a
								href="../product/addProductView.jsp;">�߰����</a> --> �߰����
								</td>
								<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table> --%>
</body>
</html>
<script type="text/javascript">
	/* function fncAddProduct() {
		//Form ��ȿ�� ����
		var name = document.detailForm.prodName.value;
		var detail = document.detailForm.prodDetail.value;
		var manuDate = document.detailForm.manuDate.value;
		var price = document.detailForm.price.value;

		if (name == null || name.length < 1) {
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		document.detailForm.action = '/product/addProduct';
		document.detailForm.submit();
	} */

	function resetData() {
		document.detailForm.reset();
	}

	$(function() {
		$("a[href='#']:contains('Ȯ��')").on("click", function() {
			self.location = "/product/listProduct/manage";
		})

		$("a[href='#']:contains('�߰����')").on("click", function() {
			self.location = "../product/addProductView.jsp";
		})

		//$("form").attr("method","post").attr("action","/product/addProduct").attr("enctype","multipart/form-data");
	});
</script>
