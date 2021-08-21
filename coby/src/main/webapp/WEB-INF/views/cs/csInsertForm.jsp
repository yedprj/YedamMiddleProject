<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 게시글 입력 양식 -->
<div class="container">
<form action="csInsert.do" method="post">
	<input type="text" id="csTitle"  name="csTitle" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요." required>
	<div class="form-group">
		<textarea class="form-control" rows="10" id="csContent" name="csContent"
			placeholder="내용을 입력해주세요" required></textarea>
	<input type="hidden" id="csWriter" name="csWriter" value="${userId}">		
	</div><br/>
	<button type="submit" class="btn btn-secondary mb-3">글작성</button>
	<input type="button" value="뒤로가기" onclick="history.back(-1);">
</form>
</div>