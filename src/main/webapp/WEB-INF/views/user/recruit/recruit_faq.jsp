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
					<li><strong>FAQ(교사)</strong></li><!-- 190429 a태그 삭제 -->
				</ul>
			</div>
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<div class="inner">
				<h3>FAQ(교사)</h3>
				<ul class="faq_list">
					<li>
						<a class="btn_faq_toggle">
							<div class="qiestion_area">
								<strong class="question">학습센터 선생님은 어떤 일을 하나요?</strong>
							</div>
							<div class="answer_area">
								<p class="answer">
									6명 내외 소그룹 수업 모델로 수준별 학습계획수립과 학습코칭(피드백)이 주업무로 학생의 체계적인 학습습관을 길러줍니다.<br>
									지국 별 지원을 통한 회원 유치 활동화 회원 학습관리와 학부모 상담관리가 주요 업무 입니다.
								</p>
							</div>
						</a>
					</li>
					<li>
						<a class="btn_faq_toggle">
							<div class="qiestion_area">
								<strong class="question">방문선생님은 어떤 일을 하나요?</strong>
							</div>
							<div class="answer_area">
								<p class="answer">
									주 1회 30분, 1:1 대면관리로 회원의 자기주도학습 강화와 올바른 학습습관을 형성시켜 주는 업무입니다.<br>
									학습계획 대비 진행률에 대한 철저한 점검으로 학습 완성률을 높이고 가정 방문 시 회원의 학습결과와 진행상황에 대해 학부모님과 소통합니다.
								</p>
							</div>
						</a>
					</li>
					<li>
						<a class="btn_faq_toggle">
							<div class="qiestion_area">
								<strong class="question">회원관리는 어떻게 하나요?</strong>
							</div>
							<div class="answer_area">
								<p class="answer">
									- 학생 개인별, 수준별 맞춤 계획 수립<br>
									- 홈런학습기(온라인) 및 워크지, 학습리포트, 시험 적중 예상문제집(지면) 등을 활용한 On-off blended learning 학습법<br>
									- 월 1회 이상 학부모 상담
								</p>
							</div>
						</a>
					</li>
					<li>
						<a class="btn_faq_toggle">
							<div class="qiestion_area">
								<strong class="question">홈런센터선생님이 관리하는 과목은 뭔가요?</strong>
							</div>
							<div class="answer_area">
								<p class="answer">
									- 국/수/사/과 교과 중심 학습<br>
									- 고객 니즈에 따라 특별학습 콘텐츠(받아쓰기/수학연산/한자 등) 활용가능
								</p>
							</div>
						</a>
					</li>
					<li>
						<a class="btn_faq_toggle">
							<div class="qiestion_area">
								<strong class="question">회원모집은 어떻게 하나요?</strong>
							</div>
							<div class="answer_area">
								<p class="answer">
									개설초기 홍보지원을 통해 성공적으로 정착할 수 있도록 돕습니다.
									지국/학습센터별 다양한 회원 모객활동(과학교실/역사교실/체험활동)을 진행합니다.
								</p>
							</div>
						</a>
					</li>
					<li>
						<a class="btn_faq_toggle">
							<div class="qiestion_area">
								<strong class="question">홈런센터선생님 모집 일정이 궁금합니다.</strong>
							</div>
							<div class="answer_area">
								<p class="answer">
									선생님모집은 매월 상시로 이루어지고 있습니다. 관할 지국 별 유선문의 및 이메일/카카오톡을 통해 가까운 면접장소 및 일정을 안내 드리고 있습니다. 또한 월별 진행하는 사업설명회에 참석하셔서 보다 자세한 내용을 확인할 수 있습니다.
								</p>
							</div>
						</a>
					</li>
					<li>
						<a class="btn_faq_toggle">
							<div class="qiestion_area">
								<strong class="question">홈런센터선생님이 되는 과정은 어떻게 되나요?</strong>
							</div>
							<div class="answer_area">
								<p class="answer">
									면접을 통과 하신분들을 대상으로 입문교육(3일/대전)을 진행하며, 이후 개설과 동시에 정착교육과정(8주/지국)으로 교육과 업무를 병행하는 과정으로 진행됩니다.
								</p>
							</div>
						</a>
					</li>
				</ul>
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
