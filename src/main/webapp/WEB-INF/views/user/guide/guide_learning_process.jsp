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
		<div class="visual_wrap visual_guide">
			<h2>학습안내</h2>
			<p>아이스크림 홈런 학습센터의 체계적인 학습 프로그램을 만나보세요</p>
		</div>
		<!--// 상단 이미지 -->
		<!-- 컨텐츠 로케이션 영역 -->
		<div class="location_wrap">
			<div class="inner">
				<ul>
					<li class="home"><span>홈</span></li><!-- 190429 a태그 삭제, span태그 추가 -->
					<li>학습안내</li><!-- 190429 a태그 삭제 -->
					<li><strong>학습프로세스</strong></li><!-- 190429 a태그 삭제 -->
				</ul>
			</div>
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<div class="wrap_learning_process">
				<div class="title_banner">
					<div class="inner">
						<h3 class="title">학습프로세스</h3>
						<p class="desc">홈런 선생님이 계획해 주시는 오늘의 학습을 통해<br> 자연스럽게 학습 습관이 형성됩니다.</p>
					</div>
				</div>
				<section class="section_today">
					<div class="inner">

						<h4 class="section_title">오늘의 학습이란?</h4>
						<!-- 20190621 문구수정 -->
						<p class="section_desc">홈런 선생님은 학생에 맞는 개인별 맞춤 학습계획을 세우고, 학생은 스스로 &lt;오늘의 학습&gt;을 그날그날 공부합니다</p>
						<!--  // 20190621 문구수정 -->
						<ol class="step_list">
							<li>
								<div class="circle">
									<span class="flag">STEP<strong>01</strong></span>
									<ul>
										<li>교과학습</li>
										<li>개념학습</li>
									</ul>
								</div>
								<!-- 20190621 문구수정 -->
								<p class="exp">홈런학습기(홈런북)로 교과서<br> 내용을 이해하고 예습,복습</p>
								<!-- // 20190621 문구수정 -->
							</li>
							<li>
								<div class="circle">
									<span class="flag">STEP<strong>02</strong></span>
									<ul>
										<li>실력평가</li>
										<li>단원평가</li>
										<li>서술형 문제</li>
									</ul>
								</div>
								<p class="exp">오답노트와 유사문제까지<br> 학습하여 학교시험대비</p>
							</li>
							<li>
								<div class="circle">
									<span class="flag">STEP<strong>03</strong></span>
									<ul>
										<!-- 190412 수정 -->
										<li>선생님과 함께하는<br>확인학습</li>
										<!-- // 190412 수정 -->
									</ul>
								</div>
								<p class="exp">선생님과 함께 주요개념을<br> 지면학습으로 다시 한번 확인</p>
							</li>
							<li>
								<div class="circle">
									<span class="flag">STEP<strong>04</strong></span>
									<ul>
										<li>개념노트 정리</li>
									</ul>
								</div>
								<p class="exp">학습리포트로 하루동안<br> 배운 내용 정리</p>
							</li>
						</ol>
					</div>
				</section>
				<section class="section_contents">
					<div class="inner">
						<h4 class="section_title">모든 아이가 즐겁게 공부하는 홈런 콘텐츠</h4>
						<p class="section_desc">아이스크림 홈런에서 아이에게 유익하고 다양한 콘텐츠를 만나실 수 있습니다.</p>
						<ul class="contents_list">
							<li class="contents01">
								<strong class="subject">학교공부예복습</strong>
								<p class="cont">
									초등 필수 주요과목 탑재!<br>
									<strong>학교 공부 단원/쪽수까지 100%연계</strong>됨은 물론<br>
									집에서도 재미있게 공부하실 수 있습니다.
								</p>
							</li>
							<li class="contents02">
								<strong class="subject">학교시험대비</strong>
								<p class="cont">
									시험대비 특강부터 선생님이<br>
									별표친 족집게 시험 적중 문제까지!<br>
									틀려도 걱정 끝!<br>
									오답노트로 <strong>시험, 완벽하게 대비하세요.</strong>
								</p>
							</li>
							<li class="contents03">
								<strong class="subject">학교숙제해결</strong>
								<p class="cont">
									초등 자녀의 숙제는 엄마숙제?NO!<br>
									자녀 스스로 방대한 숙제 자료 제공은 물론<br>
									<strong>전학년 전과목의 교과서 내용과 해답까지<br>
									모두 수록한 핵심전과까지!!</strong>
								</p>
							</li>
							<li class="contents04">
								<strong class="subject">심화특별학습</strong>
								<p class="cont">
									특별한 우리 아이를 위한<br>
									특별한 학습!<br>
									<strong>아이의 재능에 맞는 한자/영역별수학/연산력/<br>
									역사/실험</strong>
								</p>
							</li>
							<li class="contents05">
								<strong class="subject">글로벌리더십</strong>
								<p class="cont">
									공부하느라 너무 바쁜 우리 아이<br>
									혹시 인성/창의성 교육은 놓치고 계신가요?<br>
									<strong>바른 인성의 창의적인 우리 아이가<br>
									글로벌 리더로 성장합니다!</strong>
								</p>
							</li>
							<li class="contents06">
								<strong class="subject">학습사전</strong>
								<p class="cont">
									궁금한게 있으면스마트폰 꺼내서 검색하는<br>
									우리 아이.<br>
									그러다 보면 삼천포로 빠져요~<br>
									<strong>홈런에서 바로 바로 검색하는 모든 학습 사전!</strong>
								</p>
							</li>
						</ul>
					</div>
				</section>
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
