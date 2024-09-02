<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>아이스크림 홈런 학습센터</title>
	<link rel="stylesheet" href="/resources/css/common.css">
	<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<!-- wrap -->
<div class="wrap">
	<!-- header -->
	<%@ include file="/WEB-INF/views/user/common/header.jsp"%>
	<!-- header -->
	<!-- container -->
	<div class="container main_container">
		<!-- 상단 이미지 -->
		<div class="main_visual_wrap">
			<!-- 190531 수정 -->
			<div class="slider_visual">
				<ul class="list_item">
					<li style="display:none;">
						<div class="video_wrap">
							<video id="videoMain1" class="video" poster="" src="https://vodd.home-learn.com/homelearn_down/data/bl/1_low.mp4" muted="" playsinline="" autoplay="" loop=""></video>
						</div>
						<div class="text_wrap">
							<strong>선생님의 행복이 우리의 성공 기준입니다</strong>
							<p>누구나 올 수 있지만 아무나 될 수는 없습니다.<br>우리 아이의 가치를 변화시킬 수 있는 사람,<br>바로 당신입니다.</p>
						</div>
					</li>
					<li style="display:none;">
						<div class="video_wrap">
							<video id="videoMain2" class="video" poster="" src="https://vodd.home-learn.com/homelearn_down/data/bl/4_low.mp4" muted="" playsinline="" autoplay="" loop=""></video>
						</div>
						<div class="text_wrap">
							<strong>가장 가치있는 교육을 추구합니다</strong>
							<p>배움으로 세상을 바꿀 수 있다는 믿음,<br>우리는 믿음을 향한 당신과 함께 도전하겠습니다.</p>
						</div>
					</li>
					<li style="display:none;">
						<div class="video_wrap">
							<video id="videoMain3" class="video" poster="" src="https://vodd.home-learn.com/homelearn_down/data/bl/5_low.mp4" muted="" playsinline="" autoplay="" loop=""></video>
						</div>
						<!-- 20190620 수정 -->
						<div class="text_wrap">
							<strong>세상에 기여할 인재를 만들어갑니다</strong>
							<p>여기, 미래가 있습니다.<br>당신의 무한한 가능성을 세계와 함께하세요.</p>
						</div>
						<!-- // 20190620 수정 -->
					</li>
				</ul>
				<div class="indicator">
					<a href="javascript:void(0);" class="btn_navi"><span class="inner">1</span></a>
					<a href="javascript:void(0);" class="btn_navi"><span class="inner">2</span></a>
					<a href="javascript:void(0);" class="btn_navi"><span class="inner">3</span></a>
				</div>
			</div>
			<div class="main_link_wrap">
				<a href="#">
					<span class="img_char"><img src="/resources/image/img_sticker_char.png" alt=""></span>
					<p class="txt_info"><img src="/resources/image/img_sticker_bg.png" alt="아이들을 위한 교육 전문가로 참여하세요."></p>
				</a>
			</div>
			<!-- // 190531 수정 -->
		</div>
		<!--// 상단 이미지 -->
		<div class="slide_wrap slide_js">
			<!-- 190531 수정 및 추가 -->
			<div class="bu_wrap">
				<div class="bu1 trans"><img src="/resources/image/bu_main1.png" alt=""></div>
				<div class="bu2 trans"><img src="/resources/image/bu_main2.png" alt=""></div>
				<div class="bu3 trans"><img src="/resources/image/bu_main3.png" alt=""></div>
				<div class="bu4 trans"><img src="/resources/image/bu_main4.png" alt=""></div>
				<div class="bu5 trans"><img src="/resources/image/bu_main5.png" alt=""></div>
				<div class="bu6 trans"><img src="/resources/image/bu_main6.png" alt=""></div>
			</div>
			<div class="inner">
				<!-- 이미지 순서 변경 20190620 -->
				<ul class="img">
					<li class="active" style="display: block;"><img src="/resources/image/main_slide1_3.png" alt="진짜 공부 습관 홈런 학습센터 이미지"></li>
					<li><img src="/resources/image/main_slide1_2.png" alt="홈런 학습센터의 핵심가치 이미지"></li>
					<li><img src="/resources/image/main_slide1_1.png" alt="선생님이 행복한 학습센터 이미지"></li>
				</ul>
				<!-- // 이미지 순서 변경 20190620 -->
				<ul class="text">
					<li class="active" style="display: block;">
						<p>진짜 공부 습관<br>홈런 학습센터</p>
						<span>가르치는 보람과 배움의 기쁨이 가득하고<br> 아이와 함께 선생님의 행복을 만들어 가는 곳</span>
						<a href="#">공부방이 궁금해요!</a>
					</li>
					<li>
						<p>홈런 학습센터의<br>핵심가치</p>
						<span>Home-Learn에 대한 신뢰와 자부심으로<br> 학생과 동반성장하는 행복한 홈런 학습센터</span>
						<a href="#">공부방이 궁금해요!</a>
					</li>
					<li>
						<p>선생님이 행복한<br>학습센터</p>
						<span>가르치는 보람과 배움의 기쁨이 가득하고<br> 아이와 함께 선생님의 행복을 만들어 가는 곳</span>
						<a href="#">공부방이 궁금해요!</a>
					</li>

				</ul>
				<div class="btn_wrap">
					<button>이전</button><button>다음</button>
				</div>
			</div>
			<!-- //190531 수정 및 추가 -->
		</div>
		<div class="main_ad_wrap">
			<p>홈런만의 체계적인 교육과정으로<br>아이들과 함께 성장하는 NO.1 초등교육전문가가 되세요.</p>
			<div class="btn_wrap">
				<a href="#">교사 채용설명</a>
				<a href="#">사업설명회 안내</a>
			</div>
		</div>
		<div class="slide_wrap2">
			<!-- 20190620 위치변경 -->
			<div class="inner">
				<div class="left_wrap">
					<div class="text">
						<p>함께, 둘러볼까요?</p>
						<div>당신의 성공을 지원합니다.</div>
					</div>
					<div class="btn_wrap">
						<button class="on">학습센터 둘러보기</button>
						<button>성공 선생님 만나보기</button>
						<button>상담코치 지원활동</button>
					</div>
				</div>
				<div class="right_wrap">
					<!-- 학습센터 둘러보기 -->
					<!-- 20190621 slide_js1 -> slide_js2로 변경 부탁 드립니다. -->
					<div class="slide_con slide_js1">
					<!-- // 20190621 slide_js1 -> slide_js2로 변경 부탁 드립니다. -->
						<!-- 20190607 링크 추가 -->
						<!--
							[D] : 개발된 페이지 링크 연결
						-->
						<ul class="img">
							<li class="active"><a target="_self" href="intro_bestcenter_list.html"><img src="/resources/image/main_slide2_3.png" alt=""></a></li>
							<li><a target="_self" href="intro_bestcenter_list.html"><img src="/resources/image/main_slide2_4.png" alt=""></a></li>
						</ul>
						<!-- // 20190607 링크 추가 -->
						<ul class="text">
							<li class="active">
								<p>뭐가 특별하냐구요? <br>아이스크림 홈런과<br> 최고의 선생님이 함께<br>합니다.</p>
							</li>
							<li>
								<p>지국과 함께하는<br> 체험학습이 정말<br> 즐겁습니다.</p>
							</li>
						</ul>
						<div class="paginate_wrap">
							<span>1</span>/<span>2</span>
						</div>
						<div class="btn_wrap">
							<button>이전</button><button>다음</button>
						</div>
					</div>
					<!--// 학습센터 둘러보기 -->
					<!-- 성공 선생님 만나보기 -->
					<div class="slide_con slide_js3" style="display: none;">
						<!-- 20190607 링크 추가 -->
						<!--
							[D] : 개발된 페이지 링크 연결
						-->
						<ul class="img">
							<li class="active"><a target="_self" href="intro_teacher_review_list.html"><img src="/resources/image/main_slide2_1.png" alt=""></a></li>
							<li><a target="_self" href="intro_teacher_review_list.html"><img src="/resources/image/main_slide2_2.png" alt=""></a></li>
						</ul>
						<!-- // 20190607 링크 추가 -->
						<ul class="text">
							<li class="active">
								<p>홈런 학습센터를<br> 만나고 인생이<br> 바뀌었어요.</p>
							</li>
							<li>
								<p>홈런 학습기가 있어서 정말 행복합니다.</p>
							</li>
						</ul>
						<div class="paginate_wrap">
							<span>1</span>/<span>2</span>
						</div>
						<div class="btn_wrap">
							<button>이전</button><button>다음</button>
						</div>
					</div>
					<!--// 성공 선생님 만나보기 -->
					<!-- 상담코치 지원활동 -->
					<div class="slide_con slide_js4" style="display: none;">
						<ul class="img">
							<li class="active"><img src="/resources/image/main_slide2_5.png" alt=""></li>
							<li><img src="/resources/image/main_slide2_6.png" alt=""></li>
						</ul>
						<ul class="text">
							<li class="active">
								<p>상담코치와 함께하는 <br> 활동으로 적극적 홍보!</p>
							</li>
							<li>
								<p>선생님 공부방의 성공 정착을 지원합니다.</p>
							</li>
						</ul>
						<div class="paginate_wrap">
							<span>1</span>/<span>2</span>
						</div>
						<div class="btn_wrap">
							<button>이전</button><button>다음</button>
						</div>
					</div>
					<!--// 상담코치 지원활동 -->
				</div>
			</div>
			<!-- // 20190620 위치변경 -->
		</div>
		<div class="quick_wrap">
			<ul class="inner">
				<li>
					<a href="#">
						<strong>공부방 개설 신청</strong>
						<span>공부방을 개설하고 아이들과 학습세요!</span>
					</a>
				</li>
				<li>
					<a href="#">
						<strong>전국 공부방 찾기</strong>
						<span>원하시는 위치의 공부방을 찾아서 함께해요!</span>
					</a>
				</li>
			</ul>
		</div>
		<!-- //190508 추가 -->
		<div class="family_wrap">
			<ul class="list_familysite">
				<li>
					<a href="#" class="link_site">
						<img src="/resources/image/img_family01.png" alt="Home-Learn(i-Scream)">
						<strong class="tit_site">온라인 학습관리 <span class="fw_b">아이스크림 홈런</span></strong>
					</a>
				</li>
				<li>
					<a href="#" class="link_site">
						<img src="/resources/image/img_family02.png" alt="친절한 Schooling">
						<strong class="tit_site">중학 공부의 힘 <span class="fw_b">친절한 스쿨링</span></strong>
					</a>
				</li>
				<!-- Homieng 오픈시 노출 -->
				<!--
				<li>
					<a href="#" class="link_site">
						<img src="/resources/image/img_family03.png" alt="Homieng">
						<strong class="tit_site">아이의 영어회로가 바뀌는 <span class="fw_b">호밍</span></strong>
					</a>
				</li>
				-->
			</ul>
		</div>
		<!-- //190508 추가 -->
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