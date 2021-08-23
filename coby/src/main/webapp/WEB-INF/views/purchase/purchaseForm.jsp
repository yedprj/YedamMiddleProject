<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
 #img_wrap {
	width: 300px;
	margin-top: 10px;
}
#img_wrap #img,#img_wrap #img2,#img_wrap #img3 {
	max-width: 100%;
}
</style>


<script src="https://use.fontawesome.com/8c8d6bcd7e.js"></script>

<section class="bg-success py-5">
	<div class="container">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-white">
				<h1>Group Buying</h1>
			</div>
		</div>
	</div>
</section>

<section class="container py-5">
	<div class="row text-center pt-5 pb-3 mb-3">
	    <div class="col-lg-6 m-auto">
	        <h2 class="h2">공동구매 등록</h2>
	    </div>
	</div>
	
	<!-- 공동구매 등록 폼 -->
	<div class="row pb-3 mb-3">
			<div class="col-sm-9">
				<form id="frm" name="frm" action="purchaseInsert.do" method="post" enctype="multipart/form-data">
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
							<input type="date" class="form-control" id="prStartDate" name="prStartDate" readonly>
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
						<div class="col-sm-10">
							  <input class="file-upload" name="prPhoto1" id="file-input" type="file" accept="image/*"><br>
							  <input class="file-upload" name="prPhoto2" id="file-input2" type="file" accept="image/*"><br>
							  <input class="file-upload" name="prPhoto3" id="file-input3" type="file" accept="image/*">
			    			  <div class="col align-self-center text-info">*사진은 3개까지만 등록가능합니다.</div>
							  <div id="img_wrap"><img class="ratio ratio-16x9" id="img" /><img class="ratio ratio-16x9" id="img2" /><img class="ratio ratio-16x9" id="img3" /></div>
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
					<input type="hidden" name="userId" value="${user.userId }">
					<div class="text-center">
						<button type="button" class="btn btn-outline-secondary" onclick="history.back()">목록으로 돌아가기</button>
						<button id="submit" type="submit" class="btn btn-outline-dark">등록</button>
					</div>
					
				</form>
			</div>
		</div>
</section>


<script>
	document.getElementById('prStartDate').value= new Date().toISOString().substring(0, 10); //현재 날짜 가져오기
</script>

    
<script>
	var sel_file;
	 
    $(document).ready(function() {
        $("#file-input").on("change", handleImgFileSelect);
        $("#file-input2").on("change", handleImgFileSelect2);
        $("#file-input3").on("change", handleImgFileSelect3);
    }); 


    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
    
    function handleImgFileSelect2(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img2").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
    
    function handleImgFileSelect3(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img3").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
</script>

