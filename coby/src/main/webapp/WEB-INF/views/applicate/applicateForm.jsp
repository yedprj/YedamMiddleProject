<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

	let dividedPrice = ${dividedPrice};
	let bossPrice = ${bossPrice};
	//나왔따!!!!!!!!!!!!!!!!!이제 이거를 각각 update에 넣으면 된다!!!!!!!!!
	console.log(dividedPrice, bossPrice);
	let prNo = ${list[0].prNo };
	//파티장 id
	let userId = "${list[0].userId }";
	console.log(prNo);
	console.log(userId);

	//통화 변경 함수
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	$(document).ready(function() {
		let text = document.createTextNode(numberWithCommas(${dividedPrice }) + "원");
		console.log(text);
		$('#price').append(text);
		
		
		$('#applicateBtn').on('click', function() {
			//true or false
			let agree = $('#agree').is(':checked');

			if (!agree) {
				alert("구매에 동의해주세요.");
			} else {
				$.ajax({
					url: 'applicateInsert.do',
					type: 'POST',
					data: {prNo : prNo,
						dividedPrice : dividedPrice,
						bossPrice : bossPrice,
						bossId : userId},
					success: function(data) {
						data = $.trim(data);
						if (data == "참여") {
							alert('참여신청이 완료되었습니다. 마이페이지의 참여현황에서 결제를 진행해주세요!');
							location.href="home.do";
						}
					},
					error: function() {
						console.log('ajax 에러');
					}
				})
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

			</div>
			<div class="col-sm-4">
				<div class="h5">결제하기</div>
				<div class="p-3 mb-3 border rounded-3">
					<div class="row">
						<div class="col">
							<strong class="text-danger">최종 금액</strong>
						</div>
						<div class="col text-end" id="price"> </div>

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