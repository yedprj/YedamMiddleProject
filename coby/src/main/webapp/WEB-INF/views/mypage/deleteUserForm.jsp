<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		$('#delBtn').on('click', function() {
			let userPw = $('#userPw').val();
			let userPwConfirm = $('#userPwConfirm').val();
			if (userPw == "") {
				alert("비밀번호를 입력하세요.");
				$('#userPw').focus();
				return false;
			} 	else if (userPwConfirm == "") {
				alert("비밀번호를 입력하세요.");
				$('#userPwConfirm').focus();
				return false;
			} else if (userPw != userPwConfirm) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#userPw').focus();
			} else {
				$.ajax({
					url: 'deleteUser.do',
					type: 'POST',
					data: 'userPw=' + userPw,
					dataType: 'text',
					success: function(data) {
						result = $.trim(data);
						if (result == "삭제") {
							alert("탈퇴되었습니다.");
							location.href='home.do';
						} else if (result == "불일치") {
							alert("비밀번호가 일치하지 않습니다.");
							userPw = "";
							userPwConfirm = "";
						} else  if (result == "세션") {
							alert("세션이 만료되었습니다. 다시 로그인하세요.");
							location.href='login.do';
						}
					},
					error: function() {
						alert('요청에 실패했습니다.');
					}
				})
			}
		})
	});
</script>
<div class="container">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
		<span class="link-dark fs-4">회원 탈퇴</span>
	</div>

	<div class="row">
		<div class="col-sm-8">
			<div class="h-100 p-5 border border-dark rounded-3">

				<h1 class="display-5">정말 탈퇴하시겠어요?</h1>
				<blockquote class="blockquote">
					<p>탈퇴하시려면 비밀번호 확인이 필요합니다.</p>
				</blockquote>

				<form id="frm" method="POST" action="deleteUser.do">
					<div class="form-floating">
						<input type="password" class="form-control mb-3" id="userPw"
							name="userPw" placeholder="비밀번호를 입력해주세요."> <label
							for="userPw">비밀번호</label>
					</div>

					<div class="form-floating">
						<input type="password" class="form-control mb-3"
							id="userPwConfirm" name="userPwConfirm"
							placeholder="비밀번호를 한번 더 입력해주세요."> <label
							for="userPwConfirm">비밀번호 확인</label>
					</div>

					<div class="col text-center mt-3">
						<button class="btn btn-outline-danger" type="button" id="delBtn">탈퇴</button>
						<input type="hidden" id="userId" name="userId" value="${userId }"> 
						<button class="btn btn-outline-secondary" type="button"
							onclick="location.href ='myPage.do'">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
