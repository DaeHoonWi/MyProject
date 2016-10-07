<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- 단위 변환 태그 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type='text/css' rel='stylesheet' href='../css/index.css'>
<link type="">
<title>주문 목록</title>
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
	
	<br><br>
	
	<!-- content -->
	<table class='board-name'>
		<tr>
			<td colspan='5'>&nbsp;<img alt="title_img" src="../image/title_bar.gif" style="vertical-align: middle;">주문 확인</td>
		</tr>
	</table>
		
	<br><br><br>
	
	
	<table class='item_table'>
		
	<tr>
		<td colspan="7">(주문날짜)</td>
	</tr>
	<tr>
		<td class="item_table_left"/>
		<th colspan='2' style="width: 600px;">상품정보</th>
		<th style="width: 50px;">수량</th>
		<th style="width: 100px;">판매가격</th>
		<th>합계</th>
		<td class="item_table_right"/>
	</tr>


	<c:if test="${! empty savedGoods}">
	<tr>
		<td/>
		<td style="width: 50px;"><img class='goods-img' src="../image/${savedGoods.seperator}/${savedGoods.goodscode}.jpg"></td>
		<td style="text-align: left;">${savedGoods.goodsname}</td>
		<td class='goods'>${savedGoods.orderamount}</td>
		<td class='goods'><fmt:formatNumber value="${savedGoods.unitprice}" pattern="#,###.##"/>원</td>		<!-- 단가 -->
		<td class='goods'><fmt:formatNumber value="${savedGoods.orderprice}" pattern="#,###.##"/>원</td> 	<!-- 총계 -->
		<td/>
	</tr>
	<tr style="border-top: 1px solid #d9dcd4; border-bottom: 2px solid #d9dcd4;">
		<td/>
		<td/>
		<td/>
		<td/>
		<td/>
		<td class="extendedprice"><fmt:formatNumber value="${savedGoods.extendedprice}" pattern="#,###.##"/>원</td>
		<td/>
	</tr>
	</c:if>
	
	<c:if test="${empty savedGoods}">
	<tr>
		<td/>
		<td colspan='5'>구매할 상품이 없습니다.</td>
		<td/>
	</tr>
	</c:if>
</table>
		<table>
		
		<tr>
			<th>주문한 사람</th>
			<td></td>
		</tr>
		<tr>
			<th>주소</th>
			<td></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td></td>
		</tr>
		<tr>
			<th>기타 사항</th>
			<td></td>
		</tr>
	</table>
	
	
	<table class='board'>
		<tr>
			<td colspan='5' style="text-align: right;">게시물 ${articlePage.total}건</td>
		</tr>
		<tr style="border-top: 2px solid #8080ff;">
			<th style="width: 50px;">번호</th>
			<th style="width: 850px;">제목</th>
			<th style="width: 110px;">글쓴이</th>
			<th style="width: 60px;">날짜</th>
			<th>조회수</th>
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
				<a href="list.do?pageNo=${articlePage.startPage - 5}"><img alt="[이전]" src="../image/page_prev.gif"></a>
				</c:if>
				<c:forEach var="pNo" begin="${articlePage.startPage}" end="${articlePage.endPage}">
					<a class='pageNumber' href="list.do?pageNo=${pNo}">${pNo}&nbsp;</a>
				</c:forEach>
				<c:if test="${articlePagel.endPage <articlePage.totalPages}">
				<a href="list.do?pageNo=${articlePage.startPage + 5}"><img alt="[다음]" src="../image/page_next.gif"></a>
				</c:if>
			</td>
		</tr>
	</c:if>
		<tr>
			<td colspan='5' style="text-align: right;"><a href="write.do"><img alt="글쓰기" src="../image/btn_write.gif"></a></td>
		</tr>
	</table>
	
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