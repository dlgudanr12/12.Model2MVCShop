<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>
<head>

<title>�������� ����</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
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
<!-- <script type="text/javascript" src="../javascript/calendar.js"></script> -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<style>
body {
	padding-top: 50px;
}
</style>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div class="container">
		<div class="page-header">
			<h3 class=" text-info">�������� ����</h3>
		</div>
	<form name="detailForm">
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��ǰ��</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodName }</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�����ھ��̵� </strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId }
				<input type="hidden" name="buyerId" 
				class="form-control" value="${purchase.buyer.userId }">
			</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>���Ź��</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<select name="paymentOption"
					class="form-control"  >
					<option value="1" ${purchase.paymentOption=='1' ? "selected" : "" }>���ݱ���</option>
					<option value="2" ${purchase.paymentOption=='2' ? "selected" : "" }>�ſ뱸��</option>
				</select>
			</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�������̸� </strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<input type="text" name="receiverName"
				class="form-control" value="${purchase.receiverName }">
			</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>������ ����ó</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<input type="text" name="receiverPhone"
				class="form-control" value="${purchase.receiverPhone }" >
			</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�������ּ�</strong>
			</div>
			<div class="col-xs-8 col-md-4">
					<input type="hidden" class="form-control" id="divyAddr-reading" name="divyAddr-reading"
					value="${purchase.divyAddr }"  placeholder="�������ּ�">
					<jsp:include page="/homeAddress.jsp"/>
				<input type="hidden" id="divyAddr" name="divyAddr"
				class="form-control" value="" >
			</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>���ſ�û����</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<input type="text" name="divyRequest"
				class="form-control" value="${purchase.divyRequest }" >
			</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>����������</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<input type="text" id="divyDate"  name="divyDate" readonly
				class="form-control" value="${purchase.divyDate}" />
				<!-- <img class="show_calendar"/> -->
				<%-- ���� ��� ���� �� &nbsp; ${purchase.divyDate} --%>
			</div>
		</div>

		<hr />
	
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>���� ����</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<input type="text" name="tranQuantity"
				class="form-control" value="${purchase.tranQuantity}" />
			</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-primary">����</button>
				<button type="button" class="btn btn-primary">���</button>
			</div>
		</div>
		<input type="hidden" name="tranNo" value="${purchase.tranNo }">
	</form>

	</div><!-- end of <div class="container"> -->

	<%-- 
		<table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37" /></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">������������</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table>

		<table width="600" border="0" cellspacing="0" cellpadding="0"
			align="center" style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">�����ھ��̵�</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${purchase.buyer.userId }</td>
				<input type="hidden" name="buyerId"
					value="${purchase.buyer.userId }">
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">���Ź��</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><select name="paymentOption"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20">
						<option value="1"
							${purchase.paymentOption=='1' ? "selected" : "" }>���ݱ���</option>
						<option value="2"
							${purchase.paymentOption=='2' ? "selected" : "" }>�ſ뱸��</option>
				</select></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">�������̸�</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="receiverName"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" value="${purchase.receiverName }" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">������ ����ó</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="receiverPhone"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" value="${purchase.receiverPhone }" /></td>
			</tr>

			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">�������ּ�</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="divyAddr"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" value="${purchase.divyAddr }" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">���ſ�û����</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="divyRequest"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" value="${purchase.divyRequest }" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">����������</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td width="200" class="ct_write01"><input type="text"
					readonly="readonly" name="divyDate" class="ct_input_g"
					style="width: 100px; height: 19px" maxLength="20" /> 
					<img class="show_calendar"/>
					���� ��� ���� �� &nbsp; ${purchase.divyDate}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">���� ����</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="tranQuantity"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" value="${purchase.tranQuantity}" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;"><!-- <input type="submit" /> -->����
							</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
							<td width="30"></td>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;"><!-- <a
								href="javascript:history.go(-1)">���</a> -->���</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table> --%>

</body>
<script type="text/javascript">

parseAddress();
	$(function() {
		$("button:contains('����')").on(
				"click",
				function() {
					submitAddress();
					$("form").attr("method", "post").attr("action",
							"/purchase/updatePurchase").submit();
				})

		$("button:contains('���')").on("click", function() {
			history.go(-1);
		})

		/* $("img.show_calendar").attr("src", "/images/ct_icon_date.gif").attr(
				"width", "20").attr("height", "20").on(
				"click",
				function() {
					show_calendar('document.detailForm.divyDate',
							document.detailForm.divyDate.value);
				}) */
				$("#divyDate").datepicker({
					dateFormat :"yy-mm-dd"
				});
	});
</script>
</html>