<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type='text/css' rel='stylesheet' href='../css/index.css'>
<title>주문 입력</title>
</head>
<body>

<form method='post' action="buy.do">
	<!-- 결제 페이지로 넘길 정보 : 	아이디, 주소, 총계 / 물품코드, 수량, 합계
									주문코드는 order에서 받아오기-->
	<input style="display: none;" type="text" name="id" value="${authUser.id}">
	<input style="display: none;" type="text" name="extendedprice" value="${savedGoods.extendedprice}">
	<input style="display: none;" type="text" name="goodscode" value="${savedGoods.goodscode}">
	<input style="display: none;" type="text" name="orderamount" value="${savedGoods.orderamount}">
	<input style="display: none;" type="text" name="orderprice" value="${savedGoods.orderprice}">
<table>
	<tr>
		<th colspan='2'>상품정보</th>
		<th>수량</th>
		<th>판매가격</th>
		<th>합계</th>
	</tr>


	<c:if test="${! empty savedGoods}">
	<tr>
		<td><img class='goods-img' src="../image/wine/${savedGoods.goodscode}.jpg"></td>
		<td>${savedGoods.goodsname}</td>
		<td class='goods'>${savedGoods.orderamount}</td>
		<td class='goods'>${savedGoods.unitprice}원</td>		<!-- 합계 -->
		<td class='goods'>${savedGoods.orderprice}원</td> 	<!-- 총계 -->
	</tr>
	</c:if>
	
	<c:if test="${empty savedGoods}">
	<tr>
		<td colspan='4'>구매할 상품이 없습니다.</td>
	</tr>
	</c:if>
</table>
<table>
	<tr>
		<td>주소</td>
		<td><input type="text" name="destination" value=""></td>
	</tr>
</table>


<input type="submit" value="구매완료">
</form>

</body>
</html>