<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- �Խ��� -->
<div class="container">
	<div class="row">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3"
						style="background-color: #eeeeee; text-align: center;">�Խ���
						�ۺ���</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${board.boardTitle}</td>
				</tr>
				<tr>
					<td>${board.userId}</td>
				</tr>
				<tr>
					<td>${board.boardDate}</td>
				</tr>
				<tr>
					<td>${board.boardContent}</td>
				</tr>
			</tbody>
		</table>
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td>${cmt.cmtDate}/${cmt.cmtContent}</td>
				</tr>
			</tbody>
		</table>
		<textarea rows="4" cols="50"></textarea>
		<a href="boardList.do" class="btn btn-primary">���</a>
	</div>
</div>
`
