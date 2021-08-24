<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
tr:hover {
	cursor: pointer;
}
</style>

<script>
	$(document).ready(function() {
		$('button[name=delBtn]').on('click', function() {
			
			let cfirm = confirm("결제를 취소하시겠습니까?");
			console.log(this.id);
			
			let apNo = this.id;
			
			let tr = $(this).parent().parent();
			
			if (cfirm) {
				$.ajax({
					url: 'ApplicateDeleteServlet',
					type: 'POST',
					data: {apNo : apNo},
					success: function() {
						tr.remove();
						alert('결제가 취소되었습니다.');
					},
					error: function() {
						console.log('에러');
					}
				});
			}
		});
	});
</script>

<script>
	$(function (){
		price();
	});

	 function price() {
		 $('#check_module').click(function (e){
			 e.preventDefault();
			 console.log("클릭");
			 
			 var email = "${user.userEmail}";
			 var name = "${user.userName}";
			 var phone = "${user.userPhone}";
	         var IMP = window.IMP;   // 생략가능
	         // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	         // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	         IMP.init('imp42110057');
	
	         IMP.request_pay({
	             pg: 'inicis',
	             pay_method: 'card',
	             merchant_uid: 'merchant_' + new Date().getTime(),
	             name: '주문명: 결제테스트',
	             amount: 100,
	             buyer_email: email,
	             buyer_name: name,
	             buyer_tel: phone,
	             buyer_addr: '서울특별시 강남구 삼성동',
	             buyer_postcode: '123-456'
	         }, function(rsp) {
	             console.log(rsp);
	             if (rsp.success) {
	                 var msg = '결제가 완료되었습니다.';
	                 msg += '고유ID : ' + rsp.imp_uid;
	                 msg += '상점 거래ID : ' + rsp.merchant_uid;
	                 msg += '결제 금액 : ' + rsp.paid_amount;
	                 msg += '카드 승인번호 : ' + rsp.apply_num;
	             } else {
	                 var msg = '결제에 실패하였습니다.';
	                 msg += '에러내용 : ' + rsp.error_msg;
	             }
	             alert(msg);
	         });
	     });
	 }
</script>


클릭하면 해당 상세글로 이동합니다.
<table id="table">
	<tr>
		<th>주문 번호</th>
		<th>구매일</th>
		<th>제품</th>
		<th>주문 금액</th>
		<th></th>
	</tr>
	<c:forEach var="list" items="${list }">
		<tr>
			<td onclick="location.href='purchaseSelect.do?prNo=${list.prNo }'">${list.apNo }</td>
			<td onclick="location.href='purchaseSelect.do?prNo=${list.prNo }'">${list.apDate }</td>
			<td onclick="location.href='purchaseSelect.do?prNo=${list.prNo }'">${list.prTitle }</td>
			<td onclick="location.href='purchaseSelect.do?prNo=${list.prNo }'">${list.apPrice }</td>
			<td>
				<button type="button" id="${list.apNo }" name="delBtn">결제 취소</button>
				<button id="check_module">결제 하기</button>
			</td>
		</tr>
	</c:forEach>
</table>