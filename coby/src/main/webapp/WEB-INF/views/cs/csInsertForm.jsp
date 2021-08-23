<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<section class="bg-success py-5">
	<div class="container">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-white">
				<h1>Service Center</h1>
			</div>
		</div>
	</div>
</section>

<section class="container py-5">
	<div class="row text-center pt-5 pb-3">
		<div class="col-lg-6 m-auto">
			<h2 class="h2">고객센터 글 작성</h2>
		</div>
	</div>
	
	<form action="csInsert.do" method="post">
		<table class="board_view">
            <colgroup>
                <col width="15%" >
                <col width="*" >
            </colgroup>
            
            <tbody>
            	<tr>
            		<th scope="row">작성자</th>
            		<td>
            			<input type="text" id="csWriter" name="csWriter" value="${userId }"> 
            		</td>
            	</tr>
            	<tr>
            		<th scope="row">제목</th>
            		<td>
            			<input type="text" id="csTitle"  name="csTitle" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요." required>
            		</td>
            	</tr>
            	<tr>
            		<th scope="row">내용</th>
            		<td>
            			<textarea class="form-control" rows="10" cols="200" id="csContent" name="csContent"
							placeholder="내용을 입력해주세요" required></textarea>
            		</td>
            	</tr>
            </tbody>
		</table>
		<div class="col mt-4">
			<input type="submit" class="btn btn-success px-3 mx-3" value="글작성">
			<input type="button" value="뒤로가기" onclick="history.back(-1);" class="btn btn-success">
		</div>
	</form>	
</section>
