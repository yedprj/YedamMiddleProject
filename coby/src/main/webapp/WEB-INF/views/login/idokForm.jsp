<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디 조회 결과</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.bundle.js"></script>
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-4 offset-md-4 border p-4 shadow bg-light">
				<div class="login-form bg-light mt-4 p-4 text-center">
					<h4 class="mt-3 mb-4">아이디 찾기</h4>
					<small class="mt-4 mb-3 fw-bolder"> 찾으시는 아이디는 다음과 같습니다.</small>
					<br>
					<span class="fs-4 mt-3 fw-bolder text-primary">${userId }</span>
										
						<div class="col-11 d-grid mx-auto mt-2">
							<button type="button" class="btn btn-dark form-control p-2" 
								onclick="location.href='loginForm.do'">로그인</button>
						</div>
						<form id="frm" name="frm" method="post" action="updatePwForm.do">
							<div class="col-11 d-grid mx-auto mt-3">
								<input type="submit" class="btn btn-dark form-control p-2" value="비밀번호재설정">
								<input type="hidden" id="userId" name="userId" value="${userId }">
							</div>
						</form>			
				</div>
			</div>
		</div>
	</div>
</body>
</html>