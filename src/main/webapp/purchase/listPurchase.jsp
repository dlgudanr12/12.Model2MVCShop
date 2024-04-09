<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>���� �����ȸ</title>

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

		<form name="detailForm">
			<div class="page-header text-info">
				<h3>���� �����ȸ</h3>
			</div>
			<input class="currentPage" type="hidden" value="${resultPage.currentPage }" /> ��ü
			${resultPage.maxPage } �Ǽ�, ���� ${resultPage.currentPage } ������
			
				<input type="hidden" id="currentPage" name="currentPage" value="" />
			<jsp:include page="../common/pageNavigatorDefault.jsp" />
			<!--  ������ Navigator �� -->
			<table class="table table-hover table-striped">
				<thead>
					<tr align="left">
						<td align="center">No</td>
						<td>��۹�ȣ</td>
						<td>ȸ��ID</td>
						<td>ȸ����</td>
						<td>��ǰ��</td>
						<td>��ǰ����</td>
						<td>��ȭ��ȣ</td>
						<td>�����Ȳ</td>
						<td>��������</td>
					</tr>
				</thead>

				<tbody>
					<c:set var="i" value="0" />
					<c:forEach var="purchase" items="${list }">
						<c:set var="i" value="${i+1 }" />
						<tr class="ct_list_pop" align="left">
							<td align="center">${i }</td>
							<td><%-- <a href="/purchase/getPurchase/${purchase.tranNo }/search">${purchase.tranNo }</a> --%>
								${purchase.tranNo }
							</td>
							<td>${purchase.buyer.userId }</td>
							<td>${purchase.receiverName }</td>
							<td>${purchase.purchaseProd.prodName }</td>
							<td>${purchase.tranQuantity }</td>
							<td>${purchase.receiverPhone }</td>
							<td>
								<c:if test="${purchase.tranCode=='1' }">���ſϷ�
									<%-- <a href="/purchase/updatePurchase/${purchase.tranNo }">���� ����</a> --%>
									<span>���� ����</span>
								</c:if> 
								<c:if test="${purchase.tranCode=='2' }">�����</c:if>
								<c:if test="${purchase.tranCode=='3' }">��ۿϷ�</c:if>
							</td>
							<td>
								<input type="hidden" value="${purchase.tranCode }" /> 
								<c:if test="${purchase.tranCode=='2' }">
									<!-- <a href="/purchase/updateTranCode/${purchase.tranNo }/${purchase.tranCode }">
									���ǵ���</a> -->
									���ǵ���
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>

			<input type="hidden" id="currentPage" name="currentPage" value="" />
			<jsp:include page="../common/pageNavigatorDefault.jsp" />
			<!--  ������ Navigator �� -->
			
			<input class="maxPage" type="hidden" value=" ${resultPage.maxPage}" />
			<input class="pageSize" type="hidden" value=" ${resultPage.pageSize}" />
			<input class="userId" type="hidden" value=" ${sessionScope.user.userId}" />
		</form>

	</div><!-- <div class="container"> -->

</body>
</html>

<script type="text/javascript">
	function fncGetList(currentPage) {
		/* 
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit(); */
		$('#currentPage').val(currentPage)
		$("form").attr("method", "post").attr("action",
				"/purchase/listPurchase").submit();
	}
	
	function fncLink(){
		$('tr.ct_list_pop').each(function(index) {
			
			$("tr.ct_list_pop:nth-child(" + (index + 1)+ ") td:contains('���ǵ���')").click(function() {
								var tranNo = $(
										"tr.ct_list_pop:nth-child("
												+ (index + 1)
												+ ") td:nth-child(2)").text()
										.trim();
								var tranCode = $(
										"tr.ct_list_pop:nth-child("
												+ (index + 1)
												+ ") td:last input").val();
								//alert(tranNo + "/" + tranCode);
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
														+ ") td:last").empty();
										$(
												"tr.ct_list_pop:nth-child("
														+ (index + 1)
														+ ") td:nth-child(8)")
												.text("��ۿϷ�");
									}
								})
							})/* end of ���ǵ��� link  */
							
							$("tr.ct_list_pop:nth-child(" + (index + 1)+ ") td span:contains('���� ����')").click(function() {
								self.location="/purchase/updatePurchase/"+$( "tr.ct_list_pop:nth-child(" + (index + 1)+ ") td:nth-child(2)" ).text();
							})	/* end of ���� ���� link  */
							
							$("tr.ct_list_pop:nth-child(" + (index + 1)+ ") td:nth-child(2)").click(function() {
								self.location="/purchase/getPurchase/"+$( "tr.ct_list_pop:nth-child(" + (index + 1)+ ") td:nth-child(2)" ).text()+"/search";
							})	/* end of ���� ���� Ȯ�� link  */
							
							
								$("tr.ct_list_pop:nth-child(" + (index + 1) + ") td span:contains('���� ����')")
								.css("color","blue")
								.mouseenter(function() {
											$(this).css("color", "red");
								}).mouseleave(function() {
									$(this).css("color", "blue");
								})
								
								$("tr.ct_list_pop:nth-child(" + (index + 1) + ") td:nth-child(2)")
								.css("color","blue")
								.mouseenter(function() {
											$(this).css("color", "red");
								}).mouseleave(function() {
									$(this).css("color", "blue");
								})
				})/*end of each*/
	}
	var maxPage = $("input.maxPage").val();
	var pageSize = $("input.pageSize").val();
	var currentPage = $("input.currentPage").val();
	var userId=$("input.userId").val().trim();
	console.log("currentPage : " + currentPage );
	let j = 0;
	function fncScrollEvent() {
		++currentPage;
		console.log(currentPage);
		$
				.ajax(
						"/purchaseRest/json/listPurchase",
						{
							method : "POST",
							dataType : "json",
							headers : {
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								currentPage : currentPage,
								userId : userId
							}),
							success : function(JSONData, status) {
								++j;
								let i = j*pageSize;
								var textPop2="";
								$.each(JSONData.list,function(index, purchase) {
										// ���⼭ index�� �迭�� �ε����̰�, item�� �� ��Ҹ� ��Ÿ���ϴ�
										++i;
										console.log("Index: "+ index+ ", Item: "+ JSON.stringify(purchase));
										var tranCodeText = "";
										var trabCodeText2 = "";
										if (purchase.tranCode == 1 ) {
											tranCodeText = "���ſϷ� <span>���� ����</span>";
										} else if(purchase.tranCode == 2 ){
											tranCodeText = "�����";
										} else if(purchase.tranCode == 3 ){
											tranCodeText = "��ۿϷ�";
										}else{
											tranCodeText = "";
										}
										
										if(purchase.tranCode == 2 ){
											tranCodeText2 = "���ǵ���";
										}else{
											tranCodeText2 = "";
										}
										var receiverPhone=(purchase.receiverPhone != null) ? purchase.receiverPhone : "";
													var textPop = "<tr class='ct_list_pop' align='left'>"
													+"<td align='center'>"+i+"</td>"
													+"<td>"+purchase.tranNo+"</td>"
													+"<td>"+purchase.buyer.userId+"</td>"
													+"<td>"+purchase.receiverName+"</td>"
													+"<td>"+purchase.purchaseProd.prodName+"</td>"
													+"<td>"+purchase.tranQuantity+"</td>"
													+"<td>"+receiverPhone+"</td>"
													+"<td>"+tranCodeText+"</td>"
													+"<td><input type='hidden' value='"+purchase.tranCode+"' />"+tranCodeText2+"</td>"
													+"</tr>";
													
													textPop2 += textPop;
												});
								$("tr.ct_list_pop:last").after(textPop2);
								fncLink();
							}
						})/* end of '$.ajax' */
	}
	
	$(function() {
		fncLink();
		
		var currentPageInt=parseInt(currentPage);
		var maxPageInt=parseInt(maxPage);
		var last = document.body.scrollHeight - window.innerHeight;
		if (currentPageInt < maxPageInt) {
			fncScrollEvent();
			fncScrollEvent();
			fncScrollEvent();
			fncScrollEvent();
			fncScrollEvent();
			fncScrollEvent();

			$(window).scroll(function() {
				if ($(window).scrollTop() == last) {
					fncScrollEvent();

					window.scrollTo(0, last);//window.scrollTo(x��,y��);
				}/* end of 'if ( $(window).scrollTop() == last) ' */
				last = document.body.scrollHeight - window.innerHeight;//document.body.scrollHeight : body�� ��ũ�� �� ����, window.innerHeight : â ���� ����
			})/* end of '$(window).scroll(function()' */

		} /* end of 'if (currentPage <= maxPage)' */
	});
			
	/* const currentPage="${resultPage.currentPage}";
	var userId="${user.userId}";
		alert(currentPage+"/"+userId) 
	 $.ajax("/purchaseRest/json/listPurchase",{
	method : "POST",
	dataType : "text",
	headers : {
		"Content-Type" : "application/json"
	},
	data : JSON.stringify({
	currentPage : currentPage,
	userId : userId
	}),
	success : function(serverData,status){
	alert(status+"\n server�� ���� ���� ���� : " + serverData);
	var JSONData=$.parseJSON(serverData);
	alert("JSONData : \n" + JSONData);
	}
	}) 

	 $.ajax("/purchaseRest/json/listPurchase",{
		method : "POST",
	data : JSON.stringify({
		currentPage : currentPage,
		userId : userId
	}),
	dataType : "json",
	headers : {
		"Content-Type" : "application/json"
	},
	success : function(JSONData,status){
		alert("JSONData : \n" + JSONData);
		var serverData=$.stringify(JSONData);
		alert(status+"\n server�� ���� ���� ���� : " + serverData);
		}
	})

	 $.post("/purchaseRest/json/listPurchase", 
			JSON.stringify({
			currentPage : currentPage,
			userId : userId
		}),
		function(JSONData,status){
			alert("JSONData : \n" + JSONData);
			var serverData=$.stringify(JSONData);
			alert(status+"\n server�� ���� ���� ���� : " + serverData);
		}, "text") // �⺻ ����� ���� ��Ʈ���̴�.
	})
	})
	});*/
</script>