//TCLǰ̨ҳ�湫��js

$(function(){
	//ͷ��������js
	$(".header_serch .serch_btn").click(function(){
		if(!$(this).parents(".header_serch").hasClass("active")){
			$(this).parents(".header_serch").addClass("active");
			$(".tcl_header").addClass("active");
			$(document).one("click", function () {
	    	$(".header_serch").removeClass("active");
	    	$(".tcl_header").removeClass("active");
	    });
		setTimeout(function(){$('#keyword').focus();}, 500);
	    return false;
		};
	});
	$(".header_serch").click(function (event) {
	  event.stopPropagation();
	});
	
	//���÷Ŵ�ͼprettyPhoto�����js,����ҳ�鿴ͼ���õ���
	if ($.fn.prettyPhoto) {
		$("a[data-rel^='prettyPhoto']").prettyPhoto({
			hook: 'data-rel',
      animation_speed: 'fast',
      slideshow: 6000,
      autoplay_slideshow: true,
      show_title: false,
      deeplinking: false,
      social_tools: '',
      overlay_gallery: true,
			theme: 'light_square'
		});
	};
	
	/*��ѡ��ģ��*/
	$(".r_radio").click(function(){
		$(this).toggleClass("r_selected").siblings(".r_radio").removeClass("r_selected");
		$(this).parent().siblings().find(".r_radio").removeClass("r_selected");
	});		
		//��ѡ���Ż�
	$(".m_checkbox").click(function(){
		if($(this).attr("data-click")=="false"){
			return;
	  }else{
	  	$(this).toggleClass("m_checkbox_in");	
	  }
	});
	
	/*��ť�Ĳ��ɵ��*/
	$(".disabled,[disabled]").click(function(){
		return false;
	})
	

   
//���ض���
	$(window).scroll(function(){
		if ($(window).scrollTop()>100){
			$(".gobacktop").show();
		}else{
			$(".gobacktop").hide();
		}
	});
	$(".gobacktop").click(function(){
	  $('body,html').animate({scrollTop:0},500);
		return false;
	});
	
	//右侧导航
		$(".right_rose li").hover(function (){
		 	$(this).addClass("m_cur");
		},function(){
		  $(this).removeClass("m_cur");
		 
		});
	
	//ҳ��С��һ���߶�ҳ�涨λ���ײ�
	/*
	var $m_height =$("body").height(),
	    $window =$(window).height();
	 if ($m_height < $window){
	 	$(".tcl_footer").addClass("m_position");
	 }
	$(window).resize(function(){
		$(".tcl_footer").removeClass("m_position");
		var $m_height =$("body").height(),
	      $window =$(window).height();
	   if ($m_height < $window){
	   	$(".tcl_footer").addClass("m_position");
	   }
	});
	*/
});

$(window).on('load', function() {
	//调用css3 animation动画的js wow.js的事件（页面滚动到元素所在位置时执行css3动画）
	if (typeof WOW === 'function') {
		new WOW({
			boxClass:     'wow',      // default
			animateClass: 'animated', // default
			offset:       0          // default
		}).init();
	};
});


