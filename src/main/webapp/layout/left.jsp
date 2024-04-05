<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function history() {
		popWin = window
				.open(
						"/history.jsp",
						"popWin",
						"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	}

	//==> jQuery ���� �߰��� �κ�
	$(function() {

		$("td.Depth03").mouseenter(function() {
			$(this).css("font-size", "20px");
		}).mouseleave(function() {
			$(this).css("font-size", $("body").css("font-size"));
		}).click(
				function() {
					$(this).css("color", "blue").css("text-decoration",
							"underline").css("font-style", "italic");
				})

		//==> ����������ȸ Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(".Depth03:contains('����������ȸ')")
				.on(
						"click",
						function() {
							//Debug..
							//alert(  $( ".Depth03:contains('����������ȸ')" ).html() );
							$(
									window.parent.frames["rightFrame"].document.location)
									.attr("href",
											"/user/getUser?userId=${user.userId}");
						});

		//==> ȸ��������ȸ Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(".Depth03:contains('ȸ��������ȸ')").on(
				"click",
				function() {
					//Debug..
					//alert(  $( ".Depth03:contains('ȸ��������ȸ')" ) );
					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "/user/listUser");
				});

		$("td.Depth03:contains('�ǸŻ�ǰ���')").on(
				"click",
				function() {
					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "../product/addProductView.jsp");
				})
		$("td.Depth03:contains('�ǸŻ�ǰ����')").on(
				"click",
				function() {
					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "/product/listProduct/manage");
				})
		$("td.Depth03:contains('��� ����')").on(
				"click",
				function() {
					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "/purchase/listDelivery");
				})
		$("td.Depth03:contains('�� ǰ �� ��')").on(
				"click",
				function() {
					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "/product/listProduct/search");
				})
		$("td.Depth03:contains('�����̷���ȸ')").on(
				"click",
				function() {
					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "/purchase/listPurchase");
				})
		$("td.Depth03:contains('��ٱ���')").on(
				"click",
				function() {
					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "/basket/listBasket");
				})

		/* $("td.Depth03:contains('�ֱ� �� ��ǰ')").mouseenter(function(){
			 $(this).css("font-size", "20px");
		}).mouseleave(function(){
			 $(this).css("font-size", $("body").css("font-size"));
		}).on("click",function(){
			history();
		}) */

		$("td.Depth03:contains('�ֱ� �� ��ǰ')").on("click", function() {
			history();
		})
	});
</script>
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0"
	topmargin="0" marginwidth="0" marginheight="0">

	<table width="159" border="0" cellspacing="0" cellpadding="0">

		<!--menu 01 line-->
		<tr>
			<td valign="top">
				<table border="0" cellspacing="0" cellpadding="0" width="159">
					<tr>
						<c:if test="${ !empty user }">
							<tr>
								<td class="Depth03">
									<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
							<a href="/getUser.do?userId=${user.userId}" target="rightFrame">����������ȸ</a>
							////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
									<!--  <a href="/user/getUser?userId=${user.userId}"
									target="rightFrame">����������ȸ</a>  --> ����������ȸ
								</td>
							</tr>
						</c:if>

						<c:if test="${user.role == 'admin'}">
							<tr>
								<td class="Depth03">
									<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
							<a href="/listUser.do" target="rightFrame">ȸ��������ȸ</a>
							////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
									<!-- <a href="/user/listUser" target="rightFrame">ȸ��������ȸ</a> -->
									ȸ��������ȸ
								</td>
							</tr>
						</c:if>
					<tr>
						<td class="DepthEnd">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>

		<!--menu 02 line-->
		<c:if test="${user.role == 'admin'}">
			<tr>
				<td valign="top">
					<table border="0" cellspacing="0" cellpadding="0" width="159">
						<tr>
							<td class="Depth03">
								<!-- <a href="../product/addProductView.jsp;"
								target="rightFrame">�ǸŻ�ǰ���</a> -->�ǸŻ�ǰ���
							</td>
						</tr>
						<tr>
							<td class="Depth03">
								<!-- <a href="/product/listProduct/manage"
								target="rightFrame"> -->�ǸŻ�ǰ����</a>
							</td>
						</tr>
						<tr>
							<td class="Depth03">
								<!-- <a href="/purchase/listDelivery"
								target="rightFrame"> -->��� ����</a>
							</td>
						</tr>
						<tr>
							<td class="DepthEnd">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</c:if>

		<!--menu 03 line-->
		<tr>
			<td valign="top">
				<table border="0" cellspacing="0" cellpadding="0" width="159">
					<tr>
						<td class="Depth03">
							<!-- <a href="/product/listProduct/search"
							target="rightFrame">�� ǰ �� ��</a> -->�� ǰ �� ��
						</td>
					</tr>

					<c:if test="${ !empty user && user.role == 'user'}">
						<tr>
							<td class="Depth03">
								<!-- <a href="/purchase/listPurchase"
								target="rightFrame">�����̷���ȸ</a> -->�����̷���ȸ
							</td>
						</tr>
						<tr>
							<td class="Depth03">
								<!-- <a href="/basket/listBasket"
								target="rightFrame">��ٱ���</a> -->��ٱ���
							</td>
						</tr>
					</c:if>

					<tr>
						<td class="DepthEnd">&nbsp;</td>
					</tr>
					<tr>
						<td class="Depth03">
							<!-- <a href="javascript:history()">�ֱ� �� ��ǰ</a> -->�ֱ� �� ��ǰ
						</td>
					</tr>
				</table>
			</td>
		</tr>

	</table>

</body>
</html>
