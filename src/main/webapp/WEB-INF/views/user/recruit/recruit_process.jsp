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
				<!-- 20190624 수정 -->
				<ul>
					<li class="home"><span>홈</span></li><!-- 190429 a태그 삭제, span태그 추가 -->
					<li>교사채용</li><!-- 190429 a태그 삭제 -->
					<li><strong>지원자격 및 절차</strong></li><!-- 190429 a태그 삭제 -->
				</ul>
				<!-- // 20190624 수정 -->
			</div>
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<div class="inner">
				<h3>지원자격 및 채용절차</h3>
				<div class="wrap_recruit_process">
					<section class="qualification_section">
						<h4>지원자격 및 담당업무</h4>
						<table class="table_style">
							<colgroup>
								<col style="width:280px;">
								<col style="width:320px;">
								<col style="width:auto;">
							</colgroup>
							<thead>
								<tr>
									<th>구분</th>
									<th>모집분야</th>
									<th>상세내용</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>지원자격</th>
									<td>공통</td>
									<td>
										<ul>
											<li>초대졸 이상</li>
											<li>교육 관련 자격증 소지자 우대</li>
											<li>학습센터, 학원, 학습지, 방과후 지도교사 등 교육 경력 우대</li>
											<li>현 초등학교 학부모 우대</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th rowspan="2">담당업무</th>
									<td>학습센터 선생님</td>
									<td>
										<ul>
											<li>초등/중등 학습관리</li>
											<li>주 5회 관리</li>
											<li>자택 혹은 별도의 학습공간 운영</li>
											<li>학부모 상담 및 관리</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td>방문 선생님</td>
									<td>
										<ul>
											<li>초등/중등 학습관리</li>
											<li>주 1회 방문관리</li>
											<li>1:1 맞춤관리</li>
											<li>학부모 상담 및 관리</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</section>
					<!-- 20190607 수정 -->
					<section class="teacher_regi_section">
						<h4>채용절차</h4>
						<article>
							<h5>교사 등록 과정</h5>
							<ol class="process_list">
								<!-- 20190624 수정 -->
								<li>
									<strong class="tit">지원자 접수</strong>
									<ul class="cont_list">
										<li>&middot; 교사지원서 및 계약서 1부</li>
										<li>&middot; 통장/신분증 사본</li>
										<li>&middot; 졸업증명서</li>
										<li>&middot; 경력증명서(유경험자)</li>
									</ul>
								</li>
								<li>
									<strong class="tit">면접</strong>
									<ul class="cont_list">
										<li>&middot; 지국장 면접</li><!-- 190412 텍스트 변경 -->
									</ul>
								</li>
								<li>
									<strong class="tit">입문과정</strong>
									<ul class="cont_list">
										<li>
											&middot; 신임교사 기본과정
											<span class="desc">주중 4일(본부 3일, 지국 1일)</span>
										</li>
									</ul>
								</li>
								<li>
									<strong class="tit">교사 등록</strong>
									<ul class="cont_list">
										<li>&middot; 홈런선생님 활동 자격 &nbsp;&nbsp;부여</li>
									</ul>
								</li>
								<!-- // 20190624 수정 -->
								<!-- 삭제 20190620
								<li class="last">
									<strong class="tit">기본활동</strong>
									<ul class="cont_list">
										<li>- 지점내 기본 활동</li>
										<li>- 선배교사 수업참관</li>
									</ul>
								</li>
								-->
							</ol>
						</article>
						<article>
							<h5>교사 활동지원</h5>
							<ol class="process_list noarrow"><!-- 20190620 class 추가 -->
								<!-- 20190624 수정 -->
								<li>
									<strong class="tit">개설 지원</strong>
									<ul class="cont_list">
										<li>&middot; 가맹비 無, 보증금 無, &nbsp;&nbsp;교육비 無</li>
									</ul>
								</li>
								<li>
									<strong class="tit">정착 지원</strong>
									<ul class="cont_list">
										<li>&middot; 홈런 학습기 지원</li>
										<li>
											&middot; 홍보물 지원
											<span class="desc">현수막, 전단지, 명함, 현판등</span>
										</li>
									</ul>
								</li>
								<li>
									<strong class="tit">경력 우대</strong>
									<ul class="cont_list">
										<li>&middot; 학습지도 경험자 및 &nbsp;&nbsp;교원자격증 우대</li>
									</ul>
								</li>
								<li class="last">
									<strong class="tit">업계 최고 지원</strong>
									<ul class="cont_list">
										<li>&middot; 업계 최고 수수료율 적용</li>
										<li>&middot; 학생 모집활동 지원</li>
									</ul>
								</li>
								<!-- // 20190624 수정 -->
							</ol>
						</article>
					</section>
					<!-- // 20190607 수정 -->
					<section class="inquiry_section">
						<h4>지원 문의</h4>
						<article>
							<h5>이메일/SNS 문의</h5>
							<ul class="inquiry_list">
								<li>
									<div class="cont_wrap">
										<strong class="tit">이메일</strong>
										<p class="cont">8260930@i-screamedu.co.kr<p><!-- 190412 텍스트 변경 -->
									</div>
								</li>
								<li>
									<div class="cont_wrap">
										<strong class="tit">카카오톡 (친구추가)</strong>
										<p class="cont"><a href="https://pf.kakao.com/_xflJxdd" target="_blank">ID : 아이스크림홈런학습센터</a></p> <!--190503 카카오톡 플러스친구 링크 추가 -->
									</div>
								</li>
							</ul>
						</article>
						<article>
							<h5>지역별 문의</h5>
							<div class="loc_inquiry_area">
								<div class="table_wrap">
									<table class="table_style">
										<colgroup>
											<col style="width:50%;">
										</colgroup>
										<thead>
											<tr>
												<th>지역</th>
												<th>연락처</th>
											</tr>
										</thead>
										<tbody>
											<!-- <tr>
												<td>서울 강남</td>
												<td>02) 437 - 0910</td>
											</tr> 190412 삭제 -->
											<tr>
												<td>서울 강북</td>
												<td>02) 2207 - 0910</td>
											</tr>
											<!-- 190412 추가 -->
											<tr>
												<td>서울 서북</td>
												<td>031) 932 - 0910</td>
											</tr>
											<!-- // 190412 추가 -->
											<!-- 20190607 수정 -->
											<tr>
												<td>서울 강서</td>
												<td>032) 362 - 0910</td>
											</tr>
											<!-- // 20190607 수정 -->
											<tr>
												<td>광주/순천</td>
												<td>062) 951 - 0910</td>
											</tr>
											<!-- 20190607 수정 -->
											<tr>
												<td>구미/경북</td>
												<td>054) 455 - 0910</td>
											</tr>
											<!-- // 20190607 수정 -->
											<tr>
												<td>전라북도</td>
												<td>063) 451 - 0920</td>
											</tr>
											<!-- 20190607 수정 -->
											<tr>
												<td>대구/포항</td>
												<td>053) 643 - 7739</td>
											</tr>
											<!-- // 20190607 수정 -->
										</tbody>
									</table>
								</div>
								<div class="table_wrap">
									<table class="table_style">
										<colgroup>
											<col style="width:50%;">
										</colgroup>
										<thead>
											<tr>
												<th>지역</th>
												<th>연락처</th>
											</tr>
										</thead>
										<tbody>
											<!-- 20190607 수정 -->
											<tr>
												<td>대전/세종/청주</td>
												<td>042) 825 - 9712</td>
											</tr>
											<!-- // 20190607 수정 -->
											<tr>
												<td>목포/해남</td>
												<td>064) 281 - 0910/0991</td>
											</tr>
											<tr>
												<td>부산</td>
												<td>051) 892 - 0919</td>
											</tr>
											<tr>
												<td>천안/아산</td>
												<td>041) 544 - 0910</td>
											</tr>
											<!-- 20190607 수정 -->
											<tr>
												<td>경기남부</td>
												<td>031) 378 - 0930</td>
											</tr>
											<tr>
												<td>울산</td>
												<td>052) 246 - 0910</td>
											</tr>
											<tr>
												<td>창원/경남</td>
												<td>055) 274 - 0910</td>
											</tr>
											<!-- // 20190607 수정 -->
										</tbody>
									</table>
								</div>
							</div>
						</article>
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
