<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 수정하기</title>
</head>
<body>
  <div class="container">
    	<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
			<span class="link-dark fs-4 ">공동구매 수정</span>
			<div class="col align-self-center text-info">***금액과 내용만 수정 가능합니다</div>			
		</div>
		<div class="row pb-3 mb-3">
			<div class="col-sm-9">
				<form id="frm" name="frm" action="" method="post">
				  	<div class="row pb-3 mb-3 border-bottom">
						<label for="itemSelect" class="col-sm-2 col-form-label">카테고리</label>
						<div class="col-sm-3">
							<select class="form-select" id="prCategory" name="prCategory">
								<option value="${list[0].prCategory }">${list[0].prCategory }</option>
							</select>
						</div>
					</div>
					<div class="row pb-3 mb-3 border-bottom">
					<label for="prTitle" class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="prTitle"
								name="prTitle" value="${list[0].prTitle }" readonly>
						</div>
					</div>
					
			        <div class="row pb-3 mb-3 border-bottom">
						<label class="col-sm-2 col-form-label">모집 인원</label>
						<div class="col-sm-2">
							<input type="number" min="1" max="20" class="form-control"
								id="prMin" name="prMin" value="${list[0].prMin }" readonly>
						</div>
						~
						<div class="col-sm-2">
							<input type="number" min="2" max="20" class="form-control"
								id="prMax" name="prMax" value="${list[0].prMax }" readonly>
						</div>
					</div>
			        <div class="row pb-3 mb-3 border-bottom">
						<label class="col-sm-2 col-form-label">연락처</label>
						<div class="col align-self-center">
							<strong>${user.userPhone}</strong>
						</div>
					</div>
					
					<div class="row pb-3 mb-3 border-bottom">
						<label for="" class="col-sm-2 col-form-label">진행 기간</label>
						<div class="col-sm-3">
							<input type="date" class="form-control" id="prStartDate" name="prStartDate" value="${list[0].prStartdate }" readonly>
						</div>
						~
						<div class="col-sm-3">
							<input type="date" class="form-control" id="prEndDate" name="prEndDate" value="${list[0].prStartdate }" readonly >
						</div>

					</div>					


					<div class="row pb-3 mb-3 border-bottom">
						<label for="prPrice" class="col-sm-2 col-form-label">금액</label>

					<div class="col-sm-4">
							<input type="text" class="form-control" id="prPrice"
								name="prPrice" value="${list[0].prPrice }">
						</div>

					</div>
					
					<div class="row pb-3 mb-3">
						<label for="prContent" class="col-sm-2 col-form-label">기존
							내용</label>
						<div class="col">
							<textarea class="form-control" id="prContent" name="prContent"
								rows="8" readonly>${list[0].prContent }</textarea>
						</div>
					</div>
					<div class="row pb-3 mb-3">
						<label for="prContent" class="col-sm-2 col-form-label">추가
							내용</label>
						<div class="col">
							<textarea class="form-control" id="prContent2" name="prContent2"
								rows="8" placeholder="추가 할 내용을 입력해주세요."></textarea>
						</div>
					</div>
					
					<div class="text-center">
						<button type="button" class="btn btn-outline-secondary" onclick="history.back()">목록으로 돌아가기</button>
						<button id="submit" type="submit" class="btn btn-outline-dark">수정하기</button>
					</div>
					
			    </form>
          </div>
       </div>
  </div>
</body>
</html>