<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- �Խñ� �Է� ��� -->
<div class="container">
<form action="csInsert.do" method="post">
	<input type="text" id="csTitle"  name="csTitle" class="form-control mt-4 mb-2" placeholder="������ �Է����ּ���." required>
	<div class="form-group">
		<textarea class="form-control" rows="10" id="csContent" name="csContent"
			placeholder="������ �Է����ּ���" required></textarea>
	<input type="hidden" id="csWriter" name="csWriter" value="${userId}">		
	</div><br/>
	<button type="submit" class="btn btn-secondary mb-3">���ۼ�</button>
	<input type="button" value="�ڷΰ���" onclick="history.back(-1);">
</form>
</div>