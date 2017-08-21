<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
	#wrap{
		height:2300px;
	}
	#wrap_content{
		width:1000px;
		height:100%;
		position:relative;
		margin:0 auto;
	}
	.content{
		width:800px;
		height:500px;
		position:absolute;
		top:155px;
		left:100px;
	}
	#board{
		width:1000px;
		height:1800px;
		background: url("/TBR_community/resources/dist/img/board_ver4.png") no-repeat;
		background-size:100%;
		position:absolute;
		top:-100px;
		left:3px;
		
	}
	#pin{
		width:200px;
		position:absolute;
		top:170px;
		left:-20px;
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
	.timeline{
		height:615px;
		overflow: auto;
		margin-bottom:0;
	}
	.timeline:before{
		background: white;	
	}
	#replyPage-footer{
		padding:0;	
	}
	#replyPage-footer div{
		margin:0;
	}
	#replyPage-footer div ul{
		margin:0;
	}
	@media only screen and (max-width: 1024px){
		#wrap{
			height:1600px;
		}
		#wrap_content{
			width:690px;
			height:100%;
			position:relative;
			margin:0 auto;
		}
		.content{
			width:630px;
			height:500px;
			position:absolute;
			top:140px;
			left:32px;
		}
		#board{
			width:690px;
			height:1800px;
			background: url("/TBR_community/resources/dist/img/board_ver4.png") no-repeat;
			background-size:100%;
			position:absolute;
			top:-60px;
			left:3px;
		}
		#pin{
			width:150px;
			position:absolute;
			top:115px;
			left:-20px;
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
		.timeline{
			height:215px;
			overflow: auto;
			margin-bottom:0;
		}
	}
</style>
<div id="wrap_content">
	<p id="p_voca">VOCA 게시판</p>
	<div id="board">
		<img src="/TBR_community/resources/dist/img/board_pin.png" id="pin">
	</div>
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
    					<p>작성자 : ${board.nickname }</p>
    					<p>제목 : ${board.title }</p>
    					<p id="scoreAvg"></p>
    					<p>내용 : ${board.content }</p>
    				</div>
  				</div>
  				
				<div class="box-footer">
					<button class="btn btn-primary" id="btnBack">back</button>
					<c:if test="${isAdmin == true}">
						<button class="btn btn-success" id="delBest">delete best</button>
					</c:if>
				</div>
				<form role="form" method="post" id="f1">
					<input type="hidden" name="bno" value="${board.bno }">
					<input type="hidden" name="bebno" value="${board.bebno }">
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
			$("#delBest").click(function(){
				$("#f1").attr("action","delbest");
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
					<input type="text" placeholder="USER ID" id="newReplyWriter" value="${loginnick}" readonly="readonly" class="form-control"><br>
					<label for="newReplyText">댓글내용</label>
					<input type="text" placeholder="USER ID" id="newReplyText" class="form-control">
					<label for="newReplyScore" style="margin-top:15px;">점수</label>
					<p id="score_wrap">
					<img src='${pageContext.request.contextPath}/resources/dist/img/0.png' id='score'/>
						<select name="score" id="score_sel_insert">
							<option value="0">0.0</option>
							<option value="5">0.5</option>
							<option value="10">1.0</option>
							<option value="15">1.5</option>
							<option value="20">2.0</option>
							<option value="25">2.5</option>
							<option value="30">3.0</option>
							<option value="35">3.5</option>
							<option value="40">4.0</option>
							<option value="45">4.5</option>
							<option value="50">5.0</option>
						</select>
					</p>
				</div>
				<div class="box-footer">
					<button class="btn btn-primary" id="btnAdd">Add Reply</button>
					<button class="btn btn-success" id="btnlist">Replies List</button>
				</div>
			</div>
			<!-- add reply -->
			<ul class="timeline">
			</ul>
		</div>
	</div>
	
	<!-- Modal -->
  <div id="modifyModal" class="modal modal-primary fade" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"></h4>
        </div>
        <div class="modal-body">
          <div class="box-body" style="background:rgba(0.25,0.25,0.25,0.3);">
					<label for="newReplyText">댓글내용</label>
					<input type="text" placeholder="REPLY TEXT" id="replytext" class="form-control">
					<label for="newReplyScore" style="margin-top:15px;">점수</label>
					<p id="score_wrap">
					<img src='${pageContext.request.contextPath}/resources/dist/img/0.png' id='score'/>
						<select style="color:black;" name="score" id="score_sel">
							<option value="0">0.0</option>
							<option value="5">0.5</option>
							<option value="10">1.0</option>
							<option value="15">1.5</option>
							<option value="20">2.0</option>
							<option value="25">2.5</option>
							<option value="30">3.0</option>
							<option value="35">3.5</option>
							<option value="40">4.0</option>
							<option value="45">4.5</option>
							<option value="50">5.0</option>
						</select>
					</p>
				</div>
        </div>
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
				<h3 class="timeline-header">
					<strong>{{rno}}</strong>
				</h3>
				<div class="timeline-body">
					<p id="score_html" data-rno={{rno}}><img src="${pageContext.request.contextPath}/resources/dist/img/{{score}}.png" id="score"/></p>
					<div>
                    	<div class="pull-left">
						{{#if memberpic}}
                        	<img src="/TBR_community/user/displayFile?filename={{memberpic}}" 
								class="img-circle" alt="User Image" style="width: 60px; margin-right: 10px;">
						{{else}}
							<img src="${pageContext.request.contextPath}/resources/dist/img/user_offline.png" 
								class="img-circle" alt="User Image" style="width: 60px; margin-right: 10px;" />
						{{/if}}
                        </div>
                        <h4 id="h4_nickname">{{nickname}}</h4>
                        <p id="id_replytext" data-rno={{rno}}>{{replytext}}</p>
                    </div>
				</div>
				<div class="timeline-footer">
				{{#if_eq userid "${loginid}"}}
			   		<a class="btn btn-primary btn-xs" 
				 		data-toggle="modal" data-target="#modifyModal" data-rno={{rno}} data-score={{score}} id="btnModify">Modify</a>
					<a class="btn btn-primary btn-xs" data-rno={{rno}} id="btnDelete">Delete</a>
				{{else}}
				{{/if_eq}}
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
		var isCheSub;
	
		checkSub();
		setScoreAvg("${board.scoreavg }");
	
		Handlebars.registerHelper("tempdate", function(time){
			var dateObj = new Date(time);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			
			return year + "/" + month + "/" + date;
		})
		
		function getAllList(){
			var scoreAvg;
			var sum = 0;
			var len = 0;
			
			$.ajax({//pageContext.getRequest().getContextPath()
				url:"${pageContext.request.contextPath}/replies/all/"+bno+"/"+kindboard,
				type:"get",
				dataType:"json",
				success:function(data){
					console.log(data);
					$(data).each(function(i, element){
						sum += element.score;
						len++;
					})
					
					scoreAvg = (sum/len).toFixed(1);
					setScoreAvg(scoreAvg);
					
					checkSub();
					
					var source = $("#temp").html();
					var source2 = $("#temp2").html();
					var template = Handlebars.compile(source);
					
					$(".replyLi").remove();
					$("#replyPage-footer").remove();
					$(".timeline").append(template(data));
					$(".timeline").after(source2);
					getChangeList(1);
				}
			})
		}
		
		function checkSub(){
			$.ajax({
				url:"${pageContext.request.contextPath}/replies/all/"+bno+"/"+kindboard,
				type:"get",
				dataType:"json",
				success:function(data){
					console.log(data);
					if(data==""){
						isCheSub = false;
					}
					$(data).each(function(i, element){
						if(element.userid=="${loginid}"){
							isCheSub = true;
							return false;
						}else{
							isCheSub = false;
						}	
					})
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
							$(".timeline").after(template(obj));
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
		
		Handlebars.registerHelper('if_eq', function(a, b, opts) {
    		if (a == b) {
        		return opts.fn(this);
    		} else {
        		return opts.inverse(this);
    		}
    	})

		
		$(document).on("click", "#idx", function(){
			var idx = $(this).attr("data-idx");
			getChangeList(idx);
		})
		
		$("#btnlist").click(function(){
			var isReplyView = $(".replyLi").children().size();
		
			if(isReplyView == 0){
				getAllList();
			}else{
				$(".replyLi").remove();
				$("#replyPage-footer").remove();
			}
		})
		
		//댓글 추가
		$("#btnAdd").click(function(){
			var writer = $("#newReplyWriter").val();
			var text = $("#newReplyText").val();
			var score = $("#score_sel_insert").val();
			
			var sendData = {
				bno:bno,
				replytext:text,
				userid:"${loginid}",
				nickname:writer,
				memberpic:"${userpic}",
				score:(score/10)
			};
			
			if(isCheSub==true){
				alert("이미 평가하셨습니다. 수정과 삭제만 가능합니다.");
			}else{
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
			}
		})
		
		$(document).on("click", "#btnDelete", function(){
			var rno_data = $(this).attr("data-rno");
			var sendData = {rno:rno_data};
			
			$.ajax({
				url:"${pageContext.request.contextPath}/replies/delete/"+rno_data+"/"+bno+"/"+kindboard,
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
			for(var i=0 ; i<55 ; i+=5){
				$("option[value='"+i+"']").prop("selected", false);
			}
			$("option[value='"+(score * 10)+"']").prop("selected", true);
			$(".modal-title").text(rno);
			$("#replytext").val(text);
		})
		
		$(document).on("click", "#replyModBtn", function(){
			var rno_data = $(".modal-title").html();
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
					getAllList();
				}
			})
		})
		
		$("#score_sel").change(function(){
			$("#score_sel").prev().remove();
			$("#score_sel").before("<img src='${pageContext.request.contextPath}/resources/dist/img/"+($(this).val()/10)+".png' id='score'/>");
		})
		
		$("#score_sel_insert").change(function(){
			$("#score_sel_insert").prev().remove();
			$("#score_sel_insert").before("<img src='${pageContext.request.contextPath}/resources/dist/img/"+($(this).val()/10)+".png' id='score'/>");
		})
		
		function setScoreAvg(scoreavg){
			var nsa = scoreavg;
			if(scoreavg == 5.0){
				scoreavg = 5.0;
			}else if(scoreavg < 5.0 && scoreavg >= 4.5){
				scoreavg = 4.5;
			}else if(scoreavg < 4.5 && scoreavg >= 4.0){
				scoreavg = 4.0;
			}else if(scoreavg < 4.0 && scoreavg >= 3.5){
				scoreavg = 3.5;
			}else if(scoreavg < 3.5 && scoreavg >= 3.0){
				scoreavg = 3.0;
			}else if(scoreavg < 3.0 && scoreavg >= 2.5){
				scoreavg = 2.5;
			}else if(scoreavg < 2.5 && scoreavg >= 2.0){
				scoreavg = 2.0;
			}else if(scoreavg < 2.0 && scoreavg >= 1.5){
				scoreavg = 1.5;
			}else if(scoreavg < 1.5 && scoreavg >= 1.0){
				scoreavg = 1.0;
			}else if(scoreavg < 1.0 && scoreavg >= 0.5){
				scoreavg = 0.5;
			}else{
				scoreavg = 0;
				if(nsa == "NaN"){
					nsa = "0.0";	
				}
			}
			$("#scoreAvg").html("평점 : <img src='${pageContext.request.contextPath}/resources/dist/img/"+scoreavg+".png' id='score'/><span style='margin-left:5px; font-size:18px; font-weight:bold;'>"+nsa+"</span>");
		}
		
	</script>
</section>
</div>
<%@ include file="../include/footer.jsp" %>