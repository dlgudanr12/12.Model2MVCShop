<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--   jQuery , Bootstrap CDN
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

Bootstrap Dropdown Hover CSS
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

Bootstrap Dropdown Hover JS
<script src="/javascript/bootstrap-dropdownhover.min.js"></script> -->

<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
<style>
body {
	padding-top: 70px;
}

p, h3 {
	width: 70%;
}

/* .jumbotron {
	width: 100%;
} */
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->


</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	<!--  �Ʒ��� ������ http://getbootstrap.com/getting-started/  ���� -->
	<div class="container ">
		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="row">
			<div class="col-md-7 col-xs-12">
				<div class="jumbotron">
					<h1>Model2MVCShop</h1>
					<p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 ,
						UI Framework �н� �� Mini-Project ����</p>
				</div>
			</div>
		</div>
	</div>

	<!-- ���� : http://getbootstrap.com/css/   : container part..... -->
	<!-- <div class="container">
		<h3>���������� �̷��� ���ߴ�.</h3>
		<p>"���� ���� ������ ������ ���� �߸� ���� �ð��� �����̴�."</p>
		<h3>"... �庮�� �����ϰ� ������ �ʴ� ������� �ɷ������� �����մϴ�. �庮��. ����� �ƴ϶� '�ٸ�' ������� ���߰� �Ϸ��� �ű� �ִ� ��������."</h3>
		<h3>��������</h3>
		<p>�ູ�� ���� �����.</p>
		<p>�����ϴ� ���� �ϴ� ���� �Ƹ���,</p>
		<p>���� �ϴ� ���� �����ϴ� ���Դϴ�.</p>
	</div> -->
	<div class="row">
		<div class="container col-md-12">
			<div class="page-header">
				<h1>Carousel</h1>
			</div>

			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner" role="listbox">

					<div class="item active">
						<img src="http://placehold.it/700X500">
					</div>

					<div class="item">
						<img src="http://placehold.it/700X500">
					</div>

					<div class="item">
						<img src="http://placehold.it/700X500">
					</div>
				</div>

				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev" style="width: 600;"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"
					style="width: 600;"></span> <span class="sr-only"
					style="width: 600;">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next" style="width: 600;"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"
					style="width: 600;"></span> <span class="sr-only"
					style="width: 600;">Next</span>
				</a>
			</div>
		</div>
	</div>

</body>

</html>