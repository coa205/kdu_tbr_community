<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
	#wrap_content{
		width:1000px;
		height:100%;
		position:relative;
		margin:0 auto;
		border:1px solid;
	}
	.content{
		width:1000px;
		border:1px solid;
	}
	#p_voca{
		width:93%;
		margin:0 auto;
		border-bottom:2px solid green;
		border-left: 10px solid green;
		margin-top:325px;
		font-family: "휴먼둥근헤드라인";
		background:white;
		font-weight:bold;
		padding: 10px;
		font-size: 20px;
	}
	.media-photo{
		width:40px;
	}
	table tr th{
		border: 1px solid #ccc;
		background:#F9F9F9;
		text-align: center;
	}
</style>
<div id="wrap_content">
	<p id="p_voca">VOCA 게시판</p>
				
	<div class="row">

		<section class="content">
			
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">
						
						<div class="table-container">
							<table class="table table-filter">
								<tr>
									<th colspan="2" style="width:10px">선택</th>
									<th style="width:430px">제목</th>
									<th style="width:50px">등록일</th>
									<th style="width:80px">보낸날짜</th>
								</tr>
								<tbody>
								<c:forEach var="msgList" items="${msgList}">
									<tr data-status="pagado">
										<td>
											<div class="ckbox">
												<input type="checkbox" id="checkbox1">
												<label for="checkbox1"></label>
											</div>
										</td>
										<td>
											<a href="javascript:;" class="star">
												<i class="glyphicon glyphicon-star"></i>
											</a>
										</td>
										<td>
											<div class="media">
												<a href="#" class="pull-left">
													<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
												</a>
												<div class="media-body">
													<h4 class="title">
														${msgList.title}
													</h4>
													<p class="summary">${msgList.message}</p>
												</div>
											</div>
										</td>
										<td>
											<span class="media-meta pull-right">(${msgList.addresser})</span>
										</td>
										<td>
											<span class="media-meta pull-right"><fmt:formatDate value="${msgList.regdate }" pattern="yyyy-MM-dd HH:mm"/></span>
										</td>
									</tr>
								</c:forEach>	
								</tbody>
								
							</table>
						</div>
						<div class="pull-left">
							<div class="btn-group">
								<button type="button" class="btn btn-danger btn-filter" data-target="cancelado">Cancelado</button>
								<button type="button" class="btn btn-default btn-filter" data-target="all">Todos</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
	</div>
			
</div>
<script>
	$(function(){
		
	})
</script>

<%@ include file="../include/footer.jsp" %>