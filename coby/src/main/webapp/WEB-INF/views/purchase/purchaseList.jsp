<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 리스트</title>
<script>
        //글 상세보기 위한 함수
        function getRecord(n){
	        frm.prNo.value = n;
	        frm.submit();
        }
    </script>

<style>
#purchaseSelect {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
			<span class="link-dark fs-4">공동구매</span>
			<div class="col-md-3 text-end">
				<button type="button" class="btn btn-outline-primary me-2 btn-sm"
					onclick="location.href='purchaseForm.do'">공동구매 만들기</button>
			</div>
		</div>

		<div class="row row-cols-1 row-cols-md-4 g-4">
			<c:forEach var="item" items="${list }">
				<div class="col">
					<div class="card h-100">
						<div id="purchaseSelect" onclick="getRecord(${item.prNo })">
							<img class="card-img-top"
								src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(60).jpg"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">${item.prTitle }</h5>
								<p class="card-text">${item.prPrice }</p>

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
</body>
</html>