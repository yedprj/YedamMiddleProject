<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 게시글 상세보기 -->
<script>
	function deleteComment() {
		let confirms = confirm("댓글을 삭제하시겠습니까?")
		if (confirms) {
			alert("삭제되었습니다.")
			$("#frm").submit();
		}
	}
</script>
<!-- 게시판 -->
<div class="container">
	<div class="row">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3"
						style="background-color: #eeeeee; text-align: center;">게시판</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${board[0].boardTitle}</td>
				</tr>
				<tr>
					<td>${board[0].userId}</td>
				</tr>
				<tr>
					<td>${board[0].boardDate}</td>
				</tr>
				<tr>
					<td>${board[0].boardContent}</td>
				</tr>
			</tbody>
		</table>
		
		<c:if test="${cmt.cmtContent ne null}">
		<!-- 댓글 기능 -->
		<!-- 댓글 불러오기 -->
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<c:forEach var="cmt" items="${board}">
					<tr>
						<td>${cmt.cmtWriter}${cmt.cmtDate}<br /> ${cmt.cmtContent} 
						<c:if test="${userId eq cmt.cmtWriter and cmt.cmtContent ne null }">
									<!-- 댓글 삭제 -->
									<form id="frm" name="frm" action="cmtDelete.do" method="post">
										<input type="hidden" id="boardId" name="boardId"
											value="${cmt.boardId}"> <input type="text" id="cmtNo"
											name="cmtNo" value="${cmt.cmtNo}">
										<button class="btn btn-danger btn-sm" type="submit"
											onclick="cmtDelete()">댓글 삭제</button>
									</form>
								
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									수정</button>

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
											<form id="frm" name="frm" action="cmtUpdate.do" method="post">
												<div class="modal-body">
													<textarea id="cmtContent" name="cmtContent">${cmt.cmtContent}</textarea>
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
		
		<c:if test="${userId != null}">
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
										id="cmtContent" name="cmtContent" placeholder="댓글을 입력하세요">
								</textarea> <br> <input type="hidden" id="boardId" name="boardId"
									value="${board[0].boardId}"> <input type="hidden"
									id="userId" name="userId" value="${userId}"></td>
							</tr>
						</table>
						<input class="btn btn-outline-primary me-md-2" type="submit"
							value="댓글 작성">
					</div>
				</div>
			</form>
		</c:if>
	</div>
	<c:if test="${userId eq board[0].userId}">
		<form action="boardDelete.do" method="post">
			<input type="hidden" id="boardId" name="boardId"
				value="${board[0].boardId }"> <input type="hidden" id="userId"
				name="userId" value="${userId}">
			<button type="submit" class="btn btn-danger" style="display: inline">글삭제</button>
		</form>
		<form action="boardUpdateForm.do" method="post">
			<input type="hidden" id="boardId" name="boardId"
				value="${board[0].boardId }"> <input type="hidden"
				id="boardTitle" name="boardTitle" value="${board[0].boardTitle }">
			<textarea class="form-control" rows="10" id="boardContent"
				name="boardContent" style="display: none">${board[0].boardContent}</textarea>
			<button type="submit" class="btn btn-danger" style="display: inline">글수정</button>
		</form>
	</c:if>
	<button type="button" onclick="location.href='boardList.do'"
		class="btn btn-primary">목록</button>
</div>



