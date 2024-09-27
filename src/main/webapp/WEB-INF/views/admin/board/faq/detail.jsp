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
								<li class="breadcrumb-item"><a href="#">게시판 관리</a></li>
								<li class="breadcrumb-item active">FAQ(교사)</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>FAQ(교사) - 상세</h1>
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
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">제목</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${faq.title}</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">작성자</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${writer}</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">게시물 고정 유무</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${faq.faqPinned ? '최신 게시물로 표시' : '고정X' }</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">작성상태</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${faq.faqWriting ? '작성중' : '작성완료' }</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">등록일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border"><fmt:formatDate value="${faq.regDate}" type="date"/></dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">게시물 상태</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${!faq.faqWriting && (now > faq.exposeStart || exposeStart == null) && (now < faq.exposeEnd || faq.exposeEnd == null) ? '노출' : '비노출' }</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">노출 시작일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border"><fmt:formatDate value="${faq.exposeStart}" type="date"/></dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">노출 종료일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border"><fmt:formatDate value="${faq.exposeEnd}" type="date"/></dd>
							</dl>
							<dl class="col-md-12 d-flex row">
								<dt class="col-md-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">내용</dt>
								<dd class="col-md-11 px-3 py-2 m-0 d-flex align-items-center border" style="min-height: 500px; max-height: 500px; overflow: auto;">
									${faq.content}
								</dd>
							</dl>
						</div>
					</div>
					<div class="card-footer bg-white py-5">
						<div class="d-flex justify-content-center">
							<a href="/admin/manage/general/faq/edit?detailId=${searchIndex.detailId}&pageNo=${searchIndex.pageNo}&isExpose=${searchIndex.isExpose}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}" class="btn btn-lg btn-outline-primary mr-5 px-4">수정</a>
							<a href="/admin/manage/general/faq/list?pageNo=${searchIndex.pageNo}&isExpose=${searchIndex.isExpose}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}" class="btn btn-lg btn-outline-secondary px-4">목록</a>
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
