<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- �Խñ� ���� ��� -->
<div class="container">
<form action="csUpdate.do" method="post">
	<input type="text" id="csNo" name="csNo" value="${list.csNo}" >
	<input type="text" id="csTitle"  name="csTitle" class="form-control mt-4 mb-2" value="${list.csTitle}" disabled="disabled">
	<div class="form-group">
		<textarea class="form-control" rows="10" id="csContent" name="csContent">${list.csContent}</textarea>
	</div><br/>
	<button type="submit" class="btn btn-secondary mb-3">����</button>
	<input type="button" value="�ڷΰ���" onclick="history.back(-1);">
</form>
</div>