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
	top: -40px;
	right: -90px;
	color: #666666;
	transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
	position: relative;
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
}
</style>
</head>















<div>
	<div class="circle text-center">
		<!-- User Profile Image -->
		<img class="profile-pic" src="image/miffy.jpg">

		<!-- Default Image -->
		<i class="fa fa-user fa-5x"></i>
	</div>
	<div class="p-image d-flex align-items-center justify-content-center">
		<div class="camera">
			<i class="fa fa-camera upload-button"></i>
		</div>
		<input class="file-upload" type="file" accept="image/*" />
	</div>
</div>