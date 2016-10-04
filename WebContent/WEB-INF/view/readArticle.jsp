<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- 단위 변환 태그 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type='text/css' rel='stylesheet' href='../css/index.css'>
<title>게시글 읽기</title>
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
				<c:set var="id" value="${authUser.id}"/>
				<c:if test="${id eq 'test1'}">
				<tr>
					<td colspan="5"><a href="goods/insert.do">상품추가</a></td>
				</tr>
				</c:if>
			</table>
			</u:isLogin>
			<u:notLogin>
			<table class='inform'>
				<tr>
					<td><a href="../member/login.do">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="../member/join.do">회원가입</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="">즐겨찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a>고객센터</a></td>
				</tr>
			</table>
			</u:notLogin><br>
			<a href="../article/list.do"><img style="padding-top: 24px" src="../image/main/head_btn_req.png"></a>
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
	
	<br><br><br>
	
	<!-- content -->
	<table class='board-name'>
		<tr>
			<td colspan='5'>&nbsp;<img alt="title_img" src="../image/title_bar.gif" style="vertical-align: middle;">묻고답하기</td>
		</tr>
	</table>
		
	<br><br><br>


	<form action="reply.do">
	<table class='board'>
		<tr>
			<td>
			<c:set var="pageNo"	value="${empty param.pageNo ? '1' : param.pageNo}" />
				<a href="list.do?pageNo=${pageNo}"><img alt="[목록]" src="../image/btn_list.gif"></a>
				<a href="write.do"><img alt="[글쓰기]" src="../image/btn_write.gif"></a>
			<c:if test="${authUser.id == articleData.article.writer.id}">
				<a href="modify.do?no=${articleData.article.number}"><img alt="[수정]" src="../image/btn_update.gif"></a>
				<a href="delete.do?no=${articleData.article.number}"><img alt="[삭제]" src="../image/btn_delete.gif"></a>
			</c:if>
			</td>
		</tr>
		<tr>
			<th style="text-align: left; color: #000000"><c:out value='${articleData.article.title}' /></th>
		</tr>
		<tr>
			<td>글쓴이 : ${articleData.article.writer.name} &nbsp;&nbsp; 
				날짜 : <fmt:formatDate value="${articleData.article.regDate}" type="both" dateStyle="short" timeStyle="short"/> &nbsp;&nbsp; 
				조회 : ${articleData.article.readCount}</td>
		</tr>
		
		<tr>
			<td style="color: #000000;"><br><br><br><br><br>
				<u:pre value='${articleData.content}' />
			<br><br><br><br><br></td>
		</tr>
		<tr>
			<td><img alt="[코멘트]" src="../image/btn_comment_insert.gif"></td>
		</tr>
		<tr>
			<td>
				<textarea name="coment" rows="5" cols="132">${param.coment}</textarea>
				<input type="submit" class="coment_submit" style="cursor: pointer" value="">
			</td>
		</tr>
		<tr>
			<td>
			<c:set var="pageNo"	value="${empty param.pageNo ? '1' : param.pageNo}" />
				<a href="list.do?pageNo=${pageNo}"><img alt="[목록]" src="../image/btn_list.gif"></a>
				<a href="write.do"><img alt="[글쓰기]" src="../image/btn_write.gif"></a>
			<c:if test="${authUser.id == articleData.article.writer.id}">
				<a href="modify.do?no=${articleData.article.number}"><img alt="[수정]" src="../image/btn_update.gif"></a>
				<a href="delete.do?no=${articleData.article.number}"><img alt="[삭제]" src="../image/btn_delete.gif"></a>
			</c:if>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>