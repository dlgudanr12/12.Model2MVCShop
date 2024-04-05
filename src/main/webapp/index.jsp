<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ///////////////////////////// �α��ν� Forward  /////////////////////////////////////// -->
<%-- <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if> --%>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   -->
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

<!--  ///////////////////////// CSS ////////////////////////// -->
<style></style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//============= ȸ�������� ȭ���̵� =============
	$(function() {
		//==> �߰��Ⱥκ� : "addUser"  Event ����
		$("a[href='#' ]:contains('ȸ������')").on("click", function() {
			self.location = "/user/addUser";
		});
	});

	//============= �α��� ȭ���̵� =============
	$(function() {
		//==> �߰��Ⱥκ� : "addUser"  Event ����
		$("a[href='#' ]:contains('�� �� ��')").on("click", function() {
			self.location = "/user/login";
		});
	});
</script>

</head>

<body>
	<c:if test="${ empty user }">
		<!-- ToolBar Start /////////////////////////////////////-->
		<div class="navbar  navbar-default">

			<div class="container">

				<a class="navbar-brand" href="#">Model2 MVC Shop</a>

				<!-- toolBar Button Start //////////////////////// -->
				<div class="navbar-header">
					<button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
				</div>
				<!-- toolBar Button End //////////////////////// -->

				<div class="collapse navbar-collapse" id="target">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">ȸ������</a></li>
						<li><a href="#">�� �� ��</a></li>
					</ul>
				</div>

			</div>
		</div>
	</c:if>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<!-- �ٴܷ��̾ƿ�  Start /////////////////////////////////////-->
		<div class="row">

			<!--  Menu ���� Start /////////////////////////////////////-->
			<div class="col-md-3">

				<!--  ȸ������ ��Ͽ� ���� -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> ȸ������
					</div>
					<!--  ȸ������ ������ -->
					<ul class="list-group">
						<li class="list-group-item"><a href="#">����������ȸ</a> <i class="glyphicon glyphicon-user"></i>
						</li>
						<c:if test="${user.role == 'admin'}">
						<li class="list-group-item"><a href="#">ȸ��������ȸ</a> <i class="glyphicon glyphicon-th-list"></i>
						</li>
						</c:if>
					</ul>
				</div>

				<c:if test="${sessionScope.user.role == 'admin'}">
				<div class="panel panel-primary ">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-briefcase"></i> �ǸŻ�ǰ����
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="#">�ǸŻ�ǰ���</a> <i class="glyphicon glyphicon-apple"></i>
						</li>
						<li class="list-group-item"><a href="#" class="product">�ǸŻ�ǰ����</a> <i
							class="glyphicon glyphicon-menu-hamburger"></i></li>
						<li class="list-group-item"><a href="#">��� ����</a> <i class="glyphicon glyphicon-eject"></i>
						</li>
					</ul>
				</div>
				</c:if>

				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-shopping-cart"></i> ��ǰ����
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="#">��ǰ�˻�</a></li>
						<c:if test="${sessionScope.user.role == 'user'}">
						<li class="list-group-item"><a href="#">�����̷���ȸ</a> <i class="glyphicon glyphicon-phone"></i>
						</li>
						<li class="list-group-item"><a href="#">��ٱ���</a> <i
							class="glyphicon glyphicon-shopping-cart"></i></li>
						</c:if>
						<li class="list-group-item"><a href="#">�ֱٺ���ǰ</a> <i class="glyphicon glyphicon-book"></i>
						</li>
					</ul>
				</div>

			</div>
			<!--  Menu ���� end /////////////////////////////////////-->

			<!--  Main start /////////////////////////////////////-->
			<div class="col-md-6">
				<c:if test="${ empty user }">
					<div class="jumbotron">
						<h1>Model2 MVC Shop</h1>
						<p>�α��� �� ��밡��...</p>
						<p>�α��� �� �˻��� �����մϴ�.</p>
						<p>ȸ������ �ϼ���.</p>

						<div class="text-center">
							<a class="btn btn-info btn-lg" href="#" role="button">ȸ������</a> <a class="btn btn-info btn-lg"
								href="#" role="button">�� �� ��</a>
						</div>
					</div>
				</c:if>
				<c:if test="${ !empty user }">
					<jsp:include page="/main.jsp" />
				</c:if>
			</div>
			<!--  Main end /////////////////////////////////////-->
		</div>
		<!-- �ٴܷ��̾ƿ�  end /////////////////////////////////////-->
	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->


</body>

</html>