<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 상세보기</title>
<script src="https://use.fontawesome.com/8c8d6bcd7e.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script>

	//공통
	const userId = "${user.userId }";
	const prNo = ${list[0].prNo };
	let originalPrice = ${list[0].prPrice };
	let people = ${people };
	let ajaxParamPrNo = prNo;
	let ajaxParamDividedPrice = followPrice(originalPrice, people);
	let ajaxParamBossPrice = bossPrice(originalPrice, people);
	
	//통화 변경 함수
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	//참여신청 버튼 눌러서 참여신청 폼으로 가기
	function applicate() {
		if (userId === "") {
			alert("로그인이 필요합니다.");
			location.href="loginForm.do";
		} else {
			//참여신청에 글쓴사람이 있는지 확인한다.
			$.ajax({
				url: 'purchaseNotApplicate.do',
				type: 'POST',
				data: {prNo : prNo,
					userId : userId},
				success: function(data) {
					console.log('ajax 성공');
					console.log('있음?없음? : ' + data);
					data = $.trim(data);
					if (data == "있음") {
						alert("글 작성자는 참여신청을 할 수 없습니다.")
					} else if (data == "없음") {
						frm.frmPrNo.value=ajaxParamPrNo;
						console.log(ajaxParamPrNo);
						frm.frmDividedPrice.value=ajaxParamDividedPrice;
						console.log(ajaxParamDividedPrice);
						frm.frmBossPrice.value=ajaxParamBossPrice;
						frm.submit();
					}
				},
				error: function() {
					console.log('ajax 실패');
				}
			});
		}

	}
	
	//페이지 로딩시 위시리스트에 글이 이미 있으면 하트는 빨간색
	$(document).ready(function() {
		$.ajax({
			url: 'wishListConfirm.do',
			data: {prNo : prNo,
					userId : userId},
			type: 'POST',
			success: function(data) {
				console.log(data);
				let dataExist = $.trim(data);
				if (dataExist == "데이터있음") {
					$( "#heart" ).addClass( "press", 1000 );
				}
			}
	});
		
		});

	$(function() {
	    $( "#heart" ).click(function() {
	    	//로그인이 안 되어 있으면
	    	if (userId === "") {
				alert("로그인이 필요합니다.");
				location.href="loginForm.do";
			//로그인된 상태면 위시리스트 추가
			} else {
				//이미 위시리스트에 있으면 추가하지 않음.
							let classContains = heart.classList.contains('press');
							if (!classContains) {
								$.ajax({
									url: 'WishListInsert',
									type: 'POST',
									data: {prNo : prNo},
									success: function(result) {

											console.log('insert 성공');
											
									},
									error: function() {
										console.log('ajax 에러');
									}
								});
						
						      $( "#heart" ).addClass( "press", 1000 );
						      let wishListMove = confirm('위시리스트에 추가했습니다. 위시리스트로 이동하시겠습니까?');
						      if (wishListMove) {
						    	  location.href="wishList.do";
						      }
							} else {
								$.ajax({
									url: 'WishListDelete',
									type: 'POST',
									data: {prNo : prNo},
									success: function(result) {
										console.log('delete 성공');
									},
									error: function() {
										console.log('ajax 에러');
									}
								});
								
								
								$( "#heart" ).removeClass( "press" );
								alert('위시리스트에서 제거했습니다.');	
							}		
					}

				})
			});
	
	
	//댓글 가져오기 ajax
	$(document).ready(function(){
    
	//댓글 입력 하기
    $('#prcmtinsertbtn').on('click', function(){
    	
    	if ("${user.userId }" === "") {
            alert("로그인이 필요합니다.");
            location.href="loginForm.do";
        } else {
        
    	$.ajax({
      	  url:'PurchaseCmtInsertServlet',
      	  dataType: 'json',
      	  data:{prNo:${list[0].prNo },
      	        userId:"${user.userId }",
      	        prcmtContent:$('#prcommentcontent').val(),
      	       },
      	  success: function(result){
      	          console.log(result)
      	          selectCmtList(result)
      	  }
      	})
      	
        }		
    });
    
	//댓글 가져오기 ajax
	$.ajax({
		url:'PurchaseCmtServlet',
	    dataType:'json',
	    data : {prNo : ${list[0].prNo }},
	    success: function (result) {
	    	console.log(result)
	    	for (let i=0; i<result.length; i++) {
	    		selectCmtList(result[i])
	    	}
	    }
	});
	    //댓글 나와라 얍
	function selectCmtList(data) {
		//댓글 SELECT
	    let li = $('<li />').addClass("unico-comentario normal").attr('id','cmt'+data.prcmtNo);
		let li2 = $('<li />').addClass("unico-comentario children").attr('id','cmt'+data.prcmtNo);
		let div_avatar = $('<div />').addClass("avatar");
		let img_avatar = $('<img />').addClass("avatar avatar-60 photo").attr({'height':'60','width':'60','src':data.userProfile});
		let div_conteudo = $('<div />').addClass("conteudo");
		let div_info = $('<div />').addClass('comment-info');
		let div_text = $('<div />').addClass("comment-text");
		let b = $('<b>'+data.userNickname+'</b>');
		let p = $('<p />').text(data.prcmtContent);
		
		if("${user.userId }"==data.userId){
		    $('#cmt').append(li2);
		    $(li2).append(div_avatar);
		    $(li2).append(div_conteudo);
		}else{  
			$('#cmt').append(li);
			$(li).append(div_avatar);
			$(li).append(div_conteudo);
		}
		    $(div_avatar).append(img_avatar);
		    $(div_conteudo).append(div_info);
		    $(div_info).append(b,document.createTextNode(" - "+data.prcmtDate));
		    $(div_conteudo).append(div_text);
		    $(div_text).append(p);
		
		//댓글 삭제 버튼 추가
		if("${user.userId }"==data.userId){
			let div_aa = $('<div />');
			let span_del =$('<span/>');
			let button_del =$('<button />').addClass('btn btn-outline-dark btn-sm').attr('type', 'button').attr('id',data.prcmtNo).text('삭제');
			button_del.on('click', function(){
				let confirm_val = confirm('정말 삭제 하시겠습니까?')
				let id = $(this).attr('id');
				if(confirm_val) {
					$.ajax({
						url:"purchaseCmtDeleteServlet",
						type:"post",
						data:{id : id},
						success : function(result) {
							      if(result == "1"){
				                  $('#cmt'+id).remove();
							      }
						}
					})
				}
			})
			
			$(div_text).append(div_aa);
			$(div_aa).append(span_del);
			$(span_del).append(button_del);
			
		}
		
	}
	
	

	
	});
	


	$(document).ready(function() {
		//1인 부담금
		
		$('#dividedPrice').text(followPrice(originalPrice, people));
		
		console.log("파티장이 부담할 값 : " + bossPrice(originalPrice, people));
		
	});
	
	function bossPrice(price, people) {
		//가격에서 인원수만큼 나눈 값(소수점 존재)
		let original = price / people;
		
		//버림한 값
		let floor = Math.floor(original);
		
		//버림한 나머지 값 -> 파티장에게 더함
		let remainder = price - (floor*people);
		
		return floor + remainder;
	}
	
	function followPrice(price, people) {
		//가격에서 인원수만큼 나눈 값(소수점 존재)
		let original = price / people;
		
		//버림한 값
		let floor = Math.floor(original);
		
		return floor;
	}
	
</script>

<style>
#heart {
	cursor: pointer;
	padding: 10px 12px 8px;
	background: #fff;
	border-radius: 50%;
	display: inline-block;
	margin: 0 0 15px;
	color: #aaa;
	transition: .2s;
}

#heart:hover {
	color: #666;
}

#heart:before {
	font-family: fontawesome;
	content: '\f004';
	font-style: normal;
}

#heart.press {
	animation: size .4s;
	color: #e23b3b;
}

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
</head>
<body>
	<div class="container h-100">
		<div class="row">
			<div class="pt-3 pb-2 mb-3">
				<span class="link-dark fs-4">공동구매</span>
			</div>

			<div class="row">
				<div class="col-sm-8">
					<div class="h-100 p-4 border border-dark rounded-3">
						<div>
							<div class="border-bottom py-1">
								<div class="row">
									<div class="col-sm-9">
										<div class="text-muted">
											<small>${list[0].prCategory }</small>
										</div>

										<div class="h3">${list[0].prTitle }</div>
									</div>
									<!-- 위시리스트 -->
									<div class="col-sm-3 align-self-bottom" id="heart">
										<i></i><small>위시리스트 담기</small>
									</div>

								</div>
							</div>
							<div class="row">
								<div class="border-bottom py-1">
									<div class="col-sm-8">
										<img src="${list[0].userProfile }" class="image--cover">
										<small>${list[0].userNickname }</small>
									</div>
									<div class="col-sm-4 text-end d-inline-flex p-1">
										<small class="text-muted">글 번호 : ${list[0].prNo } </small>
									</div>
								</div>
							</div>

						</div>

						<div class="row py-1">
							<div class="col-sm-4">
								<div class="d-inline-flex p-1">
									<small>모집 일정</small>
								</div>
								<div class="d-inline-flex p-1 text-muted">
									<small>${list[0].prStartdate } ~ ${list[0].prEnddate }</small>
								</div>
							</div>
							<div class="col-sm-8 text-end">
								<div>
									<div class="d-inline-flex p-1">
										<small>물건의 총 가격</small>
									</div>
									<div class="d-inline-flex p-1">
										<h4 class="text-info">${list[0].prPrice }</h4>
									</div>
									<small>원</small>
								</div>
								<div>
									<div class="d-inline-flex p-1">
										<small>1인 부담금</small>
									</div>
									<div class="d-inline-flex p-1">
										<h4 class="text-info" id="dividedPrice"></h4>
									</div>
									<small>원</small>
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
											<c:if test="${not empty list[0].prPhoto1}">
												<div class="carousel-item active">
													<img src="${list[0].prPhoto1 }" class="d-block w-100"
														alt="src에 prPhoto1">
												</div>
											</c:if>
											<c:if test="${not empty list[0].prPhoto2}">
												<div class="carousel-item">
													<img src="${list[0].prPhoto2 }" class="d-block w-100"
														alt="src에 prPhoto2">
												</div>
											</c:if>
											<c:if test="${not empty list[0].prPhoto3}">
												<div class="carousel-item">
													<img src="${list[0].prPhoto3 }" class="d-block w-100"
														alt="src에 prPhoto3">
												</div>
											</c:if>
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
							<div class="border rounded-3 my-3 p-2">${list[0].prContent }</div>
						</div>

						<div class="py-2">
							<small class="py-1">참여 현황 ( ${people } 명 참여중 )</small>

							<div class="">
								<c:forEach var="applicate" items="${applicateSelect }">
									<div>
										<img src="${applicate.userProfile }" class="image--cover">
										${applicate.userNickname }, ${applicate.apDate } 참여
									</div>
								</c:forEach>
							</div>

						</div>

						<div class="py-3 text-center">
							<form id="frm" name="frm" method="POST" action="applicateForm.do">
								<input type="hidden" id="frmPrNo" name="frmPrNo" value="">
								<input type="hidden" id="frmDividedPrice" name="frmDividedPrice"
									value="">
								<input type="hidden" id="frmBossPrice" name="frmBossPrice" value="">
							</form>
							<button type="button" class="btn btn-outline-secondary"
								onclick="history.back()">목록으로 돌아가기</button>
							<button type="button" class="btn btn-outline-dark"
								onclick="applicate()">참여신청</button>
						</div>
						<!-- 댓글 폼 -->
						<div class="row py-3">
							<div class="col-sm-10">
								<label for="comment">댓글 입력</label>
								<div class="form-floating">
									<textarea class="form-control" id="prcommentcontent"
										name="prcommentcontent" style="height: 100px"></textarea>
								</div>
							</div>
							<div class="col-sm-2 align-self-center text-center">
								<button type="button" class="btn btn-outline-dark btn-lg"
									id="prcmtinsertbtn">등록</button>

							</div>
						</div>

						<div class="py-1">
							<small class="py-1">댓글</small>
							<div>

								<!-- 댓글 시작 -->

								<div class="area-comentarios">
									<ul id="cmt">
										<li class="unico-comentario normal"></li>
									</ul>
								</div>
								<!-- 댓글 끝 -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>