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
								<li class="breadcrumb-item active">사업설명회 신청</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>사업설명회 신청 - 목록</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<!-- Search -->
			<section class="content">
				<div class="container-fluid p-5">
					<div class="card card-default">
						<div class="card-body p-4">
							<form>
					            <div class="form-group row">
					                <label class="col-sm-2 col-form-label">신청자 정보</label>
					                <div class="col-sm-10 d-flex row">
					                    <select id="category" class="form-control col-sm-2">
					                        <option selected>검색 조건</option>
					                        <option>이름</option>
					                        <option>연락처</option>
					                    </select>
					                    <input type="text" class="form-control col-sm-10" id="keyword" placeholder="검색어를 입력하세요">
					                </div>
					            </div>
					            <div class="form-group row">
					                <label class="col-sm-2 col-form-label">지역 검색</label>
					                <div class="col-sm-10 d-flex row">
					                	<select class="form-control col-sm-2">
					                        <option selected>검색 조건</option>
					                        <option>서울</option>
					                        <option>인천</option>
					                        <option>경기</option>
					                    </select>
					                </div>
					            </div>
					            <div class="form-group row">
					                <label class="col-sm-2 col-form-label">일자 검색</label>
					                <div class="col-sm-10 d-flex row">
					                	<select class="form-control col-sm-2">
					                        <option selected>검색 조건</option>
					                        <option>게시물 등록일</option>
					                        <option>노출 시작일</option>
					                        <option>노출 종료일</option>
					                    </select>
					                    <input type="date" class="form-control col-sm-5" id="dateFrom">
					                    <input type="date" class="form-control col-sm-5" id="dateTo">
					                </div>
					            </div>
					            <div class="form-group row">
					                <div class="col-sm-2"></div>
					                <div class="col-sm-10">
					                    <button type="button" class="btn btn-sm btn-primary">1주</button>
					                    <button type="button" class="btn btn-sm btn-primary">1개월</button>
					                    <button type="button" class="btn btn-sm btn-primary">3개월</button>
					                    <button type="button" class="btn btn-sm btn-primary">금월</button>
					                    <button type="button" class="btn btn-sm btn-primary">전월</button>
					                </div>
					            </div>
					            <div class="form-group d-flex justify-content-center">
					                <div>
					                    <button type="submit" class="btn btn-lg btn-primary mr-3">검색</button>
					                    <button type="reset" class="btn btn-lg btn-secondary">초기화</button>
					                </div>
					            </div>
					        </form>
						</div>
					</div>
				</div>			
			</section>
			<!-- search./ end -->
			<section class="content">
				<div class="container-fluid px-3">
					<div class="d-flex justify-content-between row">
						<div class="col-md-5">
							<a href="/admin/manage/biz-apply/create" class="btn btn-md btn-outline-primary bg-white">신규 등록</a>
						</div>
						<div class="col-md-5 d-flex align-items-center justify-content-end">
							<button class="btn btn-md btn-outline-primary bg-white mr-5" style="width:300px">엑셀 다운로드</button>
							<select class="form-control" style="max-width: 200px">
		                        <option selected>10개씩 보기</option>
		                        <option>50개씩 보기</option>
		                        <option>100개씩 보기</option>
		                        <option>500개씩 보기</option>
		                    </select>
						</div>
					</div>
				</div>
			</section>
			<!-- table -->
			<section class="content">
				<div class="container-fluid p-3">
					<div class="card card-default">
						<div class="card-header bg-info">
							검색 결과 : N개
						</div>
						<div class="card-body table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th class="text-center" width="15%">ID</th>
										<th class="text-center" width="15%">지역</th>
										<th class="text-center" width="15%">성명</th>
										<th class="text-center" width="15%">연락처</th>
										<th class="text-center" width="15%">신청일</th>
										<th class="text-center" width="15%">등록일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-center">tlarlrma</td>
										<td class="text-center"><a href="/admin/manage/biz-apply/detail">인천</a></td>
										<td class="text-center">심영조</td>
										<td class="text-center">010-2810-4870</td>
										<td class="text-center">2024.10.10</td>
										<td class="text-center">2024.10.10</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="card-footer bg-white d-flex justify-content-center">
							<nav>
							  <ul class="pagination">
							    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
							    <li class="page-item"><a class="page-link" href="#">1</a></li>
							    <li class="page-item"><a class="page-link" href="#">2</a></li>
							    <li class="page-item"><a class="page-link" href="#">3</a></li>
							    <li class="page-item"><a class="page-link" href="#">Next</a></li>
							  </ul>
							</nav>
						</div>
					</div>
				</div>
			</section>
			<!-- table./ end -->
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
