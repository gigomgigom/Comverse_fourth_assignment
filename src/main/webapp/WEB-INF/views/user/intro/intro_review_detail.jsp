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
		<!-- 20190620 수정 -->
		<div class="visual_wrap visual_cs">
			<h2>홈런학습센터 소개</h2>
			<p>학교교육의 최강자 아이스크림 홈런 학습센터를 소개합니다</p>
		</div>
		<!-- // 20190620 수정 -->
		<!--// 상단 이미지 -->
		<!-- 컨텐츠 로케이션 영역 -->
		<div class="location_wrap">
			<!-- 20190620 수정 -->
			<div class="inner">
				<ul>
					<li class="home"><span>홈</span></li><!-- 190429 a태그 삭제, span태그 추가 -->
					<li>홈런학습센터 소개</li><!-- 190429 a태그 삭제 -->
					<li><strong>학습센터 회원후기</strong></li><!-- 190429 a태그 삭제 -->
				</ul>
			</div>
			<!-- // 20190620 수정 -->
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<div class="inner">
				<!-- 20190620 수정 -->
				<h3>학습센터 회원후기</h3>
				<!-- // 20190620 수정 -->
				<div class="board_detail_style">
					<div class="tit_area">
						<strong class="tit">아이가 공부에 흥미를 느끼고 열심히 합니다.</strong>
						<span class="date">2019.03.05</span>
					</div>
					<div class="cont_area">
						안녕하세요 홈런이 막 런칭하던 시점에 가입해서 약 3년여를 하였던 아이를 두고 있습니다.<br><br>

						3학년에 시작해서 5학년까지 했는데 저학년때부터 고학년이 될때까지 지속적으로 매일 일정시간을 스스로 학습을 하고 학습을 하기 위해 준비를 하고 마치고 복습
						하는 습관이 생겨 초등학교 내내 반과 학교에서 1,2등을 달렸고 어느덧 시간이 지나 이번에 중학교에 입학합니다.<br><br>

						홈런은 어쩌면 홈런을 처음 시작한 시공미디어의 입장에서도 도전이었을것 같고 아이에게 양질의 교육과 자기주도학습을 가르치고 싶었던 저희 부부에게도 모험일 수
						있었습니다.<br><br>

						컴퓨터를 함께 써야하는게 약간 비용적으로 부담된다 느끼긴 하였지만 다른 인테넷 환경으로 넘어가지 않는다는 점에서 좋아보였고
						체험학습하면서 막 런칭한 상황이면서도 너무나 많은 정보와 멀티미디어 자료가 있는것을 보고 이거다 싶어서 시작했는데 제 생각이 맞았던것 같습니다.<br><br>

						홈런을 마친지 벌써 1년이 되었지만 몸에 배인 습관을 가지고 지금도 스스로의 꿈을 위해서 공부하고 있는 딸아이를 보면 흐믓합니다.<br><br>

						시공미디어와 홈런을 기획하고 준비하는 많은 관계자분들과 선생님들께서 쉽지않은 고단한 시간을 보내셨을거라 생각합니다.<br><br>

						늘 감사드리며 더욱 발전하는 교육기업이 되시기 바라며 홈런 초기 가입맴버 서연이 아빠 올림.
						<div class="file_wrap">
							<a href="#">첨부파일예시 첫번째입니다.docx</a>
							<a href="#">첨부파일예시 첫번째입니다.xls</a>
						</div>
					</div>
					<div class="move_area">
						<div class="">
							<strong class="direction">이전글</strong>
							<a href="#" class="tit">이전글이 없습니다.</a>
							<span class="date">2019.03.05</span>
						</div>
						<div>
							<strong class="direction">다음글</strong>
							<a href="#" class="tit">아이스크림홈런 공부방 개설 서울 설명회</a>
							<span class="date">2019.03.05</span>
						</div>
					</div>
				</div>
				<div class="btn_center_wrap mb100">
					<a href="#" class="btn_bg_orange">목록보기</a>
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
