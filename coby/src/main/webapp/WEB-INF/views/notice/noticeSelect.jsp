<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- �Խñ� �󼼺��� -->
<!-- <script>
	function deleteComment() {
		let confirms = confirm("����� �����Ͻðڽ��ϱ�?")
		if (confirms) {
			alert("�����Ǿ����ϴ�.")
			$("#frm").submit();
		}
	}
</script> -->

<section class="bg-success py-5">
	<div class="container">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-white">
 				<h1>Notice</h1>
			</div>
		</div>
	</div>
</section>

<!-- Start Section -->
<section class="container py-5">
	<div class="row text-center pt-5 pb-3 mb-3">
		<div class="col-lg-6 m-auto">
			<h2 class="h2">�������� �󼼺���</h2>
		</div>
	</div>
	<!-- �������� �󼼺��� -->
	<div class="row">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>����</th>
					<td>${list.ntTitle}</td>
					<th>�ۼ���</th>
		            <td>${board[0].boardDate}</td>
				</tr>
				<tr>
					<th>����</th>
					<td colspan="3">
						${list.ntContent}
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- �������� ���� ���� ��ư -->
	<c:if test="${userId eq 'admin'}">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end mt-3">
			<form action="noticeDelete.do" method="post">
				<input type="hidden" id="ntNo" name="ntNo" value="${list.ntNo}"> 
				<button type="submit" class="btn btn-outline-danger">�������׻���</button>
			</form>
			
			<form action="noticeUpdateForm.do" method="post">
				<input type="hidden" id="ntNo" name="ntNo" value="${list.ntNo }"> 
				<input type="hidden" id="ntTitle" name="ntTitle" value="${list.ntTitle }">
				<textarea class="form-control" rows="10" id="ntContent"
					name="ntContent" style="display: none">${list.ntContent}</textarea>
				<button type="submit" class="btn btn-outline-success">�������׼���</button>
			</form>
		</div> 
	</c:if>	
	<button type="button" onclick="location.href='noticeList.do'"
		class="btn btn-outline-dark">���</button>
</section> 



