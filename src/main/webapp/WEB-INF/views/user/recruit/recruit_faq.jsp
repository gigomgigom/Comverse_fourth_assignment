<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
					<c:forEach var="faq" items="${faqList}">
						<li>
							<a class="btn_faq_toggle">
								<div class="qiestion_area">
									<strong class="question">${faq.title}</strong>
								</div>
								<div class="answer_area">
									<p class="answer">
										${faq.content}
									</p>
								</div>
							</a>
						</li>
					</c:forEach>							
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
