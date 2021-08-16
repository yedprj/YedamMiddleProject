<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-4 offset-md-4 border p-4 shadow bg-light">
				<div class="login-form bg-light mt-4 p-4">
					<h2>Login</h2>
					<c:if test="${not empty message }">
						<div class="alert alert-danger d-flex align-items-center" role="alert">
							<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
							<div>
								${message }
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						</div>
					</c:if>
					<form id="frm" action="login.do" method="post" class="row g-3">
						<div class="col-12">
							<label>ID</label> <input type="text" id="userId" name="userId"
								class="form-control" placeholder="ID를 입력해주세요" required="required">
						</div>
						<div class="col-12">
							<label>Password</label> <input type="password" id="userPw" name="userPw"
								class="form-control" placeholder="Password를 입력해주세요" required="required">
						</div>
						<div class="col-12">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="rememberMe">
								<label class="form-check-label" for="rememberMe">
									Remember me</label>
							</div>
						</div>
						<div class="col-12">
							<input type="submit" class="btn btn-dark form-control" value="Login">
						</div>
					</form>
					<hr class="mt-4">
					<div class="col-12">
						<p class="text-center mb-0">
							Have not account yet? <a href="#">Signup</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="js/bootstrap.bundle.js"></script>
</body>
</html>