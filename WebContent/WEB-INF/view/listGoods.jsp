<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type='text/css' rel='stylesheet' href='../css/index.css'>
<title>환영합니다. - 와인</title>
</head>
<body>
	<!-- 헤더 -->
	<header>
	<div class='header-ac'>
		<div class='h-l'>
			<a href="../index.jsp">
			<img src="../image/main/logo.png"></a>
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
				${authUser.name}님, 안녕하세요.<br>
				<a href="logout.do">로그아웃</a>
				&nbsp;&nbsp;/&nbsp;&nbsp;
				<a href="changePwd.do">비밀번호 변경</a>
			</u:isLogin>
			<u:notLogin>
				<a href="login.do">로그인</a>
				&nbsp;&nbsp;/&nbsp;&nbsp;
				<a href="join.do">회원가입</a>
			</u:notLogin><br>
			<img src="../image/main/head_btn_req.png">
		</div>
	</div>
	</header>

	<!-- 네비게이션 bar -->
	<nav class='top-nav'>
	<ul>
		<li><a href='wine.jsp'>와인</a></li>
		<li><a href=''>위스키</a></li>
		<li><a href=''>브랜디/꼬냑</a></li>
		<li><a href=''>리큐르/보드카</a></li>
		<li><a href=''>민속주/중국술/사케</a></li>
		<li><a href=''>미니어쳐</a></li>
		<li><a href=''>세일&이벤트</a></li>
		<li><a href=''>고객센터</a></li>
	</ul>
	</nav>
	
	<br><br><br><br><br>
	
	
	<table border='1'>
		<tr>
			<td>상품명</td>
			<td>가격</td>
		</tr>
	<c:if test="${goodsPage.hasNoGoods()}">
		<tr>
			<td colspan='2'>상품이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var='goods' items='${goodsPage.content}'>
		<tr>
			<td>
				<a href="read.do?no=${article.number}&pageNo=${articlePage.currentPage}"> <!-- 상품 상세보기 기능 추가 후 수정 요망 -->
					<%-- <c:out value="${goods.goodscode}"/><br> --%>
					<c:out value="${goods.goodsname}"/>
				</a>
			</td>
			<td>${goods.unitprice}</td>
		</tr>
	</c:forEach>
	<c:if test="${goodsPage.hasGoods()}">
		<tr>
			<td colspan='2'>
				<c:if test="${goodsPage.startPage > 5 }">
				<a href="glist.do?pageNo=${goodsPage.startPage - 5}">[이전]</a>
				</c:if>
				<c:forEach var="pNo" begin="${goodsPage.startPage}" end="${goodsPage.endPage}">
					<a href="glist.do?pageNo=${pNo}">[${pNo}]</a>
				</c:forEach>
				<c:if test="${goodsPage.endPage <goodsPage.totalPages}">
				<a href="glist.do?pageNo=${goodsPage.startPage + 5}">[다음]</a>
				</c:if>
			</td>
		</tr>
	</c:if>
	</table>
	
	<!-- 베스트셀러 -->
	<div class='best5-wine'></div>
	
	<!-- 상품 목록 시작 -->
	<div class='item'>
		<div class='item-os'>
			<img src="../image/wine/1233315685_m.jpg">
			<img src="../image/wine/1331797470_m.jpg">
			<img src="../image/wine/2172060307_m.jpg"> 
			<img src="../image/wine/6915502640_m.jpg"> 
			<img src="../image/wine/9704591046_m.jpg">
		</div>
	</div>
</body>
</html>