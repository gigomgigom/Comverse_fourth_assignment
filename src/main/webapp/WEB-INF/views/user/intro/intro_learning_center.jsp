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
		<div class="visual_wrap visual_intro">
			<h2>학습센터소개</h2>
			<p>학교교육의 최강자 아이스크림 홈런 학습센터를 소개합니다</p>
		</div>
		<!--// 상단 이미지 -->
		<!-- 컨텐츠 로케이션 영역 -->
		<div class="location_wrap">
			<!-- 20190624 수정 -->
			<div class="inner">
				<ul>
					<li class="home"><span>홈</span></li>
					<li>학습센터소개</li>
					<li><strong>학습센터란?</strong></li>
				</ul>
			</div>
			<!-- // 20190624 수정 -->
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<div class="wrap_learning_center">
				<div class="title_banner">
					<!-- 20190624 수정 -->
					<div class="inner">
						<h3 class="title">학습센터란?</h3>
						<p class="desc">아이스크림홈런의 우수한 콘텐츠와<br> 우수한 경력의 선생님이 함께하는 학습 서비스 입니다.</p>
					</div>
					<!-- // 20190624 수정 -->
				</div>
				<section class="section_iscream">
					<div class="inner">
						<h4 class="section_title">아이스크림 홈런 학습센터는</h4>
						<p class="section_desc">
							아이스크림 홈런 프로그램을 기반으로 공부하는 학습센터로<br>
							6명 내의 소그룹 수업 모델로 수준별 학습과 학습계획 수립 및 피드백이 가능하여 체계적인 학습습관을 길러줍니다.
						</p>
						<div class="info_list_area">
							<ol class="info_list">
								<li>
									<strong class="num">01</strong>
									<span class="cont">소그룹<br>수업모델</span>
								</li>
								<li>
									<strong class="num">02</strong>
									<span class="cont">주5회<br>일 50분 학습</span>
								</li>
								<li>
									<strong class="num">03</strong>
									<span class="cont">자기주도학습<br>강화</span>
								</li>
							</ol>
						</div>
					</div>
				</section>
				<section class="section_dna">
					<div class="inner">
						<h4 class="section_title">홈런은 교육 DNA가 다릅니다</h4>
						<p class="section_desc">
							전국 초등학교 93%에서 선생님이 직접 선택하여 사용하는 검증된 초등 교수 학습 도구<br><!-- 190412 숫자 수정 : 99 ==> 93 -->
							아이스크림(i-Scream)의 초등 교육 콘텐츠 개발 노하우를 그대로 담았습니다.
						</p>
						<article>
							<h5 class="title"><span>선생님이 매일 수업과 평가에 활용하는 아이스크림 홈런</span></h5>
							<img src="/resources/image/dna_img01.png" alt="">
							<ul class="blind">>
								<li>
									<strong>1위</strong>
									<p>2008년 런칭 이후 8년 연속 시장점유율 1위</p>
								</li>
								<li>
									<strong>93%</strong>
									<p>많은 초등 선생님들이 수업과 평가에 활용</p>
								</li>
								<li>
									<strong>1~6학년</strong>
									<p>전국, 전학년 초등학생들이 매일 만나는 아이스크림</p>
								</li>
							</ul>
						</article>
						<article>
							<h5 class="title"><span>교육 콘텐츠 개발 기술력과 노하우의 DNA</span></h5>
							<img src="/resources/image/dna_img02.png" alt="가입자수 유료학습 전환율 학습 수행률 재가입률 압도적! 1위">
						</article>
					</div>
				</section>
				<section class="section_way">
					<div class="inner">
						<h4 class="section_title">홈런은 관리 방식이 다릅니다</h4>
						<p class="section_desc">
							우수한 홈런 콘텐츠에 대한 정확하고 통찰력 있는 이해를 바탕으로 학습자별로 개별화된 서비스를 제공할 뿐만 아니라, <br>
							홈런 학습 전문가로서 부모에게 올바른 교육 가치를 안내합니다.
						</p>
						<div class="img_wrap">
							<img src="/resources/image/way_img01.png" alt="">
							<div class="blind">
								<strong>1:1코칭</strong>
								<ul>
									<li>학부모앱</li>
									<li>홈페이지</li>
									<li>학습리포트</li>
									<li>오답노트</li>
									<li>서술형문제</li>
									<li>시험적중문제</li>
									<li>워크지</li>
									<li>계획</li>
								</ul>
							</div>
						</div>
						<ul class="way_list">
							<li>
								<strong class="subject">학부모앱/홈페이지</strong>
								<p class="cont">
									홈런 학부모앱과 홈페이지를 통해<br>
									실시간으로 자녀의 학습현황을 확인할 수<br>
									있습니다.
								</p>
							</li>
							<li>
								<strong class="subject">워크지/시험적중문제/서술형문제</strong>
								<p class="cont">
									교과서 내용 예복습으로 학교 공부에<br>
									자신감을 심어줍니다.
								</p>
							</li>
							<li>
								<strong class="subject">학습리포트/오답노트</strong>
								<p class="cont">
									매일 매일 선생님의 학습결과 피드백을<br>
									통해 실수와 결손을 철저히 잡습니다.
								</p>
							</li>
						</ul>
						<div class="way_teacher_area">
							<div class="exp01">
								<em>홈런선생님은</em>
								<p>
									3단계 신입교사 교육을 거쳐 주별, 월별, 분기별로<br>
									체계적인 커리큘럼에 따라 교육을 받고 있는<br>
									초등 학습 전문가 입니다.
								</p>
							</div>
							<div class="exp02">
								<em>홈런선생님은</em>
								<p>
									원웨이가 아닌 멀티웨이 방법으로 다양한 각도에서<br>
									학생을 관찰하며 결과에 대한 정확한 분석을 통해 <br>
									학생 개개인별로 최적의 솔루션을 제공합니다.
								</p>
							</div>
						</div>
					</div>
				</section>
				<section class="section_system">
					<div class="inner">
						<h4 class="section_title">홈런은 학습 시스템이 다릅니다</h4>
						<p class="section_desc">
							초등 교과 학습의 최강자 홈런은 초등 학생의 학습 리듬을 분석하는 홈런 교육 연구 시스템<br>
							(Home-Learn Education Research System)을 기반으로 한 학습자 중심의 체계적인 학습 프로그램 입니다.
						</p>
						<ul class="system_list">
							<li>
								<img src="/resources/image/system_tit01.png" alt="">
								<div class="blind">
									<strong><em>93</em>%</strong><!-- 190422 숫자 수정 : 99 ==> 93 -->
									<span>초등학급 수업시간에 활용</span>
								</div>
								<div class="img_wrap"><img src="/resources/image/system_img01.png" alt=""></div>
								<p class="desc">
									7년 연속 초등학급 93%가 유료로<br><!-- 190422 숫자 수정 : 99 ==> 93 -->
									수업시간에 활용하는 i-Scream의 노하우를<br>
									기반으로 만든 자기주도형 홈러닝 프로그램
								</p>
							</li>
							<li>
								<img src="/resources/image/system_tit02.png" alt="">
								<div class="blind">
									<strong><em>3</em>배</strong>
									<span>3년 연속 3배 성장</span>
								</div>
								<div class="img_wrap"><img src="/resources/image/system_img02.png" alt=""></div>
								<p class="desc">
									초·중등 교육 서비스 유일하게<br>
									3년 연속 매년 3배 성장
								</p>
							</li>
							<li>
								<img src="/resources/image/system_tit03.png" alt="">
								<div class="blind">
									<strong><em>1</em>위</strong>
									<span>학습 수행률, 재가입률 1위</span>
								</div>
								<div class="img_wrap"><img src="/resources/image/system_img03.png" alt=""></div>
								<p class="desc">
									학습 수행률, 재가입률 1위의<br>
									만족도 높은 초등 학습 프로그램<br>
									(초 ·중등 이러닝 분야)
								</p>
							</li>
						</ul>
					</div>
				</section>

				<!-- 20190607 컨텐츠 이동 -->
				<!-- 꿈을 키우는 진짜 공부 프로세스 -->
				<section class="section_real">
					<div class="inner">
						<h4 class="section_title">꿈을 키우는 진짜 공부 프로세스</h4>
						<div class="img_wrap">
							<img src="/resources/image/img_real.png" alt="">
							<div class="blind">
								<ol>
									<li>다중지능 검사 감정지능 확인</li>
									<li>자신의 이 직업(꿈) 선정</li>
									<li>미래비전수립</li>
									<li>비전의 시각화</li>
									<li>학습목표 설계</li>
									<li>아이스크림 홈런 학습 몰입</li>
								</ol>
								<strong>진짜 공부습관 성공적 정착!</strong>
							</div>
						</div>
					</div>
				</section>
				<!-- // 꿈을 키우는 진짜 공부 프로세스 -->
				<!-- 다중 지능 검사 -->
				<section class="section_special">
					<div class="inner">
						<h4 class="section_title">홈런의 다중지능검사는 왜 특별할까요?</h4>
						<div class="img_wrap">
							<img src="/resources/image/img_special.png" alt="">
							<div class="blind">
								<strong>1:1코칭</strong>
								<ul>
									<li>언어지능</li>
									<li>논리수학지능</li>
									<li>자연탐구지능</li>
									<li>음악지능</li>
									<li>신체운동지능</li>
									<li>공간지능</li>
									<li>대인관계지능</li>
									<li>자기이해지능</li>
								</ul>
							</div>
						</div>
						<ul class="special_list">
							<li>
								<strong class="subject">하나!</strong>
								<p class="cont">
									초등생 약 3,700여 명의 검사 결과<br>
									데이터를 분석해 타당도 검증
								</p>
							</li>
							<!-- 20190610 텍스트 수정 -->
							<li>
								<strong class="subject">둘!</strong>
								<p class="cont">
									<!-- 교과서 내용 예복습으로 학교 공부에 <br>
									자신감을 심어줍니다. -->
									학생의 발달 단계에 맞춰 개발된<br>
									검사 문항을 제공
								</p>
							</li>
							<li>
								<strong class="subject">셋!</strong>
								<p class="cont">
									<!-- 매일 매일 선생님의 학습결과 피드백을<br>
									통해 실수와 결손을 철저히 잡습니다. -->
									아이의 적성에 꼭 맞춘 직업 및<br>효율적인 방법들을 제시
								</p>
							</li>
							<!-- // 20190610 텍스트 수정 -->
						</ul>
					</div>
				</section>
				<!-- // 다중 지능 검사 -->
				<!-- 20190607 컨텐츠 이동 -->
				<!-- 190412 추가 -->
				<section class="section_video">
					<div class="inner">
						<h4 class="section_title">홈런 학습센터를 만나보세요</h4>
						<p class="section_desc">부모님보다 아이들이 더 좋아하는 아이스크림 홈런 학습센터를 동영상으로 만나보세요.</p>
						<!-- 190507 동영상 추가 -->
						<div class="video_wrap">
							<iframe width="854" height="480" src="https://www.youtube.com/embed/JGkxmIk94zs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div>
						<!-- //190507 동영상 추가 -->
					</div>
				</section>
				<!-- // 190412 추가 -->
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
