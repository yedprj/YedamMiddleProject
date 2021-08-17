<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">

	${id}

	<div class="">
		<table class="table table-hover" id="myTable">
			<thead>
				<tr align="center">
					<th class="col-lg-1">번호</th>
					<th class="col-lg-5">제목</th>
					<th class="col-lg-4">작성일</th>
					<th class="col-lg-1">댓글수</th>
					<th class="col-lg-1">조회수</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="board" items="${board}">
					<tr>
						<th>${board.boardId}</th>
						<td onclick="getRecord(${board.boardId })">${board.boardTitle}</td>
						<td>${board.boardDate}</td>
						<td>${board.boardCmtnum}</td>
						<td>${board.boardHit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#">◀</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">▶</a></li>
			</ul>
		</nav>
		<div align="right">
			<input type="text" id="myInput" onkeyup="myFunction()"
				placeholder="Search for names.." title="Type in a name"> <a
				class="btn float-right btn-primary" href="boardInsert.do"
				role="button">글쓰기</a>
		</div>
		<div>
			<form id="frm" name="frm" action="boardSelect.do" method="get">
				<input type="hidden" id="boardId" name="boardId">
			</form>
		</div>


	</div>
</div>
<script>
	function myFunction() {
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
	
	function getRecord(n){
		frm.boardId.value = n;
		frm.submit();
	}
</script>
