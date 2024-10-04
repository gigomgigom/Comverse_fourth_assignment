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
				<div class="board_detail_style">
					<div class="tit_area">
						<strong class="tit">${board.boTitle}</strong>
						<span class="date"><fmt:formatDate value="${board.regDate}" type="date"/></span>
					</div>
					<div class="cont_area">
						<div style="width:100%;">
							<img width=""/>
						</div>
						${board.content}						
						<div class="file_wrap">
							<c:forEach var="attach" items="${board.boAttachList}">
								<a href="/board/download-attach/${board.boId}/${attach.attachId}">${attach.attachOName}</a>
							</c:forEach>
						</div>
						<c:if test="${board.boReplyable}">
							<h3>댓글 작성</h3>
							<input type="hidden" value="${board.boId}" id="bo_id_input">
							<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<label for="writer_name">작성자명</label>
							<input type="text" id="writer_name" style="margin-right: 20px">
							<label for="writer_pw">비밀번호</label>
							<input type="text" id="writer_pw">
							<div class="comment_form_container">							
								<textarea id="comment_form"></textarea>
								<button type="button" id="submit_comment">작성하기</button>
							</div>
							<div class="comment_list_wrap">
								<c:forEach var="reply" items="${replyList}">
									<div class="comment">
										<div class="comment_writer_date">
											<span class="comment_writer">${reply.anonWriter}</span>
											<span><fmt:formatDate value="${reply.regDate}" type="date"/></span>
										</div>
										<div class="comment_content">
											${reply.content}
										</div>
										<div class="comment_button">
											<button class="remove_button" id="reply-${reply.replyId}">삭제</button>
										</div>
									</div>				
								</c:forEach>											
							</div>
						</c:if>						
					</div>
					<div class="move_area">
						<c:choose>
							<c:when test="${preNext.pre != null}">
								<div>
									<strong class="direction">이전글</strong>
									<a href="/home/board/${ctg.ctgId}/detail?boId=${preNext.pre.boId}" class="tit">${preNext.pre.boTitle}</a>
									<span class="date"><fmt:formatDate value="${preNext.pre.regDate}" type="date"/></span>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<strong class="direction">이전글</strong>
									<a class="tit">이전글이 없습니다.</a>
									<span class="date"></span>
								</div>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${preNext.next != null}">
								<div>
									<strong class="direction">다음글</strong>
									<a href="/home/board/${ctg.ctgId}/detail?boId=${preNext.next.boId}" class="tit">${preNext.next.boTitle}</a>
									<span class="date"><fmt:formatDate value="${preNext.next.regDate}" type="date"/></span>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<strong class="direction">다음글</strong>
									<a class="tit">다음글이 없습니다.</a>
									<span class="date"></span>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="btn_center_wrap mb100">
					<a href="/home/board/${ctg.ctgId}/list" class="btn_bg_orange">목록보기</a>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
