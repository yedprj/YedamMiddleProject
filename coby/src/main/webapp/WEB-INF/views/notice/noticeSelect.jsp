<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 게시글 상세보기 -->
<!-- <script>
	function deleteComment() {
		let confirms = confirm("댓글을 삭제하시겠습니까?")
		if (confirms) {
			alert("삭제되었습니다.")
			$("#frm").submit();
		}
	}
</script> -->

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
			<h2 class="h2">공지사항 상세보기</h2>
		</div>
	</div>
	<!-- 공지사항 상세보기 -->
	<div class="row">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>제목</th>
					<td>${list.ntTitle}</td>
					<th>작성일</th>
		            <td>${board[0].boardDate}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						${list.ntContent}
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 공지사항 수정 삭제 버튼 -->
	<c:if test="${userId eq 'admin'}">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end mt-3">
			<form action="noticeDelete.do" method="post">
				<input type="hidden" id="ntNo" name="ntNo" value="${list.ntNo}"> 
				<button type="submit" class="btn btn-outline-danger">공지사항삭제</button>
			</form>
			
			<form action="noticeUpdateForm.do" method="post">
				<input type="hidden" id="ntNo" name="ntNo" value="${list.ntNo }"> 
				<input type="hidden" id="ntTitle" name="ntTitle" value="${list.ntTitle }">
				<textarea class="form-control" rows="10" id="ntContent"
					name="ntContent" style="display: none">${list.ntContent}</textarea>
				<button type="submit" class="btn btn-outline-success">공지사항수정</button>
			</form>
		</div> 
	</c:if>	
	<button type="button" onclick="location.href='noticeList.do'"
		class="btn btn-outline-dark">목록</button>
</section> 



