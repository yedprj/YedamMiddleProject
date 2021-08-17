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
				<h2>USER 님</h2>
				<dl class="row">
					<dt class="col-sm-3">이메일</dt>
					<dd class="col-sm-9">이메일 값</dd>

					<dt class="col-sm-3">전화번호</dt>
					<dd class="col-sm-9">
						<p>전화번호 값</p>
					</dd>
				</dl>
				<div class="col text-end">
					<button class="btn btn-outline-secondary" type="button" onclick = "location.href ='updateUserForm.do'">정보
						수정</button>
					<button class="btn btn-outline-secondary" type="button" onclick = "location.href ='deleteUserForm.do'">회원
						탈퇴</button>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="h-100 p-5 bg-light border rounded-3">
				<h2>위시리스트</h2>
				<h2>결제 내역</h2>
				<h2>내 등록 물품 보기</h2>
				<h2>내 글/댓글 보기</h2>
			</div>
		</div>
	</div>
</div>