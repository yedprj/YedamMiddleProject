<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://use.fontawesome.com/8c8d6bcd7e.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
	
</script>

<style>
.image--cover {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin: 10px;
	object-fit: cover;
	object-position: center right;
}

.area-comentarios ul {
	list-style: none;
}

.area-comentarios ul {
	display: block;
	overflow: hidden;
	position: relative;
	width: 100%;
	margin: auto;
	padding: 2% 3%;
}

.unico-comentario {
	display: block;
	clear: both;
}

.unico-comentario .conteudo {
	display: block;
	width: 100%;
	padding: 0.5%;
}

.unico-comentario .conteudo p {
	margin: 0;
}

.normal .conteudo, .children .conteudo {
	max-width: 60%;
	word-wrap: break-word;
	margin-bottom: 20px;
	position: relative;
	padding: 10px 20px;
	color: white;
	border-radius: 25px;
	clear: both;
	font: 100 13px 'Open Sans', sans-serif;
}

.children .conteudo {
	background: #00BCD4; /*cor do balão 1*/
	color: white; /*cor da fonte do balão 1*/
	float: right;
	clear: none;
	border-bottom-right-radius: 20px 0px\9;
}

.children .conteudo a {
	color: #006064; /* dor do link do balão 1 */
	text-decoration: none;
	cursor: pointer;
}

.children .conteudo:before {
	content: "";
	position: absolute;
	z-index: 1;
	bottom: -2px;
	right: -8px;
	height: 19px;
	border-right: 20px solid #00BCD4; /*cor do balão 1*/
	border-bottom-left-radius: 16px 14px;
	-webkit-transform: translate(0, -2px);
	transform: translate(0, -2px);
	border-bottom-left-radius: 15px 0px\9;
	transform: translate(-1px, -2px) \9;
}

.children .conteudo:after {
	content: "";
	position: absolute;
	z-index: 1;
	bottom: -2px;
	right: -42px;
	width: 12px;
	height: 20px;
	background: white; /*cor de fundo*/
	border-bottom-left-radius: 10px;
	-webkit-transform: translate(-30px, -2px);
	transform: translate(-30px, -2px);
}

.normal .conteudo {
	background: #F8BBD0; /*cor do balão 2*/
	color: #424242; /*cor da fonte do bação 2 */
	float: left;
	clear: none;
	border-bottom-left-radius: 30px 0px\9;
}

.normal .conteudo a {
	color: #D81B60;
	text-decoration: none;
	cursor: pointer;
}

.normal .conteudo:before {
	content: "";
	position: absolute;
	z-index: 2;
	bottom: -2px;
	left: -7px;
	height: 19px;
	border-left: 20px solid #F8BBD0; /*cor do balão 2*/
	border-bottom-right-radius: 16px 14px;
	-webkit-transform: translate(0, -2px);
	transform: translate(0, -2px);
	border-bottom-right-radius: 15px 0px\9;
	transform: translate(-1px, -2px) \9;
}

.normal .conteudo:after {
	content: "";
	position: absolute;
	z-index: 2;
	bottom: -2px;
	left: 4px;
	width: 26px;
	height: 20px;
	background: white; /*cor de fundo*/
	border-bottom-right-radius: 10px;
	-webkit-transform: translate(-30px, -2px);
	transform: translate(-30px, -2px);
}

.avatar img {
	border-radius: 50%;
	border: 1px solid white;
	padding: 2px;
	background: white;
}

.normal .avatar {
	float: left;
	margin-right: 12px;
}

.children .avatar {
	float: right;
	margin-left: 10px;
}

.children .author {
	background: #FFCCBC !important;
}

.children .author:before {
	border-right: 20px solid #FFCCBC !important;
}

.normal .author {
	background: #FFCCBC !important;
}

.normal .author:before {
	border-left: 20px solid #FFCCBC !important;
}
</style>

<div class="container h-100">
	<div class="row">
		<div class="pt-3 pb-2 mb-3">
			<span class="link-dark fs-4">공동구매 등록</span>
		</div>

		<div class="row">
			<div class="col-sm-8">
				<div class="h-100 p-4 border border-dark rounded-3">

					<div>
						<div class="border-bottom">
							<div class="text-muted">카테고리</div>
							<div class="h3">제목</div>
						</div>
						<div class="border-bottom">
							<div class="d-inline-flex p-1">
								<small>글 번호</small>
							</div>
							<div class="d-inline-flex p-1 text-muted">
								<small>prNo</small>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-4">
								<div class="d-inline-flex p-1">
									<small>모집 일정</small>
								</div>
								<div class="d-inline-flex p-1 text-muted">
									<small>startdate ~ enddate</small>
								</div>
							</div>
							<div class="col-sm-8 text-end">
								<div class="d-inline-flex p-1">
									<small>구매 비용</small>
								</div>
								<div class="d-inline-flex p-1">
									<h3 class="text-info">20,000</h3>
								</div>
							</div>

							<div>
								<div class="border-top"></div>
							</div>
							<div class="row py-3">
								<div class="card m-2" style="width: 30rem;">
									<div id="carouselExampleIndicators" class="carousel slide"
										data-bs-ride="carousel">
										<div class="carousel-indicators">
											<button type="button"
												data-bs-target="#carouselExampleIndicators"
												data-bs-slide-to="0" class="active" aria-current="true"
												aria-label="Slide 1"></button>
											<button type="button"
												data-bs-target="#carouselExampleIndicators"
												data-bs-slide-to="1" aria-label="Slide 2"></button>
											<button type="button"
												data-bs-target="#carouselExampleIndicators"
												data-bs-slide-to="2" aria-label="Slide 3"></button>
										</div>
										<div class="carousel-inner">
											<div class="carousel-item active">
												<img src="image/food1.jpg" class="d-block w-100"
													alt="src에 prPhoto1">
											</div>
											<div class="carousel-item">
												<img src="image/food2.jpg" class="d-block w-100"
													alt="src에 prPhoto2">
											</div>
											<div class="carousel-item">
												<img src="image/food3.jpg" class="d-block w-100"
													alt="src에 prPhoto3">
											</div>
										</div>
										<button class="carousel-control-prev" type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
									</div>

								</div>
							</div>
						</div>
						<div>
							<div class="py-3 border-top">내용</div>
						</div>

						<div class="border-top py-2">
							<small class="py-1">참여 현황</small>


							<div class="">
								<img src="image/user.jpg" class="image--cover"> <img
									src="image/user.jpg" class="image--cover"> <img
									src="image/user.jpg" class="image--cover"> <small>n명
									참여중</small>
							</div>

						</div>

						<div>댓글 n개</div>
						<div>

							<div class="area-comentarios">
							
								<ul>
									<li class="unico-comentario normal">
										<div class="avatar">
											<img alt="" src="image/user.jpg" class="avatar avatar-60 photo" height="60"
												width="60">
										</div>
										<div class="conteudo">
											<div class="comment-info">
												<b>닉네임</b> - 작성날짜
											</div>
											<div class="comment-text">
												<p>댓글내용</p>
											</div>

										</div>
									</li>

									<li class="unico-comentario children">
										<div class="avatar">
											<img alt="" src="image/user.jpg" class="avatar avatar-60 photo" height="60"
												width="60">
										</div>
										<div class="conteudo">
											<div class="comment-info">
												<b>닉네임</b> - 작성날짜
											</div>
											<div class="comment-text">
												<p>
													글내용 내용 내용 내용 내용 내용 맛있는 불고기버거 맛있는 참치샌드위치<br> 이마트 홈플러스
													코스트코 엥엥엥엥엥엥엥엥엥엥
												</p>
											</div>
										</div>
									</li>
									
								</ul>
								
							</div>





						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
</div>