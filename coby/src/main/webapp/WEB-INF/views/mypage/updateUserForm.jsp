<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<script src="https://use.fontawesome.com/8c8d6bcd7e.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {

		let beforeProfile = "${user.userProfile}";

		$("#beforeProfile").attr('src', beforeProfile);

		let readURL = function(input) {
			if (input.files && input.files[0]) {
				let reader = new FileReader();

				reader.onload = function(e) {
					$('.profile-pic').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$(".file-upload").on('change', function() {
			readURL(this);
		});

		$(".upload-button").on('click', function() {
			$(".file-upload").click();
		});
	});

	function confirm() {

		if (frm.userNickname.value == "") {
			alert("닉네임을 입력해주세요.");
			frm.userNickname.focus();
			return false;
		} else if (frm.userEmail.value == "") {
			alert("이메일을 입력해주세요.");
			frm.userEmail.focus();
			return false;
		} else if (frm.userPw.value == "") {
			alert("비밀번호를 입력해주세요.");
			frm.userPw.focus();
			return false;
		} else if (frm.userPwConfirm.value == "") {
			alert("비밀번호를 한번 더 입력해주세요.");
			frm.userPwConfirm.focus();
			return false;
		} else if (frm.userPwConfirm.value != frm.userPwConfirm.value) {
			alert("비밀번호를 확인하세요.");
			frm.userPw.focus();
			return false;
		} else {
			return chkPw();
		}

	}

	function chkPw() {

		let upw = $(userPw).val();

		if (!/^[a-zA-Z0-9]{8,20}$/.test(upw)) {
			alert("비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.");
			return false;
		}
		var chk_num = upw.search(/[0-9]/g);
		var chk_eng = upw.search(/[a-z]/ig);
		if (chk_num < 0 || chk_eng < 0) {
			alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");
			return false;
		}
		if (/(\w)\1\1\1/.test(upw)) {
			alert("비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.");
			return false;
		}
		return true;

	}
</script>
<style>
.profile {
	background-color: #efefef;
}

.profile-pic {
	width: 128px;
	height: 128px;
	display: block;
}

.file-upload {
	display: none;
}

.circle {
	border-radius: 1000px !important;
	overflow: hidden;
	width: 128px;
	height: 128px;
	border: 8px solid rgba(255, 255, 255, 0.7);
	top: 72px;
	background-color: #efefef;
}

img {
	width: 128px;
	height: 128px;
	max-width: 100%;
	height: auto;
}

.camera {
	top: 700px;
	right: 60px;
	left: 10px;
	color: #666666;
	transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
	position: sticky;
	color: #666666;
}

.p-image {
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
}

.p-image:hover {
	transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
}

.upload-button {
	font-size: 1.2em;
}

.upload-button:hover {
	transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
	color: #999;
	cursor: pointer;
}
</style>
</head>

<section class="bg-success py-5">
	<div class="container">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-white">
				<h1>User Info Update</h1>
			</div>
		</div>
	</div>
</section>	

<div class="container mb-4">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8 pt-3 pb-2 mb-3">
			<span class="link-dark fs-4">정보 수정</span>
		</div>

			<form id="frm" name="frm" method="POST" enctype="multipart/form-data"
				onsubmit="return confirm();" action="updateUser.do" style="width:100vw;">
				<div class="row">
					<div class="col-sm-8">
						<div class="h-100 p-5 border border-dark rounded-3">

							<div class="row pb-2 mb-2">
								<label for="userName"
									class="col-sm-3 col-form-label align-self-center">이름</label>
								<div class="col-sm-3">
									<input class="form-control form-control-sm" type="text"
										name="userName" id="userName" value="${user.userName }"
										disabled readonly>
								</div>
							</div>

							<div class="row pb-2 mb-2">
								<label for="userNickname"
									class="col-sm-3 col-form-label align-self-center">닉네임</label>
								<div class="col-sm-3">
									<input class="form-control form-control-sm" type="text"
										name="userNickname" id="userNickname"
										value="${user.userNickname }">
								</div>
							</div>

							<div class="row pb-2 mb-2">
								<label for="userEmail"
									class="col-sm-3 col-form-label align-self-center">이메일</label>
								<div class="col-sm-4">
									<input class="form-control form-control-sm" type="email"
										name="userEmail" id="userEmail" value="${user.userEmail }">
								</div>
							</div>

							<div class="row pb-2 mb-2">
								<label for="userPhone" class="col-sm-3 col-form-label">휴대폰
									번호</label>
								<div class="col-sm-3">
									<input class="form-control form-control-sm" type="text"
										name="userPhone" id="userPhone" value="${user.userPhone }"
										disabled readonly>
								</div>
							</div>

							<div class="row pb-2 mb-2">
								<label for="userPw" class="col-sm-3 col-form-label">비밀번호</label>
								<div class="col-sm-3">
									<input class="form-control form-control-sm" type="password"
										value="" name="userPw" id="userPw" placeholder="비밀번호">
								</div>
								<div class="col align-self-center text-info">*영문자+숫자
									8~20자리</div>
							</div>

							<div class="row pb-2 mb-2">
								<label for="userPwConfirm" class="col-sm-3 col-form-label">비밀번호
									확인</label>
								<div class="col-sm-3">
									<input class="form-control form-control-sm" type="password"
										value="" name="userPwConfirm" id="userPwConfirm"
										placeholder="비밀번호 확인">
								</div>
							</div>

							<div class="row pb-3 mb-3">
								<label for="" class="col-sm-3 col-form-label">프로필 사진</label>
								<div class="col">
									<div>
										<div class="circle text-center">
											<!-- User Profile Image -->
											<img class="profile-pic" id="beforeProfile" src="">

										</div>
										<div class="col align-self-center text-info">*권장 이미지 사이즈
											: 128px 128px</div>
										<div class="p-image d-flex">

											<div class="camera">
												<i class="fa fa-camera upload-button" id="camera"><span
													style="font-size: 1.0em;">프로필 변경</span></i>

											</div>
											<input class="file-upload" id="userProfile"
												name="userProfile" type="file" accept="image/*" />
										</div>
									</div>
								</div>
							</div>
							<input type="hidden" id="userId" name="userId"
								value="${user.userId }">

							<div class="col text-center">
								<input class="btn btn-success" type="submit" value="수정">
								<button class="btn btn-success" type="button"
									onclick="location.href ='myPage.do'">취소</button>
							</div>

						</div>
					</div>
				</div>
			</form>
		</div>
	
</div>