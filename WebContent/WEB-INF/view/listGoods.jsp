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
				<a href="../logout.do">로그아웃</a>
				&nbsp;&nbsp;/&nbsp;&nbsp;
				<a href="../changePwd.do">비밀번호 변경</a>
			</u:isLogin>
			<u:notLogin>
				<a href="../login.do">로그인</a>
				&nbsp;&nbsp;/&nbsp;&nbsp;
				<a href="../join.do">회원가입</a>
			</u:notLogin><br>
			<img src="../image/main/head_btn_req.png">
		</div>
	</div>
	</header>

	<!-- 네비게이션 bar -->
	<nav class='top-nav'>
	<ul>
		<li><a href='glist.do'>와인</a></li>
		<li><a href=''>위스키</a></li>
		<li><a href=''>브랜디/꼬냑</a></li>
		<li><a href=''>리큐르/보드카</a></li>
		<li><a href=''>민속주/중국술/사케</a></li>
		<li><a href=''>미니어쳐</a></li>
		<li><a href=''>세일&이벤트</a></li>
		<li><a href='../article/list.do'>고객센터</a></li>
	</ul>
	</nav>
	
	<br><br><br><br><br>
	
	<!-- 와인 베스트셀러 -->
	<div class='best5-wine'></div>
	
	<!-- 상품목록 -->
	<div class='item'>
	<table>
		<c:if test="${goodsPage.hasNoGoods()}">
			<tr>
				<td colspan='2'>상품이 없습니다.</td>
			</tr>
		</c:if>
<%
int i=0;
%>
			<c:forEach var='goods' items='${goodsPage.content}'>
<%
i = i+1;
if(i%5==1){
%>
<tr>
<%
}
%>
				<td style="padding: 0px 69px 50px 0px; text-align: center;"><a href="gread.do?no=${goods.goodscode}&pageNo=${goodsPage.currentPage}">
					<img alt="${goods.goodsname}" src="../image/wine/${goods.goodscode}.jpg" 
					style="border:1px solid #d9f0f7;" width="170"><br> 
					<c:out value="${goods.goodsname}" /></a><br>
					${goods.unitprice}
				</td>
<%
if(i==5){
%>
</tr>
<%
}
%>				
			</c:forEach>
		
		<c:if test="${goodsPage.hasGoods()}">
		<tr>
			<td class='onlyCenter' colspan='5'>
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
	</div>
</body>
</html>