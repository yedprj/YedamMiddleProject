<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div class="row text-center pt-5 pb-3">
		<div class="col-lg-6 m-auto">
			<h2 class="h2">Ŀ�´�Ƽ</h2>
		</div>
	</div>
	<div class="row">
		<!-- �Խñ� ����Ʈ -->
		<table class="table table-hover" id="myTable">
			<thead class="table-light">
				<tr align="center">
					<th class="col-lg-1">��ȣ</th>
					<th class="col-lg-2">����</th>
					<th class="col-lg-2">�ۼ���</th>
					<th class="col-lg-1">��ۼ�</th>
					<th class="col-lg-1">��ȸ��</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="board" items="${board}">
					<tr>
						<th>${board.boardId}</th>
						<td onclick="getRecord(${board.boardId })">${board.boardTitle}</td>
						<td><fmt:formatDate value="${board.boardDate}"
								pattern="yyyy-MM-dd" /></td>
						<td>${board.boardCmtnum}</td>
						<td>${board.boardHit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row">
			<ul class="pagination pagination-lg justify-content-center">
				<li class="page-item"><a
					class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark"
					href="#">��</a></li>
				<li class="page-item"><a
					class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
					href="#">1</a></li>
				<li class="page-item"><a
					class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
					href="#">2</a></li>
				<li class="page-item"><a
					class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark"
					href="#">3</a></li>
				<li class="page-item"><a
					class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark"
					href="#">��</a></li>
			</ul>
		</div>
		<div class="d-flex justify-content-end">
			<div class="row row-cols-lg-auto g-3">
				<div class="col-12">
					<input type="text" id="myInput" onkeyup="myFunction()"
						class="form-control" placeholder="Search for names.."
						title="Type in a name">
				</div>
				<c:if test="${userId ne null}">
					<div class="col-12">
						<a class="btn btn-success fx-2" href="boardInsertForm.do"
							role="button">�Խñ� ����</a>
					</div>
				</c:if>
			</div>
		</div>

		<div>
			<form id="frm" name="frm" action="boardSelect.do" method="get">
				<input type="hidden" id="boardId" name="boardId">
			</form>
		</div>
	</div>
</section>
<!-- End Section -->

<script>
		// �Խñ� ���� �˻����
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