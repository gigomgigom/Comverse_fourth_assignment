<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ICC-HR ADMIN</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/adminlte/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/adminlte/adminlte/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<!-- Site wrapper -->
	<div class="wrapper">
		<!-- Navbar -->
		<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>
		<!-- /.navbar -->
		<!-- aside bar -->
		<%@ include file="/WEB-INF/views/admin/common/asidebar.jsp"%>
		<!-- /aside bar -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-12">
							<ol class="breadcrumb float-sm-left pl-5 pt-4">
								<li class="breadcrumb-item"><a href="#">홈</a></li>
								<li class="breadcrumb-item"><a href="#">설정</a></li>
								<li class="breadcrumb-item active">사업설명회 신청</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>사업설명회 신청 - 상세</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content p-5">
				<div class="card card-default">
					<div class="card-body">
						<div class="row">
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">신청자 성명</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${bizApl.name}</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">연락처</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${bizApl.tel}</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">지역</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${biz.prId}. ${branch.location}(${biz.location})</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">일시</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<fmt:formatDate value="${ sch }" pattern="yyyy-MM-dd HH:mm" var="parsedDateTime"/>
									${parsedDateTime}
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">활동 희망 지역</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${bizApl.hopeArea}</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">연령대</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${bizApl.age}</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">신청 경로</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${bizApl.channel}</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">유입 경로</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${bizApl.funnel}</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">상세 유입경로</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${bizApl.funnelSub}</dd>
							</dl>
							<dl class="col-md-12 d-flex row">
								<dt class="col-md-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">
									개인정보수집 동의
								</dt>
								<dd class="col-md-11 px-3 py-2 m-0 d-flex align-items-center border" style="min-height: 500px; max-height: 500px; overflow: auto;">
									<div>
										<p><b>※ 접수 시 하단 개인정보 취급 방침의 내용을 설명하고 동의 받으시기 바랍니다.</b></p>
										<br>
										<p>[개인정보 제공 동의]</p>
										<p>본 서비스 이행을 위해 개인정보(휴대전화번호)를 목적 달성 시까지 수집/이용함을 동의합니다.</p>
										<p>1. 수집 이용 목적: 문의 및 상담 접수에 따른 수집 이용</p>
										<p>2. 개인정보수집항목: 필수항목(이름, 연락처, 이메일)</p>
										<p>3. 개인정보 보유 및 이용기간: 개인정보 수집 및 이용목적 달성 후에는 해당 정보 즉시 파기</p>
										<br>
										<p>*고객님께서는 동의를 거부하실 수 있으며, 동의하지 않을 경우 본 서비스는 이용할 수 없습니다.</p>
										<input class="form-control-input ml-3" type="checkbox" value="" id="checkbox1" ${bizApl.agree ? 'checked' : '' } disabled>
								        <label class="form-control-label" for="checkbox1">
								        	고객이 동의하였습니다.
								      	</label>
									</div>
								</dd>
							</dl>
						</div>
					</div>
					<div class="card-footer bg-white py-5">
						<div class="d-flex justify-content-center">
							<a href="/admin/manage/general/biz-apply/edit?detailId=${searchIndex.detailId}&pageNo=${searchIndex.pageNo}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&location=${searchIndex.location}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&rowsPerPage=${searchIndex.rowsPerPage}" class="btn btn-lg btn-outline-primary mr-5 px-4">수정</a>
							<a href="/admin/manage/general/biz-apply/list?pageNo=${searchIndex.pageNo}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&location=${searchIndex.location}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&rowsPerPage=${searchIndex.rowsPerPage}" class="btn btn-lg btn-outline-secondary px-4">목록</a>
						</div>
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="/resources/adminlte/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="/resources/adminlte/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/adminlte/adminlte/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/adminlte/adminlte/js/demo.js"></script>
</body>
</html>
