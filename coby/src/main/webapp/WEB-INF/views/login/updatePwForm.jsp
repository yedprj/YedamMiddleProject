<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 재설정</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.bundle.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-4 offset-md-4 border p-4 shadow bg-light">
				<div class="login-form bg-light mt-4 p-4">
					<h4 class="mt-3">비밀번호 재설정</h4>
					<small class="mt-2 mb-3"> 비밀번호를 재설정 해주세요.</small>	
									
					<div class="col-12 mt-3">
						<label>아이디(ID)</label> <input type="text" id="userId"
							name="userId" class="form-control mt-1"
							value="${id }" readonly>
					</div>
						
					<div class="col-12 mt-3">
						<input type="password" class="form-control" id="userPw"
							name="userPw" placeholder="새 비밀번호 입력"
							onchange="check_pw()">
					</div>
					
					<div class="col-12 mt-3">
						<input type="password" class="form-control" id="userPwOk"
							name="userPwOk" placeholder="새 비밀번호 확인"
							onchange="check_pw2()">
						<span id="pwCheck" class="jb-xx-small"></span>
					</div>
					
					<div class="col-11 d-grid mx-auto mt-3">
						<input type="button" id="updatePw" class="btn btn-dark form-control p-2"
							value="확인">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function check_pw(){
			
			let pw = $('#userPw').val();
		 
		    if(!/^[a-zA-Z0-9]{8,20}$/.test(pw)){
		        alert("비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.");
		        frm.userPw.focus();
		        return false;
		    }
		    
		    var chk_num = pw.search(/[0-9]/g);
		    var chk_eng = pw.search(/[a-z]/ig);
		    
		    if(chk_num<0 || chk_eng<0){
		        alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");
		        return false;
		    }
		    if(/(\w)\1\1\1/.test(pw)){
		        alert("비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.");
		        return false;
		    }
			return true;
		}
		
		function check_pw2() {
			
			let pw = $('#userPw').val();
			let pwok = $('#userPwOk').val();
			
			if (pw != null && pwok != null) {
				if (pw == pwok) {
					$('#userPw').removeClass('is-invalid')
								.addClass('is-valid');
					$('#userPwOk').removeClass('is-invalid')
								  .addClass('is-valid');
					$('#pwCheck').removeClass('invalid-feedback')
								 .addClass('valid-feedback').text('입력하신 비밀번호가 일치합니다.');
				} else {
					$('#userPw').removeClass('is-valid')
								.addClass('is-invalid');
					$('#userPwOk').removeClass('is-valid')
								 .addClass('is-invalid');
					$('#pwCheck').removeClass('valid-feedback')
								.addClass('invalid-feedback').text('입력하신 비밀번호가 일치하지 않습니다.');
				}
			} else {
				$('#userPw').removeClass('is-valid')
							.removeClass('is-invalid');
				$('#userPwOk').removeClass('is-valid')
							  .removeClass('is-invalid');
			}
		}
	</script>
	
	<script>
		$(document).ready(function(){
			$('#updatePw').on('click', function(){
				$.ajax({
					type: 'post',	// POST방식으로 전송
					url: 'updatePw.do',	// 데이터를 주고 받는 파일 주소
					data: { userId: $('input[name="userId"]').val(),
							userPw: $('input[name="userPw"]').val()},	// text타입으로 전송
					success: function(data){
						let result = $.trim(data);
						if(result == "비밀번호 변경에 성공하셨습니다."){
							alert(data);
							document.location.href="loginForm.do";
						} else {
							alert(data);
							$('#userPw').val('');
							$('#userPwOk').val('');
						}
					},
					error: function(){
						alert("비교 실패");
					}
				});
			});
		});
	</script>

</body>
</html>