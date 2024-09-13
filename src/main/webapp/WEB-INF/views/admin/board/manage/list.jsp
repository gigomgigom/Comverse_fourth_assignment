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
								<li class="breadcrumb-item"><a href="#">게시판 관리</a></li>
								<li class="breadcrumb-item active">${boardCtg.ctgName}</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>${boardCtg.ctgName} - 목록</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<!-- Search -->
			<form action="#" id="search-input">
			<section class="content">
				<div class="container-fluid p-5">
					<div class="card card-default">
						<div class="card-body p-4">
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">게시물 노출 여부</label>
				                <div class="col-sm-10 row">
				                	<select class="form-control col-sm-12" name="isExpose">
				                        <option value=0>전체</option>
				                        <option value=1>노출</option>
				                        <option value=2>비 노출</option>
				                    </select>
				                </div>
				            </div>
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">게시물 정보</label>
				                <div class="col-sm-10 d-flex row">
				                    <select class="form-control col-sm-2" name="keywordCtg">
				                        <option value=0>검색 조건</option>
				                        <option value=1>제목</option>
				                        <option value=2>제목 + 내용</option>
				                        <option value=3>작성자</option>
				                    </select>
				                    <input type="text" class="form-control col-sm-10" placeholder="검색어를 입력하세요" name="keyword">
				                </div>
				            </div>
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">일자 검색</label>
				                <div class="col-sm-10 d-flex row">
				                	<select class="form-control col-sm-2" name="dateCtg">
				                        <option value=0>검색 조건</option>
				                        <option value=1>게시물 등록일</option>
				                        <option value=2>노출 시작일</option>
				                        <option value=3>노출 종료일</option>
				                    </select>
				                    <input type="date" class="form-control col-sm-5" id="dateFrom" name="startDate">
				                    <input type="date" class="form-control col-sm-5" id="dateTo" name="endDate">
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
				                <label class="col-sm-2 col-form-label">게시물 상태</label>
				                <div class="col-sm-10 pt-1">
				                    <input id="status1" type="radio" value=0 name="stts">
				                    <label for="status1" class="mr-3">전체</label>
				                    <input id="status2" type="radio" value=1 name="stts">
				                    <label for="status2" class="mr-3">작성중</label>
				                    <input id="status3" type="radio" value=2 name="stts">
				                    <label for="status3" class="mr-3">게시중</label>
				                    <input id="status4" type="radio" value=3 name="stts">
				                    <label for="status4" class="mr-3">상시노출</label>
				                    <input id="status5" type="radio" value=4 name="stts">
				                    <label for="status5">게시기간 만료</label>
				                </div>
				            </div>
				            <div class="form-group row">
				                <label for="resultLimit" class="col-sm-2 col-form-label">기타 조건</label>
				                <div class="col-sm-10">
				                   <input id="other1" type="checkbox" value=1 name="others[]">
				                   <label for="other1" class="mr-3">게시물 고정됨</label>
				                   <input id="other2" type="checkbox" value=2 name="others[]">
				                   <label for="other2" class="mr-3">첨부파일 있음</label>
				                   <input id="other3" type="checkbox" value=3 name="others[]">
				                   <label for="other3">댓글 있음</label>
				                </div>
				            </div>
				            <div class="form-group d-flex justify-content-center">
				                <div>
				                    <button type="submit" class="btn btn-lg btn-primary mr-3">검색</button>
				                    <button type="reset" class="btn btn-lg btn-secondary">초기화</button>
				                </div>
				            </div>
						</div>
					</div>
				</div>			
			</section>
			<!-- search./ end -->
			<section class="content">
				<div class="container-fluid px-3">
					<div class="d-flex justify-content-between row">
						<div class="col-md-5">
							<a href="/admin/board/manage/${boCtg}/create" class="btn btn-md btn-outline-primary bg-white">신규 등록</a>
						</div>
						<div class="col-md-5 d-flex align-items-center justify-content-end">
							<button class="btn btn-md btn-outline-primary bg-white mr-5" style="width:300px">엑셀 다운로드</button>
							<select class="form-control" style="max-width: 200px" name="rowsPerPage">
		                        <option value=10>10개씩 보기</option>
		                        <option value=50>50개씩 보기</option>
		                        <option value=100>100개씩 보기</option>
		                        <option value=500>500개씩 보기</option>
		                    </select>
						</div>
					</div>
				</div>
			</section>
			</form>
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
										<th class="text-center" width="40%">제목</th>
										<th class="text-center" width="10%">등록일</th>
										<th class="text-center" width="10%">게시물 상태</th>
										<th class="text-center" width="10%">노출 시작일</th>
										<th class="text-center" width="10%">노출 종료일</th>
										<th class="text-center" width="10%">첨부파일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-center">tlarlrma</td>
										<td class="text-center"><a href="/admin/board/manage/intro-learning-center/detail">레이아웃 잡는거 초반만 힘들지. 후는 괜찮다.</a></td>
										<td class="text-center">2024.09.03</td>
										<td class="text-center">비노출</td>
										<td class="text-center">2024.09.10</td>
										<td class="text-center">2024.10.10</td>
										<td class="text-center"><i class="far fa-file"></i> X 1</td>
									</tr>
									<tr>
										<td class="text-center">tlarlrma</td>
										<td class="text-center">레이아웃 잡는거 초반만 힘들지. 후는 괜찮다.</td>
										<td class="text-center">2024.09.03</td>
										<td class="text-center">비노출</td>
										<td class="text-center">2024.09.10</td>
										<td class="text-center">2024.10.10</td>
										<td class="text-center"><i class="far fa-file"></i> X 1</td>
									</tr>
									<tr>
										<td class="text-center">tlarlrma</td>
										<td class="text-center">레이아웃 잡는거 초반만 힘들지. 후는 괜찮다.</td>
										<td class="text-center">2024.09.03</td>
										<td class="text-center">비노출</td>
										<td class="text-center">2024.09.10</td>
										<td class="text-center">2024.10.10</td>
										<td class="text-center"><i class="far fa-file"></i> X 1</td>
									</tr>
									<tr>
										<td class="text-center">tlarlrma</td>
										<td class="text-center">레이아웃 잡는거 초반만 힘들지. 후는 괜찮다.</td>
										<td class="text-center">2024.09.03</td>
										<td class="text-center">비노출</td>
										<td class="text-center">2024.09.10</td>
										<td class="text-center">2024.10.10</td>
										<td class="text-center"><i class="far fa-file"></i> X 1</td>
									</tr>
									<tr>
										<td class="text-center">tlarlrma</td>
										<td class="text-center">레이아웃 잡는거 초반만 힘들지. 후는 괜찮다.</td>
										<td class="text-center">2024.09.03</td>
										<td class="text-center">비노출</td>
										<td class="text-center">2024.09.10</td>
										<td class="text-center">2024.10.10</td>
										<td class="text-center"><i class="far fa-file"></i> X 1</td>
									</tr>
									<tr>
										<td class="text-center">tlarlrma</td>
										<td class="text-center">레이아웃 잡는거 초반만 힘들지. 후는 괜찮다.</td>
										<td class="text-center">2024.09.03</td>
										<td class="text-center">비노출</td>
										<td class="text-center">2024.09.10</td>
										<td class="text-center">2024.10.10</td>
										<td class="text-center"><i class="far fa-file"></i> X 1</td>
									</tr>
									<tr>
										<td class="text-center">tlarlrma</td>
										<td class="text-center">레이아웃 잡는거 초반만 힘들지. 후는 괜찮다.</td>
										<td class="text-center">2024.09.03</td>
										<td class="text-center">비노출</td>
										<td class="text-center">2024.09.10</td>
										<td class="text-center">2024.10.10</td>
										<td class="text-center"><i class="far fa-file"></i> X 1</td>
									</tr>
									<tr>
										<td class="text-center">tlarlrma</td>
										<td class="text-center">레이아웃 잡는거 초반만 힘들지. 후는 괜찮다.</td>
										<td class="text-center">2024.09.03</td>
										<td class="text-center">비노출</td>
										<td class="text-center">2024.09.10</td>
										<td class="text-center">2024.10.10</td>
										<td class="text-center"><i class="far fa-file"></i> X 1</td>
									</tr>
									<tr>
										<td class="text-center">tlarlrma</td>
										<td class="text-center">레이아웃 잡는거 초반만 힘들지. 후는 괜찮다.</td>
										<td class="text-center">2024.09.03</td>
										<td class="text-center">비노출</td>
										<td class="text-center">2024.09.10</td>
										<td class="text-center">2024.10.10</td>
										<td class="text-center"><i class="far fa-file"></i> X 1</td>
									</tr>
									<tr>
										<td class="text-center">tlarlrma</td>
										<td class="text-center">레이아웃 잡는거 초반만 힘들지. 후는 괜찮다.</td>
										<td class="text-center">2024.09.03</td>
										<td class="text-center">비노출</td>
										<td class="text-center">2024.09.10</td>
										<td class="text-center">2024.10.10</td>
										<td class="text-center"><i class="far fa-file"></i> X 1</td>
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
