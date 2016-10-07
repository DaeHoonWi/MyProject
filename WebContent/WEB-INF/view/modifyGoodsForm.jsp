<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type='text/css' rel='stylesheet' href='../css/index.css'>
<title>상품 수정 폼</title>
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
			<td colspan='5'>&nbsp;<img alt="title_img" src="../image/title_bar.gif" style="vertical-align: middle;">상품 설정</td>
		</tr>
	</table>
		
	<br><br><br>
	
	<form action="update.do" method="post">
	
	<!-- 상품코드 넘기기 -->
	<input type="hidden" name="no" value="${modReq.goodscode}">
	
		<table class="board">
			<tr class="board_write_table_top">
				<th colspan="2">상품 업데이트</th>
				<td/>
			</tr>
			<tr>
				<th class="order_sub">· 수량</th>
				<td class="order_con"><input type="text" name="goodsamount" value="${modReq.goodsamount}"> 
					<c:if test="${errors.goodsamount}">수량을 입력하세요.</c:if></td>
				<td/>
			</tr>
			<tr>
				<th class="order_sub">· 단가</th>
				<td class="order_con"><input type="text" name="unitprice" value="${modReq.unitprice}">
				<c:if test="${errors.unitprice}">단가를 입력하세요.</c:if></td>
				<td/>
			</tr>
			<tr>
				<th class="order_sub">· 물품명</th>
				<td class="order_con"><input type="text" name="goodsname" value="${modReq.goodsname}">
				<c:if test="${errors.goodsname}">물품명을 입력하세요.</c:if></td>
				<td/>
			</tr>
			<tr>
				<th class="order_sub">· 분류</th>
				<td class="order_con">
					<c:set var="sep" value="${modReq.seperator}"/>
					<table>
						<tr>
							<td>
								<c:if test="${sep eq '와인'}"><input type="radio" name="seperator" value="와인" checked="checked"></c:if>
								<c:if test="${sep ne '와인'}"><input type="radio" name="seperator" value="와인"></c:if>와인
							</td>
							<td>
								<c:if test="${sep eq '위스키'}"><input type="radio" name="seperator" value="위스키" checked="checked"></c:if>
								<c:if test="${sep ne '위스키'}"><input type="radio" name="seperator" value="위스키"></c:if>위스키
							</td>
							<td>
								<c:if test="${sep eq '브랜디'}"><input type="radio" name="seperator" value="브랜디" checked="checked"></c:if>
								<c:if test="${sep ne '브랜디'}"><input type="radio" name="seperator" value="브랜디"></c:if>브랜디
							</td>
							<td>
								<c:if test="${sep eq '꼬냑'}"><input type="radio" name="seperator" value="꼬냑" checked="checked"></c:if>
								<c:if test="${sep ne '꼬냑'}"><input type="radio" name="seperator" value="꼬냑"></c:if>꼬냑
							</td>
							<td>
								<c:if test="${sep eq '리큐르'}"><input type="radio" name="seperator" value="리큐르" checked="checked"></c:if>
								<c:if test="${sep ne '리큐르'}"><input type="radio" name="seperator" value="리큐르"></c:if>리큐르
							</td>
						</tr>
						<tr>
							<td>
								<c:if test="${sep eq '보드카'}"><input type="radio" name="seperator" value="보드카" checked="checked"></c:if>
								<c:if test="${sep ne '보드카'}"><input type="radio" name="seperator" value="보드카"></c:if>보드카
							</td>
							<td>
								<c:if test="${sep eq '민속주'}"><input type="radio" name="seperator" value="민속주" checked="checked"></c:if>
								<c:if test="${sep ne '민속주'}"><input type="radio" name="seperator" value="민속주"></c:if>민속주
							</td>
							<td>
								<c:if test="${sep eq '중국술'}"><input type="radio" name="seperator" value="중국술" checked="checked"></c:if>
								<c:if test="${sep ne '중국술'}"><input type="radio" name="seperator" value="중국술"></c:if>중국술
							</td>
							<td>
								<c:if test="${sep eq '사케'}"><input type="radio" name="seperator" value="사케" checked="checked"></c:if>
								<c:if test="${sep ne '사케'}"><input type="radio" name="seperator" value="사케"></c:if>사케
							</td>
							<td>
								<c:if test="${sep eq '미니어쳐'}"><input type="radio" name="seperator" value="미니어쳐" checked="checked"></c:if>
								<c:if test="${sep ne '미니어쳐'}"><input type="radio" name="seperator" value="미니어쳐"></c:if>미니어쳐
							</td>
						</tr>
						<tr>
							<td><c:if test="${errors.seperator}">분류를 선택하세요.</c:if></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<th class="order_sub">· 상품설명:</th>
				<td class="order_con"><textarea name="comment" rows="5" cols="30">${modReq.comment}</textarea></td>
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