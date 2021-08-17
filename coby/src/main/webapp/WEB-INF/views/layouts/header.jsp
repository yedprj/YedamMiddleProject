<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid">
	<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
		<a href="home.do" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
			<img alt="" src="image/logo.PNG" class="bi me-2" width="160" height="45">
		</a>
		<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
			<li>
				<a href="#" class="nav-link px-4 link-dark fs-4">공동구매</a>
			</li>
			<li>
				<a href="#" class="nav-link px-4 link-dark fs-4">커뮤니티</a>
			</li>
			<li>
				<a href="#" class="nav-link px-4 link-dark fs-4">공지사항</a>
			</li>
			<li>
				<a href="#" class="nav-link px-4 link-dark fs-4">고객센터</a>			
			</li>		
		</ul>
		<div class="col-md-3 text-end">
			<c:if test="${user.userAuthor eq 'ADMIN'}">
				<button type="button" class="btn btn-outline-primary me-2 btn-lg">관리자</button>				
			</c:if>
			<button type="button" class="btn btn-outline-primary me-2 btn-lg" onclick="location.href='loginForm.lo'">로그인</button>
		</div>
	</header>
</div>