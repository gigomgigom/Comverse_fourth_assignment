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
								<li class="breadcrumb-item active">${boardCtg.ctgName}</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>${boardCtg.ctgName} - 수정</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<form id="edit-form">
			<section class="content p-5">
				<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="ctg" value="${boCtg}" name="boCtg"/>
				<input type="hidden" id="ctg" value="${board.boId}" name="boId"/>
				<div class="card card-default">
					<div class="card-body">
						<div class="row">
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">제목</dt>
								<dd class="col-md-10 px-3 py-0 m-0 d-flex align-items-center border">
									<input type="text" class="form-control-sm w-100 border-0" name="boTitle" value="${board.boTitle}">
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">작성자</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${boWriter}</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">게시물 고정 유무</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<input class="custom-control-input ml-3 mr-5" type="checkbox" id="pinned" name="boPinned" ${board.boPinned ? 'checked' : ''}>
							        <label class="custom-control-label ml-5" for="pinned">
							        	프론트 화면에 최신 게시물로 노출됩니다.
							      	</label>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">댓글 등록가능</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<input class="custom-control-input ml-3 mr-5" type="checkbox" id="replyable" name="boReplyable" ${board.boReplyable ? 'checked' : '' }>
							        <label class="custom-control-label ml-5" for="replyable">
							        	댓글 등록 가능
							      	</label>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">등록일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border"><fmt:formatDate value="${board.regDate}" type="date"/></dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">게시물 상태</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<div class="custom-control custom-radio">
										<input class="custom-control-input ml-3 mr-5" type="radio" value="on" id="writing1" name="boWriting" ${board.boWriting ? 'checked' : '' }>
								        <label class="custom-control-label ml-5" for="writing1">
								        	작성중
								      	</label>
									</div>
							      	<div class="custom-control custom-radio">
										<input class="custom-control-input ml-3 mr-5" type="radio" value="" id="writing2" name="boWriting" ${board.boWriting ? '' : 'checked' }>
								        <label class="custom-control-label ml-5" for="writing2">
								        	작성완료
								      	</label>
									</div>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">노출 시작일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<div>
										<input class="custom-control-input ml-3 mr-5" type="checkbox" id="expose-start-check" ${board.exposeStart != null ? 'checked' : '' }>
								        <label class="custom-control-label ml-5" for="expose-start-check">
								        	시작일 설정
								      	</label>
									</div>
									<input type="date" class="ml-3 form-control col-sm-5" id="expose-start" name="exposeStart" value="${board.exposeStartSdf}" ${board.exposeStart == null ? 'disabled' : ''}>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">노출 종료일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<div>
										<input class="custom-control-input ml-3 mr-5" type="checkbox" id="expose-end-check" ${board.exposeEnd != null ? 'checked' : '' }>
								        <label class="custom-control-label ml-5" for="expose-end-check">
								        	종료일 설정
								      	</label>
									</div>
									<input type="date" class="ml-3 form-control col-sm-5" id="expose-end" name="exposeEnd" value="${board.exposeEndSdf}" ${board.exposeEnd == null ? 'disabled' : '' }>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">조회수</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">${board.hitCnt}</dd>
							</dl>
							<dl class="col-md-12 d-flex row">
								<dt class="col-md-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">내용</dt>
								<dd class="col-md-11 px-3 py-2 m-0 d-flex align-items-center border" style="min-height: 500px; max-height: 500px;">
									<textarea id="summernote" style="width: 100%; height: 100%; box-sizing: border-box; resize: none;" name="boContent"></textarea>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">첨부파일 추가</dt>
								<dd class="col-md-10 px-3 py-2 m-0 border">
									<div class="form-group">
							            <label for="input-attach">파일 업로드</label>
							            <div class="input-group">
								            <div class="custom-file">
									            <input type="file" class="custom-file-input" id="input-attach" multiple>
									            <label class="custom-file-label" for="input-attach">추가 업로드</label>
								            </div>
							            </div>
						            </div>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">썸네일 변경</dt>
								<dd class="col-md-10 px-3 py-2 m-0 border">
									<div class="form-group">
							            <label for="input-thumbnail">썸네일 업로드</label>
							            <div class="input-group">
								            <div class="custom-file">
									            <input type="file" class="custom-file-input" id="input-thumbnail" name="boThumbnail">
									            <label class="custom-file-label" for="input-thumbnail">썸네일 업로드</label>
								            </div>
							            </div>
						            </div>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">저장된 첨부파일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 border">
									<div>
										<ul id="file-list" class="m-0">
											<c:forEach var="boAttach" items="${board.boAttachList}">
												<li class="attach-item" id="attach-${boAttach.attachId}">${boAttach.attachOName}<i class="ml-3 fas fa-times delete-attach" style="cursor: pointer;"></i></li>
											</c:forEach>
										</ul>
									</div>
								</dd>
							</dl>							
						</div>
					</div>
					<div class="card-footer bg-white py-5">
						<div class="d-flex justify-content-center">
							<button id="submit-button" type="button" class="btn btn-lg btn-primary mr-5 px-4">저장</button>
						</div>
						<div class="d-flex justify-content-end">
							<a href="#" class="btn btn-lg btn-outline-danger mr-5 px-4">취소</a>
							<a href="/admin/board/manage/${boCtg}/list?pageNo=${searchIndex.pageNo}&isExpose=${searchIndex.isExpose}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDate}&endDate=${searchIndex.endDate}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}<c:forEach var="other" items="${searchIndex.others}">&others%5B%5D=${other}</c:forEach>" class="btn btn-lg btn-outline-secondary px-4">목록</a>
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
	<!-- summernote -->
	<script src="/resources/adminlte/summernote/summernote-bs4.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/adminlte/adminlte/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/adminlte/adminlte/js/demo.js"></script>
	<!-- JS -->
	<script src="/rsc/admin/board-edit.js"></script>
</body>
</html>
