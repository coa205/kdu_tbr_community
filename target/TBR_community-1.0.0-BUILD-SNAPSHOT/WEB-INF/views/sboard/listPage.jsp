<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
	#test{
		display: none;
	}
</style>
<section class="content">
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" id="test" data-target="#myModal">Open Modal</button>
				<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	         <h4 class="modal-title">Modal Header</h4>
	      </div>
	      <div class="modal-body">
	        <p>Some text in the modal.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
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
								<th style="width:10px">BNO</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>REGDATE</th>
								<th>RECOM</th>
								<th style="width:10px">VIEWCNT</th>
							</tr>
							<c:forEach var="board" items="${list }">
								<tr>
									<td>${board.bno }</td>
									<td><a href="read${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${board.bno }
									&replyCnt=${board.replyCnt}&kindboard=${board.kindboard}">${board.title }</a>
									<b>[${board.replyCnt}]</b></td>
									<td>${board.nickname }</td>
									<td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd HH:mm"/></td>
									<td><span class="badge bg-red">${board.recomcnt }</span></td>
									<td><span class="badge bg-red">${board.viewcnt }</span></td>
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
<script>
	$(function(){
		if("${login}" == "xxx"){
			alert("");
			$("#test").click();
		}
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