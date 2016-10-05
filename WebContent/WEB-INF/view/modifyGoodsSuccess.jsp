<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	상품정보 업데이트 완료
	${ctxPath = pageContext.request.contextPath ; ''}
	<a href="${ctxPath}/index.jsp">[메인가기]</a>
	
	<%-- <br> ${ctxPath = pageContext.request.contextPath ; ''}
	<a href="${ctxPath}/article/list.do">[게시글목록보기]</a>
	<a href="${ctxPath}/article/read.do?no=${modReq.articleNumber}">[게시글내용보기]</a> --%>
</body>
</html>