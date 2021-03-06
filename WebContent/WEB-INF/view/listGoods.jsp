<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type='text/css' rel='stylesheet' href='../css/index.css'>
<title>환영합니다. ${goodsPage.content}</title>
</head>
<body>
	<!-- header -->
	<header>
	<div class='header-ac'>
		<div class='h-l'>
			<a href="../index.do"><img src="../image/main/logo.png"></a>
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
					<td><a href="../order/list.do?id=${authUser.id}">마이페이지</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="../member/changePwd.do">정보수정</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="../article/list.do">고객센터</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<c:set var="id" value="${authUser.id}"/>
					<c:if test="${id eq 'test1'}">
					<td colspan="5"><a href="../goods/insert.do">상품추가</a></td>
					</c:if>
				</tr>
			</table>
			</u:isLogin>
			<u:notLogin>
			<table class='inform'>
				<tr>
					<td><a href="../member/login.do">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="../member/join.do">회원가입</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="../article/list.do">고객센터</a></td>
				</tr>
			</table>
			</u:notLogin><br>
			<a href="../article/list.do"><img style="padding-top: 26px" src="../image/main/head_btn_req.png"></a>
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
	
	<br><br><br><br><br>
	
	<!-- 베스트셀러 -->
	<div class='best5-goods' style="background-image: url('../image/${goodsPage.sep}/Z.jpg');">
	<table style="margin-left: 30px;">
	<c:if test="${BestGoodsPage.hasNoGoods()}">
		<tr>
			<td>상품이 없습니다.</td>
		</tr>
		</c:if>
		<tr>
			<td>
			<div style="position: absolute;">
			<img class="best5-1" src="../image/best_icon_ranking.png">
			<img class="best5-2" src="../image/best_icon_ranking.png">
			<img class="best5-3" src="../image/best_icon_ranking.png">
			<img class="best5-4" src="../image/best_icon_ranking.png">
			<img class="best5-5" src="../image/best_icon_ranking.png">
			</div>
			<c:forEach var='goods' items='${BestGoodsPage.content}'>
				<div class="best5-divide"><a href="gread.do?no=${goods.goodscode}&pageNo=${goodsPage.currentPage}">
					<img alt="${goods.goodsname}" src="../image/${goods.seperator}/${goods.goodscode}.jpg" width="170" height="227"><br> 
					${goods.goodsname}</a><br>
					<fmt:formatNumber value="${goods.unitprice}" pattern="#,###.##"/>원
				</div>
			</c:forEach>
			
			
			</td>
		<tr>
	</table>
	</div>
	
	<!-- 상품목록 -->
	<div class='divide-os'>
	<table>
		<c:if test="${goodsPage.hasNoGoods()}">
		<tr>
			<td>상품이 없습니다.</td>
		</tr>
		</c:if>
		<tr>
			<c:forEach var='goods' items='${goodsPage.content}'>
				<td class="divide"><a href="gread.do?no=${goods.goodscode}&pageNo=${goodsPage.currentPage}">
					<img alt="${goods.goodsname}" src="../image/${goods.seperator}/${goods.goodscode}.jpg" 
					style="border:1px solid #d9f0f7;" width="170" height="227"><br> 
					${goods.goodsname}</a><br>
					<fmt:formatNumber value="${goods.unitprice}" pattern="#,###.##"/>원
				</td>
			</c:forEach>
		<tr>	
		<c:if test="${goodsPage.hasGoods()}">
		<tr>
			<td colspan='5' style="text-align: center;">
				<c:if test="${goodsPage.startPage > 5 }">
				<a href="glist.do?pageNo=${goodsPage.startPage - 5}">[이전]</a>
				</c:if>
				<c:forEach var="pNo" begin="${goodsPage.startPage}" end="${goodsPage.endPage}">
					<a class='pageNumber' href="glist.do?pageNo=${pNo}">${pNo}</a>
				</c:forEach>
				<c:if test="${goodsPage.endPage <goodsPage.totalPages}">
				<a href="glist.do?pageNo=${goodsPage.startPage + 5}">[다음]</a>
				</c:if>
			</td>
		</tr>
		</c:if>
	</table>
	</div>
	
	<!-- bottom nav -->
	<nav class='bottom-nav'>
		<ul>
			<li><a href='../bnav/company.do'>회사소개</a></li>
			<li><a href='../bnav/howCome.do'>오시는길</a></li>
			<li><a href='../bnav/personalInfo.do' style='color:#ff0000;'>개인정보처리방침</a></li>
			<li><a href='../article/list.do'>고객센터</a></li>
			<li><a href='../article/list.do'>제휴문의</a></li>
		</ul>
	</nav>

	<!-- footer -->
	<footer>
	<div>
		<div>
			<img src="../image/main/foot_logo.png">
		</div>
		<div>
			<p>
				상호 : 00주류백화점 123점 대표자명 : 000 사업자등록번호 : 111-11-11111<br /> 주소 :
				서울00구 00동 111-11 <br /> ※ 내비게이션에 주소입력 시 단지가 넓어 다른 곳으로 도착합니다. 꼭
				'0000000'을 검색해주세요.<br /> 고객센터 : 11-111-1111 / 11-111-1111 FAX :
				11-111-1111 메일 : 00000000@naver.com<br /> Copyrightⓒ
				000000000000000000, All rights reserved.<br /> ※ 온라인 상에서는 판매가
				불가합니다.
			</p>
		</div>
		<div>
			<img alt="qrcode" src="../image/foot_cross.gif">
		</div>
	</div>
	</footer>
</body>
</html>