<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<section class="bg-success py-5">
	<div class="container">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-white">
 				<h1>Notice</h1>
			</div>
		</div>
	</div>
</section>

<!-- Start Section -->
<section class="container py-5">
	<div class="row text-center pt-5 pb-3 mb-3">
		<div class="col-lg-6 m-auto">
			<h2 class="h2">공지사항 수정</h2>
		</div>
	</div>

	<!-- 게시글 수정 양식 -->
	<form action="noticeUpdate.do" method="post">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*">
			</colgroup>

			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td>
						<input type="hidden" id="ntNo" name="ntNo" value="${list.ntNo}" >
						<input type="text" id="ntTitle"  name="ntTitle" class="form-control mt-4 mb-2" 
							 value="${list.ntTitle}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td>
					<textarea class="form-control" rows="10" cols="200"
						id="ntContent" name="ntContent">${list.ntContent}</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="col mt-4">
			<input type="submit" class="btn btn-success px-3 mx-3" value="글 수정">
			<input type="button" value="뒤로가기" onclick="history.back(-1);"
				class="btn btn-success">
		</div>
	</form>
</section>
