<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type='text/css' rel='stylesheet' href='../css/index.css'>
<title>상품 입력 폼</title>
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
	
	<br><br>
	
	<!-- content -->
	<table class='board-name'>
		<tr>
			<td colspan='5'>&nbsp;<img alt="title_img" src="../image/title_bar.gif" style="vertical-align: middle;">상품 설정</td>
		</tr>
	</table>
		
	<br><br><br>
	
	<form action="insert.do" method="post">
		<table class="board">
			<tr class="board_write_table_top">
				<th colspan="2">상품 등록</th>
				<td/>
			</tr>
			<tr>
				<th class="order_sub">· 수량</th>
				<td class="order_con"><input type="text" name="goodsamount" value="${param.goodsamount}"> 
					<c:if test="${errors.goodsamount}">수량을 입력하세요.</c:if></td>
				<td/>
			</tr>
			<tr>
				<th class="order_sub">· 단가</th>
				<td class="order_con"><input type="text" name="unitprice" value="${param.unitprice}">
				<c:if test="${errors.unitprice}">단가를 입력하세요.</c:if></td>
				<td/>
			</tr>
			<tr>
				<th class="order_sub">· 물품명</th>
				<td class="order_con"><input type="text" name="goodsname" value="${param.goodsname}">
				<c:if test="${errors.goodsname}">물품명을 입력하세요.</c:if></td>
				<td/>
			</tr>
			<tr>
				<th class="order_sub">· 분류</th>
				<td class="order_con">
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
				<th class="order_sub">· 상품설명:</th>
				<td class="order_con"><textarea name="comment" rows="5" cols="30">${param.comment}</textarea></td>
				<td/>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input class="order_com_button" type="submit" value="" >
					${ctxPath = pageContext.request.contextPath; ''}
					<a href="${ctxPath}/index.jsp">[취소]</a>
				</td>
				<td/>
			</tr>
		</table>
	</form>
</body>
</html>