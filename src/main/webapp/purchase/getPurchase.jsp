<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>���Ż���ȸ</title>

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
<!-- ���� ���� -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75b183fa243a51103c4118dea097b60e"></script>

<style>
body {
	padding-top: 50px;
}
</style>
</head>
<body bgcolor="#ffffff" text="#000000">
	<div class="container">
	
		<div class="page-header">
			<h3 class=" text-info">���Ż���ȸ</h3>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��ǰ ��</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodName}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�����ھ��̵�</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId }</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>���Ź��</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<c:if test="${purchase.paymentOption==1}"><strong>���ݱ���</strong></c:if>
				<c:if test="${purchase.paymentOption==2}"><strong>�ſ뱸��</strong></c:if>
			</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�������̸�</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName }</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�����ڿ���ó</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone }</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�������ּ�</strong>
			</div>
			<div id="divyAddr" class="col-xs-8 col-md-4" >${purchase.divyAddr }</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>���ſ�û����</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest }</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate }</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�ֹ���</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate }</div>
		</div>

		<hr />
		
		������ �ּ� ��ġ
		<div id="map" style="width:100%;height:400px;"></div>

		<hr />

		<div class="row">
			<div class="col-md-12 text-center ">
				<c:if test="${menu=='search'}">
					<button type="button" class="btn btn-primary">����</button>
				</c:if>
				<button type="button" class="btn btn-primary">Ȯ��</button>
			</div>
		</div>

	</div><!-- end of <div class="container"> -->
		
	<%-- <table width="100%" height="37" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
				width="15" height="37" /></td>
			<td background="/images/ct_ttl_img02.gif" width="100%"
				style="padding-left: 10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">���Ż���ȸ</td>
						<td width="20%" align="right">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
				width="12" height="37" /></td>
		</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 13px;">
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">��ǰ��ȣ <img
				src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="105">${purchase.purchaseProd.prodNo }</td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">�����ھ��̵� <img
				src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${purchase.buyer.userId }</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<tr>
			<td width="104" class="ct_write">���Ź��</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><c:if
					test="${purchase.paymentOption==1 }">���ݱ���</c:if> <c:if
					test="${purchase.paymentOption==2 }">�ſ뱸��</c:if></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">�������̸�</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${purchase.receiverName }</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">�����ڿ���ó</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${purchase.receiverPhone }</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">�������ּ�</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${purchase.divyAddr }</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">���ſ�û����</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${purchase.divyRequest }</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">��������</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${purchase.divyDate }</td>
		</tr>

		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<tr>
			<td width="104" class="ct_write">�ֹ���</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${purchase.orderDate }</td>
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

						<c:if test="${menu=='search'}">
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;"><!-- <a
								href="/purchase/updatePurchase/${purchase.tranNo }">����</a> -->
								����</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
						</c:if>

						<td width="30"></td>

						<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
							width="17" height="23" /></td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01"
							style="padding-top: 3px;"><!-- <a
							href="javascript:history.go(-1);">Ȯ��</a> -->
							Ȯ��</td>
						<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
							width="14" height="23" /></td>

					</tr>
				</table>
			</td>
		</tr>
	</table> --%>

</body>
</html>
<script type="text/javascript">
	$(function() {
		$("button:contains('����')").on("click", function() {
			//alert($("td.ct_btn01:contains('���')").html());
			self.location = "/purchase/updatePurchase/${purchase.tranNo }";
		})
		$("button:contains('Ȯ��')").on("click", function() {
			self.location ="/purchase/listPurchase";
			//alert($("td.ct_btn01:contains('���')").html());
			/* history.go(-1); */
		})
		
		
		let divyAddr=$("#divyAddr").text().trim();
		let divyAddrArr=divyAddr.split('/');
		let divyAddrArr2=divyAddrArr[0].split('(');
		let encodeDivyAddr = encodeURI(divyAddrArr2[0].trim());
		console.log("encodeDivyAddr : "+encodeDivyAddr);
		$.ajax( "https://dapi.kakao.com/v2/local/search/address.json?query="+encodeDivyAddr,
			{
			method : "GET",
			dataType : "json",
			headers : {
				"Authorization" : "KakaoAK 74a9c1aa9918735e1473d2fbaa8faaed",
				"content-type" : "application/json;charset=UTF-8"
			},
			success : function(JSONData, status) {
				console.log(JSONData);
				console.log(JSONData.documents[0].y+"/"+JSONData.documents[0].x);
				/* $("#map").append("<br/>"+JSONData.documents[0].x+"/"+JSONData.documents[0].y); */
				let x=JSONData.documents[0].x;
				let y=JSONData.documents[0].y;
				console.log(y+"/"+x);
				let marker={
						position: new kakao.maps.LatLng(y,x),
						text: '��� �ּ�'
				};
				let container=document.getElementById('map');
				let options={
						center:new kakao.maps.LatLng(y,x),
						level: 3,
						marker:marker
					};
				/* let map=new kakao.maps.Map(container,options); */
				let staticMap = new kakao.maps.StaticMap(container, options);
				
				/* let marker = new kakao.maps.Marker();
				kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);
				function displayMarker() {
				    
				    // ��Ŀ�� ��ġ�� �����߽����� �����մϴ� 
				    marker.setPosition(map.getCenter()); 
				    marker.setMap(map); 

				    // �Ʒ� �ڵ�� ���� �ѹ��� Ÿ�Ϸε� �̺�Ʈ�� �߻����� �� � ó���� �ϰ� 
				    // ������ ��ϵ� Ÿ�Ϸε� �̺�Ʈ�� �����ϴ� �ڵ��Դϴ� 
				    // kakao.maps.event.removeListener(map, 'tilesloaded', displayMarker);
				} */
			}
			
		})
	});
</script>