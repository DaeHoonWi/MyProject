<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- 단위 변환 태그 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type='text/css' rel='stylesheet' href='../css/index.css'>
<link rel="javascript" type="text/javascript" href="../js/board.js">
<link type="">
<title>게시글 목록</title>
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
		<li><a href='../goods/glist.do?sep=와인'>와인</a></li>
		<li><a href='../goods/glist.do?sep=위스키'>위스키</a></li>
		<li><a href='../goods/glist.do?sep=브랜디'>브랜디/꼬냑</a></li>
		<li><a href=''>리큐르/보드카</a></li>
		<li><a href=''>민속주/중국술/사케</a></li>
		<li><a href=''>미니어쳐</a></li>
		<li><a href='../goods/insert.do'>세일&이벤트</a></li>
		<li><a href='../article/list.do'>고객센터</a></li>
	</ul>
	</nav>
	
	<br><br>
	
	<!-- content -->
	<table class='board-name'>
		<tr>
			<td colspan='5'>&nbsp;<img alt="title_img" src="../image/title_bar.gif" style="vertical-align: middle;">묻고답하기</td>
		</tr>
	</table>
		
	<br><br><br>
	
	<table class='board'>
		<tr>
			<td colspan='5' style="text-align: right;">게시물 ${articlePage.total}건</td>
		</tr>
		<tr style="border-top: 2px solid #8080ff;">
			<th style="width: 50px;">번호</td>
			<th style="width: 850px;">제목</td>
			<th style="width: 110px;">글쓴이</td>
			<th style="width: 60px;">날짜</td>
			<th>조회수</td>
		</tr>
	<c:if test="${articlePage.hasNoArticles()}">
		<tr>
			<td colspan='5'>게시글이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var='article' items='${articlePage.content}'>
		<tr>
			<td style="text-align: center;">${article.number}</td>
			<td>
			<a href="read.do?no=${article.number}&pageNo=${articlePage.currentPage}" style="text-decoration:none;">
				<img alt="front" src="../image/icon_subject.gif">
				<c:out value="${article.title}"/>
			</a>
			</td>
			<td>${article.writer.name}</td>
			<td style="text-align: center;"><fmt:formatDate value="${article.regDate}" type="date" pattern="MM-dd"/></td>
			<td style="text-align: center;">${article.readCount}</td>
		</tr>
	</c:forEach>
	<c:if test="${articlePage.hasArticles()}">
		<tr>
			<td class='board-bottom-line' colspan='5' style="text-align: center;">
				<c:if test="${articlePage.startPage > 5 }">
				<a href="list.do?pageNo=${articlePage.startPage - 5}">[이전]</a>
				</c:if>
				<c:forEach var="pNo" begin="${articlePage.startPage}" end="${articlePage.endPage}">
					<a class='pageNumber' href="list.do?pageNo=${pNo}">${pNo}&nbsp;</a>
				</c:forEach>
				<c:if test="${articlePagel.endPage <articlePage.totalPages}">
				<a href="list.do?pageNo=${articlePage.startPage + 5}">[다음]</a>
				</c:if>
			</td>
		</tr>
	</c:if>
		<tr>
			<td colspan='5' style="text-align: right;"><a href="write.do"><img alt="글쓰기" src="../image/btn_write.gif"></a></td>
		</tr>
	</table>
</body>
</html>