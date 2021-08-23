<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="bg-success py-5">
	<div class="container">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-white">
 				<h1>Notice</h1>
			</div>
		</div>
	</div>
</section>

   <!-- Start Section -->
   <section class="container py-5">
       <div class="row text-center pt-5 pb-3">
           <div class="col-lg-6 m-auto">
               <h2 class="h2">공지사항</h2>
           </div>
       </div>
	<div class="row">
		<table class="table table-hover" id="myTable">
			<thead class="table-light">
				<tr align="center">
					<th class="col-lg-1">번호</th>
					<th class="col-lg-5">제목</th>
					<th class="col-lg-4">작성일</th>
				</tr>
			</thead>
			
			<tbody align="center">
				<c:forEach var="nt" items="${list}">
					<tr>
						<th>${nt.ntNo}</th>
						<td onclick="getRecord(${nt.ntNo })">${nt.ntTitle}</td>
						<td>${nt.ntDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row">
			<ul class="pagination pagination-lg justify-content-center">
				<li class="page-item">
					<a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="#">◀</a>
				</li>
				<li class="page-item">
					<a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="#">1</a>
				</li>
				<li class="page-item">
					<a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="#">2</a>
				</li>
				<li class="page-item">
					<a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="#">3</a>	
				</li>
				<li class="page-item">
					<a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="#">▶</a>
				</li>
			</ul>
		</div>
		<div class="d-flex justify-content-end">
			<div class="row row-cols-lg-auto g-3">
				<div class="col-12">
					<input type="text" id="myInput" onkeyup="myFunction()" class="form-control"
						placeholder="Search for names.." title="Type in a name">
				</div>
					 
				<div class="col-12">
					<a class="btn btn-success fx-2" href="noticeInsertForm.do" role="button">공지사항쓰기</a>
				</div>
			</div>
		</div>			
			
		<div>
			<form id="frm" name="frm" action="noticeSelect.do" method="get">
				<input type="hidden" id="ntNo" name="ntNo">
			</form>
		</div>
	</div>
</section>

<script>
	// 게시글 제목 검색기능
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
		frm.ntNo.value = n;
		frm.submit();
	}
</script>
