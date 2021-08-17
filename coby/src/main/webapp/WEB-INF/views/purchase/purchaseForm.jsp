<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 글 등록 폼</title>

</head>
<body>
	<div align="center">
		<div>
			<h3>공동구매 등록</h3>
		</div>
		<div>
			<form id="frm" name="frm" action="insertBoard.do" method="post">
				<div>
					<table border="1">
						<tr>
							<th>분류</th>
							<td><input type=""></td>
						</tr>

						<tr>
							<th width="100">글제목</th>
							<td colspan="3"><input type="text" id="bTitle" name="bTitle" size="30" required="required"></td>
						</tr>

						<tr>
							<th width="100">모집 인원</th>
							<td width="150"></td>
						</tr>
						<tr>
							<th width="100">연락처</th>
							<td width="150"></td>
						</tr>
						<tr>
							<th width="100">진행 기간</th>
							<td width="150"><input type="date" id="currentDate" name="bDate"></td>
							<td width="150"><input type="date" id="bDate" name="bDate"></td>
						</tr>
						<tr>
							<th width="100">상세 내용</th>
							<td colspan="3"><textarea rows="7" cols="70" id="bContent"
									name="bContent" required="required" placeholder="여기에 내용을 써주세요"></textarea>
						</tr>
					</table>
				</div>
				<br>

				<button type="button" onclick="history.back()">목록가기</button> &nbsp;&nbsp;&nbsp;
				<button type="submit">등록</button>
			</form>
		</div>
	</div>
<script>
  document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10); //현재 날짜 가져오기
</script>
</body>
</html>