<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

	let dividedPrice = ${dividedPrice};
	let bossPrice = ${bossPrice};
	//나왔따!!!!!!!!!!!!!!!!!이제 이거를 각각 update에 넣으면 된다!!!!!!!!!
	console.log(dividedPrice, bossPrice);
	

	//통화 변경 함수
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	$(document).ready(function() {
		$('#applicateBtn').on('click', function() {
			//true or false
			let apPayCredit = $('#apPayCredit').is(':checked');
			let apPayNaver = $('#apPayNaver').is(':checked');
			let agree = $('#agree').is(':checked');

			if (!(apPayCredit || apPayNaver)) {
				alert("결제 수단을 선택하세요.");
			} else if (!agree) {
				alert("구매에 동의해주세요.");
			} else {
				//결제로 넘어감
			}

		});
	});
</script>
<div class="container">
	<div class="pt-3 pb-2 mb-3">
		<span class="link-dark fs-4">참여 신청</span>
	</div>
	<div class="h-100 p-5 mb-5 border rounded-3">
		<div class="row border-bottom pb-3">
			<div class="col-sm-2">
				<img src="image/food1.jpg" class="rounded mx-auto d-block"
					width="100" height="100">
			</div>
			<div class="col-sm-10">
				<div class="text-muted">
					<small>${list[0].prCategory }</small>
				</div>
				<div class="h3">${list[0].prTitle }</div>
				<div class="text-muted">
					<small>${list[0].prStartdate } ~ ${list[0].prEnddate }</small>
				</div>
			</div>
		</div>

		<div class="row py-3">
			<div class="col-sm-8">
				<div class="mb-3">
					<div class="h5">내 정보</div>
					<div class="p-3 mb-5 border rounded-3">
						<table>
							<tr>
								<th width="100">연락처</th>
								<td>${user.userPhone }</td>
							</tr>

							<tr>
								<th width="100">이메일</th>
								<td>${user.userEmail }</td>
							</tr>

						</table>
					</div>

				</div>
				<div class="mb-3">
					<div class="h5">결제수단</div>
					<div class="p-3 border rounded-3">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="apPay"
								id="apPayCredit" value="credit card"> <label
								class="form-check-label" for="apPayCredit">신용카드</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="apPay"
								id="apPayNaver" value="naver pay"> <label
								class="form-check-label" for="apPayNaver">네이버페이</label>
						</div>
					</div>
				</div>

			</div>
			<div class="col-sm-4">
				<div class="h5">결제하기</div>
				<div class="p-3 mb-3 border rounded-3">
					<div class="row">
						<div class="col">
							<strong class="text-danger">최종 금액</strong>
						</div>
						<div class="col text-end" id="price">${dividedPrice }원</div>

					</div>
				</div>
				<div class="form-check mt-3">
					<input class="form-check-input" type="checkbox" value="" id="agree">
					<label class="form-check-label" for="agree"> 동의합니다. </label>
				</div>
				<div class="d-grid gap-2 mt-3">
					<button class="btn btn-outline-dark" type="button"
						id="applicateBtn">참여 신청하기</button>
				</div>
			</div>
		</div>
	</div>
</div>