<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ include file="../include/header.jsp" %>
<style>
	#imgDel_div{
		position: relative;
		width: 73px;
		height: 102px;
		display: inline-block;
	}
	#imgDel_div button{
		position: absolute;
		right: 4px;
		top: 2px;
	}
</style>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
				
				<!-- box-header -->
				<form role="form" method="POST" action="listAll" id="f1" enctype="multipart/form-data">
					<div class="box-body">
						<div class="form-group">
							<label>Title</label>
							<input type="hidden" name="bno" value="${board.bno }">
							<input type="hidden" name="kindboard" value="${kindboard}">
							<input type="hidden" name="page" value="${cri.page }">
							<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
							<input type="hidden" name="searchType" value="${cri.searchType }">
							<input type="hidden" name="keyword" value="${cri.keyword }">
							<input type="text" name="title" class="form-control" placeholder="Enter Title" value="${board.title }">
						</div>
						<div class="form-group">
							<label>Writer</label>
							<input type="text" name="nickname" class="form-control" placeholder="Enter Writer" value="${board.nickname }">
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea rows="5" cols="" name="content" placeholder="Enter Content" class="form-control">${board.content }</textarea>
						</div>
						<div class="form-group">
							<c:forEach var="img" items="${imgList }">
								<div id="imgDel_div">
									<img src="displayFile?filename=${img }">
									<button data-img="${img }">X</button>
								</div>
							</c:forEach>
						</div>
						<div class="form-group">
							<label>Files add</label>
							<input type="file" name="files" class="form-control" multiple="multiple">
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
			$("#f1").attr("method","post");
			$("#f1").submit();
		});
		
		$(document).on("click", "#imgDel_div button", function(){
			var img = $(this).attr("data-img");
			$(this).parent().after("<input type='hidden' name='delImgList' value='"+img+"'>");
			$(this).parent().remove();	
		})
	})
</script>

<%@ include file="../include/footer.jsp" %>