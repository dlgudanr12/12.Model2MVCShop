<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>일괄 구매</title>

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
		<h1 class="bg-primary text-center">일괄 구매</h1>
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
						<input type="hidden" name="tranQuantity" value="${basket.basketQuantity }" />
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
					<strong>${list[0].userId }</strong>
					</span>
					<input type="hidden" class="form-control" id="buyerId" name="buyerId" 
					value="${user.userId }" placeholder="구매자아이디">
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
				<div class="col-sm-4">
					<select id="paymentOption" name="paymentOption">
						<option value="1" selected>현금구매</option>
						<option value="2">신용구매</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverName" name="receiverName" 
					value="${user.userName }" placeholder="구매자이름">
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverPhone" name="receiverPhone"
					value="${user.phone }"  placeholder="구매자연락처">
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
				<div class="col-sm-4">
					<input type="hidden" class="form-control" id="divyAddr-reading"name="divyAddr-reading"
					value="${user.addr }"  placeholder="구매자주소">
					<jsp:include page="/homeAddress.jsp"/>
					<input type="hidden" class="form-control" id="divyAddr" name="divyAddr"
					value=""  placeholder="구매자주소">
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverRequest"name="receiverRequest"
					 placeholder="구매요청사항">
				</div>
			</div>
			
			<div class="form-group">
				<label for="text"  class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="divyDate" name="divyDate" 
					placeholder="배송희망일자" readonly="readonly">
					<img class="show_calendar" /> 
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >일괄구매</button>
					<button type="button" class="btn btn-primary"  >취소</button>
				</div>
			</div>
	</form>
</div>
			
</body>
</html>
<script type="text/javascript">
	 parseAddress();/* end of 주소 초기화 of "/homeAddress.jsp"*/
	$(function() {
		$("button:contains('일괄구매')").on(
				"click",
				function() {
					submitAddress();
					$("form").attr("method", "post").attr("action",
							"/basket/purchaseBasketList").submit();
				})

		$("button:contains('취소')").on("click", function() {
			$("form").eq(0).get(0).reset();
			parseAddress();
		})
		
		$("#divyDate").datepicker({
			dateFormat :"yy-mm-dd"
		});
	});
</script>