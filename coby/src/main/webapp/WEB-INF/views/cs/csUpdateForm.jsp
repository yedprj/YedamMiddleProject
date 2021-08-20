<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 게시글 수정 양식 -->
<div class="container">
<form action="noticeUpdate.do" method="post">
	<input type="text" id="ntNo" name="ntNo" value="${list.ntNo}" >
	<input type="text" id="ntTitle"  name="ntTitle" class="form-control mt-4 mb-2" value="${list.ntTitle}" disabled="disabled">
	<div class="form-group">
		<textarea class="form-control" rows="10" id="ntContent" name="ntContent">${list.ntContent}</textarea>
	</div><br/>
	<button type="submit" class="btn btn-secondary mb-3">수정</button>
	<input type="button" value="뒤로가기" onclick="history.back(-1);">
</form>
</div>