<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>아이스크림 홈런 학습센터</title>
	<link rel="stylesheet" href="/resources/css/common.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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
		<c:choose>
			<c:when test="${ctg.ctgMenu == 1}">
				<div class="visual_wrap visual_intro">
					<h2>학습센터소개</h2>
					<p>학교교육의 최강자 아이스크림 홈런 학습센터를 소개합니다</p>
				</div>
			</c:when>
			<c:when test="${ctg.ctgMenu == 2}">
				<div class="visual_wrap visual_guide">
					<h2>학습안내</h2>
					<p>아이스크림 홈런 학습센터의 체계적인 학습 프로그램을 만나보세요</p>
				</div>
			</c:when>
			<c:when test="${ctg.ctgMenu == 3}">
				<div class="visual_wrap visual_recruit">
					<h2>교사채용</h2>
					<p>아이스크림 홈런과 함께 진정한 교육 전문가로 성장하세요</p>
				</div>
			</c:when>
			<c:when test="${ctg.ctgMenu == 4}">
				<div class="visual_wrap visual_cs">
					<h2>고객센터</h2>
					<p>아이스크림 홈런 직영센터에서 궁금하신 사항을 알려드립니다</p>
				</div>
			</c:when>
		</c:choose>		
		<!--// 상단 이미지 -->
		<!-- 컨텐츠 로케이션 영역 -->
		<div class="location_wrap">
			<div class="inner">
				<c:choose>
					<c:when test="${ctg.ctgMenu == 1 }">
						<ul>
							<li class="home"><span>홈</span></li>
							<li>홈런학습센터 소개</li>
							<li><strong>${ctg.ctgName}</strong></li>
						</ul>
					</c:when>
					<c:when test="${ctg.ctgMenu == 2 }">
						<ul>
							<li class="home"><span>홈</span></li>
							<li>학습안내</li>
							<li><strong>${ctg.ctgName}</strong></li>
						</ul>
					</c:when>
					<c:when test="${ctg.ctgMenu == 3 }">
						<ul>
							<li class="home"><span>홈</span></li>
							<li>교사채용</li>
							<li><strong>${ctg.ctgName}</strong></li>
						</ul>
					</c:when>
					<c:when test="${ctg.ctgMenu == 4 }">
						<ul>
							<li class="home"><span>홈</span></li>
							<li>고객센터</li>
							<li><strong>${ctg.ctgName}</strong></li>
						</ul>
					</c:when>
				</c:choose>
			</div>
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<div class="inner">
				<h3>${ctg.ctgName}</h3>
				<div class="board_list_style">
					<div class="count">총 <strong>${pager.totalRows}</strong> 건</div>
					<div class="head_area">
						<span class="num">번호</span>
						<span class="tit">제목</span>
						<span class="date">등록일</span>
						<span class="hits">조회수</span>
					</div>
					<ul class="data_list">
						<!-- 공지 -->
						<c:forEach var="pinnedBoard" items="${pinned}">
							<li>
								<span class="num notice">상단고정</span>
								<a href="/home/board/${ctg.ctgId}/detail?boId=${pinnedBoard.boId}" class="tit">
									${pinnedBoard.boTitle}
									<c:if test="${ctg.newExpose && pinnedBoard.regDate > compDate}">
										<span class="new-article">   new</span>
									</c:if>
								</a>
								<span class="date"><fmt:formatDate value="${pinnedBoard.regDate}" type="date"/></span>
								<span class="hits">${pinnedBoard.hitCnt}</span>
							</li>
						</c:forEach>
						<!-- 목록 -->
						<c:forEach var="board" items="${boardList}">
							<li>
								<span class="num">${board.boId}</span>
								<a href="/home/board/${ctg.ctgId}/detail?boId=${board.boId}" class="tit">
									${board.boTitle}
									<c:if test="${ctg.newExpose && board.regDate > compDate}">
										<span class="new-article">   new</span>
									</c:if>
								</a>
								<span class="date"><fmt:formatDate value="${board.regDate}" type="date"/></span>
								<span class="hits">${board.hitCnt}</span>
							</li>
						</c:forEach>
					</ul>
					<div class="paging_area">
						<c:if test="${pager.groupNo != 1}">
							<button type="button" onClick="location.href('/home/board/${ctg.ctgId}/list?pageNo=${pager.startPageNo - 1}')" class="btn_page_pre"></button>
						</c:if>
						
						<c:forEach var="pageNum" items="${pager.pageArray}">
							<a href="/home/board/${ctg.ctgId}/list?pageNo=${pageNum}" class="${pager.pageNo == pageNum ? 'current' : ''}">${pageNum}</a>
						</c:forEach>
						
						<c:if test="${pager.groupNo != pager.totalGroupNo}">
							<button type="button" onClick="location.href('/home/board/${ctg.ctgId}/list?pageNo=${pager.endPageNo + 1}')" class="btn_page_next"></button>
						</c:if>
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
