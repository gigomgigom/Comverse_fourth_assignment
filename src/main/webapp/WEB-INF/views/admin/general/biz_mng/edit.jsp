<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
							<h1>사업설명회 관리 - 수정</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<form id="edit-form">
			<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="prId" value="${searchIndex.detailId}"/>
			<section class="content p-5">
				<div class="card card-default">
					<div class="card-body">
						<div class="row">
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">지부</dt>
								<dd class="col-md-10 px-3 py-0 m-0 d-flex align-items-center border">
									<select id="category" class="form-control w-100" name="brId">
				                        <option value=0>선택</option>
				                        <c:forEach var="branch" items="${branchList}">
				                        	<option value="${branch.brId}" ${branch.brId == biz.brId ? 'selected' : ''}>${branch.location}</option>
				                        </c:forEach>
				                    </select>
								</dd>
							</dl>
							<dl class="col-md-6"></dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">장소</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<input type="text" class="form-control-sm w-100 border-0" name="location" value="${biz.location}">
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">작성 상태</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<div class="custom-control custom-radio">
										<input class="custom-control-input ml-3 mr-5" type="radio" value=1 id="radio5" name="writing" ${biz.writing ? 'checked' : ''}>
								        <label class="custom-control-label ml-5" for="radio5">
								        	작성중
								      	</label>
									</div>
							      	<div class="custom-control custom-radio">
										<input class="custom-control-input ml-3 mr-5" type="radio" value=0 id="radio6" name="writing" ${biz.writing ? '' : 'checked'}>
								        <label class="custom-control-label ml-5" for="radio6">
								        	작성완료
								      	</label>
									</div>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">노출 시작일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<div>
										<input class="custom-control-input ml-3 mr-5" type="checkbox" value="" id="expose-start-check" ${biz.exposeStart != null ? 'checked' : ''}>
										<fmt:formatDate value="${biz.exposeStart}" pattern="yyyy-MM-dd" var="formattedStartDate"/>
								        <label class="custom-control-label ml-5" for="expose-start-check">
								        	시작일 설정
								      	</label>
									</div>
									<input type="date" class="ml-3 form-control col-sm-5" id="expose-start" name="exposeStart" value="${formattedStartDate}" ${formattedStartDate == null ? 'disabled' : ''}>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">노출 종료일</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
									<div>
										<input class="custom-control-input ml-3 mr-5" type="checkbox" value="" id="expose-end-check" ${biz.exposeEnd != null ? 'checked' : '' }>
										<fmt:formatDate value="${biz.exposeEnd}" pattern="yyyy-MM-dd" var="formattedEndDate"/>
								        <label class="custom-control-label ml-5" for="expose-end-check">
								        	종료일 설정
								      	</label>
									</div>
									<input type="date" class="ml-3 form-control col-sm-5" id="expose-end" name="exposeEnd" value="${formattedEndDate}" ${formattedEndDate == null ? 'disabled' : ''}>
								</dd>
							</dl>
							<dl class="col-md-6 d-flex row">
								<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">선택 일시</dt>
								<dd class="col-md-10 px-3 py-2 m-0 d-flex flex-column align-items-center border">
									<div id="card-container" class="w-100 row">				                   		
				                   		<c:if test="${empty biz.bizSchList}">
				                   			<div class="card col-xl-12">
					                   			<div class="card-body row">
					                   				<input type="datetime-local" class="datetime-pick form-control col-xl-9"/>
								                    <button type="button" class="add-button ml-3 col-xl-1 btn btn-sm btn-info">추가</button>
								                    <button type="button" class="remove-button ml-3 col-xl-1 btn btn-sm btn-danger d-none">삭제</button>
					                   			</div>
					                   		</div>
				                   		</c:if>
				                   		<c:forEach var="bizSch" items="${biz.bizSchList}" varStatus="status">
				                   			<c:if test="${status.last}">
				                   				<div class="card col-xl-12">
						                   			<div class="card-body row">
						                   				<input type="datetime-local" class="datetime-pick form-control col-xl-9" value="${bizSch.prDate}"/>
									                    <button type="button" class="add-button ml-3 col-xl-1 btn btn-sm btn-info">추가</button>
									                    <button type="button" class="remove-button ml-3 col-xl-1 btn btn-sm btn-danger d-none">삭제</button>
						                   			</div>
						                   		</div>
				                   			</c:if>
				                   			<c:if test="${!status.last}">
				                   				<div class="card col-xl-12">
						                   			<div class="card-body row">
						                   				<input type="datetime-local" class="datetime-pick form-control col-xl-9" value="${bizSch.prDate}"/>
									                    <button type="button" class="remove-button ml-3 col-xl-1 btn btn-sm btn-danger">삭제</button>
						                   			</div>
						                   		</div>
				                   			</c:if>
				                   		</c:forEach>
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
							<a href="/admin/manage/general/biz/detail?detailId=${searchIndex.detailId}&pageNo=${searchIndex.pageNo}&isExpose=${searchIndex.isExpose}&division=${searchIndex.division}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}" class="btn btn-lg btn-outline-danger mr-5 px-4">취소</a>
							<a href="/admin/manage/general/biz/list?pageNo=${searchIndex.pageNo}&isExpose=${searchIndex.isExpose}&division=${searchIndex.division}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}" class="btn btn-lg btn-outline-secondary px-4">목록</a>
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
	<!-- AdminLTE App -->
	<script src="/resources/adminlte/adminlte/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/adminlte/adminlte/js/demo.js"></script>
	<!-- JS -->
	<script src="/rsc/admin/biz-edit.js"></script>
</body>
</html>
