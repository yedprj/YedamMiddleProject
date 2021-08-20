<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="container">
			${userId }
			<!-- 게시글 리스트 -->
			<c:if test="${userId ne null}">
				<div>
					<table class="table table-hover" id="myTable">
						<thead>
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
									<td>${cs.csDate}</td>
									<td>${cs.csWriter}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

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
					<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.."
						title="Type in a name"> <a class="btn float-right btn-primary" href="noticeInsertForm.do"
						role="button">글쓰기</a>
				</div>
				<div>
					<form id="frm" name="frm" action="csSelect.do" method="get">
						<input type="hidden" id="csNo" name="csNo" value="${cs.csNo}">
						<input type="hidden" id="csWriter" name="csWriter" value="${cs.csWriter}">
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

			
			function check(a,b) {
				if('${userId}' == ( a || 'admin') {
					alert("same")
					frm.csWriter.value = a;
					frm.csNo.value = b;
					frm.submit();
				} else{
					alert("권한이 없습니다")
				}
			}
		</script>