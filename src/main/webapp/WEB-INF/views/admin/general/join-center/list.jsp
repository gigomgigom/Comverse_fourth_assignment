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
								<li class="breadcrumb-item"><a href="#">설정</a></li>
								<li class="breadcrumb-item active">학습센터 개설</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>학습센터 개설 - 목록</h1>
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
				                <label class="col-sm-2 col-form-label">지원 분야</label>
				                <div class="col-sm-10 row">
				                	<select id="category" class="form-control col-sm-12" name="division">
				                        <option value=0 ${searchIndex.division == 0 ? 'selected' : '' }>분야 선택</option>
				                        <option value=1 ${searchIndex.division == 1 ? 'selected' : '' }>학습센터 교사</option>
				                        <option value=2 ${searchIndex.division == 2 ? 'selected' : '' }>방문 교사</option>
				                    </select>
				                </div>
				            </div>
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">거주 지역</label>
				                <div class="col-sm-10 d-flex row">
				                    <select id="category" class="form-control col-sm-12" name="locationStr">
				                        <option value="">지역 선택</option>
				                        <option value="서울" ${searchIndex.locationStr eq '서울' ? 'selected' : ''}>서울특별시</option>
									    <option value="부산" ${searchIndex.locationStr eq '부산' ? 'selected' : ''}>부산광역시</option>
									    <option value="대구" ${searchIndex.locationStr eq '대구' ? 'selected' : ''}>대구광역시</option>
									    <option value="인천" ${searchIndex.locationStr eq '인천' ? 'selected' : ''}>인천광역시</option>
									    <option value="광주" ${searchIndex.locationStr eq '광주' ? 'selected' : ''}>광주광역시</option>
									    <option value="대전" ${searchIndex.locationStr eq '대전' ? 'selected' : ''}>대전광역시</option>
									    <option value="울산" ${searchIndex.locationStr eq '울산' ? 'selected' : ''}>울산광역시</option>
									    <option value="세종" ${searchIndex.locationStr eq '세종' ? 'selected' : ''}>세종특별자치시</option>
									    <option value="경기" ${searchIndex.locationStr eq '경기' ? 'selected' : ''}>경기도</option>
									    <option value="강원" ${searchIndex.locationStr eq '강원' ? 'selected' : ''}>강원도</option>
									    <option value="충북" ${searchIndex.locationStr eq '충북' ? 'selected' : ''}>충청북도</option>
									    <option value="충남" ${searchIndex.locationStr eq '충남' ? 'selected' : ''}>충청남도</option>
									    <option value="전북" ${searchIndex.locationStr eq '전북' ? 'selected' : ''}>전라북도</option>
									    <option value="전남" ${searchIndex.locationStr eq '전남' ? 'selected' : ''}>전라남도</option>
									    <option value="경북" ${searchIndex.locationStr eq '경북' ? 'selected' : ''}>경상북도</option>
									    <option value="경남" ${searchIndex.locationStr eq '경남' ? 'selected' : ''}>경상남도</option>
									    <option value="제주" ${searchIndex.locationStr eq '제주' ? 'selected' : ''}>제주특별자치도</option>
				                    </select>
				                </div>
				            </div>
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">지원자 정보</label>
				                <div class="col-sm-10 d-flex row">
				                    <select id="category" class="form-control col-sm-2" name="keywordCtg">
				                        <option value=0 ${searchIndex.keywordCtg == 0 ? 'selected' : '' }>검색 조건</option>
				                        <option value=1 ${searchIndex.keywordCtg == 1 ? 'selected' : '' }>이름</option>
				                        <option value=2 ${searchIndex.keywordCtg == 2 ? 'selected' : '' }>연락처</option>
				                        <option value=3 ${searchIndex.keywordCtg == 3 ? 'selected' : '' }>이메일</option>
				                    </select>
				                    <input type="text" class="form-control col-sm-10" id="keyword" placeholder="검색어를 입력하세요" name="keyword" value="${searchIndex.keyword}">
				                </div>
				            </div>
				            <div class="form-group row">
				                <label class="col-sm-2 col-form-label">등록일</label>
				                <div class="col-sm-10 d-flex row">
				                    <input type="date" class="form-control col-sm-6" id="dateFrom" name="startDate" value="${searchIndex.startDateSdf}">
				                    <input type="date" class="form-control col-sm-6" id="dateTo" name="endDate" value="${searchIndex.endDateSdf}">
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
							<a href="/admin/manage/general/join-center/create?pageNo=${searchIndex.pageNo}&division=${searchIndex.division}&locationStr=${searchIndex.locationStr}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&rowsPerPage=${searchIndex.rowsPerPage}" class="btn btn-md btn-outline-primary bg-white">신규 등록</a>
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
							검색 결과 : ${searchIndex.pager.totalRows }개
						</div>
						<div class="card-body table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th class="text-center" width="15%">ID</th>
										<th class="text-center" width="15%">분야</th>
										<th class="text-center" width="15%">거주지역</th>
										<th class="text-center" width="15%">성명</th>
										<th class="text-center" width="15%">연락처</th>
										<th class="text-center" width="15%">등록일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="rcrt" items="${rcrtList}">
										<tr>
											<td class="text-center">${rcrt.rcrtId}</td>
											<td class="text-center"><a href="/admin/manage/general/join-center/detail?detailId=${rcrt.rcrtId}&pageNo=${searchIndex.pageNo}&division=${searchIndex.division}&locationStr=${searchIndex.locationStr}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&rowsPerPage=${searchIndex.rowsPerPage}">${rcrt.field}</a></td>
											<td class="text-center">${rcrt.location }</td>
											<td class="text-center">${rcrt.name }</td>
											<td class="text-center">${rcrt.tel }</td>
											<td class="text-center"><fmt:formatDate value="${rcrt.regDate}" type="date"/></td>
										</tr>
									</c:forEach>									
								</tbody>
							</table>
						</div>
						<div class="card-footer bg-white d-flex justify-content-center">
							<nav>
							  <ul class="pagination">
							    <li class="page-item ${searchIndex.pager.groupNo == 1 ? 'disabled' : '' }"><a class="page-link" href="/admin/manage/general/join-center/list?pageNo=${searchIndex.pager.startPageNo-1}&division=${searchIndex.division}&locationStr=${searchIndex.locationStr}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&rowsPerPage=${searchIndex.rowsPerPage}">Previous</a></li>
							    <c:forEach var="pageNum" items="${searchIndex.pager.pageArray}">
							    	<li class="page-item ${searchIndex.pager.pageNo == pageNum ? 'active' : ''}"><a class="page-link" href="/admin/manage/general/join-center/list?pageNo=${pageNum}&division=${searchIndex.division}&locationStr=${searchIndex.locationStr}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&rowsPerPage=${searchIndex.rowsPerPage}">${pageNum}</a></li>
							    </c:forEach>
							    <li class="page-item ${searchIndex.pager.groupNo == searchIndex.pager.totalGroupNo ? 'disabled' : ''}"><a class="page-link" href="/admin/manage/general/join-center/list?pageNo=${searchIndex.pager.endPageNo+1}&division=${searchIndex.division}&locationStr=${searchIndex.locationStr}&keywordCtg=${searchIndex.keywordCtg}&keyword=${searchIndex.keyword}&startDate=${searchIndex.startDateSdf}&endDate=${searchIndex.endDateSdf}&rowsPerPage=${searchIndex.rowsPerPage}">Next</a></li>
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
	<script src="/rsc/admin/location-list.js"></script>
</body>
</html>
