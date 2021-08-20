<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>





<!-- 공지사항 -->
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
					<td>${list.ntTitle}</td>
				</tr>
				<tr>
					<td>${list.ntDate}</td>
				</tr>
				<tr>
					<td>${list.ntContent}</td>
				</tr>
			</tbody>
		</table>

	</div>
	 <c:if test="${userId eq 'admin'}">
		<form action="noticeDelete.do" method="post">
			<input type="hidden" id="ntNo" name="ntNo" value="${list.ntNo}"> 
			<button type="submit" class="btn btn-danger" style="display: inline">글삭제</button>
		</form>
		<form action="noticeUpdateForm.do" method="post">
			<input type="hidden" id="ntNo" name="ntNo" value="${list.ntNo }"> 
			<input type="hidden" id="ntTitle" name="ntTitle" value="${list.ntTitle }">
			<textarea class="form-control" rows="10" id="ntContent"
				name="ntContent" style="display: none">${list.ntContent}</textarea>
			<button type="submit" class="btn btn-danger" style="display: inline">글수정</button>
		</form>
	</c:if> 
	<button type="button" onclick="location.href='noticeList.do'"
		class="btn btn-primary">목록</button> 
</div> 



