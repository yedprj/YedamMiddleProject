<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 상세보기</title>

</head>
<body>
  <div class="container">
     <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
		<span class="link-dark fs-4">공동구매</span>
		<div class="col-md-3 text-end">
		    <button type="button" class="btn btn-outline-primary me-2 btn-sm" onclick="location.href='purchaseForm.do'">공동구매 만들기</button>
		</div>
	 </div>
	 <hr/>
	 <div class="row pb-3 mb-3">
	     <h5>${list[0].prTitle }</h5>
	     <h5>${list[0].prNo }</h5>
	 </div>
	 <hr/>
  </div>
</body>
</html>