<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/jumbotron/">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
//통화 형식 지정
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
	
	$(document).ready(function() {
		
		
		$.ajax({
			url: 'WishListServlet', //요청 페이지
			dataType: 'json',
			success: function (result) {//콜백함수 매개값으로 result가 정해져 있음
				console.log(result);
				console.log("select ajax 성공");
				if (result.length == 0) {
					console.log("위시리스트 없음");
				} else {
					for (let i=0; i<result.length; i++) {
						selectWishList(result[i]);
					}
				}
				}, 
				error: function(reject) {
					console.log(reject);
				}
			});
			
			function selectWishList(data) {
				
				let div_border = $('<div />').addClass("border-bottom one-wish").attr('id', data.wNo);
				let div_row_p4 = $('<div />').addClass("row p-4");
				let div_sm4_1 = $('<div />').addClass("col-sm-4 text-center");
				let div_row = $('<div />').addClass("row");
				let div_sm4_2 = $('<div />').addClass("col-sm-4 align-self-center");
				let inputChk = $('<input>').addClass("form-check-input").attr('type', 'checkbox').attr('name', data.wNo).attr('id', 'selectOne'); 
				let div_sm8 = $('<div />').addClass("col-sm-8");
				let img = $('<img />').addClass("rounded img-fluid").attr('src', data.prPhoto1).css({'width':'200px', 'height':'200px', 'object-fit':'cover'});
				$(img).on('click', function() {
					location.href='purchaseSelect.do?prNo=' + data.prNo;
				})
				
				
				$(div_sm8).append(img);
				$(div_sm4_2).append(inputChk);
				$(div_row).append(div_sm4_2);
				$(div_row).append(div_sm8);
				$(div_sm4_1).append(div_row);
				
				let div_sm8_2 = $('<div />').addClass("col-sm-8 align-self-center");
				let div_row_p3 = $('<div />').addClass("row p-3");
				let div_sm6 = $('<div />').addClass("col-sm-6 align-self-center");
				let p1 = $('<p />').addClass('h4').text(data.prTitle);
				$(p1).on('click', function() {
					location.href='purchaseSelect.do?prNo=' + data.prNo;
				})
				let p2 = $('<p />').addClass('lead text-secondary').text(data.userNickname);
				let div = $('<div />');
				let button = $('<button />').addClass('btn btn-outline-dark btn-sm').attr('type', 'button').attr('id', data.wNo);
				button.on('click', function() {
					  let confirm_val = confirm("정말 삭제하시겠습니까?");
					  let id = $(this).attr('id');
					  if(confirm_val) {
					    
					   $.ajax({
						    url : "WishListDeleteServlet",
						    type : "post",
						    data : {id : id},
						    success : function(result) {
						    	  if(result == "1") {     
						    		  console.log("delete ajax 성공")
						    		  $('#'+id).remove();
						    		  } else {
						    		   alert("삭제 실패");
						    		  }
						    	
						    }
						   });
					  } 
				});
				let spanDel = $('<span />').addClass('fw-bold').text('삭제');
				
				$(button).append(spanDel);
				$(div).append(button);
				$(div_sm6).append(p1);
				$(div_sm6).append(p2);
				$(div_sm6).append(div);
				
				let div_sm6_2 = $('<div />').addClass('col-sm-6 text-end align-self-center').text("￦ " + numberWithCommas(data.prPrice));
				
				$(div_row_p3).append(div_sm6);
				$(div_row_p3).append(div_sm6_2);
				$(div_sm8_2).append(div_row_p3);
				
				$(div_row_p4).append(div_sm4_1);
				$(div_row_p4).append(div_sm8_2);
				
				$(div_border).append(div_row_p4);
				
				$('#jquery').append(div_border);
				
			}
				
				
		
		$('#delSelectBtn').on('click', function() {
			
			let cnt = $("input[id='selectOne']:checked").length;
	        let arr = [];
	        $("input[id='selectOne']:checked").each(function() {
	            arr.push($(this).attr('name'));
	        });
	        arr = JSON.stringify(arr);
	            console.log(arr);
	        if(cnt == 0){
	            alert("선택된 항목이 없습니다.");
	        }
	        else{
				let confirm_val = confirm("선택된 항목이 삭제됩니다. 정말 삭제하시겠습니까?");
				
				if (confirm_val) {
					$.ajax({
						url: "WishListArrayDeleteServlet",
						type: "post",
						data : {arr : arr},
						success: function(result) {
							if (result >= 1) {
								console.log("delete array ajax 성공");
								
						        $("input[id='selectOne']:checked").each(function() {
						        	let id = $(this).attr('name');
						            $('#' + id).remove();
						            console.log(result + '건 삭제');
						            $('#selectAll').prop('checked', false);
						            $('#selectAll2').prop('checked', false);
						        });
								
								

							} else {
								alert("삭제 실패");
							}
							
						}
					})
				}
	        }
			
			
			
			

		});
		
		
		
		//최상단 체크박스 클릭
		$("#selectAll").click(function() {
			//클릭되었으면
			if ($("#selectAll").prop("checked")) {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[id=selectOne]").prop("checked", true);
				$("#selectAll2").prop("checked", true);
				
				//클릭이 안되있으면
			} else {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[id=selectOne]").prop("checked", false);
				$("#selectAll2").prop("checked", false);
			}
		})
		//최하단 체크박스 클릭
		$("#selectAll2").click(function() {
			//클릭되었으면
			if ($("#selectAll2").prop("checked")) {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[id=selectOne]").prop("checked", true);
				$("#selectAll").prop("checked", true);
				
				//클릭이 안되있으면
			} else {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[id=selectOne]").prop("checked", false);
				$("#selectAll").prop("checked", false);
			}
		})
		
		
		
	});
</script>
</head>
<div class="container">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
		<span class="link-dark fs-4">위시리스트</span>
	</div>
	<div class="h-100 p-5 border rounded-3">
		<!-- 상단 전체선택 / 삭제 -->
		<div class="border-bottom">
			<div class="row">
				<div class="col-sm-8">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="selectAll"> <label class="form-check-label"
							for="selectAll"> 전체 선택 </label>
					</div>
				</div>
				<div class="col-sm-4 text-end mb-3">
					<button type="button" class="btn btn-outline-dark btn-sm" id="delSelectBtn">
						<span class="fw-bold">선택 삭제</span>
					</button>
				</div>
			</div>
		</div>
		<div class="wishData"></div>
		<!-- 항목 -->
		
		<div id="jquery"></div>
	</div>
</div>


