//ҳ������������js

$(function(){
	//����������������������������ʽ
  $("#left-box").niceScroll({
    cursorborder: 0,
    cursorcolor: '#999',
    railoffset: {
        top: 0,
        left: -2
    },
    autohidemode: false,
    horizrailenabled: false
	});
	
	//���������Ӽ�li�����data-trigger="hover"���ԣ����������ʱ����ʾ������˵�
  $('.subnav-menu > li').hover(function() {
      if ($(this).attr("data-trigger") == "hover") {
          if ($(this).parents(".subnav-menu").length > 0) {
              $(this).find(">a").trigger("click");
          } else {
              $(this).closest('.dropdown-menu').stop(true, true).show();
              $(this).addClass('open');
          }
      }
  }, function() {
      if ($(this).attr("data-trigger") == "hover") {
          $(this).closest('.dropdown-menu').stop(true, true).hide();
          $(this).removeClass('open');
      }
  });
  
  //����������ͨ���������ӵ�body�Ķ����˵�
	function scrolledClone($el, $cloned) {
	    $cloned.remove();
	    $el.parent().removeClass("open");
	}
  
  //��������data-toggle=dropdown���Ե�a��ǩ(�ж����˵���)�ĵ���¼�
  $(".subnav-menu > li > a[data-toggle=dropdown]").click(function() {
  		
      // Clone dropdown menu to body
      var $el = $(this);
      // Remove open clones
      $('.cloned',parent.document).remove();
      var $ulToClone = $el.next();
      var offset = $el.offset();
      var bdheight= $("body").height();
      var uiheight= $ulToClone.height();
      var uitop;
      if(!$el.parent().is(".open")){
      	if(uiheight+offset.top > bdheight){
      		uitop = offset.top+55-uiheight;
      	}else{
      		uitop = offset.top+40;
      	}
      	var $cloned = $ulToClone.clone().css({
          top: uitop,
          left: offset.left + $("#left-box").width()
	      }).show().addClass("cloned");
	      $('body',parent.document).append($cloned);
      }
      $ulToClone.hide();
      // if($("#left").hasClass("mobile-show")){
      // close when clicked
      $("body").click(function(e) {
		  	if($('.cloned',parent.document).length>0){
		      var target = $(e.target);
		      if (target.parents(".cloned").length == 0 && target.attr("data-toggle") != "dropdown") {
		          // close all
		          $(".subnav-menu > li").removeClass("open");
		          $('.cloned',parent.document).remove();
		      }
		    }
		  });
      // }
			//����������ͨ���������ӵ�body�Ķ����˵�
			//function scrolledClone($el, $cloned) {
			//    $cloned.remove();
			//    $el.parent().removeClass("open");
			//}
      // $("body").on("mouseleave", '.cloned', function(){
      //     $el.parent().removeClass("open");
      //     $cloned.remove();
      // });
  });
  
	
	//���Ԫ����.subnav-hidden�࣬��Ĭ���������Ӽ������������������һ���Ӳ˵���
  $(".subnav-hidden").each(function() {
      if ($(this).find(".subnav-menu").is(":visible")) $(this).find(".subnav-menu").hide();
  });
  
  //ҳ��������� ������� չ���������ӷ���
  $(".toggle-subnav").click(function(e) {
      e.preventDefault();
      var $el = $(this);
      $el.parents(".subnav").toggleClass("subnav-hidden").find('.subnav-menu,.subnav-content').slideToggle("fast");
      $el.find("i").toggleClass("icon-angle-down").toggleClass("icon-angle-right");
      $("#left").getNiceScroll().resize().show();
  });
  //ҳ���������������ÿ���ק��� 
  $("#left-box").sortable({  //���ò��,���õ�ѡ����Ϊ����קԪ�ص�����Ԫ�أ������Ԫ�ؼ�����ui-sortable
      items: ".subnav", //items ��קԪ��ѡ����
      placeholder: "widget-placeholder",  //��קʱ������ռλԪ��(��ɫ�������߿���Ǹ�)������
      forcePlaceholderSize: true,  //ռλԪ�صĸ߶��Ƿ�����קԪ�ر���һ��,Ϊfalseʱû�и߶ȣ�����css�ж���
      axis: "y",  //����ק���ᣬΪyʱ������y���Ͽ���ק��Ϊxʱ������x���Ͽ���ק������ֵ���ǿ�������ק
      handle: ".subnav-title",  //����϶��ĸ�ѡ����������קitems��קԪ��
      tolerance: "pointer"
  });
  //subnav-menu ��li���ʱ���ѡ��Ч��
  $('.subnav-menu li').click(function(){
    $(this).parents('.subnav-menu').addClass('active').siblings().removeClass('active');
    $(this).parents('.subnav').siblings().find('.subnav-menu').removeClass('active'); 
  })
  
  
});	
