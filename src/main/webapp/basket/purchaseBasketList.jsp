<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>일괄 구매 완료</title>

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
<!-- <script type="text/javascript" src="/javascript/calendar.js"></script> -->

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
		<h1 class="bg-primary text-center">일괄 구매 완료</h1>
		<form name="detailForm" class="form-horizontal">
		
		<c:set var="i" value="0" />
			<c:forEach var="basket" items="${list }">
				<c:set var="i" value="${i+1 }" />
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${basket.prodNo }</strong>
					<input type="hidden" name="prodNo" value="${basket.prodNo }" />
					</span>
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">${i}.상품명 </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${basket.basketProd.prodName }</strong>
					</span>
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">상품 수량 </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> 
						<strong>${basket.basketQuantity }&nbsp; 개</strong>
					</span>
				</div>
			</div>
		
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">가격 </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${basket.basketProd.price }&nbsp;원</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">총 가격 </label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block"> <strong>${basket.basketQuantity*basket.basketProd.price }&nbsp;원</strong>
					</span>
				</div>
			</div>
			
			</c:forEach>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
				<div class="col-sm-4">
				<span id="helpBlock" class="help-block"> 
					<strong>${purchase.buyer.userId }</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
				<div class="col-sm-4">
					<c:if test="${purchase.paymentOption==1}"><strong>현금구매</strong></c:if>
					<c:if test="${purchase.paymentOption==2}"><strong>신용구매</strong></c:if>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
				<div class="col-sm-4">
					<strong>${purchase.receiverName }</strong>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
				<div class="col-sm-4">
					<strong>${purchase.receiverPhone }</strong>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
				<div class="col-sm-4">
					<strong>${purchase.divyAddr }</strong>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
				<div class="col-sm-4">
					<strong>${purchase.divyRequest }</strong>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
				<div class="col-sm-4">
					<strong>${purchase.divyDate }</strong>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >확인</button>
					<button type="button" class="btn btn-primary"  >이전</button>
				</div>
			</div>
	</form>
</div>
			
</body>
</html>
<script type="text/javascript">
	$(function() {
		$("button:contains('확인')").on(
				"click",
				function() {
					self.location="/purchase/listPurchase";
				})

		$("button:contains('이전')").on("click", function() {
			history.go(-1);
		})
	});
</script>