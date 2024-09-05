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
								<li class="breadcrumb-item"><a href="#">관리자 및 권한</a></li>
								<li class="breadcrumb-item active">관리자 관리</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>관리자 관리 - 수정</h1>
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
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">이름</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border">
										<input type="text" class="form-control">
									</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">ID</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border">
										<div class="w-100">
											<input type="text" class="form-control">
											<ul class="m-0">
												<li>영문/숫자를 이용하여 4자리 ~ 16자리로 아이디를 생성해주세요.</li>
												<li>아이디 첫글자는 반드시 영문으로 시작해야합니다.</li>
											</ul>
										</div>
									</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">비밀번호</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border">
										<div class="w-100">
											<input type="password" class="form-control">
											<ul class="m-0">
												<li>영문/숫자/특수문자를 2가지 이상 조합하여 8자리 ~ 16자리로 입력해 주세요.</li>
											</ul>
										</div>
									</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">tel</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border">
										<input type="text" class="form-control">
									</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">email</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border">
										<input type="email" class="form-control mr-5 col-xl-7">
										<button class="btn btn-sm btn-info col-xl-2">중복확인</button>
									</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="card card-default">
						<div class="card-header p-3 bg-primary">
							<h4 class="m-0">관리자 정보</h4>
						</div>
						<div class="card-body" style="min-height: 500px">
							<div class="row">
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">소속팀</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border">
										<select id="category" class="form-control w-100">
					                        <option>미처리</option>
					                        <option>전화 처리완료</option>
					                        <option>이메일 처리완료</option>
					                    </select>
									</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">관리자 상태</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border">
					                    <select id="category" class="form-control">
					                        <option selected>전체</option>
					                        <option>승인완료</option>
					                        <option>승인중</option>
					                        <option>접근불가</option>
					                        <option>휴면</option>
					                    </select>
									</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">권한 설정</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border"  style="min-height: 350px; max-height: 350px; overflow:auto;">
					                   	<div class="w-100 row">
					                   		<div class="card col-xl-12">
					                   			<div class="card-body row">
					                   				<select id="category" class="form-control col-xl-9">
								                        <option selected>전체</option>
								                        <option>총괄 관리자</option>
								                        <option>게시글 관리자</option>
								                        <option>이벤트 관리자</option>
								                        <option>서브 관리자</option>
								                    </select>
								                    <button class="ml-3 col-xl-2 btn btn-sm btn-info">추가</button>
					                   			</div>
					                   		</div>
					                   		<div class="card col-xl-12">
					                   			<div class="card-body row">
					                   				<select id="category" class="form-control col-xl-9">
								                        <option selected>전체</option>
								                        <option>총괄 관리자</option>
								                        <option>게시글 관리자</option>
								                        <option>이벤트 관리자</option>
								                        <option>서브 관리자</option>
								                    </select>
								                    <button class="ml-3 col-xl-2 btn btn-sm btn-info">삭제</button>
					                   			</div>
					                   		</div>
					                   	</div>
									</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-12 d-flex justify-content-end">
					<button class="btn btn-lg btn-primary mr-3">저장</button>
					<button class="btn btn-lg btn-secondary mr-3">삭제</button>
					<a class="btn btn-lg btn-secondary">목록</a>
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
