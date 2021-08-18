<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
${id}

<script>
	/*
	 * 댓글 등록하기(Ajax)
	 */
	function fn_comment(code) {

		$.ajax({
			type : 'POST',
			url : "<c:url value='/board/addComment.do'/>",
			data : $("#commentForm").serialize(),
			success : function(data) {
				if (data == "success") {
					getCommentList();
					$("#comment").val("");
				}
			},
			error : function(request, status, error) {
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}

		});
	}

	function cmtDelete(n) {
		frm.cmtNo.value = n;
		frm.submit();
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

		<!-- 댓글 기능 -->
		<!-- 댓글 불러오기 -->
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<c:forEach var="cmt" items="${board}">
					<tr>
						<td>${cmt.cmtWriter}${cmt.cmtDate}<br /> ${cmt.cmtContent} <c:if
								test="${id == cmt.cmtWriter}">
								<!-- 댓글 삭제 -->
								<form id="frm" name="frm" action="cmtDelete.do" method="post">
									<input type="text" id="cmtNo" name="cmtNo" value="${cmt.cmtNo}">
									<button class="btn btn-danger btn-sm" type="submit"
									onclick="cmtDelete(${cmt.cmtNo})">댓글 삭제</button>
								</form>
								<!-- 개체값 넘겨서 댓글 삭제 기능만들기 -->
								
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 댓글 추가 -->
		<form id="commentForm" name="commentForm" method="post">
			<br> <br>
			<div>
				<div>
					<span><strong>Comments</strong></span> <span id="cCnt"></span>
				</div>
				<div>
					<table class="table">
						<tr>
							<td><textarea style="width: 1100px" rows="3" cols="30"
									id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
								<br>
								<div>
									<a href='#' onClick="fn_comment('${result.code }')"
										class="btn pull-right btn-success">등록</a>

								</div></td>
						</tr>
					</table>
				</div>
			</div>
			<input type="hidden" id="b_code" name="b_code"
				value="${result.code }" />
		</form>
	</div>

	<button type="button" onclick="location.href='boardList.do'"
		class="btn btn-primary">목록</button>


</div>



