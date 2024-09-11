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
							<h1>권한 관리 - 목록</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<!-- Search -->
			<form action="/admin/manage/auth/list" id="search-form">
				<section class="content">
					<div class="container-fluid p-5">
						<div class="card card-default">
							<div class="card-body p-4">
					            <div class="form-group row">
					                <label class="col-sm-2 col-form-label">권한 상태</label>
					                <div class="col-sm-10 d-flex align-items-center row">
					                    <input id="status1" type="radio" value="0" name="stts" ${searchIndex.stts == 0 ? 'checked' : ''}>
					                    <label for="status1" class="mr-3 mb-0">전체</label>
					                    <input id="status2" type="radio" value="1" name="stts" ${searchIndex.stts == 1 ? 'checked' : ''}>
					                    <label for="status2" class="mr-3 mb-0">사용중</label>
					                    <input id="status3" type="radio" value="2" name="stts" ${searchIndex.stts == 2 ? 'checked' : ''}>
					                    <label for="status3" class="mr-3 mb-0">미사용</label>
					                </div>
					            </div>
					            <div class="form-group row">
					                <label class="col-sm-2 col-form-label">권한 명</label>
					                <div class="col-sm-10 d-flex row">
					                    <input type="text" class="form-control col-sm-12" id="keyword" value="${searchIndex.keyword}" name="keyword" placeholder="검색어를 입력하세요">
					                </div>
					            </div>
					            <div class="form-group d-flex justify-content-center">
					                <div>
					                    <button type="submit" class="btn btn-lg btn-primary mr-3">검색</button>
					                    <button id="reset-button" type="button" class="btn btn-lg btn-secondary">초기화</button>
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
								<a href="/admin/manage/auth/create?pageNo=${searchIndex.pageNo}&stts=${searchIndex.stts}&keyword=${searchIndex.keyword}&rowsPerPage=${searchIndex.rowsPerPage}" class="btn btn-md btn-outline-primary bg-white">신규 등록</a>
							</div>
							<div class="col-md-5 d-flex align-items-center justify-content-end">
								<button class="btn btn-md btn-outline-primary bg-white mr-5" style="width:300px">엑셀 다운로드</button>
								<select class="form-control" style="max-width: 200px" name="rowsPerPage">
			                        <option value="10" ${searchIndex.rowsPerPage == 10 ? 'selected' : ''}>10개씩 보기</option>
			                        <option value="50" ${searchIndex.rowsPerPage == 50 ? 'selected' : ''}>50개씩 보기</option>
			                        <option value="100" ${searchIndex.rowsPerPage == 100 ? 'selected' : ''}>100개씩 보기</option>
			                        <option value="500" ${searchIndex.rowsPerPage == 500 ? 'selected' : ''}>500개씩 보기</option>
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
							검색 결과 : ${searchIndex.pager.totalRows}개
						</div>
						<div class="card-body table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th class="text-center">ID</th>
										<th class="text-center">권한명</th>
										<th class="text-center">권한상태</th>
										<th class="text-center">등록일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="role" items="${roleList}">
										<tr>
											<td class="text-center">${role.roleId}</td>
											<td class="text-center"><a href="/admin/manage/auth/edit?detailId=${role.roleId}&pageNo=${searchIndex.pageNo}&stts=${searchIndex.stts}&keyword=${searchIndex.keyword}&rowsPerPage=${searchIndex.rowsPerPage}">${role.roleName}</a></td>
											<td class="text-center">${role.roleEnabled ? "사용중" : "미사용"}</td>
											<td class="text-center"><fmt:formatDate value="${role.regDate}" type="date"/></fmt></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="card-footer bg-white d-flex justify-content-center">
							<nav>
							  <ul class="pagination">
							    <li class="page-item ${searchIndex.pager.groupNo == 1 ? 'disabled' : ''}"><a class="page-link" href="/admin/manage/auth/list?pageNo=${searchIndex.pager.startPageNo - 1}&stts=${searchIndex.stts}&keyword=${searchIndex.keyword}&rowsPerPage=${searchIndex.rowsPerPage}">Previous</a></li>
							    <c:forEach var="pageNum" items="${searchIndex.pager.pageArray}">
							    	<li class="page-item ${searchIndex.pager.pageNo == pageNum ? 'active' : ''}"><a class="page-link" href="/admin/manage/auth/list?pageNo=${pageNum}&stts=${searchIndex.stts}&keyword=${searchIndex.keyword}&rowsPerPage=${searchIndex.rowsPerPage}">${pageNum}</a></li>
							    </c:forEach>
							    <li class="page-item ${searchIndex.pager.groupNo == searchIndex.pager.totalGroupNo ? 'disabled' : ''}"><a class="page-link" href="/admin/manage/auth/list?pageNo=${searchIndex.pager.endPageNo + 1}&stts=${searchIndex.stts}&keyword=${searchIndex.keyword}&rowsPerPage=${searchIndex.rowsPerPage}">Next</a></li>
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
	<script>
		$('#reset-button').on("click", function() {
			$('#search-form [name=keyword]').val("");
			$('#status1').prop('checked', 'true');
		});
	</script>
</body>
</html>
