//页面头部公共js
$(function(){
	//点击折叠左侧边栏
  $('.toggle-nav').click(function(e) {
      e.preventDefault();
      hideNav();
  });
 //main-nav选中状态效果
  $('.main-nav li').click(function(){
 	 $(this).addClass('active').siblings().removeClass('active');
 	})
});
