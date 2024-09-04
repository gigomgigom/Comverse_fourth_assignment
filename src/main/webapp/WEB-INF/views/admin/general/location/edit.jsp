<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<section class="content p-5">
				<div class="card card-default">
					<div class="card-body">
						<div class="row">
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">위치명</dt>
								<dd class="col-md-10 px-3 py-0 m-0 d-flex align-items-center border">
									<input type="text" class="form-control-sm w-100 border-0">
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">전화</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<input type="text" class="form-control-sm w-100 border-0">
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">주소</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<input type="text" class="form-control-sm w-100 border-0">
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">등록일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">2019-02-25 12:00:00</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">지국 상태</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<div class="custom-control custom-radio">
										<input class="custom-control-input ml-3 mr-5" type="radio" value="" id="radio1" name="isWriting">
								        <label class="custom-control-label ml-5" for="radio1">
								        	작성중
								      	</label>
									</div>
							      	<div class="custom-control custom-radio">
										<input class="custom-control-input ml-3 mr-5" type="radio" value="" id="radio2" name="isWriting">
								        <label class="custom-control-label ml-5" for="radio2">
								        	작성완료
								      	</label>
									</div>
								</dd>
							</dl>
							<dl class="col-md-12 d-flex row">
								<dt class="col-md-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">내용</dt>
								<dd class="col-md-11 px-3 py-2 m-0 d-flex align-items-center border">
									<div class="m-0 w-100">
										<!-- 학습센터 정보 -->
										<div class="card w-100">
											<div class="card-body">
												<div class="d-flex w-100 row">
													<div class="col-lg-5">
														<input type="text" class="form-control" placeholder="학습센터 명">
													</div>
													<div class="col-lg-5">
														<input type="text" class="form-control" placeholder="주소">
													</div>
													<div class="col-lg-2 d-flex justify-content-center">
														<button type="button" class="btn btn-sm">추가</button>
													</div>
												</div>
											</div>
										</div>
										<!-- 학습센터 정보 -->
										<div class="card w-100">
											<div class="card-body">
												<div class="d-flex w-100 row">
													<div class="col-lg-5">
														<input type="text" class="form-control" placeholder="학습센터 명">
													</div>
													<div class="col-lg-5">
														<input type="text" class="form-control" placeholder="주소">
													</div>
													<div class="col-lg-2 d-flex justify-content-center">
														<button type="button" class="btn btn-sm">추가</button>
													</div>
												</div>
											</div>
										</div>
										<div class="card w-100">
											<div class="card-body">
												<div class="d-flex w-100 row">
													<div class="col-lg-5">
														<input type="text" class="form-control" placeholder="학습센터 명">
													</div>
													<div class="col-lg-5">
														<input type="text" class="form-control" placeholder="주소">
													</div>
													<div class="col-lg-2 d-flex justify-content-center">
														<button type="button" class="btn btn-sm">추가</button>
													</div>
												</div>
											</div>
										</div>
										<div class="card w-100">
											<div class="card-body">
												<div class="d-flex w-100 row">
													<div class="col-lg-5">
														<input type="text" class="form-control" placeholder="학습센터 명">
													</div>
													<div class="col-lg-5">
														<input type="text" class="form-control" placeholder="주소">
													</div>
													<div class="col-lg-2 d-flex justify-content-center">
														<button type="button" class="btn btn-sm">추가</button>
													</div>
												</div>
											</div>
										</div>
										<!-- ============================================================================== -->
									</div>
								</dd>
							</dl>
						</div>
					</div>
					<div class="card-footer bg-white py-5">
						<div class="d-flex justify-content-center">
							<a href="/admin/manage/location/detail" class="btn btn-lg btn-primary mr-5 px-4">저장</a>
						</div>
						<div class="d-flex justify-content-end">
							<a href="/admin/manage/location/detail" class="btn btn-lg btn-outline-danger mr-5 px-4">취소</a>
							<a href="/admin/manage/location/list" class="btn btn-lg btn-outline-secondary px-4">목록</a>
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
