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
		<div class="visual_wrap visual_recruit">
			<h2>교사채용</h2>
			<p>아이스크림 홈런과 함께 진정한 교육 전문가로 성장하세요</p>
		</div>
		<!--// 상단 이미지 -->
		<!-- 컨텐츠 로케이션 영역 -->
		<div class="location_wrap">
			<div class="inner">
				<ul>
					<li class="home"><span>홈</span></li><!-- 190429 a태그 삭제, span태그 추가 -->
					<li>교사채용</li><!-- 190429 a태그 삭제 -->
					<li><strong>홈런선생님은?</strong></li><!-- 190429 a태그 삭제 -->
				</ul>
			</div>
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<div class="inner">
				<h3>홈런선생님은?</h3>
				<div class="wrap_recruit_teacher">
					<section class="section_class">
						<strong class="section_title">홈런선생님은 이렇게 수업합니다</strong>
						<p class="section_desc">
							아이스크림 홈런 콘텐츠로 수업을 운영 중인 선생님의 이야기를 들어보세요.<br>
							왜 아이스크림 홈런 학습센터를 시작했는지 아이스크림 홈런 학습센터의 장점은 무엇인지 직접 듣고 결정하세요.
						</p>
						<!-- 190507 동영상 수정 -->
						<div class="video_wrap">
							<iframe width="854" height="480" src="https://www.youtube.com/embed/9eps2B5S0UA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div>
						<!-- //190507 동영상 수정 -->
						<ul class="class_list">
							<li>
								<strong>아이스크림</strong>
								<p>홈런콘텐츠에 대한 신뢰</p>
							</li>
							<li>
								<strong>학습기를 통한 반복학습</strong>
								<p>스스로 개념과 문제풀이 반복학습가능 </p>
							</li>
							<li>
								<strong>홈런학습센터</strong>
								<p>아이들이 스스로 공부하는 습관향상</p>
							</li>
						</ul>
					</section>
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
