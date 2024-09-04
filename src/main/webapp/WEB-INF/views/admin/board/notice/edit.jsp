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
<!-- summernote -->
<link rel="stylesheet" href="/resources/adminlte/summernote/summernote-bs4.min.css">
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
								<li class="breadcrumb-item active">알려드립니다</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>알려드립니다 - 수정</h1>
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
								<dd class="col-md-10 px-3 py-0 m-0 d-flex align-items-center border">
									<input type="text" class="form-control-sm w-100 border-0">
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">작성자</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">심영조</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">게시물 고정 유무</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<input class="custom-control-input ml-3 mr-5" type="checkbox" value="" id="checkbox1">
							        <label class="custom-control-label ml-5" for="checkbox1">
							        	프론트 화면에 최신 게시물로 노출됩니다.
							      	</label>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">댓글 등록가능</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<input class="custom-control-input ml-3 mr-5" type="checkbox" value="" id="checkbox2">
							        <label class="custom-control-label ml-5" for="checkbox2">
							        	댓글 등록 가능
							      	</label>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">등록일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">2019-02-25 12:00:00</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">게시물 상태</dt>
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
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">노출 시작일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<div>
										<input class="custom-control-input ml-3 mr-5" type="checkbox" value="" id="checkbox3">
								        <label class="custom-control-label ml-5" for="checkbox3">
								        	시작일 설정
								      	</label>
									</div>
									<input type="date" class="ml-3 form-control col-sm-5" id="dateFrom">
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">노출 종료일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<div>
										<input class="custom-control-input ml-3 mr-5" type="checkbox" value="" id="checkbox4">
								        <label class="custom-control-label ml-5" for="checkbox4">
								        	종료일 설정
								      	</label>
									</div>
									<input type="date" class="ml-3 form-control col-sm-5" id="dateTo">
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">조회수</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">64</dd>
							</dl>
							<dl class="col-md-12 d-flex row">
								<dt class="col-md-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">내용</dt>
								<dd class="col-md-11 px-3 py-2 m-0 d-flex align-items-center border" style="min-height: 500px; max-height: 500px;">
									<div class="m-0 w-100" style="min-height: 500px; max-height: 500px; overflow: auto;">
										<textarea id="summernote"></textarea>
									</div>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">첨부파일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 border">
									<div class="form-group">
							            <label for="exampleInputFile">파일 업로드</label>
							            <div class="input-group">
								            <div class="custom-file">
									            <input type="file" class="custom-file-input" id="input-attach" multiple>
									            <label class="custom-file-label" for="input-attach">첨부파일 업로드</label>
								            </div>
							            </div>
						            </div>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">썸네일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 border">
									<div class="form-group">
							            <label for="exampleInputFile">썸네일 업로드</label>
							            <div class="input-group">
								            <div class="custom-file">
									            <input type="file" class="custom-file-input" id="input-attach">
									            <label class="custom-file-label" for="input-attach">썸네일 업로드</label>
								            </div>
							            </div>
						            </div>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">저장된 첨부파일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 border">
									<div>
										<ul class="m-0">
											<li>첨부파일1.jpg<i class="ml-3 fas fa-times" style="cursor: pointer;"></i></li>
											<li>첨부파일2.pdf<i class="ml-3 fas fa-times" style="cursor: pointer;"></i></li>
										</ul>
									</div>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">저장된 썸네일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 border">
									<div>
							            <ul class="m-0">
							            	<li>썸네일.jpg<i class="ml-3 fas fa-times" style="cursor: pointer;"></i></li>
							            </ul>
						            </div>
								</dd>
							</dl>
						</div>
					</div>
					<div class="card-footer bg-white py-5">
						<div class="d-flex justify-content-center">
							<a href="/admin/board/manage/notice/detail" class="btn btn-lg btn-primary mr-5 px-4">저장</a>
						</div>
						<div class="d-flex justify-content-end">
							<a href="/admin/board/manage/notice/detail" class="btn btn-lg btn-outline-danger mr-5 px-4">취소</a>
							<a href="/admin/board/manage/notice/list" class="btn btn-lg btn-outline-secondary px-4">목록</a>
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
	<script src="/resources/adminlte/bootstrap/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<!-- summernote -->
	<script src="/resources/adminlte/summernote/summernote-bs4.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/adminlte/adminlte/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/adminlte/adminlte/js/demo.js"></script>
	<script>
		$(function () {
		  bsCustomFileInput.init();
		});
		
		$(function () {
			$('#summernote').summernote( {
				height: 450,
				minHeight: 450,
				lang: "ko-KR"
			});
		});
	</script>
</body>
</html>
