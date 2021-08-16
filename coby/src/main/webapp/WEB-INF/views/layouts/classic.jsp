<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
	
	<script src="js/bootstrap.bundle.js"></script>
</body>
</html>