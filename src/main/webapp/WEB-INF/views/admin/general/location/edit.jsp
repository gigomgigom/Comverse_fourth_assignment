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
								<li class="breadcrumb-item active">지국위치 안내</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>지국위치 안내 - 수정</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<form id="edit-form">
			<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="brId" value="${searchIndex.detailId}">
			<section class="content p-5">
				<div class="card card-default">
					<div class="card-body">
						<div class="row">
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">위치명</dt>
								<dd class="col-md-10 px-3 py-0 m-0 d-flex align-items-center border">
									<input type="text" class="form-control-sm w-100 border-0" name="location" value="${branch.location}">
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">전화</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<input type="text" class="form-control-sm w-100 border-0" name="tel" value="${branch.tel}">
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">주소</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<input type="text" class="form-control-sm w-100 border-0" name="adr" value="${branch.adr}">
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">등록일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border"><fmt:formatDate value="${branch.regDate}" type="date"></fmt:formatDate></dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">게시물 상태</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<div class="custom-control custom-radio">
										<input class="custom-control-input ml-3 mr-5" type="radio" value="작성중" id="radio1" name="stts" ${branch.stts eq '작성중' ? 'checked':'' }>
								        <label class="custom-control-label ml-5" for="radio1">
								        	작성중
								      	</label>
									</div>
							      	<div class="custom-control custom-radio">
										<input class="custom-control-input ml-3 mr-5" type="radio" value="작성완료" id="radio2" name="stts" ${branch.stts eq '작성중' ? '':'checked' }>
								        <label class="custom-control-label ml-5" for="radio2">
								        	작성완료
								      	</label>
									</div>
								</dd>
							</dl>
							<dl class="col-md-12 d-flex row">
								<dt class="col-md-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">내용</dt>
								<dd class="col-md-11 px-3 py-2 m-0 d-flex align-items-center border">
									<div id="card-container" class="m-0 w-100">
										<c:if test="${empty subBranchList}">
											<!-- 학습센터 정보 -->
											<div class="card w-100">
												<div class="card-body">
													<div class="d-flex w-100 row">
														<div class="col-lg-5">
															<input type="text" class="center-name form-control" placeholder="학습센터 명">
														</div>
														<div class="col-lg-5">
															<input type="text" class="center-adr form-control" placeholder="주소">
														</div>
														<div class="col-lg-2 d-flex justify-content-center">
															<button type="button" class="add-button btn btn-sm btn-info">추가</button>
															<button type="button" class="remove-button btn btn-sm btn-danger d-none">삭제</button>
														</div>
													</div>
												</div>
											</div>
										</c:if>
										<c:forEach var="subBranch" items="${subBranchList}" varStatus="status">
											<c:if test="${status.last}">
												<!-- 학습센터 정보 -->
												<div class="card w-100">
													<div class="card-body">
														<div class="d-flex w-100 row">
															<div class="col-lg-5">
																<input type="text" class="center-name form-control" placeholder="학습센터 명" value="${subBranch.subName}">
															</div>
															<div class="col-lg-5">
																<input type="text" class="center-adr form-control" placeholder="주소" value="${subBranch.subAdr}">
															</div>
															<div class="col-lg-2 d-flex justify-content-center">
																<button type="button" class="add-button btn btn-sm btn-info">추가</button>
																<button type="button" class="remove-button btn btn-sm btn-danger d-none">삭제</button>
															</div>
														</div>
													</div>
												</div>
											</c:if>
											<c:if test="${!status.last}">
												<!-- 학습센터 정보 -->
												<div class="card w-100">
													<div class="card-body">
														<div class="d-flex w-100 row">
															<div class="col-lg-5">
																<input type="text" class="center-name form-control" placeholder="학습센터 명" value="${subBranch.subName}">
															</div>
															<div class="col-lg-5">
																<input type="text" class="center-adr form-control" placeholder="주소" value="${subBranch.subAdr}">
															</div>
															<div class="col-lg-2 d-flex justify-content-center">
																<button type="button" class="remove-button btn btn-sm btn-danger">삭제</button>
															</div>
														</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
																			
									</div>
								</dd>
							</dl>
						</div>
					</div>
					<div class="card-footer bg-white py-5">
						<div class="d-flex justify-content-center">
							<button id="register-button" type="button" class="btn btn-lg btn-primary mr-5 px-4">저장</button>
						</div>
						<div class="d-flex justify-content-end">
							<button type="reset" class="btn btn-lg btn-outline-danger mr-5 px-4">초기화</button>
							<a href="/admin/manage/location/list?pageNo=${searchIndex.pageNo}&rowsPerpage=${searchIndex.rowsPerPage}&isExpose=${searchIndex.isExpose}&keyword=${searchIndex.keyword}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}" class="btn btn-lg btn-outline-secondary px-4">목록</a>
						</div>
					</div>
				</div>
			</section>
			</form>
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
	<script src="/rsc/admin/location-edit.js"></script>
</body>
</html>
