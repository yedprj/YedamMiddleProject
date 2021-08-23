<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<section class="bg-success py-5">
	<div class="container">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-white">
 				<h1>Notice</h1>
			</div>
		</div>
	</div>
</section>

<!-- Start Section -->
<section class="container py-5">
	<div class="row text-center pt-5 pb-3 mb-3">
	    <div class="col-lg-6 m-auto">
	        <h2 class="h2">�������� �ۼ�</h2>
	    </div>
	</div>
	
	<!-- �Խñ� �Է� ��� -->
	<form action="noticeInsert.do" method="post">
		<table class="board_view">
            <colgroup>
                <col width="15%" >
                <col width="*" >
            </colgroup>
            
            <tbody>
            	<tr>
            		<th scope="row">����</th>
            		<td>
            			<input type="text" id="ntTitle"  name="ntTitle" class="form-control mt-4 mb-2" placeholder="������ �Է����ּ���." required>
            		</td>
            	</tr>
            	<tr>
            		<th scope="row">����</th>
            		<td>
            			<textarea class="form-control" rows="10" cols="200" id="ntContent" name="ntContent"
							placeholder="������ �Է����ּ���" required></textarea>
            		</td>
            	</tr>
            </tbody>
		</table>
		<div class="col mt-4">
			<input type="submit" class="btn btn-success px-3 mx-3" value="���ۼ�">
			<input type="button" value="�ڷΰ���" onclick="history.back(-1);" class="btn btn-success">
		</div>
	</form>
</section>