<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<p align="center">�ش� ��ǰ�� ���� �� �� �����ϴ�. �׷��� ���� �� �������� �Ѿ</p>
<br />
<c:import var="getProductOfNotUpdateProduct" url="../product/getProduct.jsp"
	scope="request" />${getProductOfNotUpdateProduct}
