<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type='text/css' rel='stylesheet' href='../css/index.css'>
<title>주문 입력</title>
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
	
	<br><br>
	
	<!-- content -->
	
	<form method='post' action="buy.do">
	<!-- 결제 페이지로 넘길 정보 : 	아이디, 주소, 총계 / 물품코드, 수량, 합계
									주문코드는 order에서 받아오기-->
	<input style="display: none;" type="text" name="id" value="${authUser.id}">
	<input style="display: none;" type="text" name="extendedprice" value="${savedGoods.extendedprice}">
	<input style="display: none;" type="text" name="goodscode" value="${savedGoods.goodscode}">
	<input style="display: none;" type="text" name="orderamount" value="${savedGoods.orderamount}">
	<input style="display: none;" type="text" name="orderprice" value="${savedGoods.orderprice}">
	
	
	<div class='buy_title'>
		<img alt="상품문의" src="../image/ka_cart_tit2.gif" style="padding-bottom: 10px;"><br>
	<img alt="부가설명" src="../image/ka_cart_txt.gif" style="padding-bottom: 13px;">
	</div>
	
<table class='item_table'>
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
<div style="width: 1150px; margin-left: auto; margin-right: auto; text-align: center; padding: 15px 0px 30px 0px;">
	<a href=""><img alt="수량변경" src="../image/cart_btn2.gif"></a>
	<a href=""><img alt="삭제하기" src="../image/cart_btn3.gif"></a>
	<a href=""><img alt="계속 둘러보기" src="../image/cart_btn4.gif"></a>
</div>

<!-- 주문 상세정보 입력 테이블 -->
<div class="buy_title">
<img alt="상품문의작성" src="../image/ka_order_info1.gif" style="padding-bottom: 10px">
</div>
<table class="board">
	
	<tr>
		<td class="order_sub" style="border-top: 2px solid #d9dcd4;">이 름</td>
		<td class="order_con" style="border-top: 2px solid #d9dcd4;"><input type="text" name="ordername" value="${authUser.name}"></td>
		<td/>
	</tr>
	<tr>
		<td class="order_sub">생년월일</td>
		<td class="order_con"><input type="text" name="birth" value=""></td>
		<td/>
	</tr>
	<tr>
		<td class="order_sub">전화번호</td>
		<td class="order_con"><input type="text" name="phonenum" value=""></td>
		<td/>
	</tr>
	<tr>
		<td class="order_sub">E-mail</td>
		<td class="order_con" style="color: #ff0000"><input type="text" name="email" value=""><br>
		*상품문의 내용이 이메일로 발송되므로, 정확한 이메일 주소를 입력해주세요.</td>
		<td/>
	</tr>
	<tr>
		<td class="order_sub">주소</td>
		<td class="order_con"><input type="text" name="destination" value=""></td>
		<td/>
	</tr>
	<tr>
		<td class="order_sub" style="border-bottom: 1px; border-color: #d9dcd4">상세내용</td>
		<td class="order_con" style="border-bottom: 1px; border-color: #d9dcd4"><textarea name="detail" rows="8" cols="55">${param.detail}</textarea></td>
		<td/>
	</tr>
	
	<tr>
		<td colspan="2" class="board-bottom-line" style="text-align: center;">
			<input class="order_com_button" type="submit" value="">
		<td/>
	</tr>
</table>
</form>

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