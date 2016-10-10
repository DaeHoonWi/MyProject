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
	
	<br><br>
	<!-- content -->
	<div class="company_con" style="text-align: left;">
	<p>개인정보처리방침</p>
	<table>
		<tr>
			<td class="persnolInfo_con">
			<u:pre value='
[개인정보처리방침]

1. 총칙

1) 가자주류백화점 광진점은 가자주류백화점 광진점 고객님의 개인정보를 매우 중요하게 생각합니다.
2) 회사는 고객의 개인정보를 적극적으로 보호하고, 『개인정보 보호법』, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 등 개인정보 관련 모든 법령을 준수하기 위하여 개인정보처리방침을 제정하고 이를 준수하고 있습니다.
3) 회사는 개인정보처리방침을 통해 고객의 어떤 개인정보 항목이 어떤 목적으로 수집되고 있으며 어떻게 보호조치가 되고 있는지에 대해 알려 드리며, 이는 관련 법령 및 지침?내부 운영방침의 변경에 따라 변경될 수 있습니다. 만약 변경사항이 발생할 경우에는 관련 법령이 정하는 방법에 따라 고지함을 알려 드립니다.


2. 개인정보 수집 및 이용 목적, 항목 

회사가 고객의 개인정보를 수집하는 것은 원활한 서비스 제공을 하기 위해서 입니다. 단, 고객이 서비스 혜택 정보 제공을 원치 않는다는 의사를 명확히 밝히는 경우 정보 수집을 하지 않으며, 이 경우 정보 미 제공으로 인해 발생되는 불이익에 대해서는 회사가 책임지지 않습니다.

1) 수집 목적, 수집 항목  
가자주류백화점 광진점은 회원 식별 및 서비스 제공을 위하여 아래와 같은 개인정보를 수집하고 있습니다.
- 이름, ID, 비밀번호, 생년월일, 이름, 주소, 휴대전화번호, 이메일
- 서비스 이용 기록, 접솔로그, 쿠키, 접속 IP정보 등


3. 개인정보 수집방법 

회사는 다음의 각 호와 같은 방법으로 개인정보를 수집합니다.

1) 홈페이지(회원가입)
2) 상품문의글 작성
3) 로그 분석 프로그램을 통한 생성 정보 수집
4) 쿠키(cookie)에 의한 정보 수집


4. 개인정보의 보유 및 이용기간
 
1) 회사는 수집된 고객의 개인정보는 회원탈퇴 등 수집 및 이용목적이 달성되거나 동의철회 요청이 있는 경우 지체 없이 파기함을 원칙으로 합니다. 

보유 및 이용기간: 회원탈퇴 후 5일까지

2) 회사의 개인정보 파기방법은 다음과 같습니다. 

 가. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기 
 나. 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제


5. 개인정보의 제3자 제공

회사는 고객의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
- 고객이 사전에 동의한 경우 
- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우


6. 이용자 및 법정대리인 권리와 그 행사방법

1) 고객(만 14세 미만의 경우 그 법정대리인 포함)은 언제든지 등록되어 있는 개인정보를 열람하거나 정정할 수 있습니다. 개인정보 열람 및 정정을 하고자 할 경우에는 회사 홈페이지의 “정보수정” 항목을 클릭하여 직접 열람 또는 정정하거나, 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다.
2) 고객이 개인정보의 오류에 대한 정정을 요청한 경우, 정정을 완료하기 전까지 당해 개인 정보를 이용 또는 제공하지 않습니다.
3) 고객(만 14세 미만의 경우 그 법정대리인 포함)은 회원가입 등을 통해 개인정보의 수집, 이용, 제공에 대해 동의한 내용을 언제든지 철회할 수 있습니다. 동의철회는 회사 홈페이지의 “마이페이시” 항목의 『회원탈퇴』를 클릭하거나 고객센터로 연락하면 즉시 개인정보의 삭제 등 필요한 조치를 하겠습니다. 


7. 고객의 의무 

1) 고객은 자신의 개인정보를 보호할 의무가 있으며, 고객 본인의 부주의 등으로 개인정보가 유출되어 발생한 문제에 대해서는 회사는 일체의 책임을 지지 않습니다.
2) 고객의 개인정보를 최신의 상태로 정확하게 입력하시기 바랍니다. 고객의 부정확한 정보입력으로 발생하는 문제의 책임은 고객 본인에게 있으며, 타인의 개인정보를 도용하여 회원가입 또는 서비스 이용 시 회원자격 상실과 함께 개인정보에 관한 법률에 의거하여 처벌될 수 있습니다.
3) 고객은 개인정보를 보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 아이디, 비밀번호를 포함한 고객의 개인정보가 유출되지 않도록 조심하시고 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의해 주십시오.
4) 고객은 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『개인정보보호법』 등 기타 개인정보에 관한 법률을 준수하여야 합니다. 


8. 개인정보의 자동수집장치의 설치, 운영 및 그 거부에 관한 사항 
1) 개인정보의 자동수집장치 설치,운영 회사는 고객에게 보다 적절하고 유용한 서비스를 제공하기 위하여 ‘쿠키(cookie)’를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버가 사용자의 브라우저에 보내는 소량의 텍스트 파일로서 사용자의 컴퓨터 하드디스크에 저장되며, 사용자의 컴퓨터는 식별하지만 사용자를 개인적으로 식별하지는 않습니다.
2) 쿠키설정 거부방법
고객은 쿠키 설치에 대한 선택권을 가지고 있습니다. 
사용하는 웹 브라우저의 옵션을 설정함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 단, 쿠키의 저장을 거부할 경우 로그인이 필요한 일부 서비스의 이용에 제한이 생길 수 있습니다.

쿠키 설치 허용 여부를 지정하는 방법(Internet Explorer의 경우)
   1) [도구] 메뉴에서 [인터넷 옵션]을 선택
   2) [개인정보]를 클릭
   3) [고급]을 클릭
   4) 쿠키 허용여부를 선택



9. 개인정보관리책임자 성명 및 연락처

회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다. 

고샛서비스담당 부사: 고객센터
전화번호: 02-456-3130

개인정보관리책임자 성명: 이송민
전화번호: 02-456-3130
이메일: kkajacokr@naver.com

고객은 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 신고사항에 대해 신속하고 충분한 답변을 드릴 것입니다.              

			' />
			</td>
		</tr>
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