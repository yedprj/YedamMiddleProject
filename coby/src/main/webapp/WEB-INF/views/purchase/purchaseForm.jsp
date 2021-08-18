<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 리스트</title>
<script src="https://use.fontawesome.com/8c8d6bcd7e.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
	function previewImages() {

		var $preview = $('#preview').empty();
		if (this.files)
			$.each(this.files, readAndPreview);

		function readAndPreview(i, file) {

			if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
				return alert(file.name + " is not an image");
			} // else...

			var reader = new FileReader();

			$(reader).on("load", function() {
				$preview.append($("<img/>", {
					src : this.result,
					height : 100
				}));
			});

			reader.readAsDataURL(file);

		}

	}

	$('#file-input').on("change", previewImages);
</script>
</head>
<body>
	<div class="container">
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
			<span class="link-dark fs-4">공동구매 등록</span>
		</div>

		<div class="row pb-3 mb-3">
			<div class="col-sm-9">
				<form id="frm" name="frm" action="purchaseInsert.do" method="post">
					<div class="row pb-3 mb-3 border-bottom">
						<label for="itemSelect" class="col-sm-2 col-form-label">카테고리</label>
						<div class="col-sm-3">
							<select class="form-select" id="prCategory" name="prCategory">
								<option value="" disabled selected hidden>기본 물품 선택</option>
								<option value="식품">식품</option>
								<option value="생필품">생필품</option>
							</select>
						</div>
					</div>

					<div class="row pb-3 mb-3 border-bottom">
						<label for="prTitle" class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="prTitle"
								name="prTitle" placeholder="제목을 입력해주세요">
						</div>
					</div>

					<div class="row pb-3 mb-3 border-bottom">
						<label class="col-sm-2 col-form-label">모집 인원</label>
						<div class="col-sm-2">
							<input type="number" min="1" max="20" class="form-control"
								id="prMin" name="prMin" placeholder="최소 인원">
						</div>
						~
						<div class="col-sm-2">
							<input type="number" min="2" max="20" class="form-control"
								id="prMax" name="prMax" placeholder="최대 인원">
						</div>

					</div>

					<div class="row pb-3 mb-3 border-bottom">
						<label class="col-sm-2 col-form-label">연락처</label>
						<div class="col align-self-center">
							<strong>010-5555-5555</strong>
						</div>
					</div>

					<div class="row pb-3 mb-3 border-bottom">
						<label for="" class="col-sm-2 col-form-label">진행 기간</label>
						<div class="col-sm-3">
							<input type="date" class="form-control" id="prStartDate" name="prStartDate">
						</div>
						~
						<div class="col-sm-3">
							<input type="date" class="form-control" id="prEndDate" name="prEndDate">
						</div>

					</div>


					<div class="row pb-3 mb-3 border-bottom">
						<label for="prPrice" class="col-sm-2 col-form-label">금액</label>

						<div class="col-sm-4">
							<input type="text" class="form-control" id="prPrice"
								name="prPrice" placeholder="ex) 50000">
						</div>
						<div class="col align-self-center text-info">*총 금액을 숫자로
							입력해주세요.</div>
					</div>

					<div class="row pb-3 mb-3 border-bottom">
						<label for="inputEmail3" class="col-sm-2 col-form-label">사진
							등록</label>
						<div class="col-sm-7">
							<input class="file-upload" id="file-input" type="file" multiple>
							<div id="preview"></div>
							<div class="col align-self-center text-info">*사진은 3개까지만 등록
								가능합니다.</div>
						</div>
					</div>

					<div class="row pb-3 mb-3">
						<label for="prContent" class="col-sm-2 col-form-label">상세
							내용</label>
						<div class="col">
							<textarea class="form-control" id="prContent" name="prContent"
								rows="8" placeholder="내용을 입력해주세요."></textarea>
						</div>
					</div>
					
					<div class="text-center">
						<button type="button" class="btn btn-outline-secondary" onclick="history.back()">목록으로 돌아가기</button>
						<button type="submit" class="btn btn-outline-dark">등록</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</body>
	<script>
		document.getElementById('prStartDate').value= new Date().toISOString().substring(0, 10); //현재 날짜 가져오기
	</script>
</html>