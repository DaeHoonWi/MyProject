<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type='text/css' rel='stylesheet' href='../css/index.css'>
<title>암호 변경</title>
</head>
<body>
	<!-- header -->
	<header>
	<div class='header-ac'>
		<div class='h-l'>
			<a href="../index.jsp"><img src="../image/main/logo.png"></a>
		</div>
		<div class='h-c'>

			<form action='http://wwww.google.com/' method='POST'>
				<input type="search" name="serch" value="검색 내용" onfocus="this.value=''" style="width: 300px; height: 40px; margin: 0; padding: 0; border-width: 0;">
				<input type="submit" class="submit_button" style="cursor: pointer" value="">
			</form>
			<p>앱솔루트&nbsp; &nbsp;|&nbsp; &nbsp;예거마이스터&nbsp; &nbsp;|&nbsp;
				&nbsp;발렌타인&nbsp; &nbsp;|&nbsp; &nbsp;조니워커</p>
		</div>
		<div class='h-r'>
			<u:isLogin>
			<table class='inform'>
				<tr>
					<td><a href="../member/logout.do">로그아웃</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="">마이페이지</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="../member/changePwd.do">정보수정</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="">즐겨찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="../article/list.do">고객센터</a></td>
				</tr>
			</table>
			</u:isLogin>
			<u:notLogin>
			<table class='inform'>
				<tr>
					<td><a href="../login.do">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="../join.do">회원가입</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="">즐겨찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a>고객센터</a></td>
				</tr>
			</table>
			</u:notLogin><br>
			<a href=""><img style="padding-top: 24px" src="../image/main/head_btn_req.png"></a>
		</div>
	</div>
	</header>
	
	<!-- top-nav -->
	<nav class='top-nav'>
	<ul>
		<li><a href='../goods/glist.do'>와인</a></li>
		<li><a href=''>위스키</a></li>
		<li><a href=''>브랜디/꼬냑</a></li>
		<li><a href=''>리큐르/보드카</a></li>
		<li><a href=''>민속주/중국술/사케</a></li>
		<li><a href=''>미니어쳐</a></li>
		<li><a href='../goods/insert.do'>세일&이벤트</a></li>
		<li><a href='../article/list.do'>고객센터</a></li>
	</ul>
	</nav>
	
<form action="changePwd.do" method="post">
<p>
현재 암호:<br><input type="password" name="curPwd">
<c:if test="${errors.curPwd}">현재 암호를 입력하세요.</c:if>
<c:if test="${errors.badCurPwd}">현재 암호가 일치하지 않습니다.</c:if>
</p>
<p>
새 암호:<br><input type="password" name="newPwd">
<c:if test="${errors.newPwd}">새 암호를 입력하세요.</c:if>
</p>
<input type="submit" value="암호 변경">
</form>
</body>
</html>