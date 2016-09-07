<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type='text/css' rel='stylesheet' href='css/index.css'>
<title>환영합니다.</title>
</head>
<body>
	<header>
	<div class='header-ac'>
		<div class='h-l'>
			<a href="index.jsp"><img
				src="image/main/logo.png"></a>
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
			<img src="image/main/head_btn_req.png">
		</div>
	</div>

	</header>
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
	<div id='visual'>
		<a href=''><img src="image/main/main_visual_img01.jpg"></a>
	</div>
	<div class='best5'></div>
	<div class='item'>
		<img src="image/main/main_wine/main_title_ca10.png">
		<img class='item_btn_more' src="image/main/item_btn_more.png">
		<div class='item-os'>
			<img class='item-main' src="image/main/main_wine/main_item_ca10.jpg">
			<img class='item-group' src="image/main/main_wine/8330508678_m.jpg">
			<img class='item-group' src="image/main/main_wine/8330890014_m.jpg">
			<img class='item-group' src="image/main/main_wine/8743468680_m.jpg">
			<img class='item-group' src="image/main/main_wine/8746217183_m.jpg">
			<img class='item-group' src="image/main/main_wine/8747388977_m.jpg">
			<img class='item-group' src="image/main/main_wine/8790000327_m.jpg">
			<img class='item-group' src="image/main/main_wine/8991368031_m.jpg">
			<img class='item-group' src="image/main/main_wine/9704591046_m.jpg">
			<img class='item-group' src="image/main/main_wine/9972166109_m.jpg">
			<img class='item-group' src="image/main/main_wine/9974612171_m.jpg">
		</div>
		<p>----------------------------------------------------------------------------------------------------------------------------------------------</p>
	</div>
	<div class='item'>
		<img class='main_title'	src="image/main/main_whisky/main_title_ca20.png">
		<img class='item_btn_more' src="image/main/item_btn_more.png">
		<div class='item-os'>
			<img class='item-main' src="image/main/main_whisky/main_item_ca20.jpg">
			<img class='item-group' src="image/main/main_whisky/8135855703_m.jpg">
			<img class='item-group' src="image/main/main_whisky/8136135652_m.jpg">
			<img class='item-group' src="image/main/main_whisky/8908152968_m.jpg">
			<img class='item-group' src="image/main/main_whisky/9009732154_m.jpg">
			<img class='item-group' src="image/main/main_whisky/9091597750_m.jpg">
			<img class='item-group' src="image/main/main_whisky/9091665515_m.jpg">
			<img class='item-group' src="image/main/main_whisky/9704147093_m.jpg">
			<img class='item-group' src="image/main/main_whisky/9704219421_m.jpg">
			<img class='item-group' src="image/main/main_whisky/9715940937_m.jpg">
			<img class='item-group' src="image/main/main_whisky/9716329437_m.jpg">
		</div>
	</div>
	<nav class='bottom-nav'>
		<ul>
			<li><a href=''>회사소개</a></li>
			<li><a href=''>오시는길</a></li>
			<li><a href='' style='color:#ff0000;'>개인정보처리방침</a></li>
			<li><a href=''>고객센터</a></li>
			<li><a href=''>제휴문의</a></li>
		</ul>
	</nav>
	<footer>
	<div>
	<div><img src="image/main/foot_logo.png"></div>
	<div><p>
	상호 : 00주류백화점 123점 대표자명 : 000 사업자등록번호 : 111-11-11111<br />
	주소 : 서울00구 00동 111-11 <br />
	※ 내비게이션에 주소입력 시 단지가 넓어 다른 곳으로 도착합니다. 꼭 '0000000'을 검색해주세요.<br />
	고객센터 : 11-111-1111 / 11-111-1111 FAX : 11-111-1111 메일 : 00000000@naver.com<br />
	Copyrightⓒ 000000000000000000, All rights reserved.<br />
	※ 온라인 상에서는 판매가 불가합니다.</p></div>
	</div>
	 </footer>
</body>
</html>