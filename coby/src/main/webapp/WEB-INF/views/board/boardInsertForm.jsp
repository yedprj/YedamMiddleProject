<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- �Խñ� �Է� ��� -->
<div class="container">
<form action="boardInsert.do" method="post">
	<input type="text" id="userId" name="userId" value="${userId }"> 
	<input type="text" id="boardTitle"  name="boardTitle" class="form-control mt-4 mb-2" placeholder="������ �Է����ּ���." required>
	<div class="form-group">
		<textarea class="form-control" rows="10" id="boardContent" name="boardContent"
			placeholder="������ �Է����ּ���" required></textarea>
	</div><br/>
	<button type="submit" class="btn btn-secondary mb-3">���ۼ�</button>
	<input type="button" value="�ڷΰ���" onclick="history.back(-1);">
</form>
</div>