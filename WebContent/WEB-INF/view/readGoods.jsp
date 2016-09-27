<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품 상세</title>
</head>
<body>
<form method='post' action="../order/wish.do">
	
	<!-- 주문 페이지로 넘길 정보 : 물품코드, 물품이름, 수량, 단가 -->
	
	<input style="display: none;" type="text" name="goodscode" value="${goods.goodscode}">
	<input style="display: none;" type="text" name=goodsname value="${goods.goodsname}">
	<input style="display: none;" type="text" name=unitprice value="${goods.unitprice}">
	
	<table border="1">
		
		
		<tr>
			<td rowspan="5"><img width="400" alt="${goods.goodscode}" src="../image/wine/${goods.goodscode}.jpg"></td>
			<td colspan="2">${goods.goodsname}</td>
			
		</tr>
		<tr>
			<td colspan="2"><u:pre value='${goods.comment}' /></td>
		</tr>
		<tr>
			<td>수량:</td>
			<td><input type="text" name="orderamount" value="1"></td>
		</tr>
		<tr>
			<td>금액:</td>
			<td><c:out value='${goods.unitprice}'>내용 없음</c:out></td>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="구매"></td>
		</tr>
		<tr>
			<td colspan="3">
				<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo}" /> 
					<a href="glist.do?pageNo=${pageNo}">[목록]</a> 
				
					
					
					
				
				<!-- 장바구니 담기 기능 & 상품정보 수정 기능 추가해야함, 아래 코드 응용하기 -->
				<%-- <c:if test="${authUser.id == articleData.article.writer.id}">
					<a href="modify.do?no=${articleData.article.number}">[게시글수정]</a>
				</c:if> --%>
			</td>
		</tr>
	</table>
</form>
</body>
</html>