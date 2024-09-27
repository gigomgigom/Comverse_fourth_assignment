<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
								<li class="breadcrumb-item"><a href="#">게시판 관리</a></li>
								<li class="breadcrumb-item active">FAQ(교사)</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>FAQ(교사) - 생성</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<form id="create-form">
			<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<section class="content p-5">
				<div class="card card-default">
					<div class="card-body">
						<div class="row">
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">제목</dt>
								<dd class="col-md-10 px-3 py-0 m-0 d-flex align-items-center border">
									<input type="text" class="form-control-sm w-100 border-0" name="title">
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">작성자</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<sec:authentication property="principal.username" var="username"/>
									${username}
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">게시물 고정 유무</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<input class="custom-control-input ml-3 mr-5" type="checkbox" value=1 id="pinned" name="pinned">
							        <label class="custom-control-label ml-5" for="pinned">
							        	프론트 화면에 최신 게시물로 노출됩니다.
							      	</label>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">댓글 등록가능</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<input class="custom-control-input ml-3 mr-5" type="checkbox" value=1 id="replyable" name="replyable">
							        <label class="custom-control-label ml-5" for="replyable">
							        	댓글 등록 가능
							      	</label>
								</dd>
							</dl>
							<dl class="col-md-12 d-flex row">
								<dt class="col-md-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">게시물 상태</dt>
								<dd class="col-md-11 px-3 py-2 m-0 d-flex align-items-center border">
									<div class="custom-control custom-radio">
										<input class="custom-control-input ml-3 mr-5" type="radio" value=1 id="radio1" name="stts" checked>
								        <label class="custom-control-label ml-5" for="radio1">
								        	작성중
								      	</label>
									</div>
							      	<div class="custom-control custom-radio">
										<input class="custom-control-input ml-3 mr-5" type="radio" value=2 id="radio2" name="stts">
								        <label class="custom-control-label ml-5" for="radio2">
								        	작성완료
								      	</label>
									</div>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">노출 시작일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<div>
										<input class="custom-control-input ml-3 mr-5" type="checkbox" id="expose-start-check">
								        <label class="custom-control-label ml-5" for="expose-start-check">
								        	시작일 설정
								      	</label>
									</div>
									<input id="expose-start" type="date" class="ml-3 form-control col-sm-5" name="exposeStart" disabled>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">노출 종료일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<div>
										<input class="custom-control-input ml-3 mr-5" type="checkbox" id="expose-end-check">
								        <label class="custom-control-label ml-5" for="expose-end-check">
								        	종료일 설정
								      	</label>
									</div>
									<input id="expose-end" type="date" class="ml-3 form-control col-sm-5" name="exposeEnd" disabled>
								</dd>
							</dl>
							<dl class="col-md-12 d-flex row">
								<dt class="col-md-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">내용</dt>
								<dd class="col-md-11 px-3 py-2 m-0 d-flex align-items-center border" style="min-height: 500px; max-height: 500px;">
									<div class="m-0 w-100">
										<textarea class="form-control" rows="20" name="content"></textarea>
									</div>
								</dd>
							</dl>
						</div>
					</div>
					<div class="card-footer bg-white py-5">
						<div class="d-flex justify-content-center">
							<button type="button" id="submit-button" class="btn btn-lg btn-primary mr-5 px-4">저장</button>
						</div>
						<div class="d-flex justify-content-end">
							<button type="reset" class="btn btn-lg btn-outline-danger mr-5 px-4">취소</button>
							<a href="/admin/manage/general/faq/list" class="btn btn-lg btn-outline-secondary px-4">목록</a>
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
	<script src="/resources/adminlte/bootstrap/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/adminlte/adminlte/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/adminlte/adminlte/js/demo.js"></script>
	<!-- JS -->
	<script src="/rsc/admin/faq-create.js"></script>
</body>
</html>
