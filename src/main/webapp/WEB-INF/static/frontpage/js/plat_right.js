//ƽ̨�Ҳ๺�ﳵjs

//�Ҳ๺�ﳵ���ղ���Ϣ����ʾ�¼�
function y_rtctlopen(){
	$(".y_rtfixbx").addClass("y_showrt");
	$(".y_ifixed").removeClass("y_rtcthide");
	$(document).one("click", function () {
  	y_rtctloclose();
  });
};

//�Ҳ๺�ﳵ���ղ���Ϣ�Ĺر��¼�
function y_rtctloclose(){
	$(".y_rtfixbx").removeClass("y_showrt");
	$(".y_rtctbx").removeClass("y_rtmsshow");
	$(".y_rtfixbx").animate({width:"35px"},300);
	$("#qiao-icon-wrap").animate({right:"5px"},300);
};

$(function(){
	//���ض���js
	$(".y_ifixed .y_totop").click(function(){
		$("html,body").animate({scrollTop:'0px'},300);
	});
	
	$(".y_rtfixbx").click(function (event) {
		event.stopPropagation();
	});
	
	//�Ҳർ����¼�� ������ﳵ�������رչ��ﳵ��Ϣ
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
	//�Ҳ๺�ﳵ���ղ���ʾʱ���رհ�ť���¼�
	$(".y_closertms").click(function(){
		y_rtctloclose();
	});
});