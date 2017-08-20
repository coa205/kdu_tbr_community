$(function(){
	
	$("#coin-slider").coinslider();
	
	$("#top_hanbit").attr("style","width: 400px;");
	
	/*window.onload = function(){
		setTimeout(function(){
			scrollTo(0,0);
		})
	}*/
	
	$(".navi_set").hover(function() {
		$(this).find(".subnav").finish().slideDown('normal').show();
		}, function(){  
			$(this).find(".subnav").finish().slideUp('fast'); 
	});

	$("#wrap_icon a").children().hover(function() {
		var hoverIcon = $(this).attr("src").substring(6, 20);
		$(this).attr("src", "image/"+hoverIcon+"_hover.png");
	}, function() {
		var blurIcon = $(this).attr("src").replace("_hover", "");
		$(this).attr("src", blurIcon);
	});

	$("#best_books a").children().hover(function() {
		var hoverIcon = $(this).attr("src").substring(6, 20);
		$(this).attr("src", "image/"+hoverIcon+"_hover.png");
	}, function() {
		var blurIcon = $(this).attr("src").replace("_hover", "");
		$(this).attr("src", blurIcon);
	});

	$(".subnav li").click(function() {
		location.href="#";
	});

	var onTab=$("#tabmenu dt a:first");

	$("#tabmenu dt a").on("mouseover focus click",function(){
		$("#tabmenu dd:visible").hide();
		
		$("img",onTab).attr("src",$("img",onTab).attr("src").replace("over.gif",
		"out.gif"));
		
		$(this).parent().next().show();
		
		$("img",this).attr("src",$("img",this).attr("src").replace("out.gif","over.gif"));
		
		onTab=$(this);
		return false;
	});

	$("#online_study_content img").each(function(i, element) {
		$(this).click(function(){
			if(i<6 && i>2){
				$(this).finish().animate({"width":"0","height":"0"}, 1000);
				$(this).hide();
				$("#close").hide();
			}else{
				var studyArr =[null,null,null,null,null,null,
					".ex_bigdata",".ex_sw",".ex_security"];
				$(studyArr[i]).show();
				var imgObj = $(studyArr[i]);
				imgObj.finish().animate({"width":"800px","height":"700px"}, 1000);
				imgObj.queue(function(){
					imgObj.css({"border":"2px solid black",
							"border-radius":"20px",
							"box-shadow":"5px 5px 5px black"});
					$(this).dequeue();
				});
				imgObj.fadeOut("fast").fadeIn("fast");
				$("#close").finish().fadeIn("fast").show();
			}
		});
	});

	var key=0;
	setInterval(function() {
		if(key==0){
			$("#icon_click").attr("src","image/icon_click2.png");
			key++;
		}else{
			$("#icon_click").attr("src","image/icon_click.png");
			key=0;
		}	
	}, 500);

	var mySwipe = $('#mySwipe').Swipe({
		auto: 3000,
		continuous: true,
		callback: function(index, element){
			$(".touch_bullet .active")
			.attr("src",$(".touch_bullet .active")
			.attr("src").replace("on.png","off.png"))
			.removeClass("active");
			
			$(".touch_bullet img").eq(index)
			.attr("src",$(".touch_bullet img").eq(index)
			.attr("src").replace("off.png","on.png"))
			.addClass("active");
		}
	}).data('Swipe');


	$(".touch_left_btn a").on("click",function(){
		mySwipe.prev();
		return false;
	});

	$(".touch_right_btn a").on("click",function(){
		mySwipe.next();
		return false;
	});

	var mySlider=$("#best_bg ul").bxSlider({
		mode:"horizontal",
		speed:500,
		pager:false,
		moveSlides:1,
		slideWidth:125,
		minSlides:5,
		maxSlides:5,
		slideMargin:30,
		auto:true,
		autoHover:true,
		controls:false
	});

	$(".prev_btn").on("click",function(){
		mySlider.goToPrevSlide();
		return false;
	});

	$(".next_btn").on("click",function(){
		mySlider.goToNextSlide();
		return false;
	});

	$.ajax({
		url:"https://news.google.com/news?cf=all&hl=ko&pz=1&ned=kr&topic=t&output=rss",
		type:"get",
		dataType:"xml",
		success:function(data){
			var xml = $.parseXML(data.responseText);
			console.log(xml);
			
			$(xml).find("item").each(function(){
				var title = $(this).find("title").text();
				var description = $(this).find("description").text().replace(/(<([^>]+)>)/ig, "");
				var pubDate = $(this).find("pubDate").text();
				var link = $(this).find("link").text();
				
				var li = $("<li>");
				var br = $("<br>");
				var aTag = $("<a>").attr("href",link).html(title);
				var span1 = $("<span id='span1'>").html(pubDate);
				var span2 = $("<span id='span2'>").html(description);
				
				var item = li.append(aTag).append(span1).append(br).append(span2);
				
				$("#list").append(item);
			});
		}
	});

	$(document).on("mouseover focus", "#list li", function(){
		$(this).children("#span2").show();
	});

	$(document).on("mouseout blur", "#list li", function(){
		$(this).children("#span2").hide();
	});

});

