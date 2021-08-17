<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<script src="https://use.fontawesome.com/8c8d6bcd7e.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {

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
</script>
<style>
.profile {
	background-color: #efefef;
}

.profile-pic {
	max-width: 200px;
	max-height: 200px;
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
	max-width: 100%;
	height: auto;
	object-fit: cover;
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



<div class="container">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
		<span class="link-dark fs-4">정보 수정</span>
	</div>

	<div class="row">
		<div class="col-sm-8">
			<div class="h-100 p-5 border border-dark rounded-3">

				<dl class="row align-self-center">

					<dt class="col-sm-3">이름</dt>
					<dd class="col-sm-9">
						<dl class="row">
							<dd class="col-sm-6">
								<input class="form-control form-control-sm" type="text"
									name="userName" id="userName" value="이름" disabled readonly>
							</dd>
							<dd class="col-sm-6"></dd>
						</dl>
					</dd>

					<dt class="col-sm-3">닉네임</dt>
					<dd class="col-sm-9">
						<div class=" col-xs-3">
							<input class="form-control form-control-sm" type="text"
								name="userNickName" id="userNickName" value="닉네임">
						</div>
					</dd>
					<dt class="col-sm-3">이메일</dt>
					<dd class="col-sm-9">
						<dl class="row">
							<dd class="col-sm-6">
								<input class="form-control form-control-sm" type="text"
									name="userEmail" id="userEmail" value="이메일">
							</dd>
							<dd class="col-sm-6"></dd>
						</dl>
					</dd>

					<dt class="col-sm-3">휴대폰 번호</dt>
					<dd class="col-sm-9">
						<dl class="row">
							<dd class="col-sm-6">
								<input class="form-control form-control-sm" type="text"
									name="userPhone" id="userPhone" value="010-2525-2525" disabled
									readonly>
							</dd>
							<dd class="col-sm-6"></dd>
						</dl>
					</dd>

					<dt class="col-sm-3">비밀번호</dt>
					<dd class="col-sm-9">
						<dl class="row">
							<dd class="col-sm-6">
								<input class="form-control form-control-sm" type="password"
									value="" name="userPw" id="userPw" placeholder="비밀번호를 입력해주세요">
							</dd>
							<dd class="col-sm-6"></dd>
						</dl>
					</dd>

					<dt class="col-sm-3">비밀번호 확인</dt>
					<dd class="col-sm-9">
						<dl class="row">
							<dd class="col-sm-6">
								<input class="form-control form-control-sm" type="password"
									value="" name="userPwConfirm" id="userPwConfirm"
									placeholder="비밀번호 확인을 위해 입력해주세요">
							</dd>
							<dd class="col-sm-6"></dd>
						</dl>
					</dd>

					<dt class="col-sm-3">프로필 사진</dt>
					<dd class="col-sm-9">

						<div>
							<div class="circle text-center">
								<!-- User Profile Image -->
								<img class="profile-pic" src="image/miffy.jpg">

								<!-- Default Image -->
								<i class="fa fa-user fa-5x"></i>
							</div>
							<div class="p-image d-flex">

								<div class="camera">
									<i class="fa fa-camera upload-button" id="camera"><span
										style="font-size: 1.0em;">프로필 변경</span></i>

								</div>
								<input class="file-upload" type="file" accept="image/*" />
							</div>
						</div>



					</dd>
				</dl>

				<div class="col text-center">
					<button class="btn btn-outline-dark" type="button"
						onclick="location.href ='updateUser.do'">수정</button>
					<button class="btn btn-outline-dark" type="button"
						onclick="location.href ='myPage.do'">취소</button>
				</div>

			</div>
		</div>
	</div>





</div>