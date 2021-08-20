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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class="container mt-5 mb-5">
		<div class="row">
			<div class="col-md-6 offset-md-3 shadow bg-light">
				<div class="signup-form bg-light mt-4 p-4">
					<span class="circle"><i class="fa fa-check"></i></span>
					<h5 class="mt-3">회원가입 .. Sign Up</h5>
					<small class="mt-2"> 아이디(ID) / 비밀번호(PASSWORD)</small>
					
					<form id="frm" name="frm" action="signUp.do" method="post">
						<!-- 아이디 입력 -->
						<div class="form-group row mt-2">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<input type="text" class="form-control form-control-user"
									id="userId" name="userId" placeholder="아이디" required="required">
							</div>
							<div class="col-sm-6">
								<button type="button" id="userIdCheck" class="btn btn-primary btn-user btn-block">아이디
									중복체크</button>
							</div>
						</div>
	
						<!-- 비밀번호 -->
						<div class="form-group mt-3">
							<input type="password" class="form-control" id="userPw"
								name="userPw" placeholder="비밀번호를 입력해주세요"
								onchange="check_pw()">
						</div>
	
						<!-- 비밀번호 확인 -->
						<div class="form-group mt-3 mb-4">
							<input type="password" class="form-control" id="userPwOk"
								name="userPwOk" placeholder="비밀번호 확인을 위해 입력해주세요"
								onchange="check_pw()">
							<span id="pwCheck" class="jb-xx-small"></span>
						</div>
	
						<hr />
	
						<h5 class="mt-4">내 정보 입력</h5>
						<small class="mt-2"> 이름 / 닉네임 / 이메일 / 휴대폰 번호 / 프로필 사진</small>
	
						<div class="form-group row mt-2">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<input type="text" class="form-control form-control-user"
									id="userName" name="userName" placeholder="이름(name)"
									required="required">
							</div>
							<div class="col-sm-6">
								<button type="button" onclick="" class="btn btn-primary btn-user btn-block">휴대폰
									본인확인</button>
							</div>
						</div>
	
						<div class="form-group mt-3">
							<input type="text" class="form-control" id="userNickname"
								name="userNickname" placeholder="닉네임(nickname)">
						</div>
	
						<div class="form-group mt-3">
							<input type="text" class="form-control" id="userEmail"
								name="userEmail" placeholder="이메일(E-mail)"
								onchange="checkEmail()">
							<span id="emailCheck" class="jb-xx-small"></span>
						</div>
	
						<div class="form-group mt-3">
							<input type="text" class="form-control" id="userPhone"
								name="userPhone" placeholder="휴대폰 번호(phone)">
						</div>
	
						
						<div class="input-group mt-3">
							<label class="input-group-text" for="inputGroupFile01">Upload</label>
							<input type="file" id="userProfile" name="userProfile" class="form-control" id="inputGroupFile01">
						</div>
					
	 
						<div class="form-group mt-3 mb-4 d-grid mx-auto">
							<button type="submit" class="btn btn-primary col-6 mx-auto">Sign up</button>
						</div>
					</form>
					
					<div class="text-center mt-3">
						<span>Or continue with these social profile</span>
						<!-- 카카오/네이버 회원가입 버튼!! -->
					</div>
					<div class="d-flex justify-content-center mt-4"></div>
					<div class="text-center mt-4">
						<span>이미 회원이신가요?</span> <a href="loginForm.do"
							class="text-decoration-none">Login</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function(){
			$('#userIdCheck').on('click', function(){	// 아이디 중복체크 버튼 클릭
				let idData = "userId="+$('input[name=userId]').val();	// 폼에서 유저 아이디 값을 가져옴
				
				$.ajax({
					type: 'post',	// POST방식으로 전송
					url: 'idCheck.do',	// 데이터를 주고 받는 파일 주소
					data: idData,	// 변수에 담긴 데이터를 전송
					dataType: 'text',	// text타입으로 전송
					success: function(data){
						alert(data);
					},
					error: function(){
						alert("비교 실패");
					}
				});
			});
		});
		
	</script>
	
	<script type="text/javascript">
		function check_pw(){
			if(document.getElementById('userPw').value != '' &&
			   document.getElementById('userPwOk').value != '') {
				
				if(document.getElementById('userPw').value == document.getElementById('userPwOk').value){
					document.getElementById('userPw').classList.remove('is-invalid');
					document.getElementById('userPwOk').classList.remove('is-invalid');
					document.getElementById('userPw').classList.add('is-valid');
					document.getElementById('userPwOk').classList.add('is-valid');
					document.getElementById('pwCheck').innerHTML = '비밀번호가 일치합니다.';
					document.getElementById('pwCheck').classList.remove('invalid-feedback');
					document.getElementById('pwCheck').classList.add('valid-feedback');
				} else {
					document.getElementById('userPw').classList.remove('is-valid');
					document.getElementById('userPwOk').classList.remove('is-valid');
					document.getElementById('userPw').classList.add('is-invalid');
					document.getElementById('userPwOk').classList.add('is-invalid');
					document.getElementById('pwCheck').innerHTML = '비밀번호가 일치하지 않습니다.';
					document.getElementById('pwCheck').classList.remove('valid-feedback');
					document.getElementById('pwCheck').classList.add('invalid-feedback');
				}	
			} else {
				document.getElementById('userPw').classList.remove('is-invalid');
				document.getElementById('userPwOk').classList.remove('is-invalid');
				document.getElementById('userPw').classList.remove('is-valid');
				document.getElementById('userPwOk').classList.remove('is-valid');
			}
		}
	</script>
	
	<script type="text/javascript">
		function checkEmail() {
			let email = document.getElementById('userEmail').value;
			let emailch = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			
			if (emailch.test(email) == false){
				//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
				document.getElementById('userEmail').classList.remove('is-valid');
				document.getElementById('userEmail').classList.add('is-invalid');
				document.getElementById('emailCheck').innerHTML = '올바르지 않은 이메일 형식입니다.';
				document.getElementById('emailCheck').classList.remove('valid-feedback');
				document.getElementById('emailCheck').classList.add('invalid-feedback');
				document.addjoin.email.focus();
				return false;
			} else {
				document.getElementById('userEmail').classList.remove('is-invalid');
				document.getElementById('userEmail').classList.add('is-valid');
				document.getElementById('emailCheck').innerHTML = '올바른 이메일 형식입니다.';
				document.getElementById('emailCheck').classList.remove('invalid-feedback');
				document.getElementById('emailCheck').classList.add('valid-feedback');
			}
		}
	</script>

	<script src="js/bootstrap.bundle.js"></script>
</body>
</html>