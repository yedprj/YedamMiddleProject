<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#purchaseSelect {
	cursor: pointer;
}

</style>

<section class="bg-success py-5">
	<div class="container">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-white">
				<h1>Group Buying</h1>
			</div>
		</div>
	</div>
</section>

<div class="container">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
		<span class="link-dark fs-3">공동구매</span>
		<div class="col-md-3 text-end">
			<button type="button" class="btn btn-outline-success me-2"
				onclick="aa()">공동구매 만들기</button>
		</div>
	</div>

	<div class="row row-cols-1 row-cols-md-3 g-4 mb-3">
		<c:forEach var="item" items="${list }">
			<div class="col">
				<div class="card h-100">
					<div id="purchaseSelect" onclick="getRecord(${item.prNo })">
						<div class="ratio ratio-16x9">
							<img class="card-img-top" src="${item.prPhoto1 }"
								alt="Card image cap">
						</div>
						<div class="card-body">
							<h5 class="card-title">${item.prTitle }</h5>
							<p class="card-text">${item.prPrice }원</p>

							<a class="btn btn-primary" onclick="">상세보기</a>
						</div>
					</div>
					<div class="card-footer">
						<small class="text-muted">${item.prStartdate }</small>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<div>
	<form id="frm" name="frm" action="purchaseSelect.do" method="post">
		<input type="hidden" id="prNo" name="prNo">
	</form>
</div>

<script>
	//글 상세보기 위한 prNo 가져가기
	function getRecord(n){
		frm.prNo.value = n;
		frm.submit();
	}
	//로그인한 사람만 글 작성하렴
	function aa(){
		if ("${user.userId }" === "") {
			alert("로그인이 필요합니다.");
			location.href="loginForm.do";
	     } else {
	    	location.href='purchaseForm.do';
	     }
	}
</script>
