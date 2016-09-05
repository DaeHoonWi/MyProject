<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="login.do" method="post">
		<c:if test="${errors.idOrPwNotMatch}">아이디와 암호가 일치하지 않습니다.</c:if>
		<p>
			아이디:<br>
			<input type="text" name="id" value="${param.id}">
			<c:if test="${errors.id}">ID를 입력하세요.</c:if>
		</p>
		<p>
			암호:<br>
			<input type="password" name="password">
			<c:if test="${errors.password}">암호를 입력하세요.</c:if>
		</p>
		<input type="submit" value="로그인">
	</form>
</body>
</html>