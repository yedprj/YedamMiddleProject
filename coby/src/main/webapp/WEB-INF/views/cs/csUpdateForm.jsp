<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<section class="bg-success py-5">
	<div class="container">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-white">
				<h1>Service Center</h1>
			</div>
		</div>
	</div>
</section>

<section class="container py-5">
	<div class="row text-center pt-5 pb-3">
		<div class="col-lg-6 m-auto">
			<h2 class="h2">������ �� �󼼺���</h2>
		</div>
	</div>
	
	<!-- �Խñ� ���� ��� -->
	<form action="csUpdate.do" method="post">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*">
			</colgroup>
			
			<tbody>
				<tr>
					<th scope="row">�ۼ���</th>
					<td><input type="text" id="userId" name="userId"
						value="${userId }" disabled>
						<input type="hidden" id="csNo" name="csNo"
							   value="${list.csNo}">
					</td>
				</tr>
				<tr>
					<th scope="row">����</th>
					<td><input type="text" id="csTitle" name="csTitle"
						class="form-control mt-4 mb-2" value="${list.csTitle}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<th scope="row">����</th>
					<td>
					<textarea class="form-control" rows="10" cols="200"
						id="csContent" name="csContent">${list.csContent}</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="col mt-4">
			<input type="submit" class="btn btn-success px-3 mx-3" value="�� ����">
			<input type="button" value="�ڷΰ���" onclick="history.back(-1);"
				class="btn btn-success">
		</div>
	</form>
</section>