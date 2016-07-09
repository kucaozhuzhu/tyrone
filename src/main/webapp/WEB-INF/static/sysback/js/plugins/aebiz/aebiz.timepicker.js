	// 调用时间选择插件timepicker的js
  $(function(){
    if ($('.timepick').length > 0) {
      $('.timepick').timepicker({
        defaultTime: 'current',   //默认时间
        minuteStep: 1,  //分钟加减时每次加减的最小时间
        disableFocus: true,
        template: 'dropdown'
      });
    }
  });