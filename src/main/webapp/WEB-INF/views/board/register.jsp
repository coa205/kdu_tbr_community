<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ include file="../include/header.jsp" %>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
				
				<!-- box-header -->
				<form role="form" method="post" action="listAll" id="f1">
					<div class="box-body">
						<div class="form-group">
							<label>Title</label>
							<input type="hidden" name="bno" value="${board.bno }">
							<input type="hidden" name="page" value="${cri.page }">
							<input type="text" name="title" class="form-control" placeholder="Enter Title" value="${board.title }">
						</div>
						<div class="form-group">
							<label>Writer</label>
							<input type="text" name="Writer" class="form-control" placeholder="Enter Writer" value="${board.writer }">
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea rows="5" cols="" name="Content" placeholder="Enter Content" class="form-control">${board.content }</textarea>
						</div>
					</div>
					<c:if test="${modify == false}">
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</c:if>
					<c:if test="${modify == true}">
						<div class="box-footer">
							<button type="submit" class="btn btn-primary" id="modify">modify</button>
						</div>
					</c:if>
				</form>
				
			</div>
		</div>
	</div>
</section>
<script>
	$(function(){
		$("#modify").click(function(){
			$("#f1").attr("action","modify2");
			$("#f1").attr("method","get");
			$("#f1").submit();
		});
	})
</script>

<%@ include file="../include/footer.jsp" %>