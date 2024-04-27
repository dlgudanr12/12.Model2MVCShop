<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%
List<Product> list = (List<Product>) request.getAttribute("list");
Page resultPage = (Page) request.getAttribute("resultPage");
Search search = (Search) request.getAttribute("search");

String searchCondition = CommonUtil.null2str(search.getSearchCondition());
String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%> --%>

<html>
<head>
<meta charset="euc-kr" />
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<style>
	body {
		padding-top: 70px;
    overflow-x: hidden;
	}

	div.panel-body div{
 		font-size: 16px;
	}
</style>

</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp" />

	<!-- <form name="detailForm" action="/product/listProduct/${menu }" method="post"> -->
	<form name="detailForm" class="form-inline">
		<div class="container ">

			<div class="page-header text-info">
				<h3>��ǰ ����</h3>
			</div>
			
			<div class="row">
				<div class="col-md-6 text-left">
					<p class="text-primary">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage } ������</p>
				</div>
			</div>
			
			<div class="row">
			
				<div class="col-md-6 text-left">
					<select name="searchCategory" class="form-control" style="width: 140px">
					<option value="0" ${search.searchCategory=='0' ? "selected" : "" }>��ü</option>
					<c:forEach var="category" items="${listCategory }">
						<option value="${category.categoryNo }" ${search.searchCategory==category.categoryNo ? "selected" : "" }>${category.categoryName }</option>
					</c:forEach>
					</select>
					<c:if test="${menu=='manage' }">
					<a href="#" id="addCategory" class="btn btn-default btn-lg">ī�װ� �߰�</a>
					<a href="#" id="updateCategory" class="btn btn-default btn-lg">����</a>
					</c:if>
				</div>

				<div class="col-md-6 text-right">
					<div class="form-group">
						<span>ã�� ���� ���� ���� ����</span><input type="text" name="searchPriceLowerLimit"
							value="${search.searchPriceLowerLimit}" class="form-control"
							style="width: 100px; height: 30px"> ~ <input type="text" name="searchPriceUpperLimit"
							value="${search.searchPriceUpperLimit}" class="form-control"
							style="width: 100px; height: 30px">
					</div>
					<div class="form-group">
						<select name="searchOrderBy" class="form-control" style="width: 140px">
							<option value="0" ${search.searchOrderBy=='0' ? "selected" : "" }>��ǰ��ȣ ��</option>
							<option value="1" ${search.searchOrderBy=='1' ? "selected" : "" }>���� ���� ��</option>
							<option value="2" ${search.searchOrderBy=='2'? "selected" : "" }>���� ���� ��</option>
						</select>
						<!-- <button type="button" name="searchOrderBy1" class="btn btn-primary">���� ���� ��</button>
						<input type="hidden" class="searchOrderBy" name="searchOrderBy" /> -->
						<select name="searchCondition" class="form-control" style="width: 120px">
							<option value="0" ${search.searchCondition=='0' ? "selected" : "" }>��ǰ��ȣ</option>
							<option value="1" ${search.searchCondition=='1' ? "selected" : "" }>��ǰ��</option>
							<option value="2" ${search.searchCondition=='2'? "selected" : "" }>��ǰ����</option>
						</select> <input type="text" name="searchKeyword" value="${search.searchKeyword}" class="form-control"
							style="width: 120px; height: 30px">
						<!-- <a href="javascript:fncGetList('1');"></a>  -->
						<button type="button" class="btn btn-primary">�˻�</button>
					</div>
				</div>
			</div>

			<input type="hidden" id="currentPage" name="currentPage" value="" />
			<jsp:include page="../common/pageNavigatorDefault.jsp" />
			<!--  ������ Navigator �� -->


			<%-- <table class="table table-striped" style="margin-top: 10px;">

				<thead>
					<tr align="left">
						<td align="center">No</td>
						<td>��ǰ��</td>
						<td>�̹���</td>
						<td>����</td>
						<td>�����</td>
						<td>�������</td>
						<td>��� ����</td>
					</tr>
				</thead>

				<tbody>
					<c:set var="i" value="0" />
					<c:forEach var="product" items="${list}">
						<c:set var="i" value="${i+1 }" />
						<tr class="ct_list_pop">
							<td align="center" height="200">${i }</td>
							<td align="left"><input value="${product.prodNo}" type="hidden" /> ${product.prodName }</td>
							<td align="left"><a href="#" class="thumbnail">
									<img src="/images/uploadFiles/${product.fileList[0]}">
							</a></td>
							<td align="left">${product.price }</td>
							<td align="left">${product.regDate }</td>
							<td align="left"><c:if test="${ product.prodQuantity!=0}"> �Ǹ� �� </c:if> <c:if
									test="${ product.prodQuantity==0}"> ��� ���� </c:if></td>
							<td align="left">${product.prodQuantity}��</td>
						</tr>
					</c:forEach>
				</tbody> 
			</table>--%>
			<!-- <div class="page-header"></div> -->
						<div class="row" id="ct_list_pop">
							<c:set var="i" value="0" />
							<c:forEach var="product" items="${list}">
								<c:set var="i" value="${i+1 }" />
								<div class="col-md-4 col-xs-12">
									<!-- <div class="panel panel-primary"> -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="panel-title">${i }.
												<input class="ct_prodNo" value="${product.prodNo}" type="hidden" />${product.prodName }
											</h3>
										</div>
										<div class="panel-body">
											<a href="#" class="thumbnail col-md-6 col-xs-8"> 
											<img src="/images/uploadFiles/${product.fileList[0]}" ></a>
												
											<div class="col-md-6 col-xs-4 text-right">
												<p>&nbsp; ���� : ${product.price }</p><br/>
												<p>&nbsp; �����</p>
												<p>&nbsp; ${product.regDate }</p><br/>
												<p>
													<c:if test="${ product.prodQuantity!=0}">&nbsp; �Ǹ� �� </c:if>
													<c:if test="${ product.prodQuantity==0}">&nbsp; ��� ���� </c:if>
												</p>
												<p>&nbsp; ��� : ${product.prodQuantity}��</p><br/>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						
			<input type="hidden" id="currentPage" name="currentPage" value="" />
			<jsp:include page="../common/pageNavigatorDefault.jsp" />
			<!--  ������ Navigator �� -->
			
		</div>
		<!--<div class="container ">-->
		
	<input class="maxPage" type="hidden" value=" ${resultPage.maxPage}" />
	<input class="pageSize" type="hidden" value=" ${resultPage.pageSize}" />
	<input class="currentPage" type="hidden" value=" ${search.currentPage}" />
	<input class="searchCondition" type="hidden" value=" ${search.searchCondition}" />
	<input class="searchKeyword" type="hidden" value=" ${search.searchKeyword}" />
	<input class="searchOrderBy" type="hidden" value=" ${search.searchOrderBy}" />
	<input class="searchPriceLowerLimit" type="hidden" value=" ${search.searchPriceLowerLimit}" />
	<input class="searchPriceUpperLimit" type="hidden" value=" ${search.searchPriceUpperLimit}" />
	<input class="searchCategory" type="hidden" value=" ${search.searchCategory}" />
	
	</form>
	
</body>
</html>

<script type="text/javascript">
/* $(function(){
	$("button[name='searchOrderBy1']").click(function(){
		$("input[name='searchOrderBy']").val(1)
	})
}); */
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		//document.detailForm.submit();
		$('#currentPage').val(currentPage);
		$("form").attr("method", "post").attr("action",
				"/product/listProduct/${menu }").submit();
	}
	/* function updateQuantity() {
		var newQuantity = $("#prodQuantityInput").val();

		$.ajax({
			url : "/updateQuantity.do",
			type : "GET",
			data : {
				prodNo : "${product.prodNo}",
				prodQuantity : newQuantity,
				currentPage : "${search.currentPage}",
				searchCondition : "${search.searchCondition}",
				searchKeyword : "${search.searchKeyword}"
			},
			success : function(response) {
				// �������� ���� ó��
				console.log(response);
			},
			error : function(error) {
				// ���� ó��
				console.error(error);
			}
		});
	} */

	var prodNo;
	var menu = "${menu}";
	function fncLink() {
		$('div.panel-heading').each(
				
				function(index) {
					
					$("div.panel-heading:eq(" + index + ")")
					.css("color","black")
					.mouseenter(function() {
						$(this).css("color", "red");
					}).mouseleave(function() {
						$(this).css("color", "black");
					})
					.click(function() {
								prodNo = $(
										"div.panel-heading:eq(" + index
												+ ") h3 input").val();
								//alert(prodNo + "/" + menu);
								self.location = "/product/getProduct/" + prodNo
										+ "/" + menu;
							})

					$("div.panel-body:eq(" + index + ") img").click(
							function() {
								prodNo = $(
										"div.panel-heading:eq(" + index
												+ ") h3 input").val();
								//alert(prodNo + "/" + menu);
								self.location = "/product/getProduct/" + prodNo
										+ "/" + menu;
							})
				})
	}
	
	function fncPanelPrimary() {
		$.each($("div.panel-default"), function(index, value) {
			/* console.log($("p:contains('�Ǹ� ��')", value).text().trim() ); */
	        if ($("p:contains('�Ǹ� ��')", value).text().trim() == '�Ǹ� ��') {
	            $(value).addClass("panel panel-primary");
	        }
	    });/* $( selector [, context ] ) ���� �� panel ����  */
	}

	var maxPage = $("input.maxPage").val();
	var pageSize = $("input.pageSize").val();
	var currentPage = $("input.currentPage").val();
	var searchCondition = $("input.searchCondition").val().trim();
	var searchKeyword = $("input.searchKeyword").val().trim();
	var searchOrderBy = $("input.searchOrderBy").val().trim();
	var searchPriceLowerLimit = $("input.searchPriceLowerLimit").val();
	var searchPriceUpperLimit = $("input.searchPriceUpperLimit").val();
	let searchCategory=$("input.searchCategory").val();
	console.log("maxPage : " + maxPage + "\n pageSize : " + pageSize
			+ "\n currentPage : " + currentPage + "\n searchCondition : "
			+ searchCondition + "\n searchKeyword : -" + searchKeyword + "-"
			+ "\n searchOrderBy : " + searchOrderBy
			+ "\n searchPriceLowerLimit : " + searchPriceLowerLimit
			+ "\n searchPriceUpperLimit : " + searchPriceUpperLimit);
	let j = 0;
	function fncScrollEvent() {
		++currentPage;
		/* searchOrderBy = $("input.searchOrderBy").val().trim();
		console.log("maxPage : " + maxPage + "\n pageSize : " + pageSize
				+ "\n currentPage : " + currentPage + "\n searchCondition : "
				+ searchCondition + "\n searchKeyword : -" + searchKeyword + "-"
				+ "\n searchOrderBy : " + searchOrderBy
				+ "\n searchPriceLowerLimit : " + searchPriceLowerLimit
				+ "\n searchPriceUpperLimit : " + searchPriceUpperLimit); */
		console.log(currentPage);
		$
				.ajax(
						"/productRest/json/listProduct",
						{
							method : "POST",
							dataType : "json",
							headers : {
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								currentPage : currentPage,
								searchCondition : searchCondition,
								searchKeyword : searchKeyword,
								searchOrderBy : searchOrderBy,
								searchPriceLowerLimit : searchPriceLowerLimit,
								searchPriceUpperLimit : searchPriceUpperLimit,
								searchCategory : searchCategory
							}),
							success : function(JSONData, status) {
								/* console.log(JSONData);
								var serverData=JSON.stringify(JSONData);
								console.log(serverData); */
								
								++j;
								let i = j*pageSize;
								var textPop2 = "";
								$
										.each(
												JSONData.list,
												function(index, product) {
													// ���⼭ index�� �迭�� �ε����̰�, item�� �� ��Ҹ� ��Ÿ���ϴ�
													++i;
													console
															.log("Index: "
																	+ index
																	+ ", Item: "
																	+ JSON
																			.stringify(product));
													var quantityText = "";
													if (product.prodQuantity != 0) {
														quantityText = "�Ǹ� ��";
													} else {
														quantityText = "��� ����";
													}
													var regDate = new Date(
															product.regDate);
													var formatRegDate = regDate
															.getFullYear()
															+ "-"
															+ regDate
																	.getMonth()
																	.toString()
																	.padStart(
																			2,
																			'0')
															+ "-"
															+ regDate
																	.getDate()
																	.toString()
																	.padStart(
																			2,
																			'0');
													/* var textPop = "<tr class='ct_list_pop'><td align='center' height='200'>"
															+ i
															+ "</td><td align='left'><input value='"+product.prodNo+"'type='hidden' /> "
															+ product.prodName
															+ "</td><td align='left'>"
															+ product.price
															+ "</td><td align='left'>"
															+ formatRegDate
															+ "</td><td align='left'>"
															+ quantityText
															+ "</td><td align='left'>"
															+ product.prodQuantity
															+ "��</td></tr>"; */
													var textPop = "<div class='col-md-4 col-xs-12'>"
															+ "<div class='panel panel-default'>"
															+ "<div class='panel-heading'>"
															+ "<h3 class='panel-title'>"
															+ i
															+ ". <input value='"+product.prodNo+"' type='hidden' /> "
															+ product.prodName
															+ "</h3>"
															+ "</div><div class='panel-body'>"
															+ "<a href='#' class='thumbnail col-md-6 col-xs-8'> <img src='/images/uploadFiles/"+product.fileList[0]+"'></a>"
															+ "<div class='col-md-6 col-xs-4 text-right'><p>&nbsp; ���� : "
															+ product.price
															+ "</p><br/><p>&nbsp; �����</p><p>&nbsp; "
															+ formatRegDate
															+ "</p><br/>"
															+ "<p>&nbsp; "
															+ quantityText
															+ "</p>"
															+ "<p>&nbsp; ��� : "
															+ product.prodQuantity
															+ "��</p><br/></div></div></div></div>";

													textPop2 += textPop;
												});
								textPop3 = "<div class='row' id='ct_list_pop'>"
										+ textPop2 + "</div>"
								$("#ct_list_pop:last").append(textPop3);
								fncLink();
								fncPanelPrimary();
							}
						})/* end of '$.ajax' */
						
	}
	
		$(function(){
		fncLink();
		fncPanelPrimary();
		$("button:contains('�˻�')").click(function() {
			fncGetList('1');
		})
		//console.log($("tr.ct_list_pop td:nth-child(3)"));

		/* $.ajax("/productRest/json/listProduct",
				{
					method : "POST",
					dataType : "json",
					headers : {
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status) {
						//alert(JSONData.success);
						$(
								"tr.ct_list_pop:nth-child(" + (2 * index + 4)
										+ ") td:last").empty();
						$(
								"tr.ct_list_pop:nth-child(" + (2 * index + 4)
										+ ") td:nth-child(15)").text("��ۿϷ�");
					}
				}) */

		/* $( "tfoot.a:last" ).after( $( "tfoot.a:first" ).clone() ); */
		
		$("#addCategory").click(function(){
			window.open("/category/addCategory.jsp","popWin",
			"left=300, top=200, width=300, height=400, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		});
		
		$("#updateCategory").click(function(){
			window.open("/category/updateCategoryView","popWin",
			"left=300, top=200, width=300, height=400, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		});
		
		var last = document.body.scrollHeight - window.innerHeight;
		console.log(document.body.scrollHeight + "/" + window.innerHeight);
		console.log(document.body.scrollWidth + "/" + window.innerWidth);
		console.log(document.body.scrollHeight == window.innerHeight);
		
		var currentPageInt=parseInt(currentPage);
		var maxPageInt=parseInt(maxPage);
		console.log(currentPageInt);
		console.log(maxPageInt);
		console.log("currentPage < maxPage :"+(currentPageInt < maxPageInt));
		
		if (currentPageInt < maxPageInt) {
			setTimeout(function() {
					fncScrollEvent();
			}, 300);
			fncScrollEvent();

			$(window).scroll(function() {
				/* console.log( last+"/"+$(window).scrollTop() ); */
				if ($(window).scrollTop() == last) {
					fncScrollEvent();

					window.scrollTo(0, last);//window.scrollTo(x��,y��);
				}/* end of 'if ( $(window).scrollTop() == last) ' */
				last = document.body.scrollHeight - window.innerHeight;//document.body.scrollHeight : body�� ��ũ�� �� ����, window.innerHeight : â ���� ����
			})/* end of '$(window).scroll(function()' */

		} /* end of 'if (currentPage <= maxPage)' */

		var fList = [];
		$("input[name='searchKeyword']").keyup(
				function() {
					searchKeyword = $("input[name='searchKeyword']").val()
							.trim();
					searchCondition = $("select[name='searchCondition']").val()
							.trim();
					searchOrderBy = $("select[name='searchOrderBy']").val();
					searchPriceLowerLimit = $(
							"input[name='searchPriceLowerLimit']").val();
					searchPriceUpperLimit = $(
							"input[name='searchPriceUpperLimit']").val();
					console.log(searchKeyword + "/" + searchCondition + "/"
							+ searchOrderBy + "/" + searchPriceLowerLimit + "/"
							+ searchPriceUpperLimit);

					$.ajax("/productRest/json/fullListProduct", {
						method : "POST",
						dataType : "json",
						headers : {
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							searchCondition : searchCondition,
							searchKeyword : searchKeyword,
							searchOrderBy : searchOrderBy,
							searchPriceLowerLimit : searchPriceLowerLimit,
							searchPriceUpperLimit : searchPriceUpperLimit
						}),
						success : function(JSONData, status) {
							$.each(JSONData.fullList, function(index, product) {
								if (searchCondition == 0) {
									fList.push(product.prodNo + "");
								} else if (searchCondition == 1) {
									fList.push(product.prodName);
								} else if (searchCondition == 2) {
									fList.push(product.price + "");
								}
								console.log(fList);
								$("input[name='searchKeyword']").autocomplete({
									source : fList
								})
							})
							fList = [];
						}
					})
				})
	});
</script>



