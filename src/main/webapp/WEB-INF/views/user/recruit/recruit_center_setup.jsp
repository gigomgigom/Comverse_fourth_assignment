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
				<!-- 20190620 수정 -->
				<ul>
					<li class="home"><span>홈</span></li>
					<li>교사채용</li>
					<li><strong>학습센터 개설신청</strong></li>
				</ul>
				<!-- // 20190620 수정 -->
			</div>
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<div class="inner">
				<!-- 20190620 수정 -->
				<h3>학습센터 개설신청</h3>
				<!-- // 20190620 수정 -->
				<div class="wrap_query">
					<form id="join-center-form">
					<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<table class="form_table_style">
						<caption class="blind"></caption>
						<colgroup>
							<col style="width:200px;">
							<col style="width:400px;">
							<col style="width:200px;">
							<col style="width:auto;">
						</colgroup>
						<tbody>							
							<tr>
								<th scope="row">지원분야<span class="essential">*</span></th>
								<td colspan="3">
									<div class="form_group">
										<div class="radio_wrap">
											<input type="radio" id="test1" name="field" value="학습센터 교사" checked>
											<label for="test1">학습센터 교사</label>
										</div>
										<div class="radio_wrap">
											<input type="radio" id="test2" name="field" value="방문 교사">
											<label for="test2">방문 교사</label>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">이름<span class="essential">*</span></th>
								<td><input type="text" class="ip_name2" title="이름" placeholder="이름을 입력해주세요" name="name"></td>
								<th scope="row">연락처<span class="essential">*</span></th>
								<td>
									<div class="form_group">
										<div class="sel_wrap ip_phone2">
											<button type="button" class="sel_style" id="tel-prefix"><span>선택</span></button>
											<ul class="sel_list">
												<li><button type="button">010</button></li>
												<li><button type="button">011</button></li>
												<li><button type="button">016</button></li>
												<li><button type="button">017</button></li>
												<li><button type="button">018</button></li>
												<li><button type="button">019</button></li>
												<li><button type="button">02</button></li>
												<li><button type="button">051</button></li>
												<li><button type="button">053</button></li>
												<li><button type="button">032</button></li>
												<li><button type="button">062</button></li>
												<li><button type="button">042</button></li>
												<li><button type="button">052</button></li>
												<li><button type="button">044</button></li>
												<li><button type="button">031</button></li>
												<li><button type="button">033</button></li>
												<li><button type="button">043</button></li>
												<li><button type="button">041</button></li>
												<li><button type="button">063</button></li>
												<li><button type="button">061</button></li>
												<li><button type="button">054</button></li>
												<li><button type="button">055</button></li>
												<li><button type="button">064</button></li>
											</ul>
										</div>
										<input type="text" class="ip_phone2" title="연락처 중간자리" name="telSecond">
										<input type="text" class="ip_phone2" title="연락처 끝자리" name="telThird">
									</div>
								</td>
							</tr>
							<!-- 20190529 수정 -->
							<tr>
								<th scope="row">생년월일<span class="essential">*</span></th>
								<td><input type="text" class="ip_name2" title="이름" placeholder="예시)19850101" name="birthDate"></td>
								<th scope="row">성별<span class="essential">*</span></th>
								<td>
									<div class="form_group">
										<div class="radio_wrap">
											<input type="radio" id="test4" value="남성" name="sex" checked>
											<label for="test4">남성</label>
										</div>
										<div class="radio_wrap">
											<input type="radio" id="test5" value="여성" name="sex">
											<label for="test5">여성</label>
										</div>
									</div>
								</td>
							</tr>
							<!-- // 20190529 수정 -->
							<tr>
								<th scope="row">거주지역</th>
								<td>
									<div class="sel_wrap ip_location">
										<button type="button" class="sel_style" id="living-location"><span>선택하세요</span></button>
										<ul class="sel_list">
											<li><button type="button">서울</button></li>
										    <li><button type="button">부산</button></li>
										    <li><button type="button">대구</button></li>
										    <li><button type="button">인천</button></li>
										    <li><button type="button">광주</button></li>
										    <li><button type="button">대전</button></li>
										    <li><button type="button">울산</button></li>
										    <li><button type="button">세종</button></li>
										    <li><button type="button">경기</button></li>
										    <li><button type="button">강원</button></li>
										    <li><button type="button">충북</button></li>
										    <li><button type="button">충남</button></li>
										    <li><button type="button">전북</button></li>
										    <li><button type="button">전남</button></li>
										    <li><button type="button">경북</button></li>
										    <li><button type="button">경남</button></li>
										    <li><button type="button">제주</button></li>
										</ul>
									</div>
								</td>
								<th scope="row">자택주소</th>
								<!-- 20190621 수정 -->
								<td>
									<div class="sel_wrap ip_address">
										<input type="text" class="ip_address" title="자택주소" placeholder="자택주소" name="adr">
									</div>
								</td>
								<!-- // 20190621 수정 -->
							</tr>
							<!-- 190412 추가 -->
							<tr>
								<th scope="row">이메일<span class="essential">*</span></th>
								<td colspan="3">
									<div class="form_group">
										<input type="text" class="ip_email" title="메일주소" id="email_name">
										<span class="at">@</span>
										<input type="text" class="ip_email" title="도메인" id="email_domain">
										<div class="sel_wrap ip_personal">
											<button type="button" class="sel_style"><span>직접입력</span></button>
											<ul class="sel_list">
												<li><button type="button">직접입력</button></li>
												<li><button type="button">gmail.com</button></li>
												<li><button type="button">naver.com</button></li>
												<li><button type="button">kakao.com</button></li>
												<li><button type="button">daum.net</button></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>
							<!-- // 190412 추가 -->							
						</tbody>
					</table>
					</form>
					<div class="notice_info_wrap">
						<strong class="tit">알아두실 사항</strong>
						<ul class="info_list">
							<li>학습센터 교사, 방문교사는 초대졸 이상의 학력인 경우 지원 가능합니다.</li>
						</ul>
					</div>
					<div class="agree_box">
						<div class="chk_wrap">
							<input type="checkbox" id="agree">
							<label for="agree">서비스 제공을 위한 개인정보 수집 및 이용에 동의 합니다.</label>
							<a href="javascript:void(0);" class="show_content" onclick="layerAct.layerShow('layer_agree')">내용보기</a><!-- 190426 javascript:void(0); 오타수정 -->
						</div>
					</div>
					<div class="btn_center_wrap mb100">
						<a href="javascript:resetJoinCenterForm()" class="btn_cancel">초기화</a><!-- 190426 javascript:void(0) 추가 -->
						<a href="javascript:submitJoinCenterForm()" class="btn_regi">등록</a><!-- 190426 javascript:void(0) 추가 -->
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

<!-- layer : 개인정보 수집/이용 동의 -->
<div class="layer_pop layer_agree" style="display:none;">
	<div class="pop_wrap">
		<div class="tit_area">
			개인정보 수집/이용 동의
		</div>
		<div class="cont_area">
			<!-- 20190529 수정 -->
			<strong class="tit">[선택] 개인정보 제공 동의</strong>
			<dl class="cont_list">
				<dt>본 서비스 이행을 위해 개인정보를 목적 달성 시 까지 수집/이용함을 동의합니다.</dt>
				<dd>1. 수집 이용 목적 : 학습센터개설 접수에 따른 수집 이용</dd>
				<dd>2. 개인정보수집항목: 필수항목(이름,연락처,이메일,생년월일,결혼여부)</dd>
				<dd>3. 개인정보 보유 및 이용기간: 개인정보 수집 및 이용목적 달성후에는 해당정보 즉시 파기</dd>
			</dl>
			<p class="caution">*고객님께서는 동의를 거부하실 수 있으며, 동의하지 않아도 학습센터 개설 문의는 이용할 수 있습니다.</p>
			<!-- // 20190529 수정 -->
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
