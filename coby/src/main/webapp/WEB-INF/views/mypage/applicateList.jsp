<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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

			</td>
		</tr>
	</c:forEach>
</table>