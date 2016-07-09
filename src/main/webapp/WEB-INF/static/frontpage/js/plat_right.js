//平台右侧购物车js

//右侧购物车、收藏信息的显示事件
function y_rtctlopen(){
	$(".y_rtfixbx").addClass("y_showrt");
	$(".y_ifixed").removeClass("y_rtcthide");
	$(document).one("click", function () {
  	y_rtctloclose();
  });
};

//右侧购物车、收藏信息的关闭事件
function y_rtctloclose(){
	$(".y_rtfixbx").removeClass("y_showrt");
	$(".y_rtctbx").removeClass("y_rtmsshow");
	$(".y_rtfixbx").animate({width:"35px"},300);
	$("#qiao-icon-wrap").animate({right:"5px"},300);
};

$(function(){
	//返回顶部js
	$(".y_ifixed .y_totop").click(function(){
		$("html,body").animate({scrollTop:'0px'},300);
	});
	
	$(".y_rtfixbx").click(function (event) {
		event.stopPropagation();
	});
	
	//右侧导航登录后 点击购物车弹出、关闭购物车信息
	$(".y_rtfixbx").on("click",".y_rtcart",function(){
		if(!$(".y_rtctbx").is(".y_rtmsshow")){
			y_rtctlopen();
			$(".y_rtctbx").addClass("y_rtmsshow");
			$(".y_rtfixbx").animate({width:"310px"},300);
			$("#qiao-icon-wrap").animate({right:"280px"},300);
		}else{
			y_rtctloclose();
		};
	});
	//右侧购物车或收藏显示时，关闭按钮的事件
	$(".y_closertms").click(function(){
		y_rtctloclose();
	});
});