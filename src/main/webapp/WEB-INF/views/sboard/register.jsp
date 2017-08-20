<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		top:180px;
		left:100px;
	}
	#board{
		width:1000px;
		height:1500px;
		background: url("/TBR_community/resources/dist/img/board_ver1.png") no-repeat;
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
	#putImg{
		width:202px;
		height:302px;
		border: 1px solid #ccc;
		margin: 0 30px 30px 0;
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
			background: url("/TBR_community/resources/dist/img/board_ver1.png") no-repeat;
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
		#putImg{
			width:140px;
			height:240px;
			border: 1px solid #ccc;
			margin: 23 30px 30px 0;
		}
	}
</style>
<div id="wrap_content">
	<c:if test="${kindboard == 'voca'}">
		<p id="p_voca">VOCA 게시판</p>
	</c:if>
	<c:if test="${kindboard == 'lc'}">
		<p id="p_voca" style="border-bottom:2px solid orange; border-left: 10px solid orange;">LC 게시판</p>
	</c:if>
	<c:if test="${kindboard == 'rc'}">
		<p id="p_voca" style="border-bottom:2px solid purple; border-left: 10px solid  purple;">RC 게시판</p>
	</c:if>
	<c:if test="${kindboard == 'free'}">
		<p id="p_voca" style="border-bottom:2px solid blue; border-left: 10px solid blue;">자유 게시판</p>
	</c:if>
	<c:if test="${kindboard == 'notice'}">
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
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
				
				<!-- box-header -->
				<form role="form" method="POST" action="listAll" id="f1" enctype="multipart/form-data">
					<div class="box-body">
					<c:if test="${kindboard == 'notice' || kindboard == 'free'}">
						<div class="form-group">
							<label>Writer</label>
							<input type="text" name="nickname" class="form-control" 
								placeholder="Enter Writer" value="${loginnick }" readonly="readonly">
						</div>
						<div class="form-group">
							<label>Title</label>
							<input type="hidden" name="bno" value="${board.bno }">
							<input type="hidden" name="isbest" value="${board.isbest }">
							<input type="hidden" name="kindboard" value="${kindboard}">
							<input type="hidden" name="page" value="${cri.page }">
							<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
							<input type="hidden" name="searchType" value="${cri.searchType }">
							<input type="hidden" name="keyword" value="${cri.keyword }">
							<input type="text" name="title" class="form-control" 
								placeholder="Enter Title" value="${board.title }">
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea rows="5" cols="" name="content" placeholder="Enter Content" class="form-control">${board.content }</textarea>
						</div>
					</div>
					</c:if>
					<c:if test="${kindboard != 'notice' && kindboard != 'free'}">
						<div id="putImg" style="float: left;">
						<c:if test="${modify == true}">
							<c:forEach var="img" items="${imgList }">
								<div id="imgDel_div" style="width: 100%; height: 100%;">
									<img src="displayFile?filename=${img }" style="width: 100%; height: 100%;">
									<button data-img="${img }">X</button>
								</div>
							</c:forEach>
						</c:if>
						</div>
						<div id="delImgList"></div>
						<div class="form-group" style="float: left;">
							<label>Writer</label>
							<input type="text" name="nickname" class="form-control" 
								placeholder="Enter Writer" value="${loginnick }" readonly="readonly" style="width: 400px;">
						</div>
						<div class="form-group" style="float: left;">
							<label>Title</label>
							<input type="hidden" name="bno" value="${board.bno }">
							<input type="hidden" name="isbest" value="${board.isbest }">
							<input type="hidden" name="kindboard" value="${kindboard}">
							<input type="hidden" name="page" value="${cri.page }">
							<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
							<input type="hidden" name="searchType" value="${cri.searchType }">
							<input type="hidden" name="keyword" value="${cri.keyword }">
							<input type="text" name="title" class="form-control" 
								placeholder="Enter Title" value="${board.title }" style="width: 400px;">
						</div>
						<div class="form-group" style="float: left;" id="addpic">
							<label>Files add</label>
							<input type="file" name="files" id="files" class="form-control" 
							multiple="multiple" style="width: 400px;">
						</div>
						<div class="form-group" style="clear: both;">
							<label>Content</label>
							<textarea rows="5" cols="" name="content" placeholder="Enter Content" class="form-control">${board.content }</textarea>
						</div>
						<div class="form-group">
						<c:if test="${modify == false}">
							<c:forEach var="img" items="${imgList }">
								<div id="imgDel_div">
									<img src="displayFile?filename=${img }">
									<button data-img="${img }">X</button>
								</div>
							</c:forEach>
						</c:if>
						</div>
					</div>
					</c:if>
					<div class="box-footer">
					<c:if test="${modify == false}">
						<button type="submit" class="btn btn-primary">Submit</button>
					</c:if>
					<c:if test="${modify == true}">
						<button type="submit" class="btn btn-primary" id="modify">modify</button>
					</c:if>
						<button class="btn btn-primary" id="btnBack">back</button>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</section>
</div>
<script>
	$(function(){
		var upload = document.getElementById("files");
		var holder = document.getElementById("putImg");
		
		$("#addpic").hide();
		
		if($("#imgDel_div").children().length==0){
			$("#putImg").append("<img src='/TBR_community/resources/dist/img/img_no.png' style='width: 100%; height: 100%;'>");
			$("#addpic").show();
		}
		
		$("#modify").click(function(){
			$("#f1").attr("action","modify2");
			$("#f1").attr("method","post");
			$("#f1").submit();
		});
		
		$("#btnBack").click(function(){
			$("#f1").attr("action","listPage");
			$("#f1").attr("method","get");
			$("#f1").submit();
		});
		
		$(document).on("click", "#imgDel_div button", function(){
			var img = $(this).attr("data-img");
			$("#delImgList").append("<input type='hidden' name='delImgList' value='"+img+"'>");
			$(this).parent().remove();
			$("#addpic").show();
			$("#putImg").append("<img src='/TBR_community/resources/dist/img/img_no.png' style='width: 100%; height: 100%;'>");
		})
		
		upload.onchange = function (e) {
			e.preventDefault();
			var file = upload.files[0],
				reader = new FileReader();
			
			reader.onload = function (event) {
				putImgSetting(typeof file);
			};
		
			if(typeof file!="undefined"){
				reader.readAsDataURL(file);
			}else{
				putImgSetting(typeof file);
			}
			
			return false;
		};
		
		function putImgSetting(type){
			var img = new Image();
			if(typeof file==type){
				img.src = "/TBR_community/resources/dist/img/img_no.png";
			}else{
				img.src = event.target.result;
			}
			img.style.width = "100%";
			img.style.height = "100%";
			
			holder.innerHTML = '';
			holder.appendChild(img);
		
		}
	})
</script>

<%@ include file="../include/footer.jsp" %>
<!-- memo -->
<!-- 
	var upload = document.getElementsByTagName("input")[9];
	alert(upload.getAttribute("name"));
 -->