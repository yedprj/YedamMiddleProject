<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디 찾기</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.bundle.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-4 offset-md-4 border p-4 shadow bg-light">
				<div class="login-form bg-light mt-4 p-4">
					<h4 class="mt-3">아이디 찾기 .. Find ID</h4>
					<small class="mt-2 mb-3"> 가입할 때 사용하신 이메일을 입력해 주세요</small>	
					
					<c:if test="${not empty ermessage }">
						<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
							<symbol id="exclamation-triangle-fill" fill="currentColor"
								viewBox="0 0 16 16">
    							<path
								d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
  							</symbol>
						</svg>
						<div class="alert alert-danger d-flex align-items-center"
							role="alert">
							<svg class="bi flex-shrink-0 me-2" width="24" height="24"
								role="img" aria-label="Danger:">
								<use xlink:href="#exclamation-triangle-fill" /></svg>
							<div>
								<span class="fs-6">${ermessage }</span>
								<button type="button" class="btn-close" data-bs-dismiss="alert"
									aria-label="Close"></button>
							</div>
						</div>
					</c:if>		
					
					<form id="frm" action="findId.do" method="post">						
						<div class="col-12 mt-3">
							<label>이메일(Email)</label> <input type="text" id="userEmail"
								name="userEmail" class="form-control mt-1"
								placeholder="Email을 입력해주세요" required="required">
						</div>
						
						<div class="col-11 d-grid mx-auto mt-3">
							<input type="submit" class="btn btn-dark form-control p-2"
								value="찾기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>