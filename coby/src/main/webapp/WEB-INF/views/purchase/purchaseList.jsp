<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 리스트</title>
</head>
<body>
	<div class="container">
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
			<span class="link-dark fs-4">공동구매</span>
			<div class="col-md-3 text-end">
				<button type="button" class="btn btn-outline-primary me-2 btn-sm" onclick="location.href='purchaseForm.do'">공동구매 만들기</button>
			</div>
		</div>
		<c:forEach var="item" items="${list }">
			<div id="carouselExampleControls"
				class="carousel carousel-dark slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="row row-cols-1 row-cols-md-4 g-4" style="float: left">
							<div class="col">
								<div class="card h-200">
									<img class="card-img-top"
										src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(60).jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">${item.prTitle }</h4>
										<p class="card-text">${item.prContent }:
											${item.prStartdate }</p>
										<a class="btn btn-primary">Button</a>
									</div>
								</div>
							</div>

							<div class="col" style="float: left">
								<div class="card h-200">
									<img class="card-img-top"
										src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(60).jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">Card title</h4>
										<p class="card-text">Some quick example text to build on
											the card title and make up the bulk of the card's content.</p>
										<a class="btn btn-primary">Button</a>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
</body>
</html>