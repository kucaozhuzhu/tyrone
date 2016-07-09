// FLAT Theme v2.0

//����ҳ�沼��Ϊ��Ӧ�̶���Ȳ���
function versionFixed() {
    if ($(window).width() >= 1200) {
        $("#content").addClass("container").removeClass("container-fluid");
        $("#navigation .container-fluid").addClass("container").removeClass("container-fluid");
        if ($("#left").hasClass("sidebar-fixed")) {
            $("#left").css("left", $("#content").offset().left);
        }
    }
}

//����ҳ�沼��Ϊȫ����Ȳ���
function versionFluid() {
    $("#content").addClass("container-fluid").removeClass("container");
    $("#navigation .container").addClass("container-fluid").removeClass("container");
    if ($("body").hasClass("sidebar-right")) {
        $("#left").css("right", 0);
    } else {
        $("#left").css("left", 0);
    }
}

//����������״̬
function checkLeftNav() {
    var $w = $(window),
        $content = $("#content"),
        $left = $("#left");
    if ($w.width() <= 840) {  // ��window���<=840ʱִ���¼�
        if (!$left.hasClass("mobile-show")) {  //������#leftû��.mobile-show��������#left��
            $left.hide();
            $("#main").css("margin-left", 0);
        }
        if ($(".toggle-mobile").length == 0) {  //���ҳ��û��.toggle-mobile�࣬�򴴽����Ԫ��(�����ʾ�������ֻ��µ���)
            $("#navigation .user").before('<a href="#" class="toggle-mobile"><i class="fa fa-bars"></i></a>');
        }

        if ($(".mobile-nav").length == 0) {  //���ҳ��û��.mobile-nav(�ֻ�����)Ԫ�أ��򴴽�һ��
            createSubNav();
        }
    } else {		// ��window���>840ʱִ���¼�
        if (!$left.is(":visible") && !$left.hasClass("forced-hide") && !$("#content").hasClass("nav-hidden")) {  //��������ʱ��ʾ#left
            $left.show();
            $("#main").css("margin-left", $left.width());
        }

        $(".toggle-mobile").remove();
        $(".mobile-nav").removeClass("open");

        if ($content.hasClass("forced-fixed")) {
            $content.removeClass("nav-fixed");
            $("#navigation").removeClass("navbar-fixed-top");
        }

        if ($w.width() < 1200) {
            if ($("#navigation .container").length > 0) {
                versionFluid();
                $('body').addClass("forced-fluid");
            }
        } else {
            if ($('body').hasClass("forced-fluid")) {
                versionFixed();
            }
        }
    }
}

//���������������ק���ĸ߶�
function resizeHandlerHeight() {
    $("#left .ui-resizable-handle").height($(window).height()-40);
}

//�л��ֻ���������ʾ������
function toggleMobileNav() {
    var mobileNav = $(".mobile-nav");
    mobileNav.toggleClass("open");
    mobileNav.find(".open").removeClass("open");
}

//����ҳ��Ԫ�أ������˴����ֻ�������
function getNavElement(current) {
    var currentText = $.trim(current.find(">a").text()),
        element = "";
    element += "<li><a href='" + current.find(">a").attr("href") + "'>" + currentText + "</a>";
    if (current.find(">.dropdown-menu").length > 0) {
        element += getNav(current.find(">.dropdown-menu"));
    }
    element += "</li>";
    return element;
}

var nav = "";

//����ҳ��Ԫ�أ������˴����ֻ�������
function getNav(current) {
    var currentNav = "";
    currentNav += "<ul>";
    current.find(">li").each(function() {
        currentNav += getNavElement($(this));
    });
    currentNav += "</ul>";
    nav = currentNav;
    return currentNav;
}

//���ҳ��û���ֻ��˵ĵ���.mobile-nav���򴴽�һ����ͷ��������ͬ�ṹ���ֻ�����������ӵ���¼���
function createSubNav() {
    if ($(".mobile-nav").length == 0) {
        var original = $("#navigation .main-nav");
        // loop
        var current = original;
        getNav(current);
        $("#navigation").append(nav);
        $("#navigation > ul").last().addClass("mobile-nav");

        $(".mobile-nav > li > a").click(function(e) {
            var el = $(this);
            $("#navigation").getNiceScroll().resize().show();
            if (el.next().length !== 0) {
                e.preventDefault();

                var sub = el.next();
                el.parents(".mobile-nav").find(".open").not(sub).each(function() {
                    var t = $(this);
                    t.removeClass("open");
                    t.prev().find("i").removeClass("icon-angle-down").addClass("icon-angle-left");
                });
                sub.toggleClass("open");
                el.find("i").toggleClass('icon-angle-left').toggleClass("icon-angle-down");
            }
        });
    }
}

//�л���������ʾ������
function hideNav() {
    $("#left").toggle().toggleClass("forced-hide");
    if ($("#left").is(":visible")) {
        $("#main").css("margin-left", $("#left").width());
    } else {
        $("#main").css("margin-left", 0);
    }
}

//����#content�ĸ߶Ⱥ�#left��״̬
function resizeContent() {
	  var height = 40;
	  if ($("#footer").length > 0) {
	      height += $("#footer").outerHeight();
	  }
	  
	  $("#content").css({
	      "min-height": "auto",
	      "height": $(window).height() - height
	  });
	  
	  var isChrome = navigator.userAgent.toLowerCase().match(/chrome/) != null;  //�ж��Ƿ��ǹȸ������
		if(isChrome){
		   $("#main iframe").css("height",$(window).height() - height);
		};
}

//ҳ�����ʱ�����¼���ʵ��ҳ��ĳ�ʼ������
$(document).ready(function() {

    resizeContent(); //����#content�ĸ߶Ⱥ�#left��״̬
		
		//���body��data-mobile-sidebar����=slide,�������һ���ʱ�л�������
    if ($("body").attr("data-mobile-sidebar") == "slide") {
        $("body").touchwipe({
            wipeRight: function() {
                $("#left").show().addClass("mobile-show");
            },
            wipeLeft: function() {
                $("#left").hide().removeClass("mobile-show");
            },
            preventDefaultEvents: false
        });
    }
		
		//���body��data-mobile-sidebar����=button,������ť�л�������
    if ($("body").attr("data-mobile-sidebar") == "button") {
        $(".mobile-sidebar-toggle").click(function(e) {
            e.preventDefault();
            $("#left").toggle().toggleClass("mobile-show");
        });
    }
		
		//ͷ�����Ӽ�li�����data-trigger="hover"���ԣ����������ʱ����ʾ������˵�
    $('.main-nav > li').hover(function() {
        if ($(this).attr("data-trigger") == "hover") {
            $(this).closest('.dropdown-menu').stop(true, true).show();
            $(this).addClass('open');
        }
    }, function() {
        if ($(this).attr("data-trigger") == "hover") {
            $(this).closest('.dropdown-menu').stop(true, true).hide();
            $(this).removeClass('open');
        }
    });
		

    createSubNav();
   
		//���ֻ������л���ť�󶨵���¼�
    $("#navigation").on('click', '.toggle-mobile', function(e) {
        e.preventDefault();
        toggleMobileNav();
    });
		
		//ҳ�����������ȿ��϶����С
    if (!$("#left").hasClass("no-resize")) {  //�ж�#left�Ƿ�����no-resize ���������ִ��
        $("#left").resizable({
            minWidth: 60,    //���϶�Ԫ�ص���С���
            maxWidth: 400,  //���϶�Ԫ�ص�����ȣ��߶�ͬ��Ҳ������
            handles: "e",    //���϶����� e������Ҳ����Ԫ���ұߣ���ѡn/s/e/w/se/sw/nw/ne,����ж��ֵ���м��ö��Ÿ���
            resize: function(event, ui) {   //�϶��ı���ʱִ���¼�
                var searchInput = $('.search-form .search-pane input[type=text]'),
                    content = $("#main");
                searchInput.css({
                    width: ui.size.width - 55   //��ȸı�ʱ�����������Ŀ��Ҳ��֮�ı�Ϊ #left���-55px
                });
                if (Math.abs(200 - ui.size.width) <= 20) {  //���200-����ȵľ���ֵС�ڵ���20 ����Ȱ�200px��
                    $("#left").css("width", 200);
                    searchInput.css("width", 145);
                    content.css("margin-left", 200);
                } else {
                    content.css("margin-left", $("#left").width());
                }

            },
            stop: function() {
                $("#left .ui-resizable-handle").css("background", "none");   //ֹͣʱ�¼�
            },
            start: function() {
                $("#left .ui-resizable-handle").css("background", "#aaa");   //ִ��ʱ�¼�
            }
        });
    }
		
		//���#contentԪ����.nav-hidden�࣬��Ĭ�����ز����
    if ($("#content").hasClass("nav-hidden")) {
        hideNav();
    }

    // set resize handler to corret height
    resizeHandlerHeight();

		//ͷ��������js
    $(".theme-colors > li > span").hover(function(e) {
        var $el = $(this),
            body = $('body');
        body.attr("class", "").addClass("theme-" + $el.attr("class"));
    }, function() {
        var $el = $(this),
            body = $('body');
        if (body.attr("data-theme") !== undefined) {
            body.attr("class", "").addClass(body.attr("data-theme"));
        } else {
            body.attr("class", "");
        }
    }).click(function() {
        var $el = $(this);
        $("body").addClass("theme-" + $el.attr("class")).attr("data-theme", "theme-" + $el.attr("class"));
    });
		
		//ͷ����ť����л�ҳ�沼�ַ�ʽ(ȫ��/��Ӧ�̶����)
    $(".version-toggle > a").click(function(e) {
        e.preventDefault();
        e.stopPropagation();
        var $el = $(this);
        var parent = $el.parent();
        if (!$el.hasClass("active")) {
            parent.find(".active").removeClass("active");
            $el.addClass("active");
        }

        if ($el.hasClass("set-fixed")) {
            versionFixed();
        } else {
            versionFluid();
        }
    });
		
    checkLeftNav();

    // check layout ���body�����������������Ӧ���¼����ı�ҳ���Ĭ�ϲ���
    if ($("body").attr("data-layout") == "fixed") {
        versionFixed();
    }

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
    }
    
    //���ҳ�����ม��������ر���ม����
    $('body').click(function(e){
    	if($('.cloned').length>0){
	      var target = $(e.target);
	      if (!target.is(".cloned")) {
	        $(window.frames["menuFrame"].document).find(".subnav-menu > li").removeClass("open");
	    		$('.cloned').remove();
	      }
	    }
	  });
    
});

$.fn.scrollBottom = function() {
    return $(document).height() - this.scrollTop() - this.height();
};

//ҳ���С�仯���õ��¼�
$(window).resize(function(e) {
    checkLeftNav();
    resizeContent();
    resizeHandlerHeight();
});
