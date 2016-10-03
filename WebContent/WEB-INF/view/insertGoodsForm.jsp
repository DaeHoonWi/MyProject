<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 입력 폼</title>
</head>
<body>
	<form action="insert.do" method="post">
		<table>
			<tr>
				<th>수량:</th>
				<td><input type="text" name="goodsamount" value="${param.goodsamount}"> 
					<c:if test="${errors.goodsamount}">수량을 입력하세요.</c:if></td>
			</tr>
			<tr>
				<th>단가:</th>
				<td><input type="text" name="unitprice" value="${param.unitprice}">
				<c:if test="${errors.unitprice}">단가를 입력하세요.</c:if></td>
			</tr>
			<tr>
				<th>물품명:</th>
				<td><input type="text" name="goodsname" value="${param.goodsname}">
				<c:if test="${errors.goodsname}">물품명을 입력하세요.</c:if></td>
			</tr>
			<tr>
				<th>분류:</th>
				<td>
					<table>
						<tr>
							<td><input type="radio" name="seperator" value="와인">와인</td>
							<td><input type="radio" name="seperator" value="위스키">위스키</td>
							<td><input type="radio" name="seperator" value="브랜디">브랜디</td>
							<td><input type="radio" name="seperator" value="브랜디">꼬냑</td>	<!-- 브랜디와 꼬냑을 같은 그룹에 묶기 위해 value값을 브랜디로 설정함 -->
							<td><input type="radio" name="seperator" value="리큐르">리큐르</td>
						</tr>
						<tr>
							<td><input type="radio" name="seperator" value="보드카">보드카</td>
							<td><input type="radio" name="seperator" value="민속주">민속주</td>
							<td><input type="radio" name="seperator" value="중국술">중국술</td>
							<td><input type="radio" name="seperator" value="사케">사케</td>
							<td><input type="radio" name="seperator" value="미니어쳐">미니어쳐</td>
						</tr>
						<tr>
							<td><c:if test="${errors.seperator}">분류를 선택하세요.</c:if></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<th>상품설명:</th>
				<td><textarea name="comment" rows="5" cols="30">${param.comment}</textarea></td>
			</tr>
		</table>
		
		<input type="submit" value="입력">
		${ctxPath = pageContext.request.contextPath; ''}
		<a href="${ctxPath}/index.jsp">[취소]</a>
	</form>
</body>
</html>