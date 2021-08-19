<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 게시글 입력 양식 -->
<div class="container">
<form action="boardInsert.do" method="post">
	<input type="text" id="userId" name="userId" value="${userId }"> 
	<input type="text" id="boardTitle"  name="boardTitle" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요." required>
	<div class="form-group">
		<textarea class="form-control" rows="10" id="boardContent" name="boardContent"
			placeholder="내용을 입력해주세요" required></textarea>
	</div><br/>
	<button type="submit" class="btn btn-secondary mb-3">글작성</button>
	<input type="button" value="뒤로가기" onclick="history.back(-1);">
</form>
</div>