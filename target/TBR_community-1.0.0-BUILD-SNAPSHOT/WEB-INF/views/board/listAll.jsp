<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">BOARD LISTALL</h3>
				</div>
				
				<!-- box-header -->
				<form role="form" method="get" action="register">
					<div class="box-body">
						<table class="table table-boarded">
							<tr>
								<th style="width:10px">BNO</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>REGDATE</th>
								<th style="width:10px">VIEWCNT</th>
							</tr>
							<c:forEach var="board" items="${list }">
								<tr>
									<td>${board.bno }</td>
									<td><a href="read?bno=${board.bno }">${board.title }</a></td>
									<td>${board.writer }</td>
									<td><fmt:formatDate value="${board.regdate }" pattern="yyyy-mm-dd HH:mm"/></td>
									<td><span class="badge bg-red">${board.viewcnt }</span></td>
								</tr>
							</c:forEach>
						</table>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp" %>