//B2B2Cǰ̨ҳ�湫��js
$(function(){
	//ͷ�������л�������¼�
	$(".y_serlist").hover(function(){
		$(this).addClass("y_hover");
	},function(){
		$(this).removeClass("y_hover");
	});
	$(".y_serlist ul li").click(function(){
		$(".y_serlist .y_serspan").text($(this).text());
		$(this).parents(".y_serlist").removeClass("y_hover");	
	});

	//����ҳ������ҳ���������ȫ����Ʒ����ʱչʾ������
	$(".m_nav").on('mouseenter','.y_produall',function(){

		$(this).find('.m_meun_box').show();
	});
	$(".m_nav").on('mouseleave','.y_produall',function(){
		$(this).find('.m_meun_box').hide();
	});
	
	//��¼�������û�����������֤�ɹ��������¼��ť�ı䰴ť���ֵ��¼�
	//$('#y_loadlogin').on('click', function () {
	//  var $btn = $(this).button('loading');
	//  $btn.button('reset') 
	//});
	
	//����ҳ������ҳ���������ȫ����Ʒ����ʱչʾ������
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
	 
	//����.progress-animate��data-width���Զ�̬����Ԫ�صĿ�ȣ����ҳ��������jquery.appear.js�������Ԫ������λ�ò����÷���Ĭ������
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
	 
	//���÷Ŵ�ͼprettyPhoto�����js,����ҳ�Ŵ�ͼ��Сͼ��ɹ���õ���
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
	//����css3 animation������js wow.js���¼���ҳ�������Ԫ������λ��ʱִ��css3������
	if (typeof WOW === 'function') {
		new WOW({
			boxClass:     'wow',      // default
			animateClass: 'animated', // default
			offset:       0          // default
		}).init();
	};
});