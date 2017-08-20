<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.c-day:HOVER {
	background: red;
	cursor: pointer;
}
#sch_popup{
	border-radius:3px;
	box-shadow: 3px 3px 3px black;
	background: #FFF0F0;
	position:absolute;
	z-index: 10;
	padding-left:5px;
	padding-right: 5px;
}
th{
	padding:5px;
	text-align: center;
}
#sch_see{
	color:#282828;
	border-bottom: 1px solid #dcdcdc;
}
#sch_sub, #sch_mod{
	color:#282828;
}
#sch_see:HOVER{
	background: #FFC8C8;
}
#sch_sub:HOVER{
	background: #FFC8C8;
}
#sch_mod:HOVER{
	background: #FFC8C8;
}
.c-event-body{
	padding: 10px;
}
#sch_text{
	width: 100%;
	height: 150px;
	margin-top: 10px;
}
#f1_sch{
	display: none;
}
#schAll{
	display: none;
	
}
</style>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/jquery.e-calendar.css"/>
<script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dist/js/jquery.e-calendar.js"></script>
<body>
<div class="wrap_content">			
	<h2 style="text-align: center;">schedule 관리</h2>
 	<div id="calendar"></div>
	<div id="schAll"></div>
		
 	<script src="${pageContext.request.contextPath}/resources/handlebars-v4.0.10.js"></script>
	<script id="temp" type="text/x-handlebars-template">
		{{#each.}}
			<input type="hidden" value="{{year}}" name="listSch{{@index}}">
    		<input type="hidden" value="{{month}}" name="listSch{{@index}}">
    		<input type="hidden" value="{{day}}" name="listSch{{@index}}">
    		<input type="hidden" value="{{schedule}}" name="listSch{{@index}}">
		{{/each}}
		<input type="hidden" value="{{length}}" name="listSchLength">
	</script>					
</div>

<script>
	$(function(){
		var day;
		var cDay;
		var init=0;
		var i=0;
	
		scheduleAll();
		
		$('#calendar').eCalendar();
		
		if(window.name != 'reload') {
			window.name = 'reload';
			init=1700;
		}
		
		setTimeout( function(){
			var YM = setDate($(".c-month").text());
			setSchedule(YM);
		}, init);
			
		$(document).on("click", ".c-previous", function(){
			var YM = setDate($(this).next().text());
			YM[0] = parseInt(YM[0])-1;
			if(YM[0] == 0){
				YM[0] = 12;
				YM[1]--;
			}
			setSchedule(YM);
		})
		
		$(document).on("click", ".c-next", function(){
			var YM = setDate($(this).prev().text());
			YM[0] = parseInt(YM[0])+1;
			if(YM[0] == 13){
				YM[0] = 1;
				YM[1]++;
			}
			setSchedule(YM);
		})
		
		$(document).on("click", ".c-day", function(){
			day = $(this).text();
			if($(this).children().length <= 0){
				$("#sch_popup").remove();
				if($(this).css("color") == "rgb(255, 165, 0)"){
					$(this).append("<div id='sch_popup'><table><tr><th id='sch_see'>스케줄 보기</th></tr><tr><th id='sch_mod'>스케줄 수정하기</th></tr></table></div>");
				}else{
					$(this).append("<div id='sch_popup'><table><tr><th id='sch_see'>스케줄 보기</th></tr><tr><th id='sch_sub'>스케줄 등록하기</th></tr></table></div>");
				}	
			}else{
				$(this).children().remove();
			}
		})
		
		$(document).on("click", "#sch_see", function(){
			var YM = setDate($(".c-month").text());		
			if($(this).parent().css("color") == "rgb(255, 165, 0)"){
				schduleByNo(YM[1], YM[0], day, "see");
			}else{
				$(".c-event-body").html("<b>스케줄 없음</b>");
			}
		})
		
		$(document).on("click", "#sch_sub", function(){
			var YM = setDate($(".c-month").text());
			$(".c-event-body").html("<b>"+YM[1]+"/"+YM[0]+"/"+day+"</b><textarea id='sch_text'></textarea><button id='subBtn'>등록</button>");
		})
		
		$(document).on("click", "#sch_mod", function(){
			var YM = setDate($(".c-month").text());		
			schduleByNo(YM[1], YM[0], day, "mod");
		})
		
		$(document).on("click", "#subBtn", function(){
			var YM = setDate($(".c-month").text());
			day = day.substring(0, day.indexOf('스'));
			
			var sendData = {
				year:YM[1],
				month:YM[0],
				day:day,
				schedule:$("#sch_text").val()
			};
			
			$.ajax({
				url:"${pageContext.request.contextPath}/schedule/sub",
				type:"post",
				dataType:"text",
				data:JSON.stringify(sendData),
				headers:{"Content-Type":"application/json"},
				success:function(data){
					console.log(data);
					$(".c-event-body").html("<b>"+YM[1]+"/"+YM[0]+"/"+day+"</b><textarea disabled id='sch_text'>"+$("#sch_text").val()+"</textarea>");
					$(".c-day").each(function(ei, element){
						if($(this).text()==day){
							$(this).css("color","orange");
						}
					})
					scheduleAll();
				}
			})	
		})
		
		$(document).on("click", "#modBtn", function(){
			var YM = setDate($(".c-month").text());
			day = day.substring(0, day.indexOf('스'));
			
			var sendData = {
				year:YM[1],
				month:YM[0],
				day:day,
				schedule:$("#sch_text").val()
			};
			
			$.ajax({
				url:"${pageContext.request.contextPath}/schedule/mod",
				type:"post",
				dataType:"text",
				data:JSON.stringify(sendData),
				headers:{"Content-Type":"application/json"},
				success:function(data){
					console.log(data);
					$(".c-event-body").html("<b>"+YM[1]+"/"+YM[0]+"/"+day+"</b><textarea disabled id='sch_text'>"+$("#sch_text").val()+"</textarea>");
					scheduleAll();
				}
			})	
		})
		
		$(document).on("click", "#delBtn", function(){
			var YM = setDate($(".c-month").text());
			day = day.substring(0, day.indexOf('스'));
			
			var sendData = {
				year:YM[1],
				month:YM[0],
				day:day
			};
			
			$.ajax({
				url:"${pageContext.request.contextPath}/schedule/del",
				type:"post",
				dataType:"text",
				data:JSON.stringify(sendData),
				headers:{"Content-Type":"application/json"},
				success:function(data){
					console.log(data);
					$(".c-event-body").html("<b>스케줄 없음</b>");
					$(".c-day").each(function(ei, element){
						if($(this).text()==day){
							$(this).css("color","rgb(51, 51, 51)");
						}
					})
					scheduleAll();
				}
			})	
		})
	})
	
	function scheduleAll(){
			$.ajax({
				url:"${pageContext.request.contextPath}/schedule/all",
				type:"get",
				dataType:"json",
				success:function(data){
				console.log(data);
				var source = $("#temp").html();
				var template = Handlebars.compile(source);
				$("#schAll").html(template(data));
			}
		})
	}
	
	function schduleByNo(year, month, day, act){
		var sendData = {
			year:year,
			month:month,
			day:day
		};
		
		$.ajax({
			url:"${pageContext.request.contextPath}/schedule/byNo",
			type:"post",
			dataType:"text",
			data:JSON.stringify(sendData),
			headers:{"Content-Type":"application/json"},
			success:function(data){
				if(act == "see"){
					$(".c-event-body").html("<b>"+year+"/"+month+"/"+day+"</b><textarea disabled id='sch_text'>"+data+"</textarea>");
				}else if(act == "mod"){
					$(".c-event-body").html("<b>"+year+"/"+month+"/"+day+"</b><textarea id='sch_text'>"+data+"</textarea><button id='modBtn'>수정</button><button id='delBtn'>삭제</button>");
				}
			}
		})
	}
	
	function setSchedule(YM){
		var j = 0;
		var listSchLength = $("input[name='listSchLength']").val();
		for(var i=0 ; i<listSchLength ; i++){
			var k=0;
	
			$("input[name='listSch"+i+"']").each(function(ei, element){
				if(j==2){
					cDay = $(this).val();
					$(".c-day").each(function(ei, element){
						if($(this).text()==cDay){	
							$(this).css("color","orange");
						}
					})
					j=0;
				}
				if((ei==0 || ei==1)&&($(this).val() == YM[1] || $(this).val() == YM[0])){	
					j++;
				}
			})
			j=0;
		}
	}
	
	function setDate(month){
		var setYM = month.split(" ");
		setYM[0] = setMonth(setYM[0]);
		return setYM;
	}
	
	function setMonth(month){
		switch(month){
		case "January":
			month = "1";
			break;
		case "February":
			month = "2";
			break;
		case "March":
			month = "3";
			break;
		case "April":
			month = "4";
			break;
		case "May":
			month = "5";
			break;
		case "June":
			month = "6";
			break;
		case "July":
			month = "7";
			break;
		case "August":
			month = "8";
			break;
		case "September":
			month = "9";
			break;
		case "October":
			month = "10";
			break;
		case "November":
			month = "11";
			break;
		case "December":
			month = "12";
			break;	
		}
		return month;
	}
</script>
</body>
</html>

<!-- memo
	$(this).closest('.c-day').find("#sch_see").text()
	
	setTimeout( function(){
		$(".c-day").each(function(i, element){
			alert(cDay);
			if($(this).text()==cDay){
				$(this).css("color","orange");
			}
		})
	});
	
	window.location.reload(true);
	
	var dd = $("input[name='"+$("input[value='"+day+"']").attr("name")+"']").eq(3).val();
	
	headers:{"Content-Type":"application/json"},
	
	<c:forEach var="listSch" items="${listSchedule }" varStatus="vs">
    	<input type="hidden" value="${listSch.year }" name="listSch${vs.index }">
    	<input type="hidden" value="${listSch.month }" name="listSch${vs.index }">
    	<input type="hidden" value="${listSch.day }" name="listSch${vs.index }">
    	<input type="hidden" value="${listSch.schedule }" name="listSch${vs.index }">
    <c:if test="${vs.last }">
    	<input type="hidden" value="${vs.index }" name="listSchLength">
    </c:if>
    </c:forEach>
    
    $('#calendar').load(document.URL +  '#calendar');
    
    var currentLocation = window.location;
	$('#calendar').load(currentLocation + "#calendar");
	
	if(window.name != 'reload') {
		window.name = 'reload';
		window.location.reload(true);
	}
	else window.name = '';
 -->