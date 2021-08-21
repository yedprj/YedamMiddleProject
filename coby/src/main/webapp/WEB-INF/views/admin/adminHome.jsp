<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>관리자 페이지</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<script src="js/bootstrap.bundle.js"></script>
<script src="js/scripts.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
				관리자 홈
			</div>
		</div>
	</div>
</body>
</html>