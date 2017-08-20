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
		top:600px;
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
	#voca{
		width:800px;
		margin-top:280px;
		margin-left:100px;
	}
	table{
		font-size: 13px;
	}
	#th_sday{
		width:80px;
	}
	#th_wter{
		width:20px;
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
			width:690px;
			height:100%;
			position:relative;
			margin:0 auto;
		}
		.content{
			width:630px;
			height:400px;
			position:absolute;
			top:140px;
			left:32px;
		}
		#board{
			width:690px;
			height:1000px;
			background: url("/TBR_community/resources/dist/img/board_ver1.png") no-repeat;
			background-size:100%;
			position:absolute;
			top:-60px;
			left:3px;	
		}
		#board img:NTH-CHILD(2){
			display: none;
		}
		#pin{
			width:150px;
			position:absolute;
			top:115px;
			left:-20px;
		}
		#voca{
			width:400px;
			margin-top:280px;
			margin-left:100px;
		}
		table{
			font-size: 11px;
		}
		#th_sday{
			width:90px;
		}
		#th_wter{
			width:45px;
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
		<p id="p_voca" style="border-bottom:2px solid purple; border-left: 10px solid purple;">RC 게시판</p>
	</c:if>
	<c:if test="${kindboard == 'free'}">
		<p id="p_voca" style="border-bottom:2px solid blue; border-left: 10px solid blue;">자유 게시판</p>
	</c:if>
	<c:if test="${kindboard == 'notice'}">
		<p id="p_voca" style="border-bottom:2px solid red; border-left: 10px solid red;">공지사항</p>
	</c:if>
	<div id="board">
		<img src="/TBR_community/resources/dist/img/board_pin.png" id="pin">
		<c:if test="${kindboard == 'voca'}">
			<img src="/TBR_community/resources/dist/img/img_voca.png" id="voca">
		</c:if>
		<c:if test="${kindboard == 'lc'}">
			<img src="/TBR_community/resources/dist/img/img_lc.png" id="voca">
		</c:if>
		<c:if test="${kindboard == 'rc'}">
			<img src="/TBR_community/resources/dist/img/img_rc.png" id="voca">
		</c:if>
		<c:if test="${kindboard == 'free'}">
			<img src="/TBR_community/resources/dist/img/img_free.png" id="voca">
		</c:if>	
		<c:if test="${kindboard == 'notice'}">
			<img src="/TBR_community/resources/dist/img/img_notice.png" id="voca">
		</c:if>	
	</div>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">BOARD LISTALL (${login })</h3>
					</div>
					<!-- box-header -->
					<div class="box-body">
						<select name="searchType">
							<option value="n" ${cri.searchType==null?'selected':'' }>---</option>
							<option value="t" ${cri.searchType=='t'?'selected':'' }>Title</option>
							<option value="c" ${cri.searchType=='c'?'selected':'' }>Content</option>
							<option value="w" ${cri.searchType=='w'?'selected':'' }>Writer</option>
							<option value="tc" ${cri.searchType=='tc'?'selected':'' }>Title OR Content</option>
							<option value="cw" ${cri.searchType=='cw'?'selected':'' }>Content OR Writer</option>
							<option value="tcw" ${cri.searchType=='tcw'?'selected':'' }>Title OR Content OR Writer</option>
						</select>
						<input type="text" value="${cri.keyword}" name="keyword">
						<button id="searchBtn">Search</button>
					</div>
					
					<!-- box-header -->
					<form role="form" method="get" action="register">
						<input type="hidden" name="kindboard" value="${kindboard }">
						<input type="hidden" name="page" value="${cri.page }">
						<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
						<input type="hidden" name="searchType" value="${cri.searchType }">
						<input type="hidden" name="keyword" value="${cri.keyword }">
						<div class="box-body">
							<table class="table table-boarded">
								<tr>
									<th style="width:10px">번호</th>
									<th id="th_wter">글쓴이</th>
									<th style="width:200px">제목</th>
									<th id="th_sday">등록일</th>
									<th style="width:20px">추천</th>
									<th style="width:45px">조회수</th>
									<th style="width:50px">베스트</th>
								</tr>
								<c:forEach var="board" items="${list }">
									<tr>
										<td>${board.bno }</td>
										<td>${board.nickname }</td>
										<td style="width:200px"><a href="read${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${board.bno }
										&replyCnt=${board.replyCnt}&kindboard=${board.kindboard}">${board.title }</a>
										<b>[${board.replyCnt}]</b></td>
										<td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd HH:mm"/></td>
										<td><span class="badge bg-red">${board.recomcnt }</span></td>
										<td style="text-align:center;"><span>${board.viewcnt }</span></td>
										<c:if test="${board.isbest == 1}">
										<td><img src="/TBR_community/resources/dist/img/icon_best.png" style="width:26px; margin-left:5px;"></td>
										</c:if>
										<c:if test="${board.isbest == 0}">
										<td></td>
										</c:if>
									</tr>
								</c:forEach>
							</table>
							
							<div class="box-footer">
							<button type="submit" class="btn btn-primary">Submit</button>
								<div class="text-center">
									<ul class="pagination">
										<c:if test="${pageMaker.prev}">
											<li><a href="listPage${pageMaker.makeSearch(pageMaker.startPage-1)}&kindboard=${kindboard}">&laquo;</a></li>
										</c:if>
										<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
											<li ${pageMaker.cri.page==idx?'class=active' : ''}><a href="listPage${pageMaker.makeSearch(idx)}&kindboard=${kindboard}">${idx}</a></li>
										</c:forEach>
										<c:if test="${pageMaker.next}">
											<li><a href="listPage${pageMaker.makeSearch(pageMaker.endPage+1)}&kindboard=${kindboard}">&raquo;</a></li>
										</c:if>
									</ul>
								</div>
							</div>
							
						</div>
					</form>
					
				</div>
			</div>
		</div>
	</section>
</div>
<script>
	$(function(){
		$("#searchBtn").click(function(){
			var keyword = $("input[name='keyword']").val();
			var searchType = $("select").val();
			location.href = "listPage?keyword="+keyword+"&searchType="+searchType+"&kindboard=${kindboard}";
		});
	})
</script>

<%@ include file="../include/footer.jsp" %>