<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

				<table border="1">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>Email</th>
							<th>Phone</th>
							<th>권한</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}">
							<tr>
								<th>${list.userId}</th>
								<td>${list.userName}</td>
								<td>${list.userEmail}</td>
								<td>${list.userPhone}</td>
								<td>${list.userAuthor}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>

</html>