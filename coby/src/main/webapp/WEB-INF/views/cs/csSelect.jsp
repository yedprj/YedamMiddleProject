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
						style="background-color: #eeeeee; text-align: center;">고객센터</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${list[0].csTitle}</td>
				</tr>
				<tr>
					<td>${list[0].csDate}</td>
				</tr>
				<tr>
					<td>${list[0].csContent}</td>
				</tr>
			</tbody>
		</table>

	</div>
	 <%-- <c:if test="${userId eq list.csWriter}">
		<form action="csDelete.do" method="post">
			<input type="hidden" id="csNo" name="csNo" value="${list.csNo}"> 
			<button type="submit" class="btn btn-danger" style="display: inline">글삭제</button>
		</form>
		<form action="noticeUpdateForm.do" method="post">
			<input type="hidden" id="ntNo" name="ntNo" value="${list.csNo }"> 
			<input type="hidden" id="ntTitle" name="ntTitle" value="${list.csTitle }">
			<textarea class="form-control" rows="10" id="ntContent"
				name="ntContent" style="display: none">${list.csContent}</textarea>
			<button type="submit" class="btn btn-danger" style="display: inline">글수정</button>
		</form>
	</c:if>  --%>
	<button type="button" onclick="location.href='csList.do'"
		class="btn btn-primary">목록</button> 
</div> 



