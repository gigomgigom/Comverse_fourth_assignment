<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
			<form id="edit-form">
			<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="admNo" value="${admin.admNo}">
			<section class="content container-fluid row p-5">
				<div class="col-xl-6">
					<div class="card card-default">
						<div class="card-body">
							<div class="row">
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">이름</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border">
										<input type="text" class="form-control" name="admName" value="${admin.admName}">
									</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">ID</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border">
										<div class="w-100">
											<div class="d-flex align-items-center">
												<input type="text" class="form-control mr-5 col-xl-7" name="admId" value="${admin.admId}" readonly>
											</div>
										</div>
									</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">비밀번호</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border">
										<div class="w-100">
											<input type="password" class="form-control" name="admPw">
											<ul class="m-0">
												<li>영문/숫자/특수문자를 2가지 이상 조합하여 8자리 ~ 16자리로 입력해 주세요.</li>
											</ul>
										</div>
									</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">tel</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border">
										<input type="text" class="form-control" name="admTel" value="${admin.admTel}">
									</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">email</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border">
										<input type="email" class="form-control mr-5 col-xl-7" name="admEmail" value="${admin.admEmail}">
										<button type="button" id="email-check" class="btn btn-sm btn-info col-xl-2">중복확인</button>
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
										<select id="team-input" class="form-control w-100" name="admTeam">
					                        <c:forEach var="team" items="${teamList}">
					                        	<option value="${team.teamId}" ${team.teamId == admin.admTeam? 'selected' : '' }>${team.teamName}</option>
					                        </c:forEach>
					                    </select>
									</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">관리자 상태</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border">
					                    <select id="stts-input" class="form-control" name="admStts">
					                        <option value="">미정</option>
					                        <option value="승인완료" ${admin.admStts eq '승인완료' ? 'selected' : ''}>승인완료</option>
					                        <option value="승인중" ${admin.admStts eq '승인중' ? 'selected' : ''}>승인중</option>
					                        <option value="접근불가" ${admin.admStts eq '접근불가' ? 'selected' : ''}>접근불가</option>
					                        <option value="휴면" ${admin.admStts eq '휴면' ? 'selected' : ''}>휴면</option>
					                    </select>
									</dd>
								</dl>
								<dl class="col-xl-12 d-flex row">
									<dt class="col-xl-3 px-3 py-2 bg-info d-flex justify-content-center align-items-center">권한 설정</dt>
									<dd class="col-xl-9 px-3 py-2 m-0 d-flex align-items-center border" style="min-height: 350px; max-height: 350px; overflow:auto;">
					                   	<div id="card-container" class="w-100 row">
					                   		
					                   		<c:if test="${empty manageRole}">
					                   			<div class="card col-xl-12">
						                   			<div class="card-body row">
						                   				<select class="form-control col-xl-9" name="roleList[]">
									                        <option value=0>미정</option>
									                        <c:forEach var="role" items="${roleList}">
									                        	<option value="${role.roleId}">${role.roleName}</option>
									                        </c:forEach>
									                    </select>
									                    <button class="add-button ml-3 col-xl-1 btn btn-sm btn-info">추가</button>
									                    <button class="remove-button ml-3 col-xl-1 btn btn-sm btn-danger">삭제</button>
						                   			</div>
						                   		</div>
					                   		</c:if>
					                   		<c:forEach var="roleId" items="${manageRole}" varStatus="status">
					                   			<c:if test="${status.last}">
					                   				<div class="card col-xl-12">
							                   			<div class="card-body row">
							                   				<select class="form-control col-xl-9" name="roleList[]">
										                        <option value=0>미정</option>
										                        <c:forEach var="role" items="${roleList}">
										                        	<option value="${role.roleId}" ${role.roleId == roleId ? 'selected' : '' }>${role.roleName}</option>
										                        </c:forEach>
										                    </select>
										                    <button type="button" class="add-button ml-3 col-xl-1 btn btn-sm btn-info">추가</button>
										                    <button type="button" class="remove-button ml-3 d-none col-xl-1 btn btn-sm btn-danger">삭제</button>
							                   			</div>
							                   		</div>
					                   			</c:if>
					                   			<c:if test="${!status.last}">
					                   				<div class="card col-xl-12">
							                   			<div class="card-body row">
							                   				<select class="form-control col-xl-9" name="roleList[]">
										                        <option value=0>미정</option>
										                        <c:forEach var="role" items="${roleList}">
										                        	<option value="${role.roleId}" ${role.roleId == roleId ? 'selected' : '' }>${role.roleName}</option>
										                        </c:forEach>
										                    </select>
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
					</div>
				</div>
				<div class="col-xl-12 d-flex justify-content-end">
					<button type="button" id="register-button" class="btn btn-lg btn-primary mr-3">저장</button>
					<button type="button" class="btn btn-lg btn-secondary mr-3">삭제</button>
					<a class="btn btn-lg btn-secondary">목록</a>
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
	<!-- JS -->
	<script src="/rsc/admin/manager-edit.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/adminlte/adminlte/js/demo.js"></script>
</body>
</html>
