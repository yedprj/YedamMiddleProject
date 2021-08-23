<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 게시글 상세보기 -->
<script>
	function deleteComment() {
		let confirms = alert("댓글을 삭제하시겠습니까?")
		if (confirms) {
			alert("삭제되었습니다.")
			$("#frm").submit();
		}
	}
</script>

<section class="bg-success py-5">
	<div class="container">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-white">
				<h1>Community</h1>
			</div>
		</div>
	</div>
</section>

<!-- Start Section -->
<section class="container py-5">
	<div class="row text-center pt-5 pb-3 mb-3">
		<div class="col-lg-6 m-auto">
			<h2 class="h2">커뮤니티 상세보기</h2>
		</div>
	</div>
	<!-- 게시판 -->
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
					<td>${board[0].boardTitle}</td>
					<th>조회수</th>
					<td></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${board[0].userId}</td>
					<th>작성시간</th>
					<td>${board[0].boardDate}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">${board[0].boardContent}</td>
				</tr>
			</tbody>
		</table>

		<!-- 글 수정 삭제 버튼 -->
		<div class="d-flex justify-content-end mt-2">
			<c:if test="${userId eq board[0].userId}">
				<form action="boardDelete.do" method="post">
					<input type="hidden" id="boardId" name="boardId"
						value="${board[0].boardId }"> <input type="hidden"
						id="userId" name="userId" value="${userId}">
					<button type="submit"
						class="btn btn-outline-danger px-4 py-2 me-md-2"
						style="display: inline">글삭제</button>
				</form>

				<form action="boardUpdateForm.do" method="post">
					<input type="hidden" id="boardId" name="boardId"
						value="${board[0].boardId }"> <input type="hidden"
						id="boardTitle" name="boardTitle" value="${board[0].boardTitle }">
					<textarea class="form-control" rows="10" id="boardContent"
						name="boardContent" style="display: none">${board[0].boardContent}</textarea>
					<button type="submit" class="btn btn-outline-success px-4 py-2"
						style="display: inline">글수정</button>
				</form>
			</c:if>
		</div>

		<!-- 댓글 -->
		<c:if test="${board[0].cmtContent ne null}">
			<!-- 댓글 기능 -->
			<!-- 댓글 불러오기 -->
			<table class="board_view mt-5">
				<colgroup>
					<col width="15%">
					<col width="85%">
				</colgroup>
				<tbody>
					<tr>
						<th>댓글</th>
						<td></td>
					</tr>
					<c:forEach var="cmt" items="${board}">
						<tr>
							<td style="background: #f7f7f7; color: #3b3a3a;">${cmt.cmtWriter}
								<p style="font-size: 8px;">${cmt.cmtDate}</p>
							</td>
							<td>${cmt.cmtContent}<c:if
									test="${userId eq cmt.cmtWriter and cmt.cmtContent ne null }">
									<!-- 댓글 삭제 -->
									<form id="frm" name="frm" action="cmtDelete.do" method="post">
										<input type="hidden" id="boardId" name="boardId"
											value="${cmt.boardId}"> <input type="hidden"
											id="cmtNo" name="cmtNo" value="${cmt.cmtNo}">

										<div class="d-flex justify-content-end">
											<button class="btn btn-outline-danger mx-2" type="submit"
												onclick="deleteComment()">댓글 삭제</button>

											<!-- Button trigger modal -->
											<button type="button" class="btn btn-outline-success px-4"
												data-bs-toggle="modal" data-bs-target="#exampleModal">
												수정</button>
										</div>
									</form>
									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<form id="frm" name="frm" action="cmtUpdate.do"
													method="post">
													<div class="modal-body">
														<textarea id="cmtContent" cols="50" name="cmtContent">${cmt.cmtContent}</textarea>
														<input type="hidden" id="boardId" name="boardId"
															value="${cmt.boardId}"> <input type="hidden"
															id="cmtNo" name="cmtNo" value="${cmt.cmtNo}">
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">취소</button>
														<button type="submit" class="btn btn-primary">수정</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>

		<c:if test="${userId ne null}">
			<!-- 댓글 추가 -->
			<form id="frm" name="frm" action="cmtInsert.do" method="post">
				<br> <br>

				<div>
					<div>
						<span><strong>Comments</strong></span> <span id="cCnt"></span>
					</div>
					<div>
						<table class="table">
							<tr>
								<td><textarea style="width: 1100px" rows="3" cols="30"
										id="cmtContent" name="cmtContent" placeholder="댓글을 입력하세요"></textarea><br>
									<input type="hidden" id="boardId" name="boardId"
									value="${board[0].boardId}"> <input type="hidden"
									id="userId" name="userId" value="${userId}"></td>
							</tr>
						</table>
						<input class="btn btn-success me-md-2" type="submit" value="댓글 작성">
						<button type="button" onclick="location.href='boardList.do'"
							class="btn btn-success px-4 py-2">목록</button>
					</div>
				</div>
			</form>
		</c:if>
	</div>
</section>




