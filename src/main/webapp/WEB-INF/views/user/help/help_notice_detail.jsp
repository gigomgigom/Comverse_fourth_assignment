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
		<div class="visual_wrap visual_cs">
			<h2>고객센터</h2>
			<p>아이스크림 홈런 직영센터에서 궁금하신 사항을 알려드립니다</p>
		</div>
		<!--// 상단 이미지 -->
		<!-- 컨텐츠 로케이션 영역 -->
		<div class="location_wrap">
			<div class="inner">
				<ul>
					<li class="home"><span>홈</span></li><!-- 190429 a태그 삭제, span태그 추가 -->
					<li>고객센터</li><!-- 190429 a태그 삭제 -->
					<li><strong>알려드립니다</strong></li><!-- 190429 a태그 삭제 -->
				</ul>
			</div>
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<div class="inner">
				<h3>알려드립니다</h3>
				<div class="board_detail_style">
					<div class="tit_area">
						<strong class="tit">아이스크림 홈런 직영사업본부 홈페이지 개편</strong>
						<span class="date">2019.03.05</span>
					</div>
					<div class="cont_area">
						홈런 학부모님, 안녕하세요.<br><br>

						홈런은 보다 원활하고 안정적인 서비스를 제공하기 위해<br>
						정기적으로 서비스 점검을 실시하고 있습니다.<br><br>

						2019년 1월 11일(금) 새벽 00:00~06:00 (6시간)<br>
						2019년 1월 18일(금) 새벽 00:00~06:00 (6시간)<br>
						2019년 1월 24일(목) 새벽 00:00~06:00 (6시간)<br><br>

						서비스 점검 시간 동안 홈런 학습 및 홈페이지를 이용하실 수 없습니다.<br>
						서비스 점검 시간을 확인하시어 우리 아이 학습에 불편이 없으시길 바랍니다.<br>
						※ 점검일 06시 이후부터 모든 서비스가 정상 운영되오니 참고 부탁 드립니다.<br><br>

						홈런 학습을 믿고 이용하시는 학부모님께 감사의 말씀을 전하며,<br>
						앞으로도 우리 아이들에게 더욱 좋은 학습, 좋은 공부를 제공해 드릴 수 있도록 최선의 노력을 다하겠습니다.<br><br>

						감사합니다.
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
