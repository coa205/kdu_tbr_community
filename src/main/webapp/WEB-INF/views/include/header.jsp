<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>AdminLTE 2 | Dashboard</title>
  <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
</head>

<link type="text/css" href="${pageContext.request.contextPath}/resources/dist/css/style.css?ver=1" rel="stylesheet"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/coin-slider-styles.css"/>
<script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/js/jquery.xdomainajax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dist/js/swipe.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dist/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dist/js/tbr_header.js?ver=1"></script>
<script src="${pageContext.request.contextPath}/resources/dist/js/coin-slider.min.js?ver=1"></script>

<!-- Bootstrap 3.3.4 -->
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css?ver=1" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
     folder instead of downloading all of them to reduce the load. -->
<link href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<!-- e-calendar -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/jquery.e-calendar.css"/>
<!-- menubar -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/dist/css/style.css" rel="stylesheet"/>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
	#header {
		z-index:4;
	}
	.menu_side{
		margin-left:50px;
		position: fixed;
		bottom:;
		z-index:3;	
	}
	.main-sidebar{
		width:180px;
		min-height: 10%;
		border:2px solid orange;
		border-radius:10px;
		padding-top:10px;
		position:absolute;
		top:160px;
		left:27px;
	}
	#img_nail{
		width:50px;
		position:absolute;
		top:-10px;
		right:-5px;
	}
	.user-panel{
		margin-left:20px;
	}
	p, label{
		font-size:13px;
	}
	#side_out{
		position: absolute;
		width:25px;
		top:9px;
	}
	#side_in{
		position: absolute;
		width:25px;
		top:9px;
	}
	#user_icon{
		position: absolute;
		width:25px;
		top:5px;
	}
	#topnav_side_in, #side_in{
		display:none;
	}
	#login:HOVER {
		text-decoration: underline;
		cursor: pointer;
	}
	#login2:HOVER {
		text-decoration: underline;
		cursor: pointer;
	}
	#p_user:HOVER {
		text-decoration: underline;
		cursor: pointer;
	}
	#top_hanbit{
		cursor: pointer;
	}
	#nav{
		margin:0 auto;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$("#top_hanbit").click(function(){
			location.href="/TBR_community/";
		})
		
		$("#chat").click(function(){
			var popupX = (window.screen.width / 2) - (620 / 2);
			var popupY= (window.screen.height /2) - (600 / 2);
			window.open('/TBR_community/chat/chat','popup', "width=620, height=600, left="+popupX+", top="+popupY+", toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no");
		})
		
		$("#schedule").click(function(){
			var popupX = (window.screen.width / 2) - (610 / 2);
			var popupY= (window.screen.height /2) - (350 / 2);
			window.open('/TBR_community/sboard/schedule','popup', "width=610, height=350, left="+popupX+", top="+popupY+", toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no");
		})
		
		$("#logout").click(function(e){
			e.preventDefault();
			var del = confirm("정말 로그아웃하시겠습니까?");
			if(del == true){
				location.href = "/TBR_community/user/logout";
			}
		})
		
		$("#login").click(function(){
			location.href = "/TBR_community/user/login";
		})
		
		$("#login2").click(function(){
			location.href = "/TBR_community/user/login";
		})
		
		var i = 0;
		var headerOffsetTop = $("body").offset().top;
		
		$(window).on("scroll", function(){
			var sty = $(".menu_side").attr("style");
			var win = window.screen.width/2;
			if(window.innerWidth > 676){
				if($(window).scrollTop() > headerOffsetTop){
					$("#header").addClass("sticky-header");
					if(i==0){
						$(".menu_side").animate({"top":"105px"}, 1000);
					}
					$("#header").css("background","white");
					$("#logo").animate({"height":"65px","padding":"0"}, 1000);
					$("#top_hanbit").attr("style","width:300px; margin-bottom: 10px;");
					$("#top_hanbit").attr("src","/TBR_community/resources/dist/img/mini_tbr.png");
				}else{
					$("#header").removeClass("sticky-header");
					$("#header").css("background","url('/TBR_community/resources/dist/img/headerBG.jpg') no-repeat");
					$("#top_hanbit").attr("src","/TBR_community/resources/dist/img/title_name.png");
					$("#header").css("background-size","100%");
					if(i==0){
						$(".menu_side").finish().css("top","315px").finish();
					}
					$("#logo").finish().css("height","auto").finish();
					$("#logo").finish().css("padding","35px 0").finish();
					$("#top_hanbit").finish().css("margin-right","0").finish();
					$("#top_hanbit").finish().css("margin-bottom","0").finish();
					$("#top_hanbit").attr("style","width: 400px;");
				}
			}
		});
		
		screenSetting();
		
		$(window).resize(function(){
			screenSetting();
		})
		
		function screenSetting(){
			if(window.innerWidth < 677){
				$("#header").addClass("sticky-header");
				if(i==0){
					$(".menu_side").animate({"top":"105px"}, 1000);
				}
				$("#none_nav").hide();
				$("#header").css("background","white");
				$("#logo").animate({"height":"65px","padding":"0"}, 1000);
				$("#top_hanbit").attr("style","width:300px; margin-bottom: 10px;");
				$("#top_hanbit").attr("src","/TBR_community/resources/dist/img/mini_tbr.png");
			}else{
				$("#header").removeClass("sticky-header");
				$("#header").css("background","url('/TBR_community/resources/dist/img/headerBG.jpg') no-repeat");
				$("#top_hanbit").attr("src","/TBR_community/resources/dist/img/title_name.png");
				$("#header").css("background-size","100%");
				if(i==0){
					$(".menu_side").finish().css("top","315px").finish();
				}
				$("#none_nav").show();
				$("#logo").finish().css("height","auto").finish();
				$("#logo").finish().css("padding","35px 0").finish();
				$("#top_hanbit").finish().css("margin-right","0").finish();
				$("#top_hanbit").finish().css("margin-bottom","0").finish();
				$("#top_hanbit").attr("style","width: 400px;");
			}
		}
		
		$("#img_side").click(function(){
			if(i==0){
				$(".menu_side").finish().attr("style", "bottom:0; left:0;");
				i=1;
			}else{
				if($(window).scrollTop() > headerOffsetTop){
					$(".menu_side").finish().attr("style", "top:105px; left:0;");
				}else{
					$(".menu_side").finish().attr("style", "top:315px; left:0;");
				}
				i=0;
			}
		});
		
		$("#topnav_side_in").click(function(){
			$(".menu_side").finish().animate({"left":"0"}, 500);
			$("#topnav_side_in").hide();
			$("#side_in").hide();
			$("#topnav_side_out").show();
			$("#side_out").show();
		})
		
		$("#topnav_side_out").click(function(){
			$(".menu_side").finish().animate({"left":"-500px"}, 500);
			$("#topnav_side_out").hide();
			$("#side_out").hide();
			$("#topnav_side_in").show();
			$("#side_in").show();
		})
	})
</script>
<body>
	<%
	   	String user = (String) request.getSession().getAttribute("loginnick");
	   	String userPic = (String) request.getSession().getAttribute("userpic");
	%>
<div id="header">
	<div id="logo">
		<img src="${pageContext.request.contextPath}/resources/dist/img/title_name.png" id="top_hanbit">
	</div>
	<div class="navi_bg">
		<div class="nav">  
			<li class="navi_set">
			<img src="${pageContext.request.contextPath}/resources/dist/img/sidein.png" alt="User Image" id="side_in" />
			<img src="${pageContext.request.contextPath}/resources/dist/img/sideout.png" alt="User Image" id="side_out" />
				<div class="topnav" id="topnav_side_in">Side In</div>
				<div class="topnav" id="topnav_side_out">Side out</div>
				<ul class="subnav"> 
				</ul>  
			</li>  
			<li class="navi_set" id="none_nav">  
				<div class="topnav"></div>
				<ul class="subnav">  
				</ul>  
			</li>
			<li class="navi_set">  
				<div class="topnav">일반 게시판</div>
				<ul class="subnav">  
					<li>공지사항</li>  
					<li>Q&A</li> 
					<li>자유게시판</li>   
				</ul>  
			</li>
			<li class="navi_set">  
				<div class="topnav">추천 및 베스트</div>
				<ul class="subnav">  
					<li>LC 게시판</li>  
					<li>RC 게시판</li> 
					<li>VOCA 게시판</li>
					<li>LC BEST 게시판</li>  
					<li>RC BEST 게시판</li> 
					<li>VOCA BEST 게시판</li>
				</ul>  
			</li>
			<li class="navi_set">
				<%
					if(user!=null){
				%>
				<img src="/TBR_community/user/displayFile?filename=<%=userPic%>" class="img-circle" alt="User Image" id="user_icon">
				<div class="topnav"><p data-toggle="modal" data-target="#myModal" id="p_user"><%=user%> 님</p></div>
				<%
					}else{
				%>
				<div class="topnav"><p id="login">로그인</p></div>
				<%
					}
				%>
			</li>
		</div>
	</div>
</div>

<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><%=user%>님의 프로필</h4>
        </div>
        <div class="modal-body">
          	<!-- User image -->
	        <li class="user-header" style="background:rgba(102,0,88,0.2);">
	        <%
	        	if(userPic!=null){
	        %>
	        <img src="/TBR_community/user/displayFile?filename=<%=userPic%>" class="img-circle" alt="User Image" style="width:180px; margin:0 0 0 47px;">
	        <%
	       		}else{
	        %>
	        <img src="${pageContext.request.contextPath}/resources/dist/img/user_offline.png" class="img-circle" alt="User Image" style="width:180px; margin:0 0 0 47px;" />
	        <%
	       		}
	        %>
	          <p style="text-align: center;">
	            <small>Web Developer Member since Nov. 2017</small>
	          </p>
	        </li>
	        <!-- Menu Body -->
	        <li class="user-body">
	          <div class="col-xs-4 text-center">
	            <a href="#">Followers</a>
	          </div>
	          <div class="col-xs-4 text-center">
	            <a href="#">Sales</a>
	          </div>
	          <div class="col-xs-4 text-center">
	            <a href="#">Friends</a>
	          </div>
	        </li>
	        <!-- Menu Footer-->
	        <li class="user-footer">
	          <div class="pull-left">
	            <a href="#" class="btn btn-default btn-flat">Profile</a>
	          </div>
	          <div class="pull-right">
	            <a href="${pageContext.request.contextPath}/user/logout" class="btn btn-default btn-flat" id="logout">Logout</a>
	          </div>
	        </li>
        </div>
        <div class="modal-footer">
        </div>
      </div>
    </div>
  </div>
          
<div id="wrap">  
	<div class="menu_side" style="top:315px;">
		<img src="${pageContext.request.contextPath}/resources/dist/img/side_menu.png" id="img_side">
		<img src="${pageContext.request.contextPath}/resources/dist/img/nail.png" id="img_nail">
		<aside class="main-sidebar">
		  <!-- sidebar: style can be found in sidebar.less -->
		  <section class="sidebar">
		    <!-- Sidebar user panel -->
		    <div class="user-panel">
		    <%
		    	if(user!=null){
		    %>
		      <div class="pull-left image">
		  		<%
		  			if(userPic!=null){
		  		%>
		        <img src="/TBR_community/user/displayFile?filename=<%=userPic%>" class="img-circle" alt="User Image">
		        <%
		  			}else{
		        %>
		        <img src="${pageContext.request.contextPath}/resources/dist/img/user_offline.png" class="img-circle" alt="User Image" />
		        <%
		  			}
		        %>
		      </div>
		      <div class="pull-left info">
		        <p data-toggle="modal" data-target="#myModal" id="p_user"><b><%=user%></b>
		        <%
		        	try{boolean isAdmin = (boolean) request.getSession().getAttribute("isAdmin");
		        %>
		        	<span style="font-size: 5px;">(관리자)</span></p>
		        <%
		        	}catch(Exception e){
		        %>
		        	님</p>
		        <%
		        	}
		        %>
		        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
		      </div>
		    <%
		    	}else if(user==null){
		    %>
				<div class="pull-left image">
			      <img src="${pageContext.request.contextPath}/resources/dist/img/user_offline.png" class="img-circle" alt="User Image" />
			    </div>
			   	<div class="pull-left info">
				  <p id="login2">로그인</p>
				  <a href="#"><i class="fa fa-circle text-danger"></i> Offline</a>
			    </div>
		    <%
		    	}
		    %>
		    </div>
		    <!-- search form -->
		    <form action="#" method="get" class="sidebar-form">
		      <div class="input-group">
		        <input type="text" name="q" class="form-control" placeholder="Search..."/>
		        <span class="input-group-btn">
		          <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
		        </span>
		      </div>
		    </form>
		    <!-- /.search form -->
		    <!-- sidebar menu: : style can be found in sidebar.less -->
		    <ul class="sidebar-menu">
		      <li class="header">MAIN NAVIGATION</li>
		      <li>
		        <a href="#" id="chat">
		          <i class="fa fa-comments-o"></i> <span>대화방</span>
		          <small class="label pull-right bg-red">3</small>
		        </a>
		      </li>
		      <li>
		        <a href="#" id="schedule">
		          <i class="fa fa-calendar"></i> <span>스케줄</span>
		          <small class="label pull-right bg-yellow">12</small>
		        </a>
		      </li>
		      <li class="treeview">
		        <a href="#">
		          <i class="fa fa-trophy"></i> <span>베스트 목록</span>
		          <i class="fa fa-angle-left pull-right"></i>
		        </a>
		        <ul class="treeview-menu">
		          <li><a href="${pageContext.request.contextPath}/sboard/listbest?kindboard=vocabest"><i class="fa fa-genderless"></i>VOCA 베스트</a></li>
		          <li><a href="${pageContext.request.contextPath}/sboard/listbest?kindboard=rcbest"><i class="fa fa-genderless"></i>RC 베스트</a></li>
		          <li><a href="${pageContext.request.contextPath}/sboard/listbest?kindboard=lcbest"><i class="fa fa-genderless"></i>LC 베스트</a></li>               
		        </ul>
		      </li>
		      <li class="treeview">
		        <a href="#">
		          <i class="fa fa-edit"></i> <span>일반 게시판</span>
		          <i class="fa fa-angle-left pull-right"></i>
		        </a>
		        <ul class="treeview-menu">
		          <li><a href="${pageContext.request.contextPath}/sboard/listPage?kindboard=notice"><i class="fa fa-genderless"></i>공지사항</a></li>
		          <li><a href="${pageContext.request.contextPath}/sboard/listPage?kindboard=free"><i class="fa fa-genderless"></i>자유 게시판</a></li>
		        </ul>
		      </li>
		      <li class="treeview">
		        <a href="#">
		          <i class="fa fa-thumbs-o-up"></i> <span>추천 게시판</span>
		          <i class="fa fa-angle-left pull-right"></i>
		        </a>
		        <ul class="treeview-menu">
		          <li><a href="${pageContext.request.contextPath}/sboard/listPage?kindboard=voca"><i class="fa fa-genderless"></i>어휘 게시판</a></li>
		          <li><a href="${pageContext.request.contextPath}/sboard/listPage?kindboard=lc"><i class="fa fa-genderless"></i>듣기 게시판</a></li>
		          <li><a href="${pageContext.request.contextPath}/sboard/listPage?kindboard=rc"><i class="fa fa-genderless"></i>독해 게시판</a></li>
		        </ul>
		      </li>
		      <li class="header">LABELS</li>
		      <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
		      <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
		      <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
		    </ul>
		  </section>
		</aside>
	</div>
              
     
     
        
           
               
       
              
          
    