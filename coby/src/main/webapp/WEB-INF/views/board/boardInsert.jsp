<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<div class="container">
<form action="writerAction" method="post">
	<input type="hidden" name="bdGroup"> <input type="hidden"
		name="bdOrder"> <input type="hidden" name="bdIndent">
	<input type="text" name="bdTitle" class="form-control mt-4 mb-2"
		placeholder="������ �Է����ּ���." required>
	<div class="form-group">
		<textarea class="form-control" rows="10" name="bdContent"
			placeholder="������ �Է����ּ���" required></textarea>
	</div><br/>
	<button type="submit" class="btn btn-secondary mb-3">�����ϱ�</button>
</form>
</div>