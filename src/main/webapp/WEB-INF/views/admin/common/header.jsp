<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	<!-- Left navbar links -->
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a></li>
		<li class="nav-item d-none d-sm-inline-block disabled"><span class="nav-link" style="color: black">아이스크림에듀 교육센터 관리 시스템</span></li>
	</ul>

	<!-- Right navbar links -->
	<ul class="navbar-nav ml-auto">
		<li class="nav-item"><a class="nav-link disabled text-dark" role="button"> <i class="fas fa-user"></i><span class="ml-3">심영조님</span>
		</a></li>
		<li class="nav-item">
			<form action="/logout" method="POST">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button class="btn btn-sm text-dark"> 로그아웃 </button>
			</form>
		</li>
	</ul>
</nav>