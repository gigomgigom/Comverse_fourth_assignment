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
								<li class="breadcrumb-item active">게시판 설정</li>
							</ol>
						</div>
						<div class="col-sm-12 pl-5 pt-4">
							<h1>게시판 설정</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<section class="content">
				<div class="container-fluid">
					<div class="row" style="">
						<div class="col-md-4 p-3">
							<div class="card card-default">
								<div class="card-header bg-primary">
									<h4 class="my-2">게시판 목록</h4>
								</div>
								<div class="card-body" style="overflow: auto; min-height: 700px; max-height: 700px;">
									<div id="board-list" >
										<c:forEach var="ctg" items="${ctgList}">
											<div class="card card-default" style="cursor: pointer;" onclick="selectBoardCtg('${ctg.ctgId}')">
												<div class="card-header" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all;">
													<h6 class="my-2">${ctg.ctgName}</h6>
												</div>
											</div>		
										</c:forEach>								
									</div>
								</div>
								<div class="card-footer bg-white">
									<div id="board-create" class="d-flex justify-content-center">
										<button class="btn btn-lg btn-primary" onClick="createNewCtg()">새로 생성</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-8 p-3">
							<div class="card card-default">
								<div class="card-header bg-primary">
									<h4 class="my-2">게시판 생성/수정</h4>
								</div>
								<form id="board-detail">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<input type="hidden" name="ctgId"/>
									<div class="card-body">
										<table class="table">
										    <tbody>
										        <tr class="py-1">
										            <td class="d-flex justify-content-center border-0 my-1">
										            	<p><b>게시판 명</b></p>
										            </td>
										            <td class="border-0">
										            	<input class="form-control" type="text" id="input-name" name="ctgName">
										            </td>
										        </tr>
										        <tr class="py-1">
										            <td class="d-flex justify-content-center border-0 my-1">
										            	<p><b>게시판 위치</b></p>
										            </td>
										            <td class="pl-4">
										            	<select class="form-control" id="input-pos" name="ctgMenu">
										            		<option value=1>홈런학습센터 소개</option>
										            		<option value=2>학습안내</option>
										            		<option value=3>교사채용</option>
										            		<option value=4>고객센터</option>
										            	</select>
										            </td>
										        </tr>
										        <tr>
										            <td class="d-flex justify-content-center border-0 my-1">
										            	<p><b>게시판 사용 여부</b></p>
										            </td>
										            <td>
										            	<div class="d-flex pl-5 align-items-center">
										            		<div class="d-flex justify-content-center mr-5">
											            		<input class="form-check-input mr-5" type="radio" value=true id="input-usable1" name="ctgInUse">
											            		<label for="input-usable1">사용</label>
											            	</div>
											            	<div class="d-flex justify-content-center">
											            		<input class="form-check-input mr-5" type="radio" value=false id="input-usable2" name="ctgInUse">
											            		<label for="input-usable2">미사용</label>
											            	</div>
										            	</div>
										            </td>
										        </tr>
										        <tr>
										            <td class="d-flex justify-content-center border-0 my-1">
										            	<p><b>new 버튼 노출 여부</b></p>
										            </td>
										            <td>
										            	<div class="d-flex pl-5">
										            		<div class="d-flex justify-content-center mr-5">
											            		<input class="form-check-input mr-5" type="radio" id="input-exposable1" value='true' name="newExpose">
											            		<label for="input-exposable1">사용</label>
											            	</div>
											            	<div class="d-flex justify-content-center">
											            		<input class="form-check-input mr-5" type="radio" id="input-exposable2" value='false' name="newExpose">
											            		<label for="input-exposable2">미사용</label>
											            	</div>
										            	</div>
										            	<div class="d-flex pl-3 mt-3">
										            		<select class="form-control" id="input-period" name="exposePeriod">
											            		<option value=5>5일</option>
											            		<option value=10>10일</option>
											            		<option value=15>15일</option>
											            		<option value=20>20일</option>
											            	</select>
										            	</div>
										            </td>
										        </tr>
										    </tbody>
										</table>
									</div>
								</form>
								<div class="card-footer d-flex justify-content-center bg-white py-4">
									<button class="btn btn-primary btn-lg mr-5" onClick="editBoardCtg()">저장</button>
									<button class="btn btn-danger btn-lg" onClick="removeBoardCtg()">삭제</button>
								</div>
							</div>
						
						</div>
					</div>
				</div>
			</section>
			<!-- Main content -->
			
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
	<script src="/rsc/admin/board-setting.js"></script>
	<!-- Bootstrap 4 -->
	<script src="/resources/adminlte/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/adminlte/adminlte/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/adminlte/adminlte/js/demo.js"></script>
</body>
</html>
