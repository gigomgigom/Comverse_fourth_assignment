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
			<p>아이스크림 홈런 학습센터에 관한 소식을 알려드립니다</p>
		</div>
		<!--// 상단 이미지 -->
		<!-- 컨텐츠 로케이션 영역 -->
		<div class="location_wrap">
			<div class="inner">
				<ul>
					<li class="home"><span>홈</span></li><!-- 190429 a태그 삭제, span태그 추가 -->
					<li>고객센터</li><!-- 190429 a태그 삭제 -->
					<li><strong>지국위치 안내</strong></li><!-- 190429 a태그 삭제 -->
				</ul>
			</div>
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<div class="inner">
				<h3>지국위치 안내</h3>
				<div class="branch_tab_wrap">
					<ul class="tab_list">
						<!-- 20190607 명칭 수정 -->
						<!-- 190426 javascript:void(0); 오타수정 -->
						<li class="active"><a href="javascript:void(0)">서울 강북</a></li>
						<li><a href="javascript:void(0)">서울 서북</a></li>
						<li><a href="javascript:void(0)">서울 강서</a></li>
						<li><a href="javascript:void(0)">광주/순천</a></li>
						<li><a href="javascript:void(0)">구미/경북</a></li>
						<li><a href="javascript:void(0)">전라북도</a></li>
						<li><a href="javascript:void(0)">대구/포항</a></li>
						<li><a href="javascript:void(0)">대전/세종/청주</a></li>
						<li><a href="javascript:void(0)">목포/해남</a></li>
						<li><a href="javascript:void(0)">부산</a></li>
						<li><a href="javascript:void(0)">천안/아산</a></li>
						<li><a href="javascript:void(0)">경기남부</a></li>
						<li><a href="javascript:void(0)">울산</a></li>
						<li><a href="javascript:void(0)">창원/경남</a></li>
						<!-- // 190426 javascript:void(0); 오타수정 -->
						<!-- // 20190607 명칭 수정 -->
					</ul>
					<div class="tab_cont active">
						<div class="map_wrap">
							<img src="/resources/image/temp_map.png" alt="">
						</div>
						<dl class="info_list">
							<dt><span>강북/경기북부</span></dt>
							<dd class="address">
								<strong class="tit">주소</strong>
								<span class="cont">서울시 강남구 영동대로 106길 41(삼성동 동영빌딩) 시공교육 2F</span>
							</dd>
							<dd class="call">
								<strong class="tit">전화</strong>
								<span class="cont">02.3288.0910</span>
							</dd>
							<!-- 190412 추가 -->
							<dd class="affiliated">
								<strong class="tit">산하</strong>
								<ul class="cont">
									<li>
										<em>노원 학습센터</em>
										<span>서울특별시 노원구 상계동 330-26 3층</span>
									</li>
									<li>
										<em>상계 학습센터</em>
										<span>서울특별시 노원구 한글비석로20길 14 2층</span>
									</li>
									<li>
										<em>창동 학습센터</em>
										<span>서울특별시 도봉구 노해로63가길 41 현영빌딩 3층</span>
									</li>
								</ul>
							</dd>
							<!-- // 190412 추가 -->
						</dl>
					</div>
					<div class="tab_cont">
						<div class="map_wrap">
							<img src="/resources/image/temp_map.png" alt="">
						</div>
						<dl class="info_list">
							<dt><span>서북/경기서부</span></dt>
							<dd class="address">
								<strong class="tit">주소</strong>
								<span class="cont">서울시 강남구 영동대로 106길 41(삼성동 동영빌딩) 시공교육 2F</span>
							</dd>
							<dd class="call">
								<strong class="tit">전화</strong>
								<span class="cont">02.3288.0910</span>
							</dd>
						</dl>
					</div>
					<div class="tab_cont">
						<div class="map_wrap">
							<img src="/resources/image/temp_map.png" alt="">
						</div>
						<dl class="info_list">
							<dt><span>강서/인천/부천</span></dt>
							<dd class="address">
								<strong class="tit">주소</strong>
								<span class="cont">서울시 강남구 영동대로 106길 41(삼성동 동영빌딩) 시공교육 2F</span>
							</dd>
							<dd class="call">
								<strong class="tit">전화</strong>
								<span class="cont">02.3288.0910</span>
							</dd>
						</dl>
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
