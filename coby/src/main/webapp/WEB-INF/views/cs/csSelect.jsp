<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="bg-success py-5">
	<div class="container">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-white">
				<h1>Service Center</h1>
			</div>
		</div>
	</div>
</section>

<!-- Start Section -->
<section class="container py-5">
	<div class="row text-center pt-5 pb-3">
		<div class="col-lg-6 m-auto">
			<h2 class="h2">고객센터 상세보기</h2>
		</div>
	</div>

	<!-- 고객센터  -->
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
					<td>${list[0].csTitle}</td>
					<th>작성일</th>
					<td><fmt:formatDate value="${list[0].csDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">${list[0].csContent}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 댓글 기능 -->
	<c:if test="${list[0].cscmtContent ne null}">
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
				<c:forEach var="cscmt" items="${list}">
					<tr>
						<td style="background: #f7f7f7; color: #3b3a3a;">${cscmt.cscmtWriter}
							<p style="font-size: 8px;"><fmt:formatDate value="${cscmt.cscmtDate}" pattern="yyyy-MM-dd" /></p>
						</td>
						<td>
							${cscmt.cscmtContent}
							<c:if test="${userId eq cscmt.cscmtWriter and cscmt.cscmtContent ne null }">
								<!-- 댓글 삭제 -->
								<form id="frm" name="frm" action="cscmtDelete.do" method="post">
									<input type="hidden" id="csNo" name="csNo"
										value="${cscmt.csNo}"> <input type="hidden"
										id="cscmtNo" name="cscmtNo" value="${cscmt.cscmtNo}">
									<div class="d-flex justify-content-end">
										<button class="btn btn-outline-danger mx-2" type="submit">
										댓글 삭제</button>
										
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-primary"
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
											<form id="frm" name="frm" action="cscmtUpdate.do"
												method="post">
												<div class="modal-body">
													<textarea id="cscmtContent" name="cscmtContent">${cscmt.cscmtContent}</textarea>
													<input type="hidden" id="csNo" name="csNo"
														value="${cscmt.csNo}"> <input type="text"
														id="cscmtNo" name="cscmtNo" value="${cscmt.cscmtNo}">
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
		<form id="frm" name="frm" action="cscmtInsert.do" method="post">
			<br> <br>
			<div>
				<div>
					<span><strong>Comments</strong></span> <span id="cCnt"></span>
				</div>
				<div>
					<table class="table">
						<tr>
							<td>
								<textarea style="width: 1100px" rows="3" cols="30"
									id="cscmtContent" name="cscmtContent" placeholder="댓글을 입력하세요"></textarea> 
								<br> 
								<input type="hidden" id="csNo" name="csNo"
									value="${list[0].csNo}"> <input type="hidden"
									id="userId" name="userId" value="${userId}">
							</td>
						</tr>
					</table>
					<input class="btn btn-success me-md-2" type="submit"
						value="댓글 작성">
				</div>
			</div>
		</form>
	</c:if>
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-end mt-3">
		<c:if test="${userId eq list[0].csWriter}">
			<form action="csDelete.do" method="post">
				<input type="hidden" id="csNo" name="csNo" value="${list[0].csNo }">
				<input type="hidden" id="userId" name="userId" value="${userId}">
				<button type="submit" class="btn btn btn-outline-danger px-4 py-2" style="display: inline">글삭제</button>
			</form>
			<form action="csUpdateForm.do" method="post">
				<input type="hidden" id="csNo" name="csNo" value="${list[0].csNo }">
				<input type="hidden" id="csTitle" name="csTitle"
					value="${list[0].csTitle }">
				<textarea class="form-control" rows="10" id="csContent"
					name="csContent" style="display: none">${list[0].csContent}</textarea>
				<button type="submit" class="btn btn-outline-success px-4 py-2" style="display: inline">글수정</button>
			</form>
		</c:if>
		<button type="button" onclick="location.href='csList.do'"
			class="btn btn-outline-dark px-4 py-2">목록</button>
	</div>
</section>