<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%
Product productVO = (Product) request.getAttribute("productVO");
%> --%>

<html>
<head>
<meta charset="euc-kr" />
<title>��ǰ������ȸ</title>
<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
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
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<style>
body {
	padding-top: 50px;
}
</style>
</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<div class="container">

		<div class="page-header">
			<h3 class=" text-info">��ǰ����ȸ</h3>
			<h5 class="text-muted">
				��ǰ�� <strong class="text-danger">���� ����</strong>���� Ȯ���� �ּ���.
			</h5>
		</div>

		<!-- <table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="15" height="37"><img src="/images/ct_ttl_img01.gif" width="15" height="37"></td>
			<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">��ǰ����ȸ</td>
						<td width="20%" align="right">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37"><img src="/images/ct_ttl_img03.gif" width="12" height="37" /></td>
		</tr>
	</table> -->
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��ǰ��ȣ</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodNo }</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>��ǰ��</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodName }</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>��ǰ�̹��� </strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<c:forEach var="fileName" items="${product.fileList}">
					<img src="/images/uploadFiles/${fileName}" height="200" align="absmiddle" />
					<br/>
				</c:forEach>
			</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>��ǰ������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${ !empty product.prodDetail ? product.prodDetail : ''}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>�з�</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<c:forEach var="category" items="${listCategory }">
					${product.ctgrNo==category.categoryNo ? category.categoryName : "" }
				</c:forEach>
			</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.manuDate }</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>����</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.price }&nbsp; ��</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>�������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.regDate }</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>��� ����</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodQuantity}&nbsp;��</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-md-12 text-center ">
				<c:if test="${product.prodQuantity!=null && product.prodQuantity!=0 && menu!='manage_search'}">
					<button type="button" class="btn btn-primary">��ٱ��� �߰�</button>
					<button type="button" class="btn btn-primary">����</button>
				</c:if>
				<button type="button" class="btn btn-primary">����</button>
			</div>
		</div>

	</div><!-- end of <div class="container"> -->

	<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3"
				height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="105">${product.prodNo }</td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<tr>
			<td width="104" class="ct_write">��ǰ�� <img src="/images/ct_icon_red.gif" width="3" height="3"
				align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${product.prodName }</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">��ǰ�̹��� <img src="/images/ct_icon_red.gif" width="3"
				height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><c:forEach var="fileName" items="${product.fileList}">
					<img src="/images/uploadFiles/${fileName}" height="200" align="absmiddle" />
				</c:forEach></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">��ǰ������ <img src="/images/ct_icon_red.gif" width="3"
				height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${product.prodDetail }</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">��������</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${product.manuDate }</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">����</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${product.price }</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">�������</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${product.regDate }</td>
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

						<c:if test="${product.prodQuantity!=null && product.prodQuantity!=0 && menu!='manage_search'}">
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
								<!-- <a
									href="/basket/addBasket/${product.prodNo }">��ٱ��� �߰�</a> --> ��ٱ��� �߰�
							</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							<td width="30"></td>

							<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
								<!-- <a
									href="/purchase/addPurchase/${product.prodNo }">����</a> -->����
							</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							<td width="30"></td>
						</c:if>

						<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
							<!-- <a
							href="javascript:history.go(-1)">����</a> -->����
						</td>
						<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table> --%>

</body>
</html>
<script type="text/javascript">
	$(function() {
		/* $("td.ct_btn01").mouseenter(function() {
			$(this).css("font-size", "20px");
		}).mouseleave(function() {
			$(this).css("font-size", $("body").css("font-size"));
		}) */

		//"cursor","pointer"
		$("button").hover(function() {
			$(this).css("transform", "scale(1.2)");
		}).mouseleave(function() {
			$(this).css("transform", "scale(1)");
		})
		$("button:contains('��ٱ��� �߰�')").on("click", function() {
			//alert($("td.ct_btn01:contains('���')").html());
			//alert("��ٱ��� �߰�");
			self.location.replace("/basket/addBasket/${product.prodNo}");
		})
		$("button:contains('����')").on("click", function() {
			//alert($("td.ct_btn01:contains('���')").html());
			self.location = "/purchase/addPurchase/${product.prodNo }";
		})
		$("button:contains('����')").on("click", function() {
			//alert($("td.ct_btn01:contains('���')").html());
			history.go(-1);
		})
	});
</script>