<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
	#btnlist:HOVER{
		cursor: pointer;
	}
	#idx{
		cursor: pointer;
	}
	.panel-default{
		width: 500px;
		margin:0 auto;
	}
	#bookImg{
		margin-right:10px;
		width: 150px;
		float: left;
	}
	#score{
		width: 100px;
	}
</style>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">BOARD CONTENT</h3>
				</div>
				
				<!-- box-header -->
				<div class="panel panel-default">
    				<div class="panel-body">
    					<img src="displayFile?filename=${board.bookname }" id="bookImg">
    					<p>제목 : ${board.title }</p>
    					<p>작성자 : ${board.nickname }</p>
    					<p>내용 : ${board.content }</p>
    					<p>평점 : <img src="${pageContext.request.contextPath}/resources/dist/img/${board.scoreavg }.png" id="score"/></p>
    				</div>
  				</div>
  				
				<div class="box-footer">
					<button class="btn btn-primary" id="btnBack">back</button>
				</div>
				<form role="form" method="post" id="f1">
					<input type="hidden" name="bno" value="${board.bno }">
					<input type="hidden" name="kindboard" value="${board.kindboard}">
					<input type="hidden" name="page" value="${cri.page }">
					<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
					<input type="hidden" name="searchType" value="${cri.searchType }">
					<input type="hidden" name="keyword" value="${cri.keyword }">
				</form>
				
			</div>
		</div>
	</div>
	
	<!-- 게시물 detail -->
	<script>
		$(function(){
			$("#btnBack").click(function(){
				//location.href = "listPage";
				$("#f1").attr("action","listbest");
				$("#f1").attr("method","get");
				$("#f1").submit();
			});	
		})
	</script>
	
	<!-- 댓글 detail -->
	<div class="row">
		<div class="col-md-12">
			<div class="box-box-success">
				<div class="box-header">
					<h3 class="box-title">댓글추가</h3>
				</div>
				<div class="box-body">
					<label for="newReplyWriter">작성자</label>
					<input type="text" placeholder="USER ID" id="newReplyWriter" class="form-control"><br>
					<label for="newReplyText">댓글내용</label>
					<input type="text" placeholder="USER ID" id="newReplyText" class="form-control">
				</div>
				<div class="box-footer">
					<button class="btn btn-primary" id="btnAdd">Add Reply</button>
				</div>
			</div>
			<!-- add reply -->
			<ul class="timeline">
				<li class="time-label" id="replieslist"><span class="bg-green" id="btnlist">Replies List</span></li>
			</ul>
		</div>
	</div>
	
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4> <!-- rno값 -->
				</div>
					<p><input type="text" id="replytext" class="form-control"></p>
					<p id="score_wrap">
						<select name="score" id="score_sel">
							<option value="0">0.0</option>
							<option value="10">1.0</option>
							<option value="20">2.0</option>
							<option value="30">3.0</option>
							<option value="40">4.0</option>
							<option value="50">5.0</option>
						</select>
					</p>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal" id="replyModBtn">Modify</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- "https://cdnjs.clou" -->
	<script src="${pageContext.request.contextPath}/resources/handlebars-v4.0.10.js"></script>
	<script id="temp" type="text/x-handlebars-template">
		{{#each.}}
		<li class="replyLi" data-rno={{rno}}>
				<input type="hidden" value={{rno}} id="rno-data">
				<i class="fa fa-comments bg-blue"></i>
				<div class="timeline-item">
					<span class="time">
						<i class="fa fa-clock-o"></i>{{tempdate regdate}}
					</span>
				<h3 class="timeline-header"><strong>{{rno}}</strong> -{{nickname}}</h3>
				<div class="timeline-body">
					<p id="id_replytext" data-rno={{rno}}>{{replytext}}</p>
					<p id="score_html" data-rno={{rno}}><img src="${pageContext.request.contextPath}/resources/dist/img/{{score}}.png" id="score"/></p> 
				</div>
				<div class="timeline-footer">
			   		<a class="btn btn-primary btn-xs" 
				 		data-toggle="modal" data-target="#modifyModal" data-rno={{rno}} data-score={{score}} id="btnModify">Modify</a>
					<a class="btn btn-primary btn-xs" data-rno={{rno}} id="btnDelete">Delete</a>
				</div>			
			</div>
		</li>
		{{/each}}
	</script>

	<script id="temp2" type="text/x-handlebars-template">
		<div class="box-footer" id="replyPage-footer">
			<div class="text-center">
				<ul class="pagination">
					{{#if prev}}
						{{#prev startPage}}<li><a data-idx={{this}} id="idx"}">&laquo;</a></li>{{/prev}}
					{{/if}}
					{{#times startPage endPage cri.page 1}}
    					{{this}}
					{{/times}}
					{{#if next}}
						{{#next endPage}}<li><a data-idx={{this}} id="idx">&raquo;</a></li>{{/next}}
					{{/if}}
				</ul>
			</div>
		</div>
	</script>
		
	<script>
		var bno = ${board.bno};
		var kindboard = "${board.kindboard}";
		var replyCnt = ${board.replyCnt};
	
		Handlebars.registerHelper("tempdate", function(time){
			var dateObj = new Date(time);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			
			return year + "/" + month + "/" + date;
		})
		
		function getAllList(){
			$.ajax({//pageContext.getRequest().getContextPath()
				url:"${pageContext.request.contextPath}/replies/all/"+bno+"/"+kindboard,
				type:"get",
				dataType:"json",
				success:function(data){
					console.log(data);
					var source = $("#temp").html();
					var source2 = $("#temp2").html();
					var template = Handlebars.compile(source);
					
					$(".replyLi").remove();
					$("#replyPage-footer").remove();
					$(".timeline").append(template(data));
					$(".timeline").append(source2);
					getChangeList(1);
				}
			})
		}
		
		
		function getChangeList(idx){
			$.ajax({
				url:"${pageContext.request.contextPath}/replies/ChangePage/"+bno+"/"+idx+"/"+replyCnt+"/"+kindboard,
				type:"get",
				dataType:"json",
				success:function(data){
					$(data).each(function(i, obj){
						if(i==0){
							var source = $("#temp").html();
							var template = Handlebars.compile(source);
							
							$(".replyLi").remove();
							$(".timeline").append(template(obj));
							
						}else if(i==1){
							console.log(obj);
							var source = $("#temp2").html();
							var template = Handlebars.compile(source);
							
							$("#replyPage-footer").remove();
							$(".timeline").append(template(obj));
						}
					})
				}
			})
		}
		
		Handlebars.registerHelper("times", function(s, e, p, incr, block){
			var accum = '';
			var active = '';
			var $obj = $("<li>");
		    for(var i=s ; i<=e ; i += incr){
		    	active = (p==i)?'class=active' : '';
		        accum += "<li "+active+" ><a data-idx="+i+" id='idx'>"+i+"</a></li>";
		    }
		    return accum;
		})
		
		Handlebars.registerHelper("prev", function(s, block){
			var prev = (s - 1);
		    return block.fn(prev);
		})
		
		Handlebars.registerHelper("next", function(e, block){
			var next = (e + 1);
		    return block.fn(next);
		})
		
		$(document).on("click", "#idx", function(){
			var idx = $(this).attr("data-idx");
			getChangeList(idx);
		})
		
		$("#btnlist").click(function(){
			getAllList();
		})
		
		//댓글 추가
		$("#btnAdd").click(function(){
			var writer = $("#newReplyWriter").val();
			var text = $("#newReplyText").val();
			var sendData = {
				bno:bno,
				replytext:text,
				userid:"user00",
				nickname:writer
			};
			
			$.ajax({
				url:"${pageContext.request.contextPath}/replies/add/"+kindboard,
				type:"post",
				dataType:"text",
				data:JSON.stringify(sendData),
				headers:{"Content-Type":"application/json"},
				success:function(data){
					console.log(data);
					getAllList();
				}
			})	
		})
		
		$(document).on("click", "#btnDelete", function(){
			var rno_data = $(this).attr("data-rno");
			var sendData = {rno:rno_data};
			
			$.ajax({
				url:"${pageContext.request.contextPath}/replies/delete/"+rno_data+"/"+kindboard,
				type:"delete",
				dataType:"text",
				data:JSON.stringify(sendData),
				headers:{"Content-Type":"application/json"},
				success:function(data){
					console.log(data);
					getAllList();
				}
			})
		})
		
		$(document).on("click", "#btnModify", function(){
			var rno = $(this).attr("data-rno");
			var score = $(this).attr("data-score");
			var text = $("#id_replytext[data-rno='"+rno+"']").text();
			var scoreHtml = $("#score_html[data-rno='"+rno+"']").html();
			$("#score_sel").prev().remove();
			$("#score_sel").before(scoreHtml);
			for(var i=0 ; i<60 ; i+=10){
				$("option[value='"+i+"']").prop("selected", false);
			}
			$("option[value='"+(score * 10)+"']").prop("selected", true);
			$(".modal-title").text(rno);
			$("#replytext").val(text);
		})
		
		$(document).on("click", "#replyModBtn", function(){
			var rno_data = $(".modal-title").text();
			var replytext_data = $("#replytext").val();
			var score_data = $("#score_sel").val()/10;
			var sendData = {rno:rno_data, replytext:replytext_data, score:score_data};
			
			$.ajax({
				url:"${pageContext.request.contextPath}/replies/LBupdate/"+rno_data+"/"+bno+"/"+kindboard,
				type:"PUT",
				dataType:"text",
				data: JSON.stringify(sendData),
				headers:{"Content-Type":"application/json"},
				success:function(data){
					console.log(data);
					getAllList();
				}
			})
		})
		
		$("#score_sel").change(function(){
			$("#score_sel").prev().remove();
			$("#score_sel").before("<img src='${pageContext.request.contextPath}/resources/dist/img/"+($(this).val()/10)+".png' id='score'/>");
		})
		
	</script>
</section>
<%@ include file="../include/footer.jsp" %>