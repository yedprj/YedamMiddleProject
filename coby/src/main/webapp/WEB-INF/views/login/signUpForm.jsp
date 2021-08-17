<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signup.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<div class="container mt-5 mb-5">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="col-md-6">
				<div class="card px-5 py-5">
					<span class="circle"><i class="fa fa-check"></i></span>
					<h5 class="mt-3"> 회원가입 .. Sign Up</h5>
					<small class="mt-2"> 아이디(ID)/비밀번호(PASSWORD)</small>
					
					<!-- 아이디 입력 -->
					<div class="form-input">
						<i class="fa fa-user"></i> 
						<input type="text" class="form-control" id="userId" name="userId"
							placeholder="사용할 아이디를 입력해주세요.">
					</div>
					
					<!-- 비밀번호 -->
					<div class="form-input">
						<i class="fa fa-lock"></i> 
						<input type="password" class="form-control" id="userPw" name="userPw"
							placeholder="비밀번호를 입력해주세요">
					</div>
					
					<!-- 비밀번호 확인 -->
					<div class="form-input">
						<i class="fa fa-lock"></i> 
						<input type="password" class="form-control" id="userPwOk" name="userPwOk"
							placeholder="비밀번호 확인을 위해 입력해주세요">
					</div>
					
					
					<button class="btn btn-primary mt-4 signup">Start coding
						now</button>
					<div class="text-center mt-3">
						<span>Or continue with these social profile</span>
					</div>
					<div class="d-flex justify-content-center mt-4">
					  <span class="social"><i class="fa fa-google"></i></span> <span
							class="social"><i class="fa fa-facebook"></i></span> <span
							class="social"><i class="fa fa-twitter"></i></span> <span
							class="social"><i class="fa fa-linkedin"></i></span>
					</div>
					<div class="text-center mt-4">
						<span>Already a member?</span> <a href="#"
							class="text-decoration-none">Login</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="js/bootstrap.bundle.js"></script>
</body>
</html>