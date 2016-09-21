<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 쓰기</title>
</head>
<body>
	<form action="write.do" method="post">
		<p>
			제목:<br>
			<input type="text" name="title" value="${param.title}">
			<c:if test="${errors.title}">제목을 입력하세요.</c:if>
		</p>
	<p>
		내용:<br><textarea name="content" rows="5" cols="30">${param.content}</textarea>
	</p>
	<input type="submit" value="새 글 등록">
	${ctxPath = pageContext.request.contextPath; ''}
	<a href="${ctxPath}/article/list.do">[취소]</a>
	</form>

</body>
</html>