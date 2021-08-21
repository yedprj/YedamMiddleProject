<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 게시글 수정 양식 -->
<div class="container">
<form action="csUpdate.do" method="post">
	<input type="text" id="csNo" name="csNo" value="${list.csNo}" >
	<input type="text" id="csTitle"  name="csTitle" class="form-control mt-4 mb-2" value="${list.csTitle}" disabled="disabled">
	<div class="form-group">
		<textarea class="form-control" rows="10" id="csContent" name="csContent">${list.csContent}</textarea>
	</div><br/>
	<button type="submit" class="btn btn-secondary mb-3">수정</button>
	<input type="button" value="뒤로가기" onclick="history.back(-1);">
</form>
</div>