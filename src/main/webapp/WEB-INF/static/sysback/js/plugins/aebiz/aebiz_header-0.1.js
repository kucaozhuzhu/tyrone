//ҳ��ͷ������js
$(function(){
	//����۵�������
  $('.toggle-nav').click(function(e) {
      e.preventDefault();
      hideNav();
  });
 //main-navѡ��״̬Ч��
  $('.main-nav li').click(function(){
 	 $(this).addClass('active').siblings().removeClass('active');
 	})
});
