<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
div.gallery {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
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
	width: 200px; /* 18.99999% */
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

.kindcon{
	padding-bottom: 100px; 
}

.voca{
	margin:0 auto;
}

.lc{
	float: left;
	margin-left: 25px;
}

.rc{
	float: right;
	margin-right: 25px;
}

.container{
	width:100%;
}
</style>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary kindcon">
				<div class="box-header">
					<h3 class="box-title">BOARD LISTALL (${login })</h3>
				</div>
				<h2>Image Gallery</h2>
					
				<div class="container kindcon">
				
					<div class="responsive voca">
					  <div class="gallery">
					    <a target="_blank" href="displayFile?filename=${vocaWB.bookname }">
					      <img src="displayFile?filename=${vocaWB.bookname }" width="400" height="200">
					    </a>
					    <div class="desc">${vocaWB.content }</div>
					  </div>
					</div>
				
				</div>
				
				<div class="container">
				
					<div class="responsive lc">
					  <div class="gallery">
					    <a target="_blank" href="displayFile?filename=${lcWB.bookname }">
					      <img src="displayFile?filename=${lcWB.bookname }" width="400" height="200">
					    </a>
					    <div class="desc">${lcWB.content }</div>
					  </div>
					</div>
					
					<div class="responsive rc">
					  <div class="gallery">
					    <a target="_blank" href="displayFile?filename=${rcWB.bookname }">
					      <img src="displayFile?filename=${rcWB.bookname }" width="400" height="200">
					    </a>
					    <div class="desc">${rcWB.content }</div>
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