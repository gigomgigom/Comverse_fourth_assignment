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
<body class="hold-transition sidebar-mini layer-fixed">
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
								<li class="breadcrumb-item active">문의 관리</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>문의 관리 - 목록</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<!-- Search -->
			<form>
			<section class="content">
				<div class="container-fluid p-5">
					<div class="card card-default">
						<div class="card-body p-4">
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">구분</label>
				                <div class="col-sm-10 d-flex row">
				                    <select id="category" class="form-control col-sm-12" name="division">
				                        <option value=0 ${searchIndex.division == 0 ? 'selected' : '' }>구분 선택</option>
				                        <option value=1 ${searchIndex.division == 1 ? 'selected' : '' }>1대1 문의</option>
				                        <option value=2 ${searchIndex.division == 2 ? 'selected' : '' }>학습 문의</option>
				                    </select>
				                </div>
				            </div>
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">문의자 정보</label>
				                <div class="col-sm-10 d-flex row">
				                    <select id="category" class="form-control col-sm-2" name="keywordCtg">
				                        <option value=0 ${searchIndex.keywordCtg == 0 ? 'selected' : '' }>검색 조건</option>
				                        <option value=1 ${searchIndex.keywordCtg == 1 ? 'selected' : '' }>이름</option>
				                        <option value=2 ${searchIndex.keywordCtg == 2 ? 'selected' : '' }>연락처</option>
				                        <option value=3 ${searchIndex.keywordCtg == 3 ? 'selected' : '' }>이메일</option>
				                    </select>
				                    <input type="text" class="form-control col-sm-10" id="keyword" placeholder="검색어를 입력하세요" value="${searchIndex.keyword}" name="keyword">
				                </div>
				            </div>
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">등록일</label>
				                <div class="col-sm-10 d-flex row">
				                    <input type="date" class="form-control col-sm-6" id="dateFrom" value="${searchIndex.startDateSdf}" name="startDate">
				                    <input type="date" class="form-control col-sm-6" id="dateTo" value="${searchIndex.endDateSdf}" name="endDate">
				                </div>
				            </div>
				            <div class="form-group row">
				                <div class="col-sm-2"></div>
				                <div class="col-sm-10">
				                    <button type="button" onClick="pickDate(1)" class="btn btn-sm btn-primary">1주</button>
				                    <button type="button" onClick="pickDate(12)" class="btn btn-sm btn-primary">1개월</button>
				                    <button type="button" onClick="pickDate(36)" class="btn btn-sm btn-primary">3개월</button>
				                    <button type="button" onClick="pickDate(2)" class="btn btn-sm btn-primary">금월</button>
				                    <button type="button" onClick="pickDate(-1)" class="btn btn-sm btn-primary">전월</button>
				                </div>
				            </div>
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">처리 상태</label>
				                <select id="category" class="form-control col-sm-2" name="stts">
			                        <option value=0 ${searchIndex.stts == 0 ? 'selected' : '' }>전체</option>
			                        <option value=1 ${searchIndex.stts == 1 ? 'selected' : '' }>접수중</option>
			                        <option value=2 ${searchIndex.stts == 2 ? 'selected' : '' }>전화 처리완료</option>
			                        <option value=3 ${searchIndex.stts == 3 ? 'selected' : '' }>이메일 처리완료</option>
			                        <option value=4 ${searchIndex.stts == 4 ? 'selected' : '' }>미처리</option>
			                    </select>
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
							<a href="/admin/manage/general/one-to-one/create?pageNo=${searchIndex.pageNo}&division=${searchIndex.division}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&startDate=${searchIndex.startDate}&endDate=${searchIndex.endDate}&rowsPerPage=${searchIndex.rowsPerPage}" class="btn btn-md btn-outline-primary bg-white">신규 등록</a>
						</div>
						<div class="col-md-5 d-flex align-items-center justify-content-end">
							<button class="btn btn-md btn-outline-primary bg-white mr-5" style="width:300px">엑셀 다운로드</button>
							<select class="form-control" style="max-width: 200px" name="rowsPerPage">
		                        <option value=10 ${searchIndex.rowsPerPage == 10 ? 'selected' : '' }>10개씩 보기</option>
		                        <option value=50 ${searchIndex.rowsPerPage == 50 ? 'selected' : '' }>50개씩 보기</option>
		                        <option value=100 ${searchIndex.rowsPerPage == 100 ? 'selected' : '' }>100개씩 보기</option>
		                        <option value=500 ${searchIndex.rowsPerPage == 500 ? 'selected' : '' }>500개씩 보기</option>
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
										<th class="text-center" width="15%">ID</th>
										<th class="text-center" width="15%">구분</th>
										<th class="text-center" width="15%">성명</th>
										<th class="text-center" width="15%">연락처</th>
										<th class="text-center" width="15%">등록일</th>
										<th class="text-center" width="15%">처리 상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="inq" items="${inqList}">
										<tr>
											<td class="text-center">${inq.inqId}</td>
											<td class="text-center"><a href="/admin/manage/general/one-to-one/detail?detailId=${inq.inqId}&pageNo=${searchIndex.pageNo}&division=${searchIndex.division}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&startDate=${searchIndex.startDate}&endDate=${searchIndex.endDate}&rowsPerPage=${searchIndex.rowsPerPage}">${inq.field}</a></td>
											<td class="text-center">${inq.name}</td>
											<td class="text-center">${inq.tel}</td>
											<td class="text-center"><fmt:formatDate value="${inq.regDate}" type="date"></fmt:formatDate></td>
											<td class="text-center">${inq.stts}</td>
										</tr>
									</c:forEach>									
								</tbody>
							</table>
						</div>
						<div class="card-footer bg-white d-flex justify-content-center">
							<nav>
							  <ul class="pagination">
							    <li class="page-item ${searchIndex.pager.groupNo == 1 ? 'disabled' : ''}"><a class="page-link" href="/admin/manage/general/one-to-one/list?pageNo=${searchIndex.pager.startPageNo - 1}&division=${searchIndex.division}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&startDate=${searchIndex.startDate}&endDate=${searchIndex.endDate}&rowsPerPage=${searchIndex.rowsPerPage}">Previous</a></li>
							    	<c:forEach var="pageNum" items="${searchIndex.pager.pageArray}">
								    	<li class="page-item ${searchIndex.pager.pageNo == pageNum ? 'active' : ''}"><a class="page-link" href="/admin/manage/general/one-to-one/list?pageNo=${pageNum}&division=${searchIndex.division}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&startDate=${searchIndex.startDate}&endDate=${searchIndex.endDate}&rowsPerPage=${searchIndex.rowsPerPage}">${pageNum}</a></li>
								    </c:forEach>
							    <li class="page-item ${searchIndex.pager.groupNo == searchIndex.pager.totalGroupNo ? 'disabled' : ''}"><a class="page-link" href="/admin/manage/general/one-to-one/list?pageNo=${searchIndex.pager.endPageNo + 1}&division=${searchIndex.division}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&startDate=${searchIndex.startDate}&endDate=${searchIndex.endDate}&rowsPerPage=${searchIndex.rowsPerPage}">Next</a></li>
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
	<!-- JS -->
	<script src="/rsc/admin/biz-list.js"></script>
</body>
</html>
