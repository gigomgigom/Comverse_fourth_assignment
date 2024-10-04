<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
					<li><strong>사업설명회 안내</strong></li><!-- 190429 a태그 삭제 -->
				</ul>
			</div>
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<h3>사업설명회 안내</h3>
			<div class="wrap_recruit_business">
				<section class="section_business_info">
					<!-- 20190620 수정 -->
					<div class="inner">
						<div class="guide_area">
							<strong class="area_tit">홈런학습센터 사업설명회</strong>
							<p class="area_desc">
									아이스크림홈런 학습센터에서 초등 및 중등회원 <br>
									학습관리 업무를 진행할 홈런선생님을 모십니다.
							</p>
							<ul class="guide_list">
								<li>
									<strong>홈런학습센터란?</strong>
									<p>아이스크림 콘텐츠를 기반으로 한 교과중심 학교교육 콘텐츠 수업을 진행하는 공부방 입니다.</p>
								</li>
								<li>
									<strong>홈런선생님이란?</strong>
									<p>아이스크림 홈런의 '홈런 선생님'은 아이들의 학습 코치와 관리에만 전념하는 진정한 교육 전문가입니다.</p>
								</li>
								<li>
									<strong>아이스크림홈런 선생님의 혜택은?</strong>
									<ul>
										<li>
											60만원 상당의 홈런학습기 3대 기본제공 (회원수에 따른 추가 무상제공)
										</li>
										<li>
											첫 달 등록회원에 대한 정착지원금 제공 (20명 등록시, 100만원 지원) <span class="txtdesc">* 30만원 상당의 초도물품 제공</span>
										</li>
									</ul>
								</li>
							</ul>
						</div>
						<!-- // 20190620 수정 -->
						<div class="inquire_area">
							<dl>
								<dt>카카오톡으로 문의하기 (친구추가)</dt>
								<dd><a href="https://pf.kakao.com/_xflJxdd" target="_blank">ID : 아이스크림홈런학습센터</a></dd> <!--190503 카카오톡 플러스친구 링크 추가 -->
							</dl>
						</div>
					</div>
				</section>
				<section class="section_business_schedule">
					<div class="inner">
						<ul class="schedule_list">
							<c:forEach var="biz" items="${result}">
								<li>
									<strong class="location">${biz.branch.location}</strong>
									<ul class="schedule_info_list">
										<li>
											<em class="subject">일시</em>
											<div class="cont_wrap">
												<c:forEach var="bizSch" items="${biz.biz.bizSchList}">
													<p>${bizSch.prDateStr}</p>
												</c:forEach>												
											</div>
										</li>
										<li>
											<em class="subject">장소</em>
											<div class="cont_wrap">
												<p>${biz.biz.location}</p>
											</div>
										</li>
										<li>
											<em class="subject">전화</em>
											<div class="cont_wrap">
												<p>${biz.branch.tel}</p>
											</div>
										</li>
									</ul>
									<a href="javascript:void(0);" class="btn_ask" onclick="showBizPrInfoForm(${biz.biz.prId})">참석신청</a><!-- 190426 javascript:void(0); 오타수정 -->
								</li>
							</c:forEach>							
						</ul>
					</div>
				</section>
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
<!-- layer : 사업설명회 신청 -->
<div class="layer_pop layer_ask" style="display:none;">
	<div class="pop_wrap">
		<div class="tit_area">
			사업설명회 신청
		</div>
		<div class="cont_area">
			<div class="area_inner">
				<form id="apply-form">
				<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<strong class="tit">2019년 4월 아이스크림 홈런 학습센터 사업설명회 신청</strong>
				<ul class="input_list">
						<li>
							<strong class="subject">지역<span class="essential">*</span></strong>
							<div class="form_group">
								<div class="radio_wrap">
									<input type="radio" id="test1" name="prId" checked>
									<label for="test1">서울</label>
								</div>
							</div>
						</li>
						<li>
							<strong class="subject">일시<span class="essential">*</span></strong>
							<div class="form_group" id="choose_time">
								
							</div>
						</li>
						<li>
							<strong class="subject">연락처<span class="essential">*</span></strong>
							<div class="form_group">
								<input type="text" class="ip_phone3" title="연락처 첫번째자리" id="phone1">
								<input type="text" class="ip_phone3" title="연락처 중간자리" id="phone2">
								<input type="text" class="ip_phone3" title="연락처 끝자리" id="phone3">
							</div>
						</li>
						<li>
							<strong class="subject">이름<span class="essential">*</span></strong>
							<input type="text" class="ip_name" title="이름" placeholder="이름을 입력해주세요" name="name">
						</li>
						<li>
							<strong class="subject">활동희망지역<span class="essential">*</span></strong>
							<input type="text" class="ip_name" title="활동희망지역" placeholder="예시) 서울시 서초구" name="hopeArea">
						</li>
						<li>
							<strong class="subject">연령대<span class="essential">*</span></strong>
							<div class="form_group">
								<div class="radio_wrap">
									<input type="radio" id="test6" name="age" value="20대">
									<label for="test6">20대</label>
								</div>
								<div class="radio_wrap">
									<input type="radio" id="test7" name="age" value="30대">
									<label for="test7">30대</label>
								</div>
								<div class="radio_wrap">
									<input type="radio" id="test8" name="age" value="40대">
									<label for="test8">40대</label>
								</div>
								<div class="radio_wrap">
									<input type="radio" id="test9" name="age" value="50대">
									<label for="test9">50대</label>
								</div>
								<div class="radio_wrap">
									<input type="radio" id="test10" name="age" value="기타">
									<label for="test10">기타</label>
								</div>
							</div>
						</li>
						<li>
							<strong class="subject">유입경로</strong>
							<div class="form_group">
								<div class="radio_wrap">
									<input type="radio" id="test11" name="funnel" value="온라인" checked>
									<label for="test11">온라인</label>
								</div>
								<div class="radio_wrap">
									<input type="radio" id="test12" name="funnel" value="오프라인">
									<label for="test12">오프라인</label>
								</div>
							</div>
						</li>
						<li>
							<strong class="subject">상세 유입경로</strong>
							<div class="form_group">
								<div class="radio_wrap">
									<input type="radio" id="test13" value="아이스크림홈런 홈페이지" name="funnelSub">
									<label for="test13">아이스크림홈런 홈페이지</label>
								</div>
								<div class="radio_wrap">
									<input type="radio" id="test14" value="네이버블로그" name="funnelSub">
									<label for="test14">네이버블로그</label>
								</div>
								<div class="radio_wrap">
									<input type="radio" id="test15" value="네이버카페" name="funnelSub">
									<label for="test15">네이버카페</label>
								</div>
							</div>
							<div class="form_group">
								<div class="radio_wrap">
									<input type="radio" id="test16" value="신문광고" name="funnelSub">
									<label for="test16">신문광고</label>
								</div>
								<div class="radio_wrap">
									<input type="radio" id="test17" value="지인추천" name="funnelSub">
									<label for="test17">지인추천</label>
								</div>
								<div class="radio_wrap">
									<input type="radio" id="test18" value="기타" name="funnelSub">
									<label for="test18">기타</label>
								</div>
							</div>
						</li>
					</ul>
				<div class="agree_box">
					<div class="chk_wrap">
						<input type="checkbox" id="agree">
						<label for="agree">서비스 제공을 위한 개인정보 수집 및 이용에 동의 합니다.</label>
						<a href="javascript:void(0);" class="show_content" onclick="layerAct.layerShow('layer_agree')">내용보기</a><!-- 190426 javascript:void(0); 오타수정 -->
					</div>
				</div>
				</form>
			</div>
		</div>
		<div class="btn_center_wrap">
			<a href="javascript:resetBizApply()" class="btn_cancel">초기화</a><!-- 190426 javascript:void(0) 추가 -->
			<a href="javascript:bizApply()" class="btn_regi">등록</a><!-- 190426 javascript:void(0) 추가 -->
		</div>
		<button type="button" class="btn_pop_close" onclick="layerAct.layerHide('layer_ask')"><span class="blind">닫기</span></button>
	</div>
	<div class="dim"></div>
</div>
<!-- // layer : 사업설명회 신청 -->
<!-- layer : 개인정보 수집/이용 동의 -->
<div class="layer_pop layer_agree" style="display:none;">
	<div class="pop_wrap">
		<div class="tit_area">
			개인정보 수집/이용 동의
		</div>
		<div class="cont_area">
			<strong class="tit">개인정보 제공 동의</strong>
			<dl class="cont_list">
				<dt>본 서비스 이행을 위해 개인정보(휴대전화번호)를 목적 달성 시 까지 수집/이용함을 동의합니다.</dt>
				<dd>1. 수집 이용 목적: 문의 및 상담 접수에 따른 수집이용</dd>
				<dd>2. 개인정보수집항목: 필수항목(이름,연락처,이메일)</dd>
				<dd>3. 개인정보 보유 및 이용기간: 개인정보 수집 및 이용목적 달성후에는 해당정보 즉시 파기</dd>
			</dl>
			<p class="caution">*고객님께서는 동의를 거부하실 수 있으며, 동의하지 않을 경우 본 서비스는 이용할 수 없습니다.</p>
		</div>
		<div class="btn_center_wrap">
			<a href="javascript:void(0);" class="btn_check" onclick="layerAct.layerHide('layer_agree')">확인</a><!-- 190426 javascript:void(0); 오타수정 -->
		</div>
	</div>
	<div class="dim"></div>
</div>
<!-- // layer : 개인정보 수집/이용 동의 -->
<script src="/resources/js/jquery-1.9.1.min.js"></script>
<script src="/resources/js/default.js"></script>
</body>
</html>
