<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-5 mb-5">
		<div class="row">
			<div class="col-md-6 offset-md-3 shadow bg-light">
				<div class="signup-form bg-light mt-4 p-4">
					<span class="circle"><i class="fa fa-check"></i></span>
					<h5 class="mt-3">회원가입 .. Sign Up</h5>
					<small class="mt-2"> 아이디(ID) / 비밀번호(PASSWORD)</small>

					<!-- 아이디 입력 -->
					<div class="form-group row mt-2">
						<div class="col-sm-6 mb-3 mb-sm-0">
							<input type="text" class="form-control form-control-user"
								id="userId" name="userId" placeholder="아이디" required="required">
						</div>
						<div class="col-sm-6">
							<a href="" onclick="" class="btn btn-primary btn-user btn-block">아이디
								중복체크</a>
						</div>
					</div>

					<!-- 비밀번호 -->
					<div class="form-group mt-3">
						<input type="password" class="form-control" id="userPw"
							name="userPw" placeholder="비밀번호를 입력해주세요">
					</div>

					<!-- 비밀번호 확인 -->
					<div class="form-group mt-3 mb-3">
						<input type="password" class="form-control" id="userPwOk"
							name="userPwOk" placeholder="비밀번호 확인을 위해 입력해주세요">
					</div>

					<hr />

					<h5 class="mt-3">내 정보 입력</h5>
					<small class="mt-2"> 이름 / 닉네임 / 이메일 / 휴대폰 번호 / 프로필 사진</small>

					<div class="form-group row mt-2">
						<div class="col-sm-6 mb-3 mb-sm-0">
							<input type="text" class="form-control form-control-user"
								id="userName" name="userName" placeholder="이름(name)"
								required="required">
						</div>
						<div class="col-sm-6">
							<a href="" onclick="" class="btn btn-primary btn-user btn-block">휴대폰
								본인확인</a>
						</div>
					</div>

					<div class="form-group mt-3">
						<input type="text" class="form-control" id="userNickname"
							name="userNickname" placeholder="닉네임(nickname)">
					</div>

					<div class="form-group mt-3">
						<input type="text" class="form-control" id="userEmail"
							name="userEmail" placeholder="이메일(E-mail)">
					</div>

					<div class="form-group mt-3">
						<input type="text" class="form-control" id="userPhone"
							name="userPhone" placeholder="휴대폰 번호(phone)">
					</div>

					<div class="input-group mt-3 mb-3">
						<label class="input-group-text" for="inputGroupFile01">Upload</label>
						<input type="file" class="form-control" id="inputGroupFile01">
					</div>


					<button class="btn btn-primary mt-4 signup">Sign up</button>
					<div class="text-center mt-3">
						<span>Or continue with these social profile</span>
						<!-- 카카오/네이버 회원가입 버튼!! -->
					</div>
					<div class="d-flex justify-content-center mt-4"></div>
					<div class="text-center mt-4">
						<span>Already a member?</span> <a href="#"
							class="text-decoration-none">Login</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>

	<script src="js/bootstrap.bundle.js"></script>
</body>
</html>