//B2B2C前台页面公用js
$(function(){
	//头部搜索切换、点击事件
	$(".y_serlist").hover(function(){
		$(this).addClass("y_hover");
	},function(){
		$(this).removeClass("y_hover");
	});
	$(".y_serlist ul li").click(function(){
		$(".y_serlist .y_serspan").text($(this).text());
		$(this).parents(".y_serlist").removeClass("y_hover");	
	});

	//除首页外其他页面鼠标移上全部商品分类时展示分类树
	$(".m_nav").on('mouseenter','.y_produall',function(){

		$(this).find('.m_meun_box').show();
	});
	$(".m_nav").on('mouseleave','.y_produall',function(){
		$(this).find('.m_meun_box').hide();
	});
	
	//登录弹出框用户名、密码验证成功，点击登录按钮改变按钮文字的事件
	//$('#y_loadlogin').on('click', function () {
	//  var $btn = $(this).button('loading');
	//  $btn.button('reset') 
	//});
	
	//除首页外其他页面鼠标移上全部商品分类时展示分类树
   $('.nav_produall .m_meun').hover(function(){
   	 $(this).find('.m_meun_box').show();
 	 },function(){
 		$(this).find('.m_meun_box').hide(); 
 	 });
 	 
 	 // Bootstrap tooltip
 	 if($.fn.tooltip) {
	 	$('.add-tooltip,[rel=tooltip]').tooltip();
	 };
	 
	 // Bootstrap popover
	 if($.fn.popover) {
		 $('.add-popover,[rel=popover]').popover();
	 };
	 
	//根据.progress-animate的data-width属性动态设置元素的宽度，如果页面引入了jquery.appear.js则滚动到元素所在位置才设置否则默认设置
	if ($.fn.appear) {
		$('.progress-animate').appear();
		$('.progress-animate').on('appear', function () {
			var $this = $(this),
				progressVal = $(this).data('width'),
				progressText = $this.find('.progress-text');
			$this.css({ 'width' : progressVal + '%'}, 400);
			progressText.fadeIn(500);
		});
	
	} else {
		$('.progress-animate').each(function () {
			var $this = $(this),
				progressVal = $(this).data('width'),
				progressText = $this.find('.progress-text');
			$this.css({ 'width' : progressVal + '%'}, 400);
			progressText.fadeIn(500);
		});
	}
	 
	//调用放大图prettyPhoto插件的js,详情页放大图的小图和晒单用到了
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