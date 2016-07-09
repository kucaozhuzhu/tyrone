//ҳ���Ҳ����幫��js
$(function(){
	//.scrollable�����������������
	if ($(".scrollable").length > 0) {
	    $('.scrollable').each(function() {
	        var $el = $(this);
	        var height = parseInt($el.attr('data-height')),
	            vis = ($el.attr("data-visible") == "true") ? true : false,
	            start = ($el.attr("data-start") == "bottom") ? "bottom" : "top";
	        var opt = {
	            height: height,
	            color: "#666",
	            start: start,
	            allowPageScroll: true
	        };
	        if (vis) {
	            opt.alwaysVisible = true;
	            opt.disabledFadeOut = true;
	        }
	        $el.slimScroll(opt);
	    });
	};
	    
	//����bootstrap��popover���
	$("[rel=popover]").popover();
	
	// Tooltips (only for desktop) (bootstrap tooltips) ����bootstrap��title�������tooltip
	var mobile = false,
	    tooltipOnlyForDesktop = true,
	    notifyActivatedSelector = 'button-active';
	if (/Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent)) {
	    mobile = true;
	}
	if (tooltipOnlyForDesktop) {
	    if (!mobile) {
	        $('[rel=tooltip]').tooltip();
	    }
	};
	 //���ҳ�津���ر���൯�����¼�
  $('body').click(function(){
  	if($('.cloned',parent.document).length>0){
    	$(window.parent.document).find("body").trigger("click");
    }
  });
  //.boxģ�� �������չ��(slideToggle)�¼�
  $(".content-slideUp").click(function(e) {
      e.preventDefault();
      var $el = $(this),
          content = $el.parents('.box').find(".box-content");
      content.slideToggle('fast', function() {
          $el.find("i").toggleClass('icon-angle-up').toggleClass("icon-angle-down");
          if (!$el.find("i").hasClass("icon-angle-up")) {
              if (content.hasClass('scrollable')) slimScrollUpdate(content);
          } else {
              if (content.hasClass('scrollable')) destroySlimscroll(content);
          }
      });
  });
});

$(window).resize(function(){
	 //ҳ���ȱ仯ʱ����������datatable�Ŀ��
	 if ($('.dataTable').length > 0) {
        var table = $.fn.dataTable.fnTables(true); //this gets all visible dataTables...  --add by ddy      
        if (table.length > 0) {
            $(table).each(function() {
                if ($(this).hasClass("dataTable-scroller")) {
                    $(this).dataTable().fnDraw();
                }
                $(this).css("width", '100%');
            });
            $(table).dataTable().fnAdjustColumnSizing(); //this  adjusts a given dataTable --add by ddy
        }
    }
    
		//ҳ���ȱ仯ʱ����������calendar�ı��༭���Ŀ��
    if ($(".calendar").length > 0) {
        $(".calendar").fullCalendar("render");
    }	
});

