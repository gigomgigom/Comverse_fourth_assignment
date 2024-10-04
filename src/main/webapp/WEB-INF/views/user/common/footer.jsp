<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<footer>
	<div class="inner">
		<ul class="ft_util_list">
			<li><a href="/policy">개인정보처리방침</a></li>
			<li><button onClick="layerAct.layerShow('layer_sitemap')">사이트맵</button></li>
		</ul>
		<!-- 190412 수정 -->
		<ul class="ft_info_list">
			<li>주식회사 아이스크림에듀</li>
			<li>대표 : 조용상</li>
			<!-- 190916 수정 -->
			<li>
				<address>서울특별시 강남구 테헤란로88길 15</address>
			</li>
			<li>대표전화 : 1544-0910</li>
			<li>대표이메일 : 8260930@i-screamedu.co.kr</li>
			<li>사업자등록번호 : 120-87-97004</li>
		</ul>
		<!-- // 190412 수정 -->
		<p class="copy">Copyright 2019 i-Scream deu Corporation. All
			rights reserved.</p>
	</div>
</footer>
<div class="layer_pop type_l layer_sitemap">
	<div class="pop_wrap">
		<div class="tit_area">
			사이트맵
		</div>
		<div class="cont_area">
			<div class="sitemap_wrap">
				<!-- 20190620 수정 -->
				<ul class="sitemap_list">
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
				<!-- // 20190620 수정 -->
			</div>
		</div>
		<button type="button" class="btn_pop_close" onclick="layerAct.layerHide('layer_sitemap')"><span class="blind">닫기</span></button>
	</div>
	<div class="dim"></div>
</div>