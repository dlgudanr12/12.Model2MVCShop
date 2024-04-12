<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>장바구니</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
body {
	padding-top: 70px;
}
</style>
</head>

<body bgcolor="#ffffff" text="#000000">

<div class="container">

		<form name="detailForm">
			<div class="page-header text-info">
				<h3>장바구니</h3>
			</div>
			<input class="currentPage" type="hidden" value="${resultPage.currentPage }" /> 전체
			${resultPage.maxPage } 건수, 현재 ${resultPage.currentPage } 페이지

	<!-- <div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/basket/listBasket" method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">장바구니</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table> -->
			
			<input type="hidden" id="currentPage" name="currentPage" value="" />
			<jsp:include page="../common/pageNavigatorDefault.jsp" />
			<!--  페이지 Navigator 끝 -->
			<table class="table table-hover table-striped">
				<thead>
					<tr align="left">
						<td align="center">No</td>
						<td>상품 명</td>
						<td>상품 수량</td>
						<td>상품 가격</td>
						<td>삭제</td>
					</tr>
				</thead>

			<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">전체 ${resultPage.maxPage } 건수, 현재
						${resultPage.currentPage } 페이지</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="30">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" >상품 명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="80">상품 수량</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="80">변경</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="80">삭제</td>
					<td class="ct_line02"></td>
				</tr>
				<tr>
					<td colspan="17" bgcolor="808285" height="1"></td>
				</tr> --%>
				
				<tbody>
					<c:set var="i" value="0" />
					<c:forEach var="basket" items="${list }">
						<c:set var="i" value="${i+1 }" />
						<tr class="ct_list_pop" align="left">
							<td align="center"><input type="hidden" value="${basket.basketNo }">${i }</td>
							<td><a href="/product/getProduct/${basket.prodNo }/search">
							${basket.basketProd.prodName}</a></td>
							<td><span>◀ </span>
							<input name="basketQuantity" value=" ${basket.basketQuantity }" style="width:30px;" readonly="readonly"/>
							<span> ▶</span></td>
							<td><span>${basket.basketQuantity }</span> * <span>${basket.basketProd.price }</span> = <span>${basket.basketQuantity*basket.basketProd.price }</span></td>
							<td><a href="/basket/removeBasket/${basket.basketNo }"> 삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
				
				<div class="row">
					<div class="col-md-12 text-center ">
					<button type="button" class="btn btn-primary">일괄구매</button>
					<button type="button" class="btn btn-primary">일괄삭제</button>
					</div>
				</div>

				<%-- <c:set var="i" value="0" />
				<c:forEach var="basket" items="${list }">
					<c:set var="i" value="${i+1 }" />
					<tr class="ct_list_pop">
						<td align="center">${i }</td>
						<td></td>
						<td align="left"><a
							href="/product/getProduct/${basket.prodNo }/search"> ${basket.basketProd.prodName}</a>
						</td>
						<td></td>
						<td align="left">${basket.basketQuantity }</td>
						<td></td>
						<td align="left"><a href="/">미정</a>
						</td>
						<td></td>
						<td align="left"><a href="/basket/removeBasket/${basket.basketNo }"> 삭제</a>
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="17" bgcolor="D6D7D6" height="1"></td>
					</tr>
				</c:forEach>
			</table> --%>

			<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage"
						name="currentPage" value="" />
						<jsp:include page="../common/pageNavigatorDefault.jsp"/>
					</td>
				</tr>
			</table> --%>
			<!--  페이지 Navigator 끝 -->
			
		</form>

	</div>

</body>
</html>
<script type="text/javascript">
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
	
	$("button:contains('일괄구매')").on("click", function() {
		self.location = "/basket/purchaseBasketList";
	})
	
	$("button:contains('일괄삭제')").on("click", function() {
		self.location.replace("/basket/removeBasketList");
	})
	
	$(function(){
		$.each($("tr.ct_list_pop"),function(index){
			let indexNo=1;
			let inputValue=$("tr.ct_list_pop:nth-child("+(index+indexNo)+") td:nth-child(3) input");
			let basketNo=$("tr.ct_list_pop:nth-child("+(index+indexNo)+") td:nth-child(1) input").val();
			function fncIndex(){
				$("tr.ct_list_pop:nth-child("+(index+indexNo)+") td:nth-child(4) span:nth-child(1)").text(inputValue.val());
				let calc=($("tr.ct_list_pop:nth-child("+(index+indexNo)+") td:nth-child(4) span:nth-child(1)").text().trim()*$("tr.ct_list_pop:nth-child("+(index+indexNo)+") td:nth-child(4) span:nth-child(2)").text().trim());
				$("tr.ct_list_pop:nth-child("+(index+indexNo)+") td:nth-child(4) span:nth-child(3)").text(calc);

				$.ajax("/basketRest/json/updateBasketQuantity/"+basketNo+"/"+inputValue.val(),
						{
							method : "GET",
							dataType : "json",
							headers : {
								"Content-Type" : "application/json"
							},
								success : function(JSONData, status) {}
						})
			}
			
			$("tr.ct_list_pop:nth-child("+(index+indexNo)+") td:nth-child(3) span:contains('◀')").click(function(){
				console.log( "inputValue");
				if(inputValue.val()>1)
					inputValue.val( (inputValue.val()-indexNo) );
				
				fncIndex();
			})
			
			$("tr.ct_list_pop:nth-child("+(index+indexNo)+") td:nth-child(3) span:contains('▶')").click(function(){
				inputValue.val( (parseInt( inputValue.val() )+indexNo) );
				
				fncIndex();
			})
		});
		
	});
</script>