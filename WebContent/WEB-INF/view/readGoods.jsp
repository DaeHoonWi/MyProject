<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type='text/css' rel='stylesheet' href='../css/index.css'>
<title>제품 상세</title>
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
	
<form method='post' action="../order/wish.do">
	
	<!-- 주문 페이지로 넘길 정보 : 물품코드, 물품이름, 수량, 단가 -->
	
	<input style="display: none;" type="text" name="goodscode" value="${goods.goodscode}">
	<input style="display: none;" type="text" name="goodsname" value="${goods.goodsname}">
	<input style="display: none;" type="text" name="unitprice"  value="${goods.unitprice}">
	<input style="display: none;" type="text" name="seperator" value="${goods.seperator}">
	
	<table border="1">
		
		
		<tr>
			<td rowspan="5"><img width="400" alt="${goods.goodscode}" src="../image/${goods.seperator}/${goods.goodscode}.jpg"></td>
			<td colspan="2">${goods.goodsname}</td>
			
		</tr>
		<tr>
			<td colspan="2"><u:pre value='${goods.comment}' /></td>
		</tr>
		<tr>
			<td>수량:</td>
			<td><input type="text" name="orderamount" value="1"></td>
		</tr>
		<tr>
			<td>금액:</td>
			<td><c:out value='${goods.unitprice}'>내용 없음</c:out></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="구매">
				<c:set var="id" value="${authUser.id}"/>
				<c:if test="${id eq 'test1'}">
				<a href="update.do?no=${goods.goodscode}">[상품정보 업데이트]</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo}" /> 
					<a href="glist.do?pageNo=${pageNo}">[목록]</a> 
				
					
					
					
				
				<!-- 장바구니 담기 기능 & 상품정보 수정 기능 추가해야함, 아래 코드 응용하기 -->
				<%-- <c:if test="${authUser.id == articleData.article.writer.id}">
					<a href="modify.do?no=${articleData.article.number}">[게시글수정]</a>
				</c:if> --%>
			</td>
		</tr>
	</table>
</form>
</body>
</html>