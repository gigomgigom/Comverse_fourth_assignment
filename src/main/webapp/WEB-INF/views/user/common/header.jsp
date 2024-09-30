<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<header>
	<div class="inner">
		<h1>
			<a href="/main"><img src="/resources/image/h1_logo.png"
				alt="home learn i-scream"></a>
		</h1>
		<!-- 190412 수정 -->
		<div class="nav_wrap">
			<ul>
				<li>
					<dl>
						<dt>
							<a href="javascript:void(0);">홈런학습센터 소개</a>
						</dt>
						<dd>
							<a href="/intro/learning-center">학습센터란?</a>
						</dd>
						<c:forEach var="menu" items="${boardInfo}">
							<c:if test="${menu.index == 1}">
								<c:forEach var="board" items="${menu.ctgList}">
									<dd>
										<a href="/home/board/${board.ctgId}/list">${board.ctgName}</a>
									</dd>
								</c:forEach>
							</c:if>
						</c:forEach>
					</dl>
				</li>
				<li>
					<dl>
						<dt>
							<a href="javascript:void(0);">학습안내</a>
						</dt>
						<dd>
							<a href="/guide/product">학습서비스 안내</a>
						</dd>
						<dd>
							<a href="/guide/learning-process">학습프로세스</a>
						</dd>
						<dd>
							<a href="/guide/query">학습문의</a>
						</dd>
						<c:forEach var="menu" items="${boardInfo}">
							<c:if test="${menu.index == 2}">
								<c:forEach var="board" items="${menu.ctgList}">
									<dd>
										<a href="/home/board/${board.ctgId}/list">${board.ctgName}</a>
									</dd>
								</c:forEach>
							</c:if>
						</c:forEach>
					</dl>
				</li>
				<li>
					<dl>
						<dt>
							<a href="javascript:void(0);">교사채용</a>
						</dt>
						<dd>
							<a href="/recruit/teacher">홈런 선생님은?</a>
						</dd>
						<dd>
							<a href="/recruit/process">지원자격 및 절차</a>
						</dd>
						<dd>
							<a href="/recruit/business">사업설명회 안내</a>
						</dd>
						<dd>
							<a href="/recruit/center-setup">학습센터 개설신청</a>
						</dd>
						<dd>
							<a href="/recruit/faq">FAQ(교사)</a>
						</dd>
						<c:forEach var="menu" items="${boardInfo}">
							<c:if test="${menu.index == 3}">
								<c:forEach var="board" items="${menu.ctgList}">
									<dd>
										<a href="/home/board/${board.ctgId}/list">${board.ctgName}</a>
									</dd>
								</c:forEach>
							</c:if>
						</c:forEach>
					</dl>
				</li>
				<li>
					<dl>
						<dt>
							<a href="javascript:void(0);">고객센터</a>
						</dt>
						<dd>
							<a href="/help/location">지국위치 안내</a>
						</dd>
						<dd>
							<a href="/help/one-to-one">1:1 문의</a>
						</dd>
						<c:forEach var="menu" items="${boardInfo}">
							<c:if test="${menu.index == 4}">
								<c:forEach var="board" items="${menu.ctgList}">
									<dd>
										<a href="/home/board/${board.ctgId}/list">${board.ctgName}</a>
									</dd>
								</c:forEach>
							</c:if>
						</c:forEach>
					</dl>
				</li>
			</ul>
		</div>
		<!-- 190412 수정 -->
	</div>
</header>