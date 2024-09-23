<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
				                        <option value=0 ${searchIndex.isExpose == 0 ? 'selected' : '' }>전체</option>
				                        <option value=1 ${searchIndex.isExpose == 1 ? 'selected' : '' }>노출</option>
				                        <option value=2 ${searchIndex.isExpose == 2 ? 'selected' : '' }>비 노출</option>
				                    </select>
				                </div>
				            </div>
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">게시물 정보</label>
				                <div class="col-sm-10 d-flex row">
				                    <select class="form-control col-sm-2" name="keywordCtg">
				                        <option value=0 ${searchIndex.keywordCtg == 0 ? 'selected' : '' }>검색 조건</option>
				                        <option value=1 ${searchIndex.keywordCtg == 1 ? 'selected' : '' }>제목</option>
				                        <option value=2 ${searchIndex.keywordCtg == 2 ? 'selected' : '' }>제목 + 내용</option>
				                        <option value=3 ${searchIndex.keywordCtg == 3 ? 'selected' : '' }>작성자</option>
				                    </select>
				                    <input type="text" class="form-control col-sm-10" placeholder="검색어를 입력하세요" value="${searchIndex.keyword}" name="keyword">
				                </div>
				            </div>
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">일자 검색</label>
				                <div class="col-sm-10 d-flex row">
				                	<select class="form-control col-sm-2" name="dateCtg">
				                        <option value=0 ${searchIndex.dateCtg == 0 ? 'selected' : '' }>검색 조건</option>
				                        <option value=1 ${searchIndex.dateCtg == 1 ? 'selected' : '' }>게시물 등록일</option>
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
				                <label class="col-sm-2 col-form-label">게시물 상태</label>
				                <div class="col-sm-10 pt-1">
				                    <input id="status1" type="radio" value=0 name="stts" ${searchIndex.stts == 0 ? 'checked' : '' }>
				                    <label for="status1" class="mr-3">전체</label>
				                    <input id="status2" type="radio" value=1 name="stts" ${searchIndex.stts == 1 ? 'checked' : '' }>
				                    <label for="status2" class="mr-3">작성중</label>
				                    <input id="status3" type="radio" value=2 name="stts" ${searchIndex.stts == 2 ? 'checked' : '' }>
				                    <label for="status3" class="mr-3">게시중</label>
				                    <input id="status4" type="radio" value=3 name="stts" ${searchIndex.stts == 3 ? 'checked' : '' }>
				                    <label for="status4" class="mr-3">상시노출</label>
				                    <input id="status5" type="radio" value=4 name="stts" ${searchIndex.stts == 4 ? 'checked' : '' }>
				                    <label for="status5">게시기간 만료</label>
				                </div>
				            </div>
				            <div class="form-group row">
				                <label for="resultLimit" class="col-sm-2 col-form-label">기타 조건</label>
				                <div class="col-sm-10">
				                   <input id="other1" type="checkbox" value=1 name="others[]" ${fn:contains(searchIndex.others, 1) ? 'checked' : ''}>
				                   <label for="other1" class="mr-3">게시물 고정됨</label>
				                   <input id="other2" type="checkbox" value=2 name="others[]" ${fn:contains(searchIndex.others, 2) ? 'checked' : ''}>
				                   <label for="other2" class="mr-3">첨부파일 있음</label>
				                   <input id="other3" type="checkbox" value=3 name="others[]" ${fn:contains(searchIndex.others, 3) ? 'checked' : ''}>
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
							<a href="/admin/board/manage/${boCtg}/create?pageNo=${searchIndex.pageNo}&isExpose=${searchIndex.isExpose}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}<c:forEach var="other" items="${searchIndex.others}">&others%5B%5D=${other}</c:forEach>" class="btn btn-md btn-outline-primary bg-white">신규 등록</a>
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
									<c:set var="now" value="<%= new java.util.Date() %>"/>
									<c:forEach var="board" items="${boardList}">
										<tr>
											<td class="text-center">${board.boId}</td>
											<td class="text-center"><a href="/admin/board/manage/${boCtg}/detail?detailId=${board.boId}&pageNo=${searchIndex.pageNo}&isExpose=${searchIndex.isExpose}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}<c:forEach var="other" items="${searchIndex.others}">&others%5B%5D=${other}</c:forEach>">${board.boTitle}</a></td>
											<td class="text-center"><fmt:formatDate type="date" value="${board.regDate}"/></td>
											<td class="text-center">${!board.boWriting && (now > board.exposeStart || board.exposeStart == null) && (now < board.exposeEnd || board.exposeEnd == null) ? '노출' : '비노출' }</td>
											<td class="text-center"><fmt:formatDate type="date" value="${board.exposeStart}"/></td>
											<td class="text-center"><fmt:formatDate type="date" value="${board.exposeEnd}"/></td>
											<td class="text-center"><i class="far fa-file"></i> X ${board.attachCnt}</td>
										</tr>	
									</c:forEach>																	
								</tbody>
							</table>
						</div>
						<div class="card-footer bg-white d-flex justify-content-center">
							<nav>
							  <ul class="pagination">
							    <li class="page-item ${searchIndex.pager.groupNo == 1 ? 'disabled' : ''}"><a class="page-link" href="/admin/board/manage/${boCtg}/list?pageNo=${searchIndex.pager.startPageNo - 1}&isExpose=${searchIndex.isExpose}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}<c:forEach var="other" items="${searchIndex.others}">&others%5B%5D=${other}</c:forEach>">Previous</a></li>
							    	<c:forEach var="pageNum" items="${searchIndex.pager.pageArray}">
								    	<li class="page-item ${searchIndex.pager.pageNo == pageNum ? 'active' : ''}"><a class="page-link" href="/admin/board/manage/${boCtg}/list?pageNo=${pageNum}&isExpose=${searchIndex.isExpose}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}<c:forEach var="other" items="${searchIndex.others}">&other%5B%5D=${other}</c:forEach>">${pageNum}</a></li>
								    </c:forEach>
							    <li class="page-item ${searchIndex.pager.groupNo == searchIndex.pager.totalGroupNo ? 'disabled' : ''}"><a class="page-link" href="/admin/board/manage/${boCtg}/list?pageNo=${searchIndex.pager.endPageNo + 1}&isExpose=${searchIndex.isExpose}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&dateCtg=${searchIndex.dateCtg}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&stts=${searchIndex.stts}&rowsPerPage=${searchIndex.rowsPerPage}<c:forEach var="other" items="${searchIndex.others}">&other%5B%5D=${other}</c:forEach>">Next</a></li>
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
	<script src="/rsc/admin/board-list.js"></script>
</body>
</html>
