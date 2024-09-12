<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
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
								<li class="breadcrumb-item active">권한 관리</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>권한 관리 - 수정</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content p-5">
				<form id="create-form">
					<div class="card card-default">
						<div class="card-body">
							<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<input type="hidden" name="roleId" value="${role.roleId}">
							<div class="row">
								<dl class="col-md-12 d-flex row">
									<dt class="col-md-1 px-3 py-2 bg-info d-flex justify-content-center align-items-center">권한명</dt>
									<dd class="col-md-11 px-3 py-0 m-0 d-flex align-items-center border">
										<input type="text" class="form-control-sm w-100 border-0" value="${role.roleName}" name="roleName">
									</dd>
								</dl>
								<dl class="col-md-6 d-flex row">
									<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">삭제 권한</dt>
									<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
					                    <input id="status1" type="radio" value=true name="roleRemovable" ${role.roleRemovable ? 'checked' : ''}>
					                    <label for="status1" class="mr-3 mb-0">삭제 가능</label>
					                    <input id="status2" type="radio" value=false name="roleRemovable" ${role.roleRemovable ? '' : 'checked'}>
					                    <label for="status2" class="mr-3 mb-0">삭제 불가</label>
									</dd>
								</dl>
								<dl class="col-md-6 d-flex row">
									<dt class="col-md-2 px-3 py-2 bg-info d-flex justify-content-center align-items-center">권한 상태</dt>
									<dd class="col-md-10 px-3 py-2 m-0 d-flex align-items-center border">
										<input id="status3" type="radio" value=true name="roleEnabled" ${role.roleEnabled ? 'checked' : '' }>
					                    <label for="status3" class="mr-3 mb-0">사용중</label>
					                    <input id="status4" type="radio" value=false name="roleEnabled" ${role.roleEnabled ? '' : 'checked' }>
					                    <label for="status4" class="mr-3 mb-0">미사용</label>
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
							            	<c:forEach var="menu" items="${menuList}">
							            		<c:set var="isMainChecked" value="false"/>
							            		<c:forEach var="authMenuId" items="${authMenuList}">
							            			<c:if test="${authMenuId == menu.parent.menuId}">
							            				<c:set var="isMainChecked" value="true" />
							            			</c:if>
							            		</c:forEach>
							            		<tr>
								                	<td>
								                		<input id="menu-${menu.parent.menuId}" type="checkbox" class="main-menu group-${menu.parent.menuId}" name="menuItems[]" value="${menu.parent.menuId}" ${isMainChecked ? 'checked="checked"' : ''}>
							                   			<label for="menu-${menu.parent.menuId}" class="mr-3">${menu.parent.name}</label>
								                	</td>
								                	<td>
								                		<c:if test="${menu.parent.menuId == 2}">
								                			<c:forEach var="child" items="${menu.children}">
								                				<div>
										                			<input id="board-${child.ctgId}" type="checkbox" class="sub-menu group-${menu.parent.menuId}" name="boardItems[]" value="${child.ctgId}" ${fn:contains(authBoardList, child.ctgId) ? 'checked="checked"' : ''}>
									                   				<label for="board-${child.ctgId}" class="mr-3">${child.ctgName}</label>
										                		</div>
								                			</c:forEach>
								                		</c:if>
								                		<c:if test="${menu.parent.menuId != 2}">
								                			<c:forEach var="child" items="${menu.children}">
								                				<div>
										                			<input id="menu-${child.menuId}" type="checkbox" class="sub-menu group-${menu.parent.menuId}" name="menuItems[]" value="${child.menuId}" ${fn:contains(authMenuList, child.menuId) ? 'checked="checked"' : ''}>
									                   				<label for="menu-${child.menuId}" class="mr-3">${child.name}</label>
										                		</div>
								                			</c:forEach>
								                		</c:if>
								                	</td>
								                </tr>
							            	</c:forEach>						                
							            </tbody>
							        </table>
								</div>
							</div>						
						</div>
						<div class="card-footer bg-white py-5">
							<div class="d-flex justify-content-center">
								<button type="button" id="submit-button" class="btn btn-lg btn-primary mr-5 px-4">저장</button>
							</div>
							<div class="d-flex justify-content-end">
								<button type="reset" class="btn btn-lg btn-outline-danger mr-5 px-4">초기화</button>
								<a href="/admin/manage/role/auth/list?pageNo=${searchIndex.pageNo}&stts=${searchIndex.stts}&keyword=${searchIndex.keyword}&rowsPerPage=${searchIndex.rowsPerPage}" class="btn btn-lg btn-outline-secondary px-4">목록</a>
							</div>
						</div>
					</div>
				</form>
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
	<!-- JS -->
	<script src="/rsc/admin/auth-edit.js"></script>
	<!-- Bootstrap 4 -->
	<script src="/resources/adminlte/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/adminlte/adminlte/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/adminlte/adminlte/js/demo.js"></script>
</body>
</html>
