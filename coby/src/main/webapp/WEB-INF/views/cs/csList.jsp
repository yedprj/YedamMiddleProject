<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

<section class="container py-5">
	<div class="row text-center pt-5 pb-3">
		<div class="col-lg-6 m-auto">
			<h2 class="h2">고객센터 글 상세보기</h2>
		</div>
	</div>
	
	<div class="row">
		<!-- 게시글 리스트 -->
		<c:if test="${userId ne null}">
			<div>
				<table class="table table-hover" id="myTable">
					<thead class="table-light">
						<tr align="center">
							<th class="col-lg-1">번호</th>
							<th class="col-lg-4">제목</th>
							<th class="col-lg-4">작성날짜</th>
							<th class="col-lg-3">작성자</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="cs" items="${list}">
							<tr>
								<th>${cs.csNo}</th>
								<td onclick="check('${cs.csWriter}','${cs.csNo}')">${cs.csTitle}</td>
								<td><fmt:formatDate value="${cs.csDate}" pattern="yyyy-MM-dd" /></td>
								<td>${cs.csWriter}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

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
						<a class="btn btn-success fx-2" href="csInsertForm.do" role="button">고객센터 글 쓰기</a>
					</div>
				</div>
			</div>

			<div>
				<form id="frm" name="frm" action="csSelect.do" method="get">
					<input type="hidden" id="csNo" name="csNo" value="${cs.csNo}">
					<input type="hidden" id="csWriter" name="csWriter"
						value="${cs.csWriter}">
				</form>
			</div>
		</c:if>
		<div>
			<!-- 비회원 화면 -->
			<c:if test="${userId eq null}">
				회원만 이용가능한 서비스 입니다.
			</c:if>
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

	function check(a, b) {
		if ('${userId}' == a) {
			frm.csWriter.value = a;
			frm.csNo.value = b;
			frm.submit();
		} else if ('${userId}' == 'admin') {
			frm.csWriter.value = 'admin';
			frm.csNo.value = b;
			frm.submit();
		} else {
			alert("권한이 없습니다");
		}
	}
</script>