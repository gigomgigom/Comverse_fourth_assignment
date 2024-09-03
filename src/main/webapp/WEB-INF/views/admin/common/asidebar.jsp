<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-warning elevation-4">
			<!-- Brand Logo -->
			<a href="#" class="brand-link"> <img src="/resources/logo.png" alt="IceCrHR" class="brand-image img-circle elevation-3" style="opacity: .8"> <span class="brand-text font-weight-light">ICC-HR ADMIN</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<div class="sidebar">
					<!-- Sidebar user (optional) -->
					<div class="user-panel mt-3 pb-3 mb-3 d-flex">
						<div class="info">
							<a href="/admin/main" class="d-block" style="font-size: 1.5em">관리자 페이지</a>
						</div>
					</div>
					<!-- Sidebar Menu -->
					<nav>
						<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
							<li class="nav-item">
					            <a href="/admin/board/setting" class="nav-link ${chNum.firstDepth==0 ? 'active' : ''}">
					              <i class="nav-icon fas fa-list"></i>
					              <p>
					                게시판 설정
					              </p>
					            </a>
					         </li>
							<li class="nav-item ${chNum.firstDepth==1 ? 'menu-is-opening menu-open' : ''}">
								<a href="#" class="nav-link ${chNum.firstDepth==1 ? 'active' : ''}"> <i class="nav-icon fas fa-clipboard-list"></i>
									<p>
										게시판 관리 <i class="right fas fa-angle-left"></i>
									</p>
								</a>
								<ul class="nav nav-treeview">
									<li class="nav-item">
										<a href="/admin/board/manage/intro-learning-center/list" class="nav-link ${chNum.firstDepth==1 && chNum.secondDepth==0 ? 'active' : ''}"> 
											<i class="far fa-circle nav-icon"></i>
											<p>우주학습센터 소개</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/admin/board/manage/study-review/list" class="nav-link ${chNum.firstDepth==1 && chNum.secondDepth==1 ? 'active' : ''}"> 
											<i class="far fa-circle nav-icon"></i>
											<p>홈런학습센터 학습 후기</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/admin/board/manage/teacher-review/list" class="nav-link ${chNum.firstDepth==1 && chNum.secondDepth==2 ? 'active' : ''}"> 
											<i class="far fa-circle nav-icon"></i>
											<p>홈런학습센터 교사 후기</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/admin/board/manage/faq/list" class="nav-link ${chNum.firstDepth==1 && chNum.secondDepth==3 ? 'active' : ''}"> 
											<i class="far fa-circle nav-icon"></i>
											<p>FAQ</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/admin/board/manage/notice/list" class="nav-link ${chNum.firstDepth==1 && chNum.secondDepth==4 ? 'active' : ''}"> 
											<i class="far fa-circle nav-icon"></i>
											<p>알려드립니다</p>
										</a>
									</li>
								</ul>
							</li>
							<li class="nav-item ${chNum.firstDepth==2 ? 'menu-is-opening menu-open' : ''}">
								<a href="#" class="nav-link ${chNum.firstDepth==2 ? 'active' : ''}">
									<i class="nav-icon fas fa-edit"></i>
									<p>
										설정 <i class="right fas fa-angle-left"></i>
									</p>
								</a>
								<ul class="nav nav-treeview">
									<li class="nav-item">
										<a href="/admin/manage/location/list" class="nav-link ${chNum.firstDepth==2 && chNum.secondDepth==0 ? 'active' : ''}"> 
											<i class="far fa-circle nav-icon"></i>
											<p>지국위치 안내</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/admin/manage/biz/list" class="nav-link ${chNum.firstDepth==2 && chNum.secondDepth==1 ? 'active' : ''}"> 
											<i class="far fa-circle nav-icon"></i>
											<p>사업설명회 관리</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/admin/manage/biz-apply/list" class="nav-link ${chNum.firstDepth==2 && chNum.secondDepth==2 ? 'active' : ''}"> 
											<i class="far fa-circle nav-icon"></i>
											<p>사업설명회 신청</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/admin/manage/join-center/list" class="nav-link ${chNum.firstDepth==2 && chNum.secondDepth==3 ? 'active' : ''}"> 
											<i class="far fa-circle nav-icon"></i>
											<p>학습센터 개설</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/admin/manage/one-to-one/list" class="nav-link ${chNum.firstDepth==2 && chNum.secondDepth==4 ? 'active' : ''}"> 
											<i class="far fa-circle nav-icon"></i>
											<p>문의 관리</p>
										</a>
									</li>
								</ul>
							</li>
							<li class="nav-item ${chNum.firstDepth==3 ? 'menu-is-opening menu-open' : ''}">
								<a href="#" class="nav-link ${chNum.firstDepth==3 ? 'active' : ''}">
									<i class="nav-icon fas fa-user"></i>
									<p>
										관리자 및 권한 <i class="right fas fa-angle-left"></i>
									</p>
								</a>
								<ul class="nav nav-treeview">
									<li class="nav-item">
										<a href="/admin/manage/manager/list" class="nav-link ${chNum.firstDepth==3 && chNum.secondDepth==0 ? 'active' : ''}"> 
											<i class="far fa-circle nav-icon"></i>
											<p>관리자 관리</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/admin/manage/auth/list" class="nav-link ${chNum.firstDepth==3 && chNum.secondDepth==1 ? 'active' : ''}"> 
											<i class="far fa-circle nav-icon"></i>
											<p>권한 관리</p>
										</a>
									</li>
								</ul>
							</li>
						</ul>
					</nav>
					<!-- /.sidebar-menu -->
				</div>
				<!-- /.sidebar -->
		</aside>