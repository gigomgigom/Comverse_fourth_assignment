<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
<body class="hold-transition sidebar-mini layer-fixed">
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
								<li class="breadcrumb-item active">문의 관리</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>문의 관리 - 상세</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content container-fluid row p-5">
				<div class="col-xl-6">
					<div class="card card-default">
						<div class="card-body">
							<div class="row">
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">제목</dt>
									<dd class="col-xl-11 px-3 py-2 m-0 d-flex align-items-center border">${inquiry.title}</dd>
								</dl>
								<dl class="col-xl-6 d-flex row">
									<dt class="col-xl-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">구분</dt>
									<dd class="col-xl-10 px-3 py-2 m-0 d-flex align-items-center border">${inquiry.field}</dd>
								</dl>
								<dl class="col-xl-6 d-flex row">
									<dt class="col-xl-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">성명</dt>
									<dd class="col-xl-10 px-3 py-2 m-0 d-flex align-items-center border">${inquiry.name}</dd>
								</dl>
								<dl class="col-xl-6 d-flex row">
									<dt class="col-xl-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">연락처</dt>
									<dd class="col-xl-10 px-3 py-2 m-0 d-flex align-items-center border">${inquiry.tel}</dd>
								</dl>
								<dl class="col-xl-6 d-flex row">
									<dt class="col-xl-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">이메일</dt>
									<dd class="col-xl-10 px-3 py-2 m-0 d-flex align-items-center border">${inquiry.email}</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">본문 내용</dt>
									<dd class="col-xl-11 px-3 py-2 m-0 d-flex align-items-center border" style="min-height: 300px">
										${inquiry.content}
									</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">
										개인정보수집 동의
									</dt>
									<dd class="col-xl-11 px-3 py-2 m-0 d-flex align-items-center border" style="min-height: 500px; max-height: 500px; overflow: auto;">
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
											<input class="form-control-input ml-3" type="checkbox" value="" id="checkbox1" checked disabled>
									        <label class="form-control-label" for="checkbox1">
									        	고객이 동의하였습니다.
									      	</label>
										</div>
									</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<form id="create-form">
					<input type="hidden" name="inqId" value="${inquiry.inqId}"/>
					<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="card card-default">
						<div class="card-header p-3 bg-primary">
							<h4 class="m-0">처리내용 작성</h4>
						</div>
						<div class="card-body">
							<div class="row">
								<dl class="col-xl-6 d-flex row">
									<dt class="col-xl-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">처리상태</dt>
									<dd class="col-xl-10 px-3 py-2 m-0 d-flex align-items-center border">
										<select id="category" class="form-control w-100" name="stts">
											<option ${inquiry.stts eq '접수중' ? 'selected' : '' }>접수중</option>
					                        <option ${inquiry.stts eq '미처리' ? 'selected' : '' }>미처리</option>
					                        <option ${inquiry.stts eq '전화 처리완료' ? 'selected' : '' }>전화 처리완료</option>
					                        <option ${inquiry.stts eq '이메일 처리완료' ? 'selected' : '' }>이메일 처리완료</option>
					                    </select>
									</dd>
								</dl>
								<div class="col-xl-6 mb-5 d-flex justify-content-end">
									<button type="button" id="register-button" class="btn btn-lg btn-outline-primary mr-2 px-4">저장</button>
									<a href="/admin/manage/general/one-to-one/list?pageNo=${searchIndex.pageNo}&division=${searchIndex.division}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&startDate=${searchIndex.startDate}&endDate=${searchIndex.endDate}&rowsPerPage=${searchIndex.rowsPerPage}" class="btn btn-lg btn-outline-secondary px-4">문의 목록으로 이동</a>
								</div>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">처리내용</dt>
									<dd class="col-xl-11 px-3 py-2 m-0 d-flex align-items-center border">
										<textarea class="form-control w-100" rows="10" name="content"></textarea>
									</dd>
								</dl>
							</div>
						</div>
					</div>
					</form>
					<div class="card card-default">
						<div class="card-header p-3 bg-primary">
							<h4 class="m-0">처리 이력</h4>
						</div>
						<div class="card-body" style="min-height: 479px; max-height: 479px; overflow: auto;">
							<div class="row">
								<div class="col-xl-12">
									<c:forEach var="history" items="${inqProgList}" varStatus="status">
										<div class="card">
											<div class="card-header bg-info">
												<h5 class="m-0">${status.count}차</h5>
											</div>
											<div class="card-body">
												<div class="row">
													<div class="col-xl-6 d-flex flex-column">
														<dl class="d-flex row" style="height:33%;">
															<dt class="col-xl-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">처리자</dt>
															<dd class="col-xl-10 px-3 py-2 m-0 d-flex align-items-center border">
																${history.admName} - ( ${history.admUserName} )
															</dd>
														</dl>
														<dl class="d-flex row" style="height:33%;">
															<dt class="col-xl-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">처리상태</dt>
															<dd class="col-xl-10 px-3 py-2 m-0 d-flex align-items-center border">
																${history.stts}
															</dd>
														</dl>
														<dl class="d-flex row" style="height:33%;">
															<dt class="col-xl-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">처리일자</dt>
															<dd class="col-xl-10 px-3 py-2 m-0 d-flex align-items-center border">
																<fmt:formatDate value="${history.regDate}" type="date"/>
															</dd>
														</dl>
													</div>
													<dl class="col-xl-6 d-flex row">
														<dt class="col-xl-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">처리내용</dt>
														<dd class="col-xl-10 px-3 py-2 m-0 d-flex align-items-center border">
															${history.content}
														</dd>
													</dl>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
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
	<!-- JS -->
	<script src="/rsc/admin/inquiry-detail.js"></script>
</body>
</html>
