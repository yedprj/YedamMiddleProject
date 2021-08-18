<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<div class="container">
<form action="writerAction" method="post">
	<input type="hidden" name="bdGroup"> <input type="hidden"
		name="bdOrder"> <input type="hidden" name="bdIndent">
	<input type="text" name="bdTitle" class="form-control mt-4 mb-2"
		placeholder="제목을 입력해주세요." required>
	<div class="form-group">
		<textarea class="form-control" rows="10" name="bdContent"
			placeholder="내용을 입력해주세요" required></textarea>
	</div><br/>
	<button type="submit" class="btn btn-secondary mb-3">제출하기</button>
</form>
</div>