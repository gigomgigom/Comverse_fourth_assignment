<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
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
			<form href="#" id="search-form">
			<section class="content">
				<div class="container-fluid p-5">
					<div class="card card-default">
						<div class="card-body p-4">
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">설명회 노출 여부</label>
				                <div class="col-sm-10 row">
				                	<select id="category" class="form-control col-sm-12" name="isExpose">
				                        <option value=0 ${searchIndex.isExpose == 0 ? 'selected' : '' }>전체</option>
				                        <option value=1 ${searchIndex.isExpose == 1 ? 'selected' : '' }>노출</option>
				                        <option value=2 ${searchIndex.isExpose == 2 ? 'selected' : '' }>비노출</option>
				                    </select>
				                </div>
				            </div>
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">설명회 정보(지부)</label>
				                <div class="col-sm-10 d-flex row">
				                    <select id="category" class="form-control col-sm-2" name="location">
				                    	<option value=0 ${searchIndex.location == 0 ? 'selected' : '' }>전체</option>
				                    	<c:forEach var="branch" items="${branchList}">
				                    		<option value=${branch.brId} ${searchIndex.location == branch.brId ? 'selected' : '' }>${branch.location}</option>
				                    	</c:forEach>
				                    </select>
				                </div>
				            </div>
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">일자 검색</label>
				                <div class="col-sm-10 d-flex row">
				                	<select class="form-control col-sm-2" name="dateCtg">
				                        <option value=0 ${searchIndex.dateCtg == 0 ? 'selected' : '' }>검색 조건</option>
				                        <option value=1 ${searchIndex.dateCtg == 1 ? 'selected' : '' }>등록일</option>
				                        <option value=2 ${searchIndex.dateCtg == 2 ? 'selected' : '' }>노출 시작일</option>
				                        <option value=3 ${searchIndex.dateCtg == 3 ? 'selected' : '' }>노출 종료일</option>
				                    </select>
				                    <input type="date" class="form-control col-sm-5" value="${searchIndex.startDateSdf}" id="dateFrom" name="startDate">
				                    <input type="date" class="form-control col-sm-5" value="${searchIndex.endDateSdf}" id="dateTo" name="endDate">
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
				                <label class="col-sm-2 col-form-label">작성 상태</label>
				                <div class="col-sm-10 pt-1">
				                    <input id="status1" type="radio" value=0 name="stts" ${searchIndex.stts == 0 ? 'checked' : ''}>
				                    <label for="status1" class="mr-3">전체</label>
				                    <input id="status2" type="radio" value=1 name="stts" ${searchIndex.stts == 1 ? 'checked' : ''}>
				                    <label for="status2" class="mr-3">작성중</label>
				                    <input id="status3" type="radio" value=2 name="stts" ${searchIndex.stts == 2 ? 'checked' : ''}>
				                    <label for="status3" class="mr-3">작성완료</label>
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
							<a href="/admin/manage/general/biz/create?pageNo=${searchIndex.pageNo}&isExpose=${searchIndex.isExpose}&division=${searchIndex.division}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}" class="btn btn-md btn-outline-primary bg-white">신규 등록</a>
						</div>
						<div class="col-md-5 d-flex align-items-center justify-content-end">
							<button type="button" id="download-excel" class="btn btn-md btn-outline-primary bg-white mr-5" style="width:300px">엑셀 다운로드</button>
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
										<th class="text-center" width="10%">ID</th>
										<th class="text-center" width="30%">지부</th>
										<th class="text-center" width="10%">등록일</th>
										<th class="text-center" width="10%">진행 일자</th>
										<th class="text-center" width="10%">작성 상태</th>
										<th class="text-center" width="10%">노출</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="now" value="<%= new java.util.Date() %>"/>
									<c:forEach var="biz" items="${bizList}">
										<tr>
											<td class="text-center">${biz.prId}</td>
											<td class="text-center">
												<a href="/admin/manage/general/biz/detail?detailId=${biz.prId}&pageNo=${searchIndex.pageNo}&isExpose=${searchIndex.isExpose}&division=${searchIndex.division}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}">
													<c:forEach var="branch" items="${branchList}">
														<c:if test="${branch.brId == biz.brId}">
															${branch.location}															
														</c:if>
													</c:forEach>
												</a>
											</td>
											<td class="text-center"><fmt:formatDate value="${biz.regDate}" type="date"></fmt:formatDate></td>
											<fmt:parseDate value="${ biz.bizSchList[0].prDate }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
											<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${parsedDateTime}"></fmt:formatDate> ${fn:length(biz.bizSchList) == 1 ? '' : '외 ' += fn:length(biz.bizSchList)-1 += '개'}</td>
											<td class="text-center">${biz.writing ? '작성중' : '작성완료' }</td>
											<td class="text-center">${!biz.writing && (now > biz.exposeStart || biz.exposeStart == null) && (now < biz.exposeEnd || biz.exposeEnd == null) ? '노출' : '비노출' }</td>
										</tr>
									</c:forEach>									
								</tbody>
							</table>
						</div>
						<div class="card-footer bg-white d-flex justify-content-center">
							<nav>
							  <ul class="pagination">
							    <li class="page-item ${searchIndex.pager.groupNo == 1 ? 'disabled' : ''}"><a class="page-link" href="/admin/manage/general/biz/list?pageNo=${searchIndex.pager.startPageNo - 1}&isExpose=${searchIndex.isExpose}&division=${searchIndex.division}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}">Previous</a></li>
							    	<c:forEach var="pageNum" items="${searchIndex.pager.pageArray}">
								    	<li class="page-item ${searchIndex.pager.pageNo == pageNum ? 'active' : ''}"><a class="page-link" href="/admin/manage/general/biz/list?pageNo=${pageNum}&isExpose=${searchIndex.isExpose}&division=${searchIndex.division}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}">${pageNum}</a></li>
								    </c:forEach>
							    <li class="page-item ${searchIndex.pager.groupNo == searchIndex.pager.totalGroupNo ? 'disabled' : ''}"><a class="page-link" href="/admin/manage/general/biz/list?pageNo=${searchIndex.pager.endPageNo + 1}&isExpose=${searchIndex.isExpose}&division=${searchIndex.division}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}">Next</a></li>
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
