<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
div.gallery {
    border: 1px solid #ccc;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 15px;
    text-align: center;
}

* {
    box-sizing: border-box;
}

.responsive {
    margin: 0 15px 30px 15px;
    float: left;
    width: 16.99999%;
}

@media only screen and (max-width: 700px){
    .responsive {
        width: 49.99999%;
        margin: 6px 0;
    }
}

@media only screen and (max-width: 500px){
    .responsive {
        width: 100%;
    }
}

.clearfix:after {
    content: "";
    display: table;
    clear: both;
}
.container{
	padding-left: 30px;
}

</style>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">BOARD LISTALL (${login })</h3>
				</div>
				
				<div class="container">
				
				  <h2>Image Gallery</h2>
				  <c:forEach var="board" items="#{list }">
				  	 <div class="responsive">
					   <div class="gallery">
					     <a href="readlcbest${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${board.bno }
								&replyCnt=${board.replyCnt}&kindboard=${board.kindboard}">
					       <img src="displayFile?filename=${board.bookname}" alt="Trolltunga Norway" width="400" height="200">
					     </a>
					     <div class="desc">
					     	${board.content}
					     	<img src="${pageContext.request.contextPath}/resources/dist/img/${board.scoreavg }.png"/>
					     </div>
					   </div>
					 </div>
				  </c:forEach>
					
				</div>
				
				<div class="box-body">
				  <div class="box-footer">
					<button type="submit" class="btn btn-primary">Submit</button>
						<div class="text-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li><a href="listbest${pageMaker.makeSearch(pageMaker.startPage-1)}&kindboard=${kindboard}">&laquo;</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
									<li ${pageMaker.cri.page==idx?'class=active' : ''}><a href="listbest${pageMaker.makeSearch(idx)}&kindboard=${kindboard}">${idx}</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
									<li><a href="listbest${pageMaker.makeSearch(pageMaker.endPage+1)}&kindboard=${kindboard}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</section>
<script>
	$(function(){
		var result = '${msg}';
		if(result == 'SUCCESS'){
			alert("처리가 완료되었습니다.");
		}
		
		$("#searchBtn").click(function(){
			var keyword = $("input[name='keyword']").val();
			var searchType = $("select").val();
			location.href = "listPage?keyword="+keyword+"&searchType="+searchType+"&kindboard=${kindboard}";
		});
	})
</script>

<%@ include file="../include/footer.jsp" %>