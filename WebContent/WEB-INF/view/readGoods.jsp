<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품 상세</title>
</head>
<body>
	<table border="1">
		<tr>
			<td rowspan="3"><img width="400" alt="${goods.goodscode}" src="../image/wine/${goods.goodscode}.jpg"></td>
			<td colspan="2">${goods.goodsname}</td>
		</tr>
		<tr>
			<td colspan="2"><u:pre value='${goods.comment}' /></td>
		</tr>
		<tr>
			<td>금액:</td>
			<td><c:out value='${goods.unitprice}'>내용 없음</c:out></td>
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

</body>
</html>