<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>아이스크림 홈런 학습센터</title>
	<link rel="stylesheet" href="/resources/css/common.css">
</head>
<body>
<!-- wrap -->
<div class="wrap">
	<!-- header -->
	<%@ include file="/WEB-INF/views/user/common/header.jsp"%>
	<!-- header -->
	<!-- container -->
	<div class="container sub_container">
		<!-- 상단 이미지 -->
		<!-- // 20190620 수정 -->
		<div class="visual_wrap visual_intro">
			<h2>홈런학습센터 소개</h2>
			<p>학교교육의 최강자 아이스크림 홈런 학습센터를 소개합니다</p>
		</div>
		<!-- // 20190620 수정 -->
		<!--// 상단 이미지 -->
		<!-- 컨텐츠 로케이션 영역 -->
		<!-- 20190620 수정 -->
		<div class="location_wrap">
			<div class="inner">
				<ul>
					<li class="home"><span>홈</span></li>
					<li>홈런학습센터 소개</li>
					<li><strong>학습센터 교사후기</strong></li>
				</ul>
			</div>
		</div>
		<!-- // 20190620 수정 -->
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<div class="inner">
				<!-- 20190620 수정 -->
				<h3>학습센터 교사후기</h3>
				<!-- // 20190620 수정 -->
				<div class="board_list_style">
					<div class="head_area">
						<span class="num">번호</span>
						<span class="tit">제목</span>
						<span class="date">등록일</span>
						<span class="hits">조회수</span>
					</div>
					<ul class="data_list">
						<li>
							<span class="num notice">중요</span>
							<a href="/intro/teacher-review-detail" class="tit">아이스크림홈런 공부방 개설 서울 설명회</a>
							<span class="date">2019.03.05</span>
							<span class="hits">120</span>
						</li>
						<li>
							<span class="num">10</span>
							<a href="#" class="tit">아이스크림홈런 공부방 개설 서울 설명회</a>
							<span class="date">2019.03.05</span>
							<span class="hits">120</span>
						</li>
						<li>
							<span class="num">09</span>
							<a href="#" class="tit">아이스크림홈런 공부방 개설 서울 설명회</a>
							<span class="date">2019.03.05</span>
							<span class="hits">120</span>
						</li>
						<li>
							<span class="num">08</span>
							<a href="#" class="tit">아이스크림홈런 공부방 개설 서울 설명회</a>
							<span class="date">2019.03.05</span>
							<span class="hits">120</span>
						</li>
						<li>
							<span class="num">07</span>
							<a href="#" class="tit">아이스크림홈런 공부방 개설 서울 설명회</a>
							<span class="date">2019.03.05</span>
							<span class="hits">120</span>
						</li>
						<li>
							<span class="num">06</span>
							<a href="#" class="tit">아이스크림홈런 공부방 개설 서울 설명회</a>
							<span class="date">2019.03.05</span>
							<span class="hits">120</span>
						</li>
						<li>
							<span class="num">05</span>
							<a href="#" class="tit">아이스크림홈런 공부방 개설 서울 설명회</a>
							<span class="date">2019.03.05</span>
							<span class="hits">120</span>
						</li>
						<li>
							<span class="num">04</span>
							<a href="#" class="tit">아이스크림홈런 공부방 개설 서울 설명회</a>
							<span class="date">2019.03.05</span>
							<span class="hits">120</span>
						</li>
						<li>
							<span class="num">03</span>
							<a href="#" class="tit">아이스크림홈런 공부방 개설 서울 설명회</a>
							<span class="date">2019.03.05</span>
							<span class="hits">120</span>
						</li>
						<li>
							<span class="num">02</span>
							<a href="#" class="tit">아이스크림홈런 공부방 개설 서울 설명회</a>
							<span class="date">2019.03.05</span>
							<span class="hits">120</span>
						</li>
						<li>
							<span class="num">01</span>
							<a href="#" class="tit">아이스크림홈런 공부방 개설 서울 설명회</a>
							<span class="date">2019.03.05</span>
							<span class="hits">120</span>
						</li>
					</ul>
					<div class="paging_area">
						<button type="button" class="btn_page_pre"></button>
						<a href="#" class="current">1</a></span>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						<button type="button" class="btn_page_next"></button>
					</div>
				</div>
			</div>
		</div>
		<!-- // contents-->
	</div>
	<!-- // container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/common/footer.jsp"%>
	<!-- // footer -->
</div>
<!--// wrap -->
<script src="/resources/js/jquery-1.9.1.min.js"></script>
<script src="/resources/js/default.js"></script>
</body>
</html>
