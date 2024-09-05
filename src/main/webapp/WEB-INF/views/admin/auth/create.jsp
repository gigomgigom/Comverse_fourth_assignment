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
<body class="hold-transition sidebar-mini sidebar-collapse">
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
								<li class="breadcrumb-item"><a href="#">관리자 및 권한</a></li>
								<li class="breadcrumb-item active">권한 관리</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>권한 관리 - 생성</h1>
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
							<dl class="col-md-12 d-flex row">
								<dt class="col-md-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">권한명</dt>
								<dd class="col-md-11 px-3 py-0 m-0 d-flex align-items-center border">
									<input type="text" class="form-control-sm w-100 border-0">
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">삭제 권한</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
				                    <input id="status1" type="radio" name="" checked>
				                    <label for="status1" class="mr-3 mb-0">삭제 가능</label>
				                    <input id="status2" type="radio" name="">
				                    <label for="status2" class="mr-3 mb-0">삭제 불가</label>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">권한 상태</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<input id="status1" type="radio" name="" checked>
				                    <label for="status1" class="mr-3 mb-0">사용중</label>
				                    <input id="status2" type="radio" name="">
				                    <label for="status2" class="mr-3 mb-0">미사용</label>
								</dd>
							</dl>
							<div class="col-md-12 my-5">
								<h5>권한 설정</h5>
								<table class="table table-bordered">
						            <thead>
						                <tr>
						                    <th class="text-center bg-info" style="width: 30%;">대메뉴 접근권한</th>
						                    <th class="text-center bg-info" style="width: 70%;">서브메뉴 접근권한</th>
						                </tr>
						            </thead>
						            <tbody>
						                <tr>
						                	<td>
						                		<input id="other1" type="checkbox" name="">
					                   			<label for="other1" class="mr-3">게시판 설정</label>
						                	</td>
						                	<td>
						                		<input id="other2" type="checkbox" name="">
					                   			<label for="other2" class="mr-3">게시판 설정</label>
						                	</td>
						                </tr>
						                <tr>
						                	<td>
						                		<input id="other3" type="checkbox" name="">
					                   			<label for="other3" class="mr-3">게시판 관리</label>
						                	</td>
						                	<td>
						                		<div>
						                			<input id="other4" type="checkbox" name="">
					                   				<label for="other4" class="mr-3">우주학습센터 소개</label>
						                		</div>
						                		<div>
						                			<input id="other5" type="checkbox" name="">
					                   				<label for="other5" class="mr-3">홈런학습센터 학습 후기</label>
						                		</div>
						                		<div>
						                			<input id="other6" type="checkbox" name="">
					                   				<label for="other6" class="mr-3">홈런학습센터 교사 후기</label>
						                		</div>
						                		<div>
						                			<input id="other7" type="checkbox" name="">
					                   				<label for="other7" class="mr-3">FAQ</label>
						                		</div>
						                		<div>
						                			<input id="other8" type="checkbox" name="">
					                   				<label for="other8" class="mr-3">알려드립니다.</label>
						                		</div>
						                	</td>
						                </tr>
						                <tr>
						                	<td>
						                		<input id="other9" type="checkbox" name="">
					                   			<label for="other9" class="mr-3">설정</label>
						                	</td>
						                	<td>
						                		<div>
						                			<input id="other10" type="checkbox" name="">
					                   				<label for="other10" class="mr-3">지국위치 안내</label>
						                		</div>
						                		<div>
						                			<input id="other5" type="checkbox" name="">
					                   				<label for="other5" class="mr-3">사업설명회 관리</label>
						                		</div>
						                		<div>
						                			<input id="other6" type="checkbox" name="">
					                   				<label for="other6" class="mr-3">사업설명회 신청</label>
						                		</div>
						                		<div>
						                			<input id="other7" type="checkbox" name="">
					                   				<label for="other7" class="mr-3">학습센터 개설</label>
						                		</div>
						                		<div>
						                			<input id="other8" type="checkbox" name="">
					                   				<label for="other8" class="mr-3">문의 관리</label>
						                		</div>
						                	</td>
						                </tr>
						                <tr>
						                	<td>
						                		<input id="other9" type="checkbox" name="">
					                   			<label for="other9" class="mr-3">관리자 및 권한</label>
						                	</td>
						                	<td>
						                		<div>
						                			<input id="other10" type="checkbox" name="">
					                   				<label for="other10" class="mr-3">관리자 관리</label>
						                		</div>
						                		<div>
						                			<input id="other5" type="checkbox" name="">
					                   				<label for="other5" class="mr-3">권한 관리</label>
						                		</div>
						                	</td>
						                </tr>
						            </tbody>
						        </table>
							</div>
						</div>
					</div>
					<div class="card-footer bg-white py-5">
						<div class="d-flex justify-content-center">
							<a href="/admin/manage/auth/list" class="btn btn-lg btn-primary mr-5 px-4">등록</a>
						</div>
						<div class="d-flex justify-content-end">
							<a href="/admin/manage/auth/list" class="btn btn-lg btn-outline-secondary px-4">목록</a>
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
