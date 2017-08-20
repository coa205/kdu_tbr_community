<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
	#joinBtn{
		display:none;
	}
	#idReg, #nickReg, #idSamReg, #nickSamReg, #passReg, #emailReg, #passSamReg{
		color: red;
		display: none;
	}
	#userpic{
		width:200px;
		height:200px;
		margin-right:20px;
		margin-bottom:10px;
	}
</style>
  <head>
    <meta charset="UTF-8">
    <title>AdminLTE 2 | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
  <body class="login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="/resources/index2.html"><b>TBR</b>Community</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>

		<form action="loginPost" method="post">
		  <div class="form-group has-feedback">
		    <input type="text" name="userid" class="form-control" placeholder="USER ID"/>
		    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
		  </div>
		  <div class="form-group has-feedback">
		    <input type="password" name="userpw" class="form-control" placeholder="Password"/>
		    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  <div class="row">
		    <!-- <div class="col-xs-8">    
		      <div class="checkbox icheck">
		        <label>
		          <input type="checkbox" name="useCookie"> Remember Me
		        </label>
		      </div>                        
		    </div>/.col -->
		    <div class="col-xs-4">
		      <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
		    </div><!-- /.col -->
		  </div>
		</form>
		
        <a href="#">I forgot my password</a><br>
        <a href="#" id="Register" class="text-center">Register a new membership</a>
        
        	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" id="joinBtn" data-target="#myModal">Open Modal</button>
			<div id="myModal" class="modal fade" role="dialog">
			  <div class="modal-dialog">
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			         <h4 class="modal-title">회원가입</h4>
			      </div>
			      <div class="modal-body">
			          <form role="form" action="joinPost" method="post" id="f1_join" enctype="multipart/form-data">
			          	<div id="userpic" style="float:left;">
			          		<img src="${pageContext.request.contextPath}/resources/dist/img/user_offline.png" class="img-circle" alt="User Image" style="width:100%;" />
			          	</div>
			          	<div class="form-group" style="float:left; width:61%;">
			              <label for="userid">아이디</label>
			              <input type="text" class="form-control" name="userid" id="join0" placeholder="아이디를 입력해 주세요">
			              <p class="help-block" id="idReg">아이디는 영어와 숫자만 입력가능합니다(5~15자리)</p>
			              <p class="help-block" id="idSamReg">동일한 아이디가 존재합니다</p>
			            </div>
			            <div class="form-group" style="float:left; width:61%;">
			              <label for="nickname">닉네임</label>
			              <input type="text" class="form-control" name="nickname" id="join1" placeholder="닉네임을 입력해 주세요">
			              <p class="help-block" id="nickReg">닉네임은 영어와 숫자,한글만 입력가능합니다(2~15자리)</p>
			              <p class="help-block" id="nickSamReg">동일한 닉네임이 존재합니다</p>
			            </div>
			            <div class="form-group" style="float:left; width:61%;">
			              <label for="userpic">프로필 사진</label>
			              <input type="file" name="files" class="form-control" multiple="multiple">
			            </div>
			            <div class="form-group" style="clear:both;">
			              <label for="InputPassword1">비밀번호</label>
			              <input type="password" class="form-control" name="userpw" id="join2" placeholder="비밀번호">
			              <p class="help-block" id="passReg">비밀번호는 영어와 숫자,특수문자만 입력가능합니다(8~15자리)</p>
			            </div>
			            <div class="form-group">
			              <label for="InputPassword2">비밀번호 확인</label>
			              <input type="password" class="form-control" name="userpwcheck" id="join3" placeholder="비밀번호 확인">
			              <p class="help-block" id="passSamReg">비밀번호가 일치하지 않습니다</p>
			            </div>
			            <div class="form-group">
			              <label for="InputEmail">이메일 주소</label>
			              <input type="email" class="form-control" name="email" id="join4" placeholder="이메일 주소">
			              <p class="help-block" id="emailReg">이메일 양식에 맞지않습니다</p>
			            </div>
			            <div class="form-group">
			                <label>약관 동의</label>
			              <div data-toggle="buttons">
			              <label class="btn btn-primary active">
			                  <span class="fa fa-check"></span>
			                  <input id="agree" type="checkbox" autocomplete="off" checked>
			              </label>
			              <a href="#">이용약관</a>에 동의합니다.
			              </div>
			            </div>
			            <div class="form-group text-center">
			              <button type="submit" class="btn btn-info">회원가입<i class="fa fa-check spaceLeft"></i></button>
			              <button type="submit" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button>
			            </div>
			          </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>

      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->
    
    <c:forEach var="listMem" items="${listMember }">
    	<input type="hidden" value="${listMem.userid }" name="listMem_userid">
    	<input type="hidden" value="${listMem.nickname }" name="listMem_nickname">
    </c:forEach>
    
	<!-- jQuery 2.1.4 -->
    <script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script>
    $(function () {
    	var idReg = /^\w{5,15}$/
    	var nickReg = /^[a-zA-Z가-힣0-9]{2,15}$/
    	var passReg1 = /^[a-z][a-z0-9!@#$%^&*]{7,15}$/i;
    	var passReg2 = /\s+/
    	var emailReg = /^\w{5,12}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/
    	
    	$("#Register").click(function(){
    		$("#joinBtn").click();
    	})
    			
    	if("${isMember}" == "false"){
    		<%
    			request.getSession().removeAttribute("isMember");
    		%>
    		alert("가입된 회원이 아니거나 아이디 또는 비밀번호가 틀렸습니다.");
  		}
    	
    	if("${isCreat}" == "1"){
    		alert("회원가입에 성공하였습니다.");
    		<%
				request.getSession().removeAttribute("isCreat");
			%>
    	}else if("${isCreat}" == "0"){
    		alert("서버오류로 인하여 회원가입이 되지 못하였습니다.")
    		<%
				request.getSession().removeAttribute("isCreat");
			%>
    	}
    	
    	$("#f1_join").submit(function(e){
    		$("#idReg").hide();
    		$("#idSamReg").hide();
    		$("#nickReg").hide();
    		$("#nickSamReg").hide();
    		$("#passReg").hide();
    		$("#emailReg").hide();
    		$("#passSamReg").hide();
    		
    		for(var i=0 ; i<5 ; i++){
    			if($("#join"+i).val()==""){
    				alert("입력란에 공백이 존재합니다.");
    				return false;
    			}
    		}
    		
    		if(!idReg.test($("#join0").val())){
    			$("#idReg").show();
    			return false;
    		}else{
    			$("input[name='listMem_userid']").each(function(i, element){
    				if($("#join0").val()==$(this).val()){
    					$("#idSamReg").show();
    					e.preventDefault();
    				}
      			})
    		}
    		
    		if(!nickReg.test($("#join1").val())){
    			$("#nickReg").show();
    			return false;
    		}else{
    			$("input[name='listMem_nickname']").each(function(i, element){
    				if($("#join1").val()==$(this).val()){
    					$("#nickSamReg").show();
    					e.preventDefault();
    				}
      			})
    		}
    		
    		if(passReg1.test($("#join2").val())==true && passReg2.test($("#join2").val())!=true){
    		}else{
    			$("#passReg").show();
    			return false;
    		}
    		
    		if(!emailReg.test($("#join4").val())){
    			$("#emailReg").show();
    			return false;
    		}
    		
    		if($("#join2").val()!=$("#join3").val()){
    			$("#passSamReg").show();
    			return false;
    		}
    	})
    	
    	var upload = document.getElementsByTagName("input")[4];
		var holder = document.getElementById("userpic");
		
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
				img.src = "/TBR_community/resources/dist/img/user_offline.png";
			}else{
				img.src = event.target.result;
			}
			img.style.width = "100%";
			img.style.height = "100%";
			img.classList.add('img-circle');
			
			holder.innerHTML = '';
			holder.appendChild(img);
		
		}
    });
    </script>
  </body>
</html>
<!-- memo
$('input').iCheck({
	checkboxClass: 'icheckbox_square-blue',
	radioClass: 'iradio_square-blue',
	increaseArea: '20%' // optional
});

e.preventDefault();

 -->