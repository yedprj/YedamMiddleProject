<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/jumbotron/">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	//selectOne에는 위시리스트 번호가 들어가야한다.
	$(document).ready(function() {
		//최상단 체크박스 클릭
		$("#selectAll").click(function() {
			//클릭되었으면
			if ($("#selectAll").prop("checked")) {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[id=selectOne]").prop("checked", true);
				$("#selectAll2").prop("checked", true);
				//클릭이 안되있으면
			} else {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[id=selectOne]").prop("checked", false);
				$("#selectAll2").prop("checked", false);
			}
		})
		//최하단 체크박스 클릭
		$("#selectAll2").click(function() {
			//클릭되었으면
			if ($("#selectAll2").prop("checked")) {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[id=selectOne]").prop("checked", true);
				$("#selectAll").prop("checked", true);
				//클릭이 안되있으면
			} else {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[id=selectOne]").prop("checked", false);
				$("#selectAll").prop("checked", false);
			}
		})
	})
</script>
</head>
<div class="container">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
		<span class="link-dark fs-4">위시리스트</span>
	</div>
	<div class="h-100 p-5 border rounded-3">
		<!-- 상단 전체선택 / 삭제 -->
		<div class="border-bottom">
			<div class="row">
				<div class="col-sm-8">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="selectAll"> <label class="form-check-label"
							for="selectAll"> 전체 선택 </label>
					</div>
				</div>
				<div class="col-sm-4 text-end mb-3">
					<button type="button" class="btn btn-outline-dark btn-sm">
						<span class="fw-bold">선택 삭제</span>
					</button>
				</div>
			</div>
		</div>

		<!-- 항목 -->
		<div class="border-bottom">
			<div class="row p-4">
				<div class="col-sm-4 text-center">
					<div class="row">
						<div class="col-sm-4 align-self-center">
							<input class="form-check-input" type="checkbox" value=""
								id="selectOne" name="">
						</div>
						<div class="col-sm-8">
							<label class="form-check-label" for="selectOne"> <img
								src="image/miffy.jpg" class="rounded img-fluid" alt="200X200">
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-8 align-self-center">
					<div class="row p-3">
						<div class="col-sm-6 align-self-center">
							<p class="h4">물품명</p>
							<p class="lead text-secondary">판매자</p>
							<div>
								<button type="button" class="btn btn-outline-dark btn-sm">
									<span class="fw-bold">삭제</span>
								</button>
							</div>
						</div>
						<div class="col-sm-6 text-end align-self-center">가격</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 하단 전체선택 / 삭제 -->
		<div class="border-bottom mt-3">
			<div class="row">
				<div class="col-sm-8">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="selectAll2"> <label class="form-check-label"
							for="selectAll"> 전체 선택 </label>
					</div>
				</div>
				<div class="col-sm-4 text-end pb-3">
					<button type="button" class="btn btn-outline-dark btn-sm">
						<span class="fw-bold">선택 삭제</span>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>


