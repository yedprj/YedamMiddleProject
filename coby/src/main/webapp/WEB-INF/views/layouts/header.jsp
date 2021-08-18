<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<header
		class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
		<a href="home.do"
			class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
			<img alt="" src="image/logo.PNG" class="bi me-2" width="160"
			height="45">
		</a>
		<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
			<li><a href="#" class="nav-link px-3 link-dark fs-4">공동구매</a></li>
			<li><a href="#" class="nav-link px-3 link-dark fs-4">커뮤니티</a></li>
			<li><a href="#" class="nav-link px-3 link-dark fs-4">공지사항</a></li>
			<li><a href="#" class="nav-link px-3 link-dark fs-4">고객센터</a></li>
		</ul>
		
		<div class="col-md-2 text-end">
			<c:if test="${empty user.userId  }">
				<button type="button" class="btn btn-outline-primary me-2"
					onclick="location.href='loginForm.do'">로그인</button>
			</c:if>
			<c:if test="${not empty user.userId  }">
			
				<div class="dropdown">	
					<a href="#" class="nav-link px-3 link-dark fs-5" id="userDropdown"
	                 data-bs-toggle="dropdown" aria-expanded="false">
	                	 <span>${user.userNickname }</span>
	                 	 <img class="" src="">
	                 </a>
					
					<div class="dropdown-menu" aria-labelledby="userDropdown">
						<c:if test="${user.userAuthor eq 'ADMIN'}">
							<a class="dropdown-item" href="#">관리자</a>
						</c:if>
						<a class="dropdown-item" href="#">개인정보</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="logout.do">로그아웃</a>
					</div>
				</div>
			</c:if>
		</div>
	</header>
</div>
