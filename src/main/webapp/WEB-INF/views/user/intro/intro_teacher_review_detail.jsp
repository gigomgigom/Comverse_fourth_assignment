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
		<!-- 20190620 수정 -->
		<div class="location_wrap">
			<div class="inner">
				<ul>
					<li class="home"><span>홈</span></li><!-- 190429 a태그 삭제, span태그 추가 -->
					<li>홈런학습센터 소개</li><!-- 190429 a태그 삭제 -->
					<li><strong>학습센터 교사후기</strong></li><!-- 190429 a태그 삭제 -->
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
				<div class="board_detail_style">
					<div class="tit_area">
						<strong class="tit">5월의 우수교사 부산 해운대구 홍길동 선생님</strong>
						<span class="date">2019.03.05</span>
					</div>
					<div class="cont_area">
						5월의 우수교사는 아이스크림 홈런 콘텐츠로 수업을 운영하고 있는 부산 해운대구 홍길동 선생님 입니다.<br>
						왜 아이스크림홈런 공부방을 시작하게 되었고 홈런공부방을 운영하며 좋은 점은 무엇인지 들어보겠습니다.
						<div class="source_wrap">
							<img src="/resources/image/temp_detail_video.png" alt="">
						</div>
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
