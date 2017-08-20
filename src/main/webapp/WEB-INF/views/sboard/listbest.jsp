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
}
.content{
	width:885px;
	height:700px;
	position:absolute;
	top:137px;
	left:55px;
}
div.gallery {
    border: 1px solid #ccc;
    width:130px;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 10px;
    text-align: center;
}

* {
    box-sizing: border-box;
}

.responsive {
	margin-bottom:15px;
    float: left;
    width: 16.99999%;
}

.clearfix:after {
    content: "";
    display: table;
    clear: both;
}
.container{
	width:1020px;
	height:620px;
	margin-left:10px;
}
#img_listbest{
	width:100%;
	height:860px;
	background:url("/TBR_community/resources/dist/img/img_listbook.png") no-repeat;
	background-size:100%;
	position:absolute;
	top:50px;
}
.box-body>*{
	background-color: rgba( 255, 255, 255, 0.0 );
}
.pagination>li a{
	box-shadow: 0 5px 1px black;
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
@media only screen and (max-width: 1024px){
	#wrap_content{
		width:715px;
		height:100%;
		position:relative;
		margin:0 auto;
	}
	.content{
		width:100%;
		height:700px;
		position:absolute;
		top:45px;
		left:0;
	}
	.container{
		width:1020px;
		height:920px;
		margin-left:10px;
	}
	#img_listbest{
		display: none;
	}
}
@media only screen and (max-width: 800px){
	#wrap_content{
		width:545px;
		height:100%;
		position:relative;
		margin:0 auto;
	}
	.content{
		width:100%;
		height:700px;
		position:absolute;
		top:45px;
		left:0;
	}
	.container{
		width:1020px;
		height:1200px;
		margin-left:10px;
	}
	#img_listbest{
		display: none;
	}
}
@media only screen and (max-width: 576px){
	#wrap_content{
		width:333px;
		height:100%;
		position:relative;
		margin:0 auto;
	}
	.content{
		width:100%;
		height:700px;
		position:absolute;
		top:45px;
		left:0;
	}
	.container{
		width:870px;
		height:1475px;
		margin-left:0px;
	}
	#img_listbest{
		display: none;
	}
}
</style>
<div id="wrap_content">
	<c:if test="${kindboard == 'vocabest'}">
		<p id="p_voca">VOCA BEST 게시판</p>
	</c:if>
	<c:if test="${kindboard == 'lcbest'}">
		<p id="p_voca" style="border-bottom:2px solid orange; border-left: 10px solid orange;">LC BEST 게시판</p>
	</c:if>
	<c:if test="${kindboard == 'rcbest'}">
		<p id="p_voca" style="border-bottom:2px solid purple; border-left: 10px solid purple;">RC BEST 게시판</p>
	</c:if>
	<div id="img_listbest"></div>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					
					<div class="container">
					
					  <h2>Best Gallery</h2>
					  <c:forEach var="board" items="#{list }">
					  	<c:if test="${board.scoreavg == 5.0}">
					  		<c:set value="5.0" var="scoreavg"/>
					  	</c:if>
					  	<c:if test="${board.scoreavg < 5.0 && board.scoreavg >= 4.5}">
					  		<c:set value="4.5" var="scoreavg"/>
					  	</c:if>
					  	<c:if test="${board.scoreavg < 4.5 && board.scoreavg >= 4.0}">
					  		<c:set value="4.0" var="scoreavg"/>
					  	</c:if>
					  	<c:if test="${board.scoreavg < 4.0 && board.scoreavg >= 3.5}">
					  		<c:set value="3.5" var="scoreavg"/>
					  	</c:if>
					  	<c:if test="${board.scoreavg < 3.5 && board.scoreavg >= 3.0}">
					  		<c:set value="3.0" var="scoreavg"/>
					  	</c:if>
					  	<c:if test="${board.scoreavg < 3.0 && board.scoreavg >= 2.5}">
					  		<c:set value="2.5" var="scoreavg"/>
					  	</c:if>
					  	<c:if test="${board.scoreavg < 2.5 && board.scoreavg >= 2.0}">
					  		<c:set value="2.0" var="scoreavg"/>
					  	</c:if>
					  	<c:if test="${board.scoreavg < 2.0 && board.scoreavg >= 1.5}">
					  		<c:set value="1.5" var="scoreavg"/>
					  	</c:if>
					  	<c:if test="${board.scoreavg < 1.5 && board.scoreavg >= 1.0}">
					  		<c:set value="1.0" var="scoreavg"/>
					  	</c:if>
					  	<c:if test="${board.scoreavg < 1.0 && board.scoreavg >= 0.5}">
					  		<c:set value="0.5" var="scoreavg"/>
					  	</c:if>
					  	<c:if test="${board.scoreavg < 0.5}">
					  		<c:set value="0" var="scoreavg"/>
					  	</c:if>
					  	 <div class="responsive">
						   <div class="gallery">
						     <a href="readlcbest${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${board.bno }
									&replyCnt=${board.replyCnt}&kindboard=${board.kindboard}">
						       <img src="displayFile?filename=${board.bookname}" alt="Trolltunga Norway">
						     </a>
						     <div class="desc">
						     	<h6>${board.title}</h6>
						     	<img src="${pageContext.request.contextPath}/resources/dist/img/<c:out value="${scoreavg}"/>.png?ver=1"/>
						     </div>
						   </div>
						 </div>
					  </c:forEach>
					
					</div>
					
				</div>
				<div class="box-body">
					<div class="box-footer" style="border:0px solid">
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
	</section>
</div>
<script>
	$(function(){
		
		screenSetting();
		
		$(window).resize(function (){
			screenSetting();
        });
		
		function screenSetting(){
			if(window.innerWidth >= 1025){
				$(".responsive").each(function(i, element){
					$(".responsive").eq(i).attr("style","clear:none;");
				})
				$(".responsive").each(function(i, element){
					if(i%5==0){
						$(".responsive").eq(i).attr("style","clear:both;");
					}
				})
	        }
			if(window.innerWidth < 1025){
				$(".responsive").each(function(i, element){
					$(".responsive").eq(i).attr("style","clear:none;");
				})
				$(".responsive").each(function(i, element){
					if(i%4==0){
						$(".responsive").eq(i).attr("style","clear:both;");
					}
				})
	        }
			if(window.innerWidth < 800){
	        	$(".responsive").each(function(i, element){
					$(".responsive").eq(i).attr("style","clear:none;");
				})
	        	$(".responsive").each(function(i, element){
	    			if(i%3==0){
	    				$(".responsive").eq(i).attr("style","clear:both;");
	    			}
	    		})
	        }
			if(window.innerWidth < 576){
	        	$(".responsive").each(function(i, element){
					$(".responsive").eq(i).attr("style","clear:none;");
				})
	        	$(".responsive").each(function(i, element){
	    			if(i%2==0){
	    				$(".responsive").eq(i).attr("style","clear:both;");
	    			}
	    		})
	        }
		}
		
		$("#searchBtn").click(function(){
			var keyword = $("input[name='keyword']").val();
			var searchType = $("select").val();
			location.href = "listPage?keyword="+keyword+"&searchType="+searchType+"&kindboard=${kindboard}";
		});
		
	})
</script>

<%@ include file="../include/footer.jsp" %>