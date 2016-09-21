<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품입력 완료</title>
</head>
<body>

	상품을 입력했습니다. 
	${ctxPath = pageContext.request.contextPath; ''}
	<a href="${ctxPath}/goods/insert.do">[새 상품 등록]</a>
	<a href="${ctxPath}/index.jsp">[메인 페이지]</a>
</body>
</html>