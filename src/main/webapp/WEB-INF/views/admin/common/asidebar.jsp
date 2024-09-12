<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
							
							<c:forEach var="menu" items="${allowedMenuList}">
								<c:if test="${menu.parent.menuId != 2}">
									<li class="nav-item ${chNum.firstDepth==menu.parent.menuId ? 'menu-is-opening menu-open' : ''}">
										<a href="#" class="nav-link ${chNum.firstDepth==menu.parent.menuId ? 'active' : ''}"> <i class="nav-icon fas ${menu.parent.icon}"></i>
											<p>
												${menu.parent.name} <i class="right fas fa-angle-left"></i>
											</p>
										</a>
										<ul class="nav nav-treeview">
											<c:if test="${menu.parent.menuId != 1}">
												<c:forEach var="child" items="${menu.children}">
													<li class="nav-item">
														<a href="/admin${child.url}list" class="nav-link ${chNum.firstDepth==menu.parent.menuId && chNum.secondDepth==child.menuId ? 'active' : ''}"> 
															<i class="far fa-circle nav-icon"></i>
															<p>${child.name}</p>
														</a>
													</li>
												</c:forEach>
											</c:if>
											<c:if test="${menu.parent.menuId == 1}">
												<c:forEach var="child" items="${menu.children}">
													<li class="nav-item">
														<a href="/admin${child.url}" class="nav-link ${chNum.firstDepth==menu.parent.menuId && chNum.secondDepth==child.menuId ? 'active' : ''}"> 
															<i class="far fa-circle nav-icon"></i>
															<p>${child.name}</p>
														</a>
													</li>
												</c:forEach>
											</c:if>																
										</ul>
									</li>
								</c:if>
								<c:if test="${menu.parent.menuId == 2}">
									<li class="nav-item ${chNum.firstDepth==menu.parent.menuId ? 'menu-is-opening menu-open' : ''}">
										<a href="#" class="nav-link ${chNum.firstDepth==menu.parent.menuId ? 'active' : ''}"> <i class="nav-icon fas ${menu.parent.icon}"></i>
											<p>
												${menu.parent.name} <i class="right fas fa-angle-left"></i>
											</p>
										</a>
										<ul class="nav nav-treeview">
											<c:forEach var="child" items="${menu.children}">
												<li class="nav-item">
													<a href="/admin${menu.parent.url}${child.ctgId}/list" class="nav-link ${chNum.firstDepth==menu.parent.menuId && chNum.boardDepth==child.ctgId ? 'active' : ''}"> 
														<i class="far fa-circle nav-icon"></i>
														<p>${child.ctgName}</p>
													</a>
												</li>
											</c:forEach>											
										</ul>
									</li>
								</c:if>
							</c:forEach>							
						</ul>
					</nav>
					<!-- /.sidebar-menu -->
				</div>
				<!-- /.sidebar -->
		</aside>