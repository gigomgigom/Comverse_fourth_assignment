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
								<li class="breadcrumb-item active">사업설명회 관리</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>사업설명회 관리 - 목록</h1>
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
					                <label class="col-sm-2 col-form-label">설명회 노출 여부</label>
					                <div class="col-sm-10 row">
					                	<select id="category" class="form-control col-sm-12">
					                        <option selected>노출</option>
					                        <option>비 노출</option>
					                    </select>
					                </div>
					            </div>
					            <div class="form-group row">
					                <label class="col-sm-2 col-form-label">설명회 정보(지부)</label>
					                <div class="col-sm-10 d-flex row">
					                    <select id="category" class="form-control col-sm-2">
					                        <option selected>서울</option>
					                        <option>인천</option>
					                        <option>부천</option>
					                        <option>성남</option>
					                    </select>
					                </div>
					            </div>
					            <div class="form-group row">
					                <label class="col-sm-2 col-form-label">일자 검색</label>
					                <div class="col-sm-10 d-flex row">
					                	<select class="form-control col-sm-2">
					                        <option selected>검색 조건</option>
					                        <option>등록일</option>
					                        <option>설명회 진행일자</option>
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
					            <div class="form-group row">
					                <label class="col-sm-2 col-form-label">작성 상태</label>
					                <div class="col-sm-10 pt-1">
					                    <input id="status1" type="radio" name="" checked>
					                    <label for="status1" class="mr-3">전체</label>
					                    <input id="status2" type="radio" name="">
					                    <label for="status2" class="mr-3">작성중</label>
					                    <input id="status3" type="radio" name="">
					                    <label for="status3" class="mr-3">게시중</label>
					                </div>
					            </div>
					            <div class="form-group row">
					                <label class="col-sm-2 col-form-label">모집 상태</label>
					                <div class="col-sm-10 pt-1">
					                    <input id="status1" type="radio" name="" checked>
					                    <label for="status1" class="mr-3">전체</label>
					                    <input id="status2" type="radio" name="">
					                    <label for="status2" class="mr-3">모집중</label>
					                    <input id="status3" type="radio" name="">
					                    <label for="status3" class="mr-3">모집완료</label>
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
							<a href="/admin/manage/biz/create" class="btn btn-md btn-outline-primary bg-white">신규 등록</a>
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
										<th class="text-center" width="10%">ID</th>
										<th class="text-center" width="30%">지부</th>
										<th class="text-center" width="10%">등록일</th>
										<th class="text-center" width="10%">진행 일자</th>
										<th class="text-center" width="10%">작성 상태</th>
										<th class="text-center" width="10%">모집 상태</th>
										<th class="text-center" width="10%">노출</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-center">tlarlrma</td>
										<td class="text-center"><a href="/admin/manage/biz/detail">서울</a></td>
										<td class="text-center">2024.09.03</td>
										<td class="text-center">2024.11.03 외 2개</td>
										<td class="text-center">게시중</td>
										<td class="text-center">모집중</td>
										<td class="text-center">비노출</td>
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
