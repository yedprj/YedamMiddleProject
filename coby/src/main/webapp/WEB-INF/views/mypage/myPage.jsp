<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
		<span class="link-dark fs-4">마이페이지</span>
	</div>
	<div class="row">
		<div class="col-md-6">
			<div class="h-100 p-5 bg-light border rounded-3">
				<h2>${user.userNickname } 님</h2>
				<dl class="row">
					<dt class="col-sm-3">이메일</dt>
					<dd class="col-sm-9">${user.userEmail }</dd>

					<dt class="col-sm-3">전화번호</dt>
					<dd class="col-sm-9">
						<p>${user.userPhone }</p>
					</dd>
				</dl>
				<div class="col text-end">
					<button class="btn btn-outline-dark" type="button" onclick = "location.href ='updateUserForm.do'">정보
						수정</button>
					<button class="btn btn-outline-secondary" type="button" onclick = "location.href ='deleteUserForm.do'">회원
						탈퇴</button>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="h-100 p-5 bg-light border rounded-3">
				<h2 onclick="location.href='wishList.do'" style="cursor:pointer">위시리스트</h2>
				<h2 onclick="location.href='applicateList.do'" style="cursor:pointer">참여 현황</h2>
			</div>
		</div>
	</div>
</div>