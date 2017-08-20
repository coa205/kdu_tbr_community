<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<style>
	#wrap{
		height:2600px;
	}
	#wrap_content{
		width:1200px;
		height:100%;
		position:relative;
		margin:0 auto;
	}
	#coin-slider{
		width:690px;
		height:400px;
		margin-top: 290px;
		box-shadow:5px 5px 5px black;
	}
	#coin-slider{
		margin-left:0px;
	}
	#img_tabmenu{
		width:410px;
		height:300px;
		background:url("/TBR_community/resources/dist/img/img_tabmenu.png") no-repeat;
		background-size: 100%;
		position:absolute;
		top:445px;
		right:45px;
	}
	#best_bar{
		width:490px;
		height:40px;
		background: url("/TBR_community/resources/dist/img/bestbook_bar.png") no-repeat;
		background-size:100%;
		position: absolute;
		top:390px;
		right:3px;
	}
	#best_board{
		position:absolute;
		top:800px;
		left:100px;
	}
	#best_board img{
		width:1000px;
	}
	#best_voca{
		width:230px; 
		height:335px;
		position:absolute;
		top:985px;
		left:189px;
		z-index:1;
	}
	#best_lc{
		width:230px; 
		height:335px;
		position:absolute;
		top:985px;
		left:485px;
		z-index:1;
	}
	#best_rc{
		width:230px; 
		height:335px;
		position:absolute;
		top:985px;
		left:782px;
		z-index:1;
	}
	#div_best_voca{
		width:230px; 
		height:335px;
		background:rgba(0,0,0,0.8);
		position:absolute;
		top:985px;
		left:189px;
		z-index:2;
	}
	#div_best_lc{
		width:230px;
		height:335px;
		background:rgba(0,0,0,0.8);
		position:absolute;
		top:985px;
		left:485px;
		z-index:2;
	}
	#div_best_rc{
		width:230px;
		height:335px;
		background:rgba(0,0,0,0.8);
		position:absolute;
		top:985px;
		left:782px;
		z-index:2;
	}
	#div_overlay_voca{
		width:230px;
		height:335px;
		position:absolute;
		top:985px;
		left:189px;
		cursor: pointer;
		z-index:3;
	}
	#div_overlay_lc{
		width:230px;
		height:335px;
		position:absolute;
		top:985px;
		left:485px;
		cursor: pointer;
		z-index:3;
	}
	#div_overlay_rc{
		width:230px; 
		height:335px;
		position:absolute;
		top:985px;
		left:782px;
		cursor: pointer;
		z-index:3;
	}
	#voca_marker{
		position:absolute;
		top:900px;
		left:145px;
		z-index:0;
	}
	#lc_marker{
		position:absolute;
		top:900px;
		left:441px;
		z-index:0;
	}
	#rc_marker{
		position:absolute;
		top:900px;
		left:738px;
		z-index:0;
	}
	#bottom_content{
		width:1000px;
		position:absolute;
		top:1820px;
		left:100px;
	}
	#google_news{
		width:100%;
	}
	#video_content{
		width:1000px;
		height:260px;
		position:absolute;
		top:1570px;
		left:100px;
	}
	#java_video_p{
		width:1000px;
		top:-135px;
		left:-10px;
	}
	#google_news_p{
		width:1000px;
		margin-left:0;
	}
	iframe{
		width:250px;
		height:250px;
		margin:0;
		padding:0;
		float:left;
		margin-left:60px;
	}
	#star{
		width:160px;
		position:absolute;
		top:740px;
		left:50px;
		z-index:1;
	}
	#star_light{
		width:160px;
		position:absolute;
		top:740px;
		left:50px;
		z-index:1;
		display:none;
	}
	#best_bg ul li img{
		width: 132px;
	}
	#best_bg .next_btn{
		position: absolute;
		top:170px;
		right: -15px;
	}
	#rc_content{
		width:160px; 
		margin-left:33px;
	}
	#lc_content{
		width:160px; 
		margin-left:33px;
	}
	#voca_content{
		width:160px; 
		margin-left:33px;
	}
	#voca_conbtn{
		margin:130px 0 0 70px;
	}
	#rc_conbtn{
		margin:130px 0 0 70px;
	}
	#lc_conbtn{
		margin:130px 0 0 70px;
	}	
	@media only screen and (max-width: 1024px){
		#wrap{
			height:2700px;
		}
	   	#wrap_content{
			width:690px;
			height:100%;
			position:relative;
			margin:0 auto;
		}
		#coin-slider{
			width:690px;
			height:400px;
			margin-top: 290px;
			box-shadow:5px 5px 5px black;
		}
		#bestbook_zone{
			width:450px;
			height: 243px;
			position:absolute;
			top:690px;
			right:120px;
		}
		#best_bar{
			width:490px;
			height:40px;
			background: url("/TBR_community/resources/dist/img/bestbook_bar.png") no-repeat;
			background-size:100%;
			position: absolute;
			top:812px;
			right:100px;
		}
		#img_tabmenu{
			width:410px;
			height:300px;
			background:url("/TBR_community/resources/dist/img/img_tabmenu.png") no-repeat;
			background-size: 100%;
			position:absolute;
			top:890px;
			right:140px;
		}
		#tabmenu{
			width:380px;
			height:180px;
			position: relative;
			background: url("../image/tab_line_bg.gif") 0 0 repeat-x;
			background:white;
			float:right;
			margin-right:155px;
			top:232px;
			box-shadow: 1px 1px 1px black;
		}
		#best_board{
			position:absolute;
			top:1200px;
			left:20px;
		}
		#best_board img{
			width:650px;
		}
		#star{
			width:100px;
			position:absolute;
			top:1160px;
			left:-10px;
			z-index:1;
		}
		#star_light{
			width:100px;
			position:absolute;
			top:1160px;
			left:-10px;
			z-index:1;
			display:none;
		}
		#best_voca{
			width:158px;
			height:220px;
			position:absolute;
			top:1322px;
			left:74px;
			z-index:1;
		}
		#best_lc{
			width:158px;
			height:220px;
			position:absolute;
			top:1322px;
			left:268px;
			z-index:1;
		}
		#best_rc{
			width:158px;
			height:220px;
			position:absolute;
			top:1322px;
			left:460px;
			z-index:1;
		}
		#div_best_voca{
			width:158px;
			height:220px;
			background:rgba(0,0,0,0.8);
			position:absolute;
			top:1322px;
			left:74px;
			z-index:2;
		}
		#div_best_lc{
			width:158px;
			height:220px;
			background:rgba(0,0,0,0.8);
			position:absolute;
			top:1322px;
			left:268px;
			z-index:2;
		}
		#div_best_rc{
			width:158px;
			height:220px;
			background:rgba(0,0,0,0.8);
			position:absolute;
			top:1322px;
			left:460px;
			z-index:2;
		}
		#div_overlay_voca{
			width:158px;
			height:220px;
			position:absolute;
			top:1322px;
			left:74px;
			z-index:3;
		}
		#div_overlay_lc{
			width:158px;
			height:220px;
			position:absolute;
			top:1322px;
			left:268px;
			z-index:3;
		}
		#div_overlay_rc{
			width:158px;
			height:220px;
			position:absolute;
			top:1322px;
			left:460px;
			z-index:3;
		}
		#voca_marker{
			width:90px;
			position:absolute;
			top:1265px;
			left:48px;
			z-index:0;
		}
		#lc_marker{
			width:90px;
			position:absolute;
			top:1265px;
			left:240px;
			z-index:0;
		}
		#rc_marker{
			width:90px;
			position:absolute;
			top:1265px;
			left:432px;
			z-index:0;
		}
		#video_content{
			width:690px;
			height:260px;
			position:absolute;
			top:1770px;
			left:0px;
		}
		#java_video_p{
			width:100%;
		
		}
		#java_video3{
			display: none;
		}
		#bottom_content{
			width:100%;
			position:absolute;
			top:2000px;
			left:0;
		}
		#google_news_p{
			width:100%;
			margin-left:0;
		}
		#img_goole_news{
			display: none;
		}
		#list{
			width: 680px;
			height: 330px;
			position: absolute;
			top:0;
			left:10px;
		}
		.menu_side{
			left: -500px;
		}
		#topnav_side_out, #side_out{
			display:none;
		}
		#topnav_side_in, #side_in{
			display: inherit;
			visibility:visible; 
		}
		#rc_content{
			width:130px; 
			margin-left:13px;
		}
		#lc_content{
			width:130px; 
			margin-left:13px;
		}
		#voca_content{
			width:130px; 
			margin-left:13px;
		}
		#voca_conbtn{
			margin:50px 0 0 35px;
		}
		#rc_conbtn{
			margin:50px 0 0 35px;
		}
		#lc_conbtn{
			margin:50px 0 0 35px;
		}
	}
	@media only screen and (max-width: 559px){
	   	#wrap{
			height:1500px;
		}
	   	#wrap_content{
			width:300px;
			height:100%;
			position:relative;
			margin:0 auto;
		}
		#wrap_content>*{
			display: none;
		}
		.menu_side{
			position: inherit;
		}
		#star_light{
			left:-700px;
		}
	}
</style>
<div id="wrap_content">
	<div id="coin-slider">
		<a href="#">
			<img src="${pageContext.request.contextPath}/resources/dist/img/menu_slide1.png"/>
		</a>
		<a href="#">
			<img src="${pageContext.request.contextPath}/resources/dist/img/menu_slide2.png"/>
		</a>
	</div>
	<div id="best_bar"></div>
	<div id="bestbook_zone">
		<div id="best_bg">
			<ul>
				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/dist/img/bestbook_list_1.png?ver=1" alt=""/><span>
					<strong>토익스피킹</strong>영단기</span></a>
				</li>
				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/dist/img/bestbook_list_23.png" alt=""/><span>
					<strong>PAGODA</strong>파고다</span></a>
				</li>
				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/dist/img/bestbook_list_3.png?ver=1" alt=""/><span>
					<strong>프토VOCA</strong>김대중 지음</span></a>
				</li>
				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/dist/img/bestbook_list_4.png?ver=1" alt=""/><span>
					<strong>BASIC LC</strong>이기택 지음</span></a>
				</li>
			</ul>
			<p class="prev_btn">
				<a href="#">
					<img src="${pageContext.request.contextPath}/resources/dist/img/bestbook_btn_left.png" alt="이전으로 이동"/>
				</a>
			</p>
			<p class="next_btn">
				<a href="#">
					<img src="${pageContext.request.contextPath}/resources/dist/img/bestbook_btn_right.png" alt="다음으로 이동"/>
				</a>
			</p>
		</div>
	</div>
	<div id="img_tabmenu"></div>
	<dl id="tabmenu">
		<dt class="tab_btn1">
			<a href="#"><img src="${pageContext.request.contextPath}/resources/dist/image/tab_btn_1_over.gif" alt="공지사항"/></a>
		</dt>
		<dd>
			<ul>
				<li>
					<a href="#" class="board">공지사항 관련 내용입니다.</a><span>2014-03-01</span>
				</li>
				<li>
					<a href="#" class="board">공지사항 관련 내용입니다.</a><span>2014-03-01</span>
				</li>
				<li>
					<a href="#" class="board">공지사항 관련 내용입니다.</a><span>2014-03-01</span>
				</li>
				<li>
					<a href="#" class="board">공지사항 관련 내용입니다.</a><span>2014-03-01</span>
				</li>
				<li>
					<a href="#" class="board">공지사항 관련 내용입니다.</a><span>2014-03-01</span>
				</li>
			</ul>
			<p>
				<a href="#"><img src="${pageContext.request.contextPath}/resources/dist/image/tab_more_btn.gif" alt="더보기"/></a>
			</p>
		</dd>
		<dt class="tab_btn2">
			<a href="#"><img src="${pageContext.request.contextPath}/resources/dist/image/tab_btn_2_out.gif" alt="질문과 답변"/></a>
		</dt>
		<dd>
			<ul>
				<li>
					<a href="#" class="board">질문과 답변 관련 내용입니다.</a>
					<span>2014-03-01</span>
				</li>
				<li>
					<a href="#" class="board">질문과 답변 관련 내용입니다.</a>
					<span>2014-03-01</span>
				</li>
				<li>
					<a href="#" class="board">질문과 답변 관련 내용입니다.</a>
					<span>2014-03-01</span>
				</li>
				<li>
					<a href="#" class="board">질문과 답변 관련 내용입니다.</a>
					<span>2014-03-01</span>
				</li>
				<li>
					<a href="#" class="board">질문과 답변 관련 내용입니다.</a>
					<span>2014-03-01</span>
				</li>
			</ul>
			<p>
				<a href="#"><img src="${pageContext.request.contextPath}/resources/dist/image/tab_more_btn.gif" alt="더보기"/></a>
			</p>
		</dd>
		<dt class="tab_btn3">
			<a href="#"><img src="${pageContext.request.contextPath}/resources/dist/image/tab_btn_3_out.gif" alt="저자문의"/></a>
		</dt>
		<dd>
			<ul>
				<li>
					<a href="#" class="board">저자문의 관련 내용입니다.</a>
					<span>2014-03-01</span>
				</li>
				<li>
					<a href="#" class="board">저자문의 관련 내용입니다.</a>
					<span>2014-03-01</span>
				</li>
				<li>
					<a href="#" class="board">저자문의 관련 내용입니다.</a>
					<span>2014-03-01</span>
				</li>
				<li>
					<a href="#" class="board">저자문의 관련 내용입니다.</a>
					<span>2014-03-01</span>
				</li>
				<li>
					<a href="#" class="board">저자문의 관련 내용입니다.</a>
					<span>2014-03-01</span>
				</li>
			</ul>
			<p>
				<a href="#"><img src="${pageContext.request.contextPath}/resources/dist/image/tab_more_btn.gif" alt="더보기"/></a>
			</p>
		</dd>
	</dl>
	<div id="div_overlay_voca"></div>
	<div id="div_overlay_rc"></div>
	<div id="div_overlay_lc"></div>
	<div id="div_best_voca"></div>
	<div id="div_best_rc"></div>
	<div id="div_best_lc"></div>
	<img src="${pageContext.request.contextPath}/resources/dist/img/voca_marker.png" id="voca_marker">
	<img src="${pageContext.request.contextPath}/resources/dist/img/lc_marker.png" id="lc_marker">
	<img src="${pageContext.request.contextPath}/resources/dist/img/rc_marker.png" id="rc_marker">
	<img src="${pageContext.request.contextPath}/resources/dist/img/star.png" id="star">
	<img src="${pageContext.request.contextPath}/resources/dist/img/star_light.png" id="star_light">
	<img src="/TBR_community/sboard/displayFile?filename=${vocaWB.bookname }" id="best_voca">
	<img src="/TBR_community/sboard/displayFile?filename=${rcWB.bookname }" id="best_rc">
	<img src="/TBR_community/sboard/displayFile?filename=${lcWB.bookname }" id="best_lc">
	<div id="best_board">		   
		<img src="${pageContext.request.contextPath}/resources/dist/img/best_board.png">
	</div>
	<div id="video_content">
		<p id="java_video_p">보너스 영상</p>
		<div id="java_video1">
			<iframe width="560" height="315" src="https://www.youtube.com/embed/AwODI8svZUU" 
			frameborder="0" allowfullscreen></iframe>
		</div>
		<div id="java_video2">
			<iframe width="560" height="315" src="https://www.youtube.com/embed/bGHnLwCn3Bc" 
			frameborder="0" allowfullscreen></iframe>
		</div>
		<div id="java_video3">
			<iframe width="560" height="315" src="https://www.youtube.com/embed/KGsaElmWI1c" 
			frameborder="0" allowfullscreen></iframe>
		</div>
	</div>
	<div id="bottom_content">
		<p id="google_news_p">구글 뉴스</p>
		<div id="google_news">
			<img src="${pageContext.request.contextPath}/resources/dist/image/google_news.png" id="img_goole_news"/>
			<ul id="list"></ul>
		</div>
	</div>
</div>
<script>
	$(function(){
		var key=0;
		setInterval(function() {
			if(key==0){
				$("#star_light").fadeIn(500);
				key++;
			}else{
				$("#star_light").fadeOut(500);
				key=0;
			}	
		});
		
		setTimeout( function(){
			$(".bx-viewport").attr("style", "width: 100%; overflow: hidden; position: relative; height: 453px;");
		},800);
		
		$("#div_best_voca").hide();
		$("#div_best_rc").hide();
		$("#div_best_lc").hide();
		
		$("#div_overlay_voca").mouseover(function(){
			$("#div_best_voca").finish().slideDown(500);
		})
		$("#div_overlay_voca").mouseout(function(){
			$("#div_best_voca").finish().slideUp(500);
		})
		
		$("#div_overlay_rc").mouseover(function(){
			$("#div_best_rc").finish().slideDown(500);
		})
		$("#div_overlay_rc").mouseout(function(){
			$("#div_best_rc").finish().slideUp(500);
		})
		
		$("#div_overlay_lc").hover(function(){
			$("#div_best_lc").finish().slideDown(500);
		})
		$("#div_overlay_lc").mouseleave(function(){
			$("#div_best_lc").finish().slideUp(500);
		})
		
		var i=0;
		
		screenSetting();
		
		$(window).resize(function (){
			screenSetting();
        });
		
		function screenSetting(){
			if(window.innerWidth < 1025 && i==0){
				$(".menu_side").finish().animate({"left":"-500px"}, 500);
				$("#topnav_side_out").hide();
				$("#side_out").hide();
				$("#topnav_side_in").show();
				$("#side_in").show();
				i=1;
	        }else if(window.innerWidth >= 1025 && i==1){
				$(".menu_side").finish().animate({"left":""}, 500);
				$("#topnav_side_in").hide();
				$("#side_in").hide();
				$("#topnav_side_out").show();
				$("#side_out").show();
				i=0;
	        }
		}
		
		for(var i=0 ; i<3 ; i++){
			if(i==0){
				var rc = setScoreAvg("${rcWB.scoreavg }");
				$("#div_best_rc").html("<h1 style='color:white; text-align: center;'>${rcWB.scoreavg }</h1><img src='${pageContext.request.contextPath}/resources/dist/img/"+rc+".png?ver=1' id='rc_content'/><button class='btn btn-primary' id='lc_conbtn'>상세 보기</button>");
			}else if(i==1){
				setScoreAvg("${lcWB.scoreavg }");
				var lc = setScoreAvg("${lcWB.scoreavg }");
				$("#div_best_lc").html("<h1 style='color:white; text-align: center;'>${lcWB.scoreavg }</h1><img src='${pageContext.request.contextPath}/resources/dist/img/"+lc+".png?ver=1' id='lc_content'/><button class='btn btn-primary' id='lc_conbtn'>상세 보기</button>");
			}else{
				setScoreAvg("${vocaWB.scoreavg }");
				var voca = setScoreAvg("${vocaWB.scoreavg }");
				$("#div_best_voca").html("<h1 style='color:white; text-align: center;'>${vocaWB.scoreavg }</h1><img src='${pageContext.request.contextPath}/resources/dist/img/"+voca+".png?ver=1' id='voca_content'/><button class='btn btn-primary' id='voca_conbtn'>상세 보기</button>");
			}
		}
		
		$(document).on("click","#div_overlay_lc", function(){
			location.href = "/TBR_community/sboard/readlcbest?bno=${lcWB.bno }&kindboard=lcbest";
		})
		
		$(document).on("click","#div_overlay_rc", function(){
			location.href = "/TBR_community/sboard/readlcbest?bno=${rcWB.bno }&kindboard=rcbest";
		})
		
		$(document).on("click","#div_overlay_voca", function(){
			location.href = "/TBR_community/sboard/readlcbest?bno=${vocaWB.bno }&kindboard=vocabest";
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
			return scoreavg;
		}
	})
</script>
<%@ include file="include/footer.jsp" %>
<!-- memo
	jQuery("#best_lc").hover(function(){ 
	 alert("진입성공"); 
	},function(){ 
	 alert("빠져나옴"); 
	});
 -->