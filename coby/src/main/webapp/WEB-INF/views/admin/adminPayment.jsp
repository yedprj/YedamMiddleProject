<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>결제관리 페이지</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	<script src="js/bootstrap.bundle.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	
		function send(n){
			frm.prNo.value = n
			frm.submit();
		}	
	
	</script>

</head>

<body>
	<div class="d-flex" id="wrapper">
		<!-- side -->
		<jsp:include page="side.jsp" />
		<!-- Page Content Wrapper -->
		<div id="page-content-wrapper">
			<!-- header -->
			<jsp:include page="adminheader.jsp" />

			<!-- body  -->
			<div class="container">
				<table class="table">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>종류</th>
							<th>제목</th>
							<th>주문자</th>
							<th>시작일</th>
							<th>종료일</th>
							<th>총가격</th>
							<th>참여인원</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="pr" items="${list}">
							<tr>
								<th>${pr.prNo}</th>
								<td>${pr.prCategory}</td>
								<td>${pr.prTitle}</td>
								<td>${pr.userId}</td>
								<td>${pr.prStartdate}</td>
								<td>${pr.prEnddate}</td>
								<td>${pr.prPrice}</td>
								<td>${pr.prPeople}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>

</html>