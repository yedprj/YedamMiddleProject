<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- �������� -->
<div class="container">
	<div class="row">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3"
						style="background-color: #eeeeee; text-align: center;">������</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${list[0].csTitle}</td>
				</tr>
				<tr>
					<td>${list[0].csDate}</td>
				</tr>
				<tr>
					<td>${list[0].csContent}</td>
				</tr>
			</tbody>
		</table>

	</div>
	<!-- ��� ��� -->
	<!-- ��� �ҷ����� -->
	<table class="table table-striped"
		style="text-align: center; border: 1px solid #dddddd">
		<tbody>
			<c:forEach var="cscmt" items="${list}">
				<tr>
					<td>${cscmt.cscmtWriter}${cscmt.cscmtDate}<br />
						${cscmt.cscmtContent} 
						<c:if test="${userId eq cscmt.cscmtWriter and cscmt.cscmtContent ne null }">
							<!-- ��� ���� -->
							<form id="frm" name="frm" action="cscmtDelete.do" method="post">
								<input type="hidden" id="csNo" name="csNo" value="${cscmt.csNo}">
								<input type="hidden" id="cscmtNo" name="cscmtNo" value="${cscmt.cscmtNo}">
								<button class="btn btn-danger btn-sm" type="submit">���
									����</button>
							</form>

							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal">
								����</button>

							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">��� ����</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<form id="frm" name="frm" action="cscmtUpdate.do"
											method="post">
											<div class="modal-body">
												<textarea id="cscmtContent" name="cscmtContent">${cscmt.cscmtContent}</textarea>
												<input type="hidden" id="csNo" name="csNo" value="${cscmt.csNo}"> 
												<input type="text" id="cscmtNo" name="cscmtNo" value="${cscmt.cscmtNo}">
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">���</button>
												<button type="submit" class="btn btn-primary">����</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<c:if test="${userId != null}">
		<!-- ��� �߰� -->
		<form id="frm" name="frm" action="cscmtInsert.do" method="post">
			<br> <br>
			<div>
				<div>
					<span><strong>Comments</strong></span> <span id="cCnt"></span>
				</div>
				<div>
					<table class="table">
						<tr>
							<td><textarea style="width: 1100px" rows="3" cols="30"
									id="cscmtContent" name="cscmtContent" placeholder="����� �Է��ϼ���">
								</textarea> <br> <input type="hidden" id="csNo" name="csNo"
								value="${list[0].csNo}"> <input type="hidden"
								id="userId" name="userId" value="${userId}"></td>
						</tr>
					</table>
					<input class="btn btn-outline-primary me-md-2" type="submit"
						value="��� �ۼ�">
				</div>
			</div>
		</form>
	</c:if>

	<c:if test="${userId eq list[0].csWriter}">
		<form action="csDelete.do" method="post">
			<input type="hidden" id="csNo" name="csNo" value="${list[0].csNo }">
			<input type="hidden" id="userId" name="userId" value="${userId}">
			<button type="submit" class="btn btn-danger" style="display: inline">�ۻ���</button>
		</form>
		<form action="csUpdateForm.do" method="post">
			<input type="hidden" id="csNo" name="csNo" value="${list[0].csNo }">
			<input type="hidden" id="csTitle" name="csTitle"
				value="${list[0].csTitle }">
			<textarea class="form-control" rows="10" id="csContent"
				name="csContent" style="display: none">${list[0].csContent}</textarea>
			<button type="submit" class="btn btn-danger" style="display: inline">�ۼ���</button>
		</form>
	</c:if>
	<button type="button" onclick="location.href='csList.do'"
		class="btn btn-primary">���</button>
</div>