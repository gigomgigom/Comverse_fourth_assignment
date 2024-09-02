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
		<div class="visual_wrap visual_guide">
			<h2>학습안내</h2>
			<p>아이스크림 홈런 학습센터의 체계적인 학습 프로그램을 만나보세요</p>
		</div>
		<!--// 상단 이미지 -->
		<!-- 컨텐츠 로케이션 영역 -->
		<div class="location_wrap">
			<div class="inner">
				<ul>
					<li class="home"><span>홈</span></li><!-- 190429 a태그 삭제, span태그 추가 -->
					<li>학습안내</li><!-- 190429 a태그 삭제 -->
					<li><strong>학습문의</strong></li><!-- 190429 a태그 삭제 -->
				</ul>
			</div>
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- contents-->
		<div class="contents">
			<div class="inner">
				<h3>학습문의</h3>
				<div class="wrap_query">
					<table class="form_table_style">
						<caption class="blind"></caption>
						<colgroup>
							<col style="width:18%;">
							<col style="width:auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">이름<span class="essential">*</span></th>
								<td><input type="text" class="ip_name" title="이름" placeholder="문의하시는 분의 이름을 입력해주세요"></td>
							</tr>
							<tr>
								<th scope="row">연락처<span class="essential">*</span></th>
								<td>
									<div class="form_group">
										<div class="sel_wrap ip_phone">
											<button type="button" class="sel_style"><span>선택</span></button>
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
										<input type="text" class="ip_phone" title="연락처 중간자리">
										<input type="text" class="ip_phone" title="연락처 끝자리">
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">이메일<span class="essential">*</span></th>
								<td>
									<div class="form_group">
										<input type="text" class="ip_email" title="메일주소">
										<span class="at">@</span>
										<input type="text" class="ip_email disabled" title="도메인" disabled>
										<div class="sel_wrap ip_personal">
											<button type="button" class="sel_style"><span>직접입력</span></button>
											<ul class="sel_list">
												<li><button type="button">010</button></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">제목<span class="essential">*</span></th>
								<td>
									<input type="text" class="ip_title" title="제목" placeholder="제목을 정확하게 입력해주세요">
								</td>
							</tr>
							<tr>
								<th scope="row">문의내용<span class="essential">*</span></th>
								<td>
									<div class="form_group">
										<textarea class="ip_content" title="제목" placeholder="문의내용을 입력해주세요."></textarea>
										<span class="count"><strong class="current">30</strong> / 1,000</span>
									</div>
									<p class="caution">* 작성하시는 내용 중에 주민등록번호, 연락처 등 개인정보에 관한 내용이 있다면 개인정보가 타인에게 노출되어 침해 받을 수 있으므로 삭제 후 등록하여 주십시요.</p>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="notice_info_wrap">
						<strong class="tit">알아두실 사항</strong>
						<ul class="info_list">
							<li>학습문의를 등록하시면 이메일 또는 연락처로 연락드립니다. 등록전 연락정보를 다시 한번 확인해주세요.</li>
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
						<a href="javascript:void(0)" class="btn_cancel">초기화</a><!-- 190426 javascript:void(0) 추가 -->
						<a href="javascript:void(0)" class="btn_regi">등록</a><!-- 190426 javascript:void(0) 추가 -->
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
			<strong class="tit">개인정보 제공 동의</strong>
			<!-- 20190529 수정 -->
			<dl class="cont_list">
				<dt>본 서비스 이행을 위해 개인정보를 목적 달성 시 까지 수집/이용함을 동의합니다.</dt>
				<dd>1. 수집 이용 목적 : 학습 문의 접수에 따른 수집 이용</dd>
				<dd>2. 개인정보수집항목: 필수항목(이름,연락처,이메일)</dd>
				<dd>3. 개인정보 보유 및 이용기간: 개인정보 수집 및 이용목적 달성후에는 해당정보 즉시 파기</dd>
			</dl>
			<!-- // 20190529 수정 -->
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
