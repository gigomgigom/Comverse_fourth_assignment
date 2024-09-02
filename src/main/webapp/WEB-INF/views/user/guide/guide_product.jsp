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
		<div class="visual_wrap visual_guide"><!-- 190426 class명 변경 visual_recruit ==> visual_guide -->
			<h2>학습안내</h2>
			<p>아이스크림 홈런 학습센터의 체계적인 학습 프로그램을 만나보세요</p>
		</div>
		<!--// 상단 이미지 -->
		<!-- 컨텐츠 로케이션 영역 -->
		<div class="location_wrap">
			<!-- 20190620 수정 -->
			<div class="inner">
				<ul>
					<li class="home"><span>홈</span></li><!-- 190429 a태그 삭제, span태그 추가 -->
					<li>학습안내</li><!-- 190429 a태그 삭제 -->
					<li><strong>학습서비스 안내</strong></li><!-- 190429 a태그 삭제 -->
				</ul>
			</div>
			<!-- // 20190620 수정 -->
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<div class="inner">
				<!-- 20190620 수정 -->
				<h3>학습서비스 안내</h3>
				<!-- // 20190620 수정 -->
				<div class="wrap_guide_product">
					<!-- <section class="basic_section">
						<h4>기본정보</h4>
						<table class="table_style">
							<colgroup>
								<col style="width:50%;">
								<col style="width:auto;">
							</colgroup>
							<thead>
								<tr>
									<th>등록기간 단위</th>
									<th>약정기간</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1개월</td>
									<td>무약정</td>
								</tr>
							</tbody>
						</table>
					</section>
					<section class="choice_section">
						<h4>선택정보</h4>
						<table class="table_style">
							<colgroup>
								<col style="width:auto;">
								<col style="width:480px;">
								<col style="width:480px;">
							</colgroup>
							<tbody>
								<tr>
									<th>학습유형</th>
									<td>학생이 <em class="color_orange">공부방으로 방문</em>하여 수업</td>
									<td>선생님이 <em class="color_orange">집으로 방문</em>하여 수업</td>
								</tr>
								<tr>
									<th>수업회수</th>
									<td>주 5회</td>
									<td>주 51회</td>
								</tr>
								<tr>
									<th>수업시간</th>
									<td>회당 50분</td>
									<td>회당 30분</td>
								</tr>
								<tr>
									<th>과목</th>
									<td>전과목</td>
									<td>전과목</td>
								</tr>
								<tr>
									<th>학습기</th>
									<td>학습센터의 공용 학습기</td>
									<td>학생의 개인 학습기</td>
								</tr>
								<tr>
									<th>가격</th>
									<td><strong class="price">170,000</strong>원</td>
									<td><strong class="price">15,000</strong>원</td>
								</tr>
							</tbody>
						</table>
						<div class="comment_box">
							아이스크림 홈런 학습기기와 동일한 콘텐츠로 공부할 뿐만 아니라<br>
							체험학습, 이벤트 수업 등 다양한 추가관리를 받을 수 있는 아이스크림 홈런 학습센터에서 우리아이도 스스로 공부하는 아이로 변화합니다.
						</div>
					</section> 190412 기존 컨텐츠 전체 삭제 -->
					<!-- 190412 추가 -->
					<section class="section_compare">
						<!-- 20190620 텍스트 수정 -->
						<ul class="compare_list">
							<li>
								<em class="tit">센터(공부방)형</em>
								<spna class="desc">학생이 학습센터(공부방)로 방문하여 수업</span>
							</li>
							<li>
								<em class="tit">방문형</em>
								<spna class="desc">홈런선생님이 집으로 방문하여 수업</span>
							</li>
						</ul>
						<table class="table_style">
							<colgroup>
								<col style="width:auto;">
								<col style="width:260px;">
								<col style="width:260px;">
								<col style="width:260px;">
								<col style="width:260px;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">구분</th>
									<td colspan="3" class="color_orange"><strong>학습센터형</strong></th>
									<td class="color_orange"><strong>방문학습형</strong></th>
								</tr>
								<tr>
									<th scope="row">과목</th>
									<td>전과목</td>
									<td>수학단과목<br>(홈런수학)</td>
									<td>역사단과목<br>(한국사)</td>
									<td>전과목</td>
								</tr>
								<tr>
									<th scope="row">수업횟수</th>
									<td>주 5회</td>
									<td>주 2회</td>
									<td>주 1회</td>
									<td>주 1회</td>
								</tr>
								<tr>
									<th scope="row">수업시간</th>
									<td>회당 50분</td>
									<td>회당 50분</td>
									<td>회당 70분</td>
									<td>회당 30분</td>
								</tr>
							</tbody>
						</table>
						<!-- // 20190620 텍스트 수정 -->
						<div class="comment_box">
							아이스크림 홈런 학습기기와 동일한 콘텐츠로 공부할 뿐만 아니라<br>
							체험학습, 이벤트 수업 등 다양한 추가관리를 받을 수 있는 아이스크림 홈런 학습센터에서 우리아이도 스스로 공부하는 아이로 변화합니다.
						</div>
					</section>
					<!-- // 190412 추가 -->
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
