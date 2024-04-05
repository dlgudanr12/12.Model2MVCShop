<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<meta charset="euc-kr" />
<title>��� �����ȸ</title>

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

<style>
body {
	padding-top: 70px;
}
</style>

</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">

		<div class="page-header text-info">
			<h3>��� ����</h3>
		</div>

		<!-- <form name="detailForm" action="/purchase/listDelivery"
			method="post"> -->
		<form name="detailForm" class="form-inline">

			<div class="row">
				<div class="col-md-6 text-left">
					<div class="form-group">
						<p class="text-primary">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage } ������</p>
						<div>
							<%-- �Ǹ� ��<input type="checkbox" name="searchTranCodeOn0" value="0"
								${! empty search.searchTranCodeOn[0]&&search.searchTranCodeOn[0]==0 ? "checked" : "" } /> --%>
							���� �Ϸ�<input type="checkbox" name="searchTranCodeOn1" value="1"
								${! empty search.searchTranCodeOn[1]&&search.searchTranCodeOn[1]==1 ? "checked" : "" } />
							��� ��<input type="checkbox" name="searchTranCodeOn2" value="2"
								${! empty search.searchTranCodeOn[2]&&search.searchTranCodeOn[2]==2 ? "checked" : "" } />
							��� �Ϸ�<input type="checkbox" name="searchTranCodeOn3" value="3"
								${! empty search.searchTranCodeOn[3]&&search.searchTranCodeOn[3]==3 ? "checked" : "" } />
						</div>
					</div>
				</div>

				<div class="col-md-6 text-right">
					<div class="form-group">
						<select name="searchOrderBy" class="form-control" style="width: 130px">
							<option value="0" ${search.searchOrderBy=='0' ? "selected" : "" }>���� ��¥ ��</option>
							<option value="1" ${search.searchOrderBy=='1' ? "selected" : "" }>�����ID ��</option>
							<option value="2" ${search.searchOrderBy=='2'? "selected" : "" }>��ۻ��� ��</option>
						</select> <select name="searchCondition" class="form-control" style="width: 120px">
							<option value="0" ${search.searchCondition=='0' ? "selected" : "" }>�����ID</option>
							<option value="1" ${search.searchCondition=='1' ? "selected" : "" }>������</option>
							<option value="2" ${search.searchCondition=='2' ? "selected" : "" }>��ǰ��ȣ</option>
						</select> <input type="text" name="searchKeyword" value="${search.searchKeyword}" class="form-control"
							style="width: 120px; height: 19px">
						<button type="button" class="btn btn-primary">
							<!-- <a href="javascript:fncGetList('1');">�˻�</a> -->
							�˻�
						</button>
					</div>
				</div>
			</div>
			
			<input type="hidden" id="currentPage" name="currentPage" value="" />
			<jsp:include page="../common/pageNavigatorDefault.jsp" />
			<!--  ������ Navigator �� -->

			<table class="table table-hover table-striped">
				<thead>
					<tr align="left">
						<td align="center">No</td>
						<td>��۹�ȣ</td>
						<td>�����ID</td>
						<td>������</td>
						<td>��ǰ��</td>
						<td>��û��</td>
						<td>��� ���� ��</td>
						<td>�������</td>
						<td>��� ����</td>
					</tr>
				</thead>
				<tbody>
					<c:set var="i" value="0" />
					<c:forEach var="purchase" items="${list}">
						<c:set var="i" value="${i+1 }" />
						<tr class="ct_list_pop">
							<td align="center">${i }</td>
							<td align="left"><a href="/purchase/getPurchase/${purchase.tranNo }/manage">
									${purchase.tranNo }</a></td>
							<td align="left">${purchase.buyer.userId }</td>
							<td align="left">${purchase.receiverName }</td>
							<td align="left"><a href="/product/getProduct/${purchase.purchaseProd.prodNo}/search">${purchase.purchaseProd.prodName }</a>
							</td>
							<td align="left">${purchase.orderDate }</td>
							<td align="left">${purchase.divyDate }</td>
							<td align="left"><input type="hidden" value="${purchase.tranCode }" /> <c:if
									test="${purchase.tranCode!=null}">
									<c:if test="${purchase.tranCode=='1' }">���ſϷ�
										<!--<a href="/purchase/updateTranCode/${purchase.tranNo }/${purchase.tranCode }">����ϱ�</a>-->
										<span>����ϱ�</span>
									</c:if>
									<c:if test="${purchase.tranCode=='2' }">��� ��</c:if>
									<c:if test="${purchase.tranCode=='3' }">��� �Ϸ�</c:if>
								</c:if></td>
							<td align="left">${purchase.tranQuantity}��</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<input type="hidden" id="currentPage" name="currentPage" value="" />
			<jsp:include page="../common/pageNavigatorDefault.jsp" />
			<!--  ������ Navigator �� -->
		</form>
	</div>

</body>
</html>

<script type="text/javascript">
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		//document.detailForm.submit();
		$('#currentPage').val(currentPage)
		$("form").attr("method", "post").attr("action",
				"/purchase/listDelivery").submit();

	}
	
	function fncLink(){
		$('tr.ct_list_pop').each(
				function(index) {
					$(
							"tr.ct_list_pop:nth-child(" + (index + 1)
									+ ") td:contains('����ϱ�') span").mouseenter(
							function() {
								$(this).css("color", "red");
							}).mouseleave(function() {
						$(this).css("color", "blue");
					})
					
					$(
							"tr.ct_list_pop:nth-child(" + (index + 1)
									+ ") td:contains('����ϱ�') span").css(
							"color", "blue").click(
							function() {
								var tranNo = $(
										"tr.ct_list_pop:nth-child("
												+ (index + 1)
												+ ") td:nth-child(2)").text()
										.trim();
								var tranCode = $(
										"tr.ct_list_pop:nth-child("
												+ (index + 1)
												+ ") td:nth-child(8) input")
										.val();
								alert(tranNo + "/" + tranCode);
								$.ajax("/purchaseRest/json/updateTranCode/"
										+ tranNo + "/" + tranCode, {
									method : "GET",
									dataType : "json",
									headers : {
										"Content-Type" : "application/json"
									},
									success : function(JSONData, status) {
										//alert(JSONData.success);
										$(
												"tr.ct_list_pop:nth-child("
														+ (index + 1)
														+ ") td:nth-child(8)")
												.text("��� ��");
									}
								})
							})
				})
	}
	
	$(function() {
		$("button:contains('�˻�')").click(function() {
			fncGetList('1');
		})
		 fncLink();
	});
</script>


