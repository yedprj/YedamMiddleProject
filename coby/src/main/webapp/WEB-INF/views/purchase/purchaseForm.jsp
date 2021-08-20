<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 폼</title>
<style>
.imgs_wrap{
	min-height:200px;
	border:1px solid #888;
}
</style>
<script src="https://use.fontawesome.com/8c8d6bcd7e.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>

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
						<div class="col-sm-10">
							  <input class="file-upload" name="prPhoto1" id="file-input" type="file" accept="image/*"><br>
							  <input class="file-upload" name="prPhoto2" id="file-input" type="file" accept="image/*"><br>
							  <input class="file-upload" name="prPhoto3" id="file-input" type="file" accept="image/*">
			    			  <div class="col align-self-center text-info">*사진은 3개까지만 등록가능합니다.</div>
							  <div id="imgs_wrap"></div>
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
	</div>
</body>
	<script>
		document.getElementById('prStartDate').value= new Date().toISOString().substring(0, 10); //현재 날짜 가져오기
	</script>
	<script>
	(upload = function(){
		$id = function(id){ return document.getElementById(id) }
		
		var sel_files = [];
		var btnChooseID; //파일 선택 버튼
		var btnSendID; // 전송 버튼
		var appendZone; // 이미지가 표시될 영역
		var sendURL;
		var img_style = 'width:200px;height:150px;margin:4px';
		var chk_style = 'position:absolute; right:7px;bottom:7px;width:20px;height:20px;opacity:.7';
		var div_style = 'display:inline-block; position:relative';
		upload.start = function(chooseID, sendID, apZone, url){
			btnChooseID = $id(chooseID);
			btnSendID = $id(sendID);
			appendZone = $id(apZone);
			sendURL = url;
		
			// file tag로 파일을 선택한 경우
			btnChooseID.onchange = function(e){
				var files = e.target.files;
				var fileArr = Array.prototype.slice.call(files);
				for(f of fileArr){
					upload.imageLoader(f);
				}
			}

			// drap and drop을 사용한 경우
			appendZone.addEventListener('dragenter', function(e) {
				e.preventDefault();
				e.stopPropagation();
			}, false)
			appendZone.addEventListener('dragover', function(e) {
				e.preventDefault();
				e.stopPropagation();
			}, false)
			appendZone.addEventListener('drop', function(e) {
				e.stopPropagation();
				e.preventDefault();
				var dt = e.dataTransfer;
				var files = dt.files;
				for(f of files) upload.imageLoader(f);
			}, false)
			
			
			// 이미지 로드
			upload.imageLoader = function(file){
				sel_files.push(f);
				
				var reader = new FileReader();
				reader.readAsDataURL(f);
				reader.onload = function(ee){
					let img = document.createElement('img');
					img.setAttribute('style', img_style);
					img.src = ee.target.result;
					appendZone.append(img_div(img));
				}
			}
			
			// 파일 전송
			btnSendID.onclick = function(e){
				var data = new FormData();
				var uploadChk= document.getElementsByClassName('upload_chk');
				
				for(i=0 ; i<sel_files.length ; i++){
					if(uploadChk[i].checked){
						var name = 'image_';
						data.append(name, sel_files[i]);
					}
				}
				
				var xhr = new XMLHttpRequest();
				xhr.open("POST", sendURL);
				xhr.send(data);
				xhr.onreadystatechange = function(){
					if(this.status==200 && this.readyState == 4){
						console.log("OK.");
					}
				}
				
			}
			
			// 이미지 개당 div 생성
			img_div = function(img){
				var div = document.createElement('div');
				div.setAttribute('style', div_style);
				var btn = document.createElement('input');
				btn.setAttribute('type', 'checkbox');
				btn.setAttribute('class', 'upload_chk');
				btn.setAttribute('checked', 'checked');
				btn.setAttribute('style', chk_style);
				div.appendChild(img);
				div.appendChild(btn);
				return div;
			}
		}		

	})()
	</script>
	<script>
	  upload.start('file-input', 'submit', 'imgs_wrap', 'file_upload_action.jsp');
    </script>
</html>