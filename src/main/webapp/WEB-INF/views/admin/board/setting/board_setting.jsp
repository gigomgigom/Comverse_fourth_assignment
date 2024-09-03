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
								<li class="breadcrumb-item active">게시판 설정</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>게시판 설정</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<section class="content">
				<div class="container-fluid">
					<div class="row" style="">
						<div class="col-md-4 p-3">
							<div class="card card-default">
								<div class="card-header bg-primary">
									<h4 class="my-2">게시판 목록</h4>
								</div>
								<div class="card-body" style="overflow: auto; min-height: 700px; max-height: 700px;">
									<div id="board-list" >
										<div class="card card-default">
											<div class="card-header" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all;">
												<h6 class="my-2">공지사항</h6>
											</div>										
										</div>
										<div class="card card-default">
											<div class="card-header" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all;">
												<h6 class="my-2">공지사항</h6>
											</div>										
										</div>
										<div class="card card-default">
											<div class="card-header" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all;">
												<h6 class="my-2">공지사항</h6>
											</div>										
										</div>
										<div class="card card-default">
											<div class="card-header" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all;">
												<h6 class="my-2">공지사항</h6>
											</div>										
										</div>
										<div class="card card-default">
											<div class="card-header" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all;">
												<h6 class="my-2">공지사항</h6>
											</div>										
										</div>
										<div class="card card-default">
											<div class="card-header" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all;">
												<h6 class="my-2">공지사항</h6>
											</div>										
										</div>
										<div class="card card-default">
											<div class="card-header" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all;">
												<h6 class="my-2">공지사항</h6>
											</div>										
										</div>
										<div class="card card-default">
											<div class="card-header" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all;">
												<h6 class="my-2">공지사항</h6>
											</div>										
										</div>
										<div class="card card-default">
											<div class="card-header" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all;">
												<h6 class="my-2">공지사항</h6>
											</div>										
										</div>
										<div class="card card-default">
											<div class="card-header" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all;">
												<h6 class="my-2">공지사항</h6>
											</div>										
										</div>
										<div class="card card-default">
											<div class="card-header" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all;">
												<h6 class="my-2">공지사항</h6>
											</div>										
										</div>
									</div>
								</div>
								<div class="card-footer bg-white">
									<div id="board-create" class="d-flex justify-content-center">
										<button class="btn btn-lg btn-primary">새로 생성</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-8 p-3">
							<div class="card card-default">
								<div class="card-header bg-primary">
									<h4 class="my-2">게시판 생성/수정</h4>
								</div>
								<div class="card-body">
									<table class="table">
									    <tbody>
									        <tr class="py-1">
									            <td class="d-flex justify-content-center border-0 my-1">
									            	<p><b>게시판 명</b></p>
									            </td>
									            <td class="border-0">
									            	<input class="form-control" type="text" id="input-name" name="">
									            </td>
									        </tr>
									        <tr>
									            <td class="d-flex justify-content-center border-0 my-1">
									            	<p><b>게시판 코드</b></p>
									            </td>
									            <td>
									            	<input class="form-control" type="text" id="input-code" name="">
									            </td>
									        </tr>
									        <tr>
									            <td class="d-flex justify-content-center border-0 my-1">
									            	<p><b>게시판 주소</b></p>
									            </td>
									            <td>
									            	<input class="form-control" type="text" id="input-addr" name="">
									            </td>
									        </tr>
									        <tr>
									            <td class="d-flex justify-content-center border-0 my-1">
									            	<p><b>게시판 사용 여부</b></p>
									            </td>
									            <td>
									            	<div class="d-flex pl-5 align-items-center">
									            		<div class="d-flex justify-content-center mr-5">
										            		<input class="form-check-input mr-5" type="radio" id="input-usable1" name="radioButton">
										            		<label for="input-usable1">사용</label>
										            	</div>
										            	<div class="d-flex justify-content-center">
										            		<input class="form-check-input mr-5" type="radio" id="input-usable2" name="radioButton">
										            		<label for="input-usable2">미사용</label>
										            	</div>
									            	</div>
									            </td>
									        </tr>
									        <tr>
									            <td class="d-flex justify-content-center border-0 my-1">
									            	<p><b>new 버튼 노출 여부</b></p>
									            </td>
									            <td>
									            	<div class="d-flex pl-5">
									            		<div class="d-flex justify-content-center mr-5">
										            		<input class="form-check-input mr-5" type="radio" id="input-exposable1" name="radioButton1">
										            		<label for="input-exposable1">사용</label>
										            	</div>
										            	<div class="d-flex justify-content-center">
										            		<input class="form-check-input mr-5" type="radio" id="input-exposable2" name="radioButton1">
										            		<label for="input-exposable2">미사용</label>
										            	</div>
									            	</div>
									            	<div class="d-flex pl-3 mt-3">
									            		<div class="mr-5">
									            			<b>노출 기간</b>
									            		</div>
									            		<div class="d-flex justify-content-center mr-5">
										            		<input class="form-check-input mr-5" type="radio" id="input-expose1" name="radioButton2">
										            		<label for="input-expose1">5일</label>
										            	</div>
										            	<div class="d-flex justify-content-center mr-5">
										            		<input class="form-check-input mr-5" type="radio" id="input-expose2" name="radioButton2">
										            		<label for="input-expose2">10일</label>
										            	</div>
										            	<div class="d-flex justify-content-center mr-5">
										            		<input class="form-check-input mr-5" type="radio" id="input-expose3" name="radioButton2">
										            		<label for="input-expose3">15일</label>
										            	</div>
										            	<div class="d-flex justify-content-center">
										            		<input class="form-check-input mr-5" type="radio" id="input-expose4" name="radioButton2">
										            		<label for="input-expose4">20일</label>
										            	</div>
									            	</div>
									            </td>
									        </tr>
									        <tr>
									            <td class="d-flex justify-content-center border-0 my-1">
									            	<p><b>게시판 사용 여부</b></p>
									            </td>
									            <td>
									            	<div class="d-flex pl-3 align-items-center">
									            		<div class="d-flex justify-content-center mr-5">
										            		<input class="form-check-input mr-5" type="radio" id="input-rowCnt1" name="radioButton3">
										            		<label for="input-rowCnt1" class="ml-4">기본 10개</label>
										            	</div>
										            	<div class="d-flex justify-content-center mr-5">
										            		<input class="form-check-input mr-5" type="radio" id="input-rowCnt2" name="radioButton3">
										            		<label for="input-rowCnt2">15개</label>
										            	</div>
										            	<div class="d-flex justify-content-center mr-5">
										            		<input class="form-check-input mr-5" type="radio" id="input-rowCnt3" name="radioButton3">
										            		<label for="input-rowCnt3">20개</label>
										            	</div>
										            	<div class="d-flex justify-content-center mr-5">
										            		<input class="form-check-input mr-5" type="radio" id="input-rowCnt4" name="radioButton3">
										            		<label for="input-rowCnt4">25개</label>
										            	</div>
										            	<div class="d-flex justify-content-center mr-5">
										            		<input class="form-check-input mr-5" type="radio" id="input-rowCnt5" name="radioButton3">
										            		<label for="input-rowCnt5">30개</label>
										            	</div>
										            	<div class="d-flex justify-content-center">
										            		<input class="form-check-input mr-5" type="radio" id="input-rowCnt6" name="radioButton3">
										            		<label for="input-rowCnt6">50개</label>
										            	</div>
									            	</div>
									            </td>
									        </tr>
									        <tr class="py-1">
									            <td class="d-flex justify-content-center border-0 my-1">
									            	<p><b>글쓰기 권한</b></p>
									            </td>
									            <td class="pl-4">
									            	<select class="form-select">
									            		<option value="user">전체</option>
									            		<option value="user">회원</option>
									            		<option value="user">관리자</option>
									            	</select>
									            </td>
									        </tr>
									    </tbody>
									</table>
								</div>
								<div class="card-footer d-flex justify-content-center bg-white py-4">
									<button class="btn btn-primary btn-lg mr-5">저장</button>
									<button class="btn btn-danger btn-lg">삭제</button>
								</div>
							</div>
						
						</div>
					</div>
				</div>
			</section>
			<!-- Main content -->
			
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
