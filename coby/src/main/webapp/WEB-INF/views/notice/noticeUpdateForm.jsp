<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 게시글 수정 양식 -->
<div class="container">
<form action="boardUpdate.do" method="post">
	<input type="text" id="boardId" name="boardId" value="${board.boardId}" >
	<input type="text" id="boardTitle"  name="boardTitle" class="form-control mt-4 mb-2" value="${board.boardTitle}" disabled="disabled">
	<div class="form-group">
		<textarea class="form-control" rows="10" id="boardContent" name="boardContent">${board.boardContent}</textarea>
	</div><br/>
	<button type="submit" class="btn btn-secondary mb-3">수정</button>
	<input type="button" value="뒤로가기" onclick="history.back(-1);">
</form>
</div>