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
		width:800px;
		height:500px;
		position:absolute;
		top:155px;
		left:100px;
	}
	#board{
		width:1000px;
		height:1800px;
		background: url("/TBR_community/resources/dist/img/board_ver3.png") no-repeat;
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
	.timeline{
		height:535px;
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
	#putImg{
		width:202px;
		height:302px;
		border: 1px solid #ccc;
		margin: 0 30px 30px 0;
	}
	#text_content{
		width:500px;
		height:135px;
	}
	#recombtn{
		cursor: pointer;
	}
	@media only screen and (max-width: 1024px){
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
			background: url("/TBR_community/resources/dist/img/board_ver3.png") no-repeat;
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
		.timeline{
			height:165px;
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
		#putImg{
			width:140px;
			height:240px;
			border: 1px solid #ccc;
			margin: 23px 30px 30px 0;
		}
		#text_content{
			width:400px;
			height:100px;
		}
	}
</style>
<div id="wrap_content">
	<c:if test="${board.kindboard == 'voca'}">
		<p id="p_voca">VOCA 게시판</p>
	</c:if>
	<c:if test="${board.kindboard == 'lc'}">
		<p id="p_voca" style="border-bottom:2px solid orange; border-left: 10px solid orange;">LC 게시판</p>
	</c:if>
	<c:if test="${board.kindboard == 'rc'}">
		<p id="p_voca" style="border-bottom:2px solid purple; border-left: 10px solid  purple;">RC 게시판</p>
	</c:if>
	<c:if test="${board.kindboard == 'free'}">
		<p id="p_voca" style="border-bottom:2px solid blue; border-left: 10px solid blue;">자유 게시판</p>
	</c:if>
	<c:if test="${board.kindboard == 'notice'}">
		<p id="p_voca" style="border-bottom:2px solid red; border-left: 10px solid red;">공지사항</p>
	</c:if>
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
				<c:if test="${board.kindboard == 'notice' || board.kindboard == 'free'}">
				<div class="box-body">
				<div class="form-group">
						<label>Writer</label>
						<input readonly="readonly" type="text" name="writer" class="form-control" value="${board.nickname }">
					</div>
					<div class="form-group">
						<label>Title</label>
						<input readonly="readonly" type="text" name="title" class="form-control" value="${board.title }">
					</div>
					<div class="form-group">
						<label>Content</label>
						<textarea style="width:100%; height:100px;" class="form-control" name="content" readonly="readonly">${board.content }</textarea>
					</div>
				</div>
				<div class="box-footer">
				</c:if>
				<c:if test="${board.kindboard != 'notice' && board.kindboard != 'free'}">
				<div class="box-body" style="height: 280px;">
					<div id="putImg" style="float: left;">	
						<c:forEach var="img" items="${imgList }">
							<img src="displayFile?filename=${img }" style="width: 100%; height: 100%;">
							<input type='hidden' name='files' value="${img }" id="displayImg">
						</c:forEach>
					</div>
					<div class="form-group" style="float: left;">
						<label>Writer</label>
						<input readonly="readonly" type="text" name="writer" class="form-control" style="width: 400px;" value="${board.nickname }">
					</div>
					<div class="form-group" style="float: left;">
						<label>Title</label>
						<input readonly="readonly" type="text" name="title" class="form-control" style="width: 400px;" value="${board.title }">
					</div>
					<div class="form-group" style="float: left;">
						<label>Content</label>
						<textarea id="text_content" class="form-control" name="content" readonly="readonly">${board.content }</textarea>
					</div>
				</div>
				<div class="box-footer" style="clear:both;">
				</c:if>
					<c:if test="${loginid == board.userid && isAdmin != true}">
						<button class="btn btn-warning">modify</button>
						<button class="btn btn-danger">delete</button>
					</c:if>
					<c:if test="${isAdmin == true}">
						<button class="btn btn-warning">modify</button>
						<button class="btn btn-danger">delete</button>
					</c:if>
					<button class="btn btn-primary" id="btnBack">back</button>
					<img src = "/TBR_community/resources/dist/img/recom.png" style="width:50px;" id="recombtn">
					<c:if test="${isAdmin == true}">
						<c:if test="${board.isbest == 0}">
							<button class="btn btn-primary" id="btnBest">best submit</button>
						</c:if>
					</c:if>
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
			if($("#putImg").children().length==0){
				$("#putImg").html("<img src='/TBR_community/resources/dist/img/img_no.png' style='width: 100%; height: 100%;'>");
			}
			
			$(".btn-danger").click(function(){
				$("#f1").attr("action","delete");
				$("#f1").attr("method","get");
				$("#f1").submit();
			});
			$(".btn-warning").click(function(){
				$("input[name='files']").each(function(i, obj){
					$("#f1").children().last().append(this);
				});
				$("#f1").attr("action","modify");
				$("#f1").attr("method","get");
				$("#f1").submit();
			});
			$("#recombtn").click(function(){
				$("#f1").attr("action","recomUp");
				$("#f1").attr("method","get");
				$("#f1").submit();
			});
			$("#btnBack").click(function(){
				//location.href = "listPage";
				$("#f1").attr("action","listPage");
				$("#f1").attr("method","get");
				$("#f1").submit();
			});
			
			$("#btnBest").click(function(e){
				e.preventDefault();
				var del = confirm("정말 베스트로 등록하시겠습니까?");
				if(del == true){
					$("#f1").attr("action","subbest");
					$("#f1").attr("method","get");
					$("#f1").submit();
				}
			})
		})
	</script>
	
	<!-- 댓글 detail -->
	<div class="row">
		<div class="col-md-12">
			<div class="box-box-success">
				<div class="box-body">
					<label for="newReplyWriter">작성자</label>
					<input type="text" placeholder="USER ID" id="newReplyWriter" value="${loginnick }" readonly="readonly" class="form-control"><br>
					<label for="newReplyText">댓글내용</label>
					<input type="text" placeholder="USER ID" id="newReplyText" class="form-control">
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
	
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4> <!-- rno값 -->
				</div>
				<div class="modal-body">
					<p><input type="text" id="replytext" class="form-control"></p>
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
				<h3 class="timeline-header"><strong>{{rno}}</strong></h3>
				<div class="timeline-body">
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
                        <h4>{{nickname}}</h4>
                        <p id="id_replytext" data-rno={{rno}}>{{replytext}}</p>
                    </div>
				</div>
				<div class="timeline-footer">
				{{#if_eq userid "${loginid}"}}
			   		<a class="btn btn-primary btn-xs" 
				 		data-toggle="modal" data-target="#modifyModal" data-rno={{rno}} id="btnModify">Modify</a>
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
					$(".timeline").after(source2);
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
			var sendData = {
				bno:bno,
				replytext:text,
				userid:"${loginid}",
				nickname:writer,
				memberpic:"${userpic}"
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
			var text = $("#id_replytext[data-rno='"+rno+"']").text();
			$(".modal-title").text(rno);
			$("#replytext").val(text);
		})
		
		$(document).on("click", "#replyModBtn", function(){
			var rno_data = $(".modal-title").html();
			var replytext_data = $("#replytext").val();
			var sendData = {rno:rno_data, replytext:replytext_data};
		
			$.ajax({
				url:"${pageContext.request.contextPath}/replies/update/"+rno_data+"/"+bno+"/"+kindboard,
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
		
	</script>
</section>
</div>
<%@ include file="../include/footer.jsp" %>