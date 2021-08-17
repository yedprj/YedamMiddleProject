<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				

				<div class="form-floating">
					<input type="password" class="form-control mb-3" id="userPw"
						name="userPw" placeholder="비밀번호를 입력해주세요."> <label
						for="userPw">비밀번호</label>
				</div>

				<div class="form-floating">
					<input type="password" class="form-control mb-3" id="userPwConfirm"
						name="userPwConfirm" placeholder="비밀번호를 한번 더 입력해주세요."> <label
						for="userPwConfirm">비밀번호 확인</label>
				</div>

				<div class="col text-center mt-3">
					<button class="btn btn-outline-danger" type="button"
						onclick="location.href ='deleteUser.do'">탈퇴</button>
					<button class="btn btn-outline-dark" type="button"
						onclick="location.href ='myPage.do'">취소</button>
				</div>

			</div>
		</div>
	</div>
</div>
