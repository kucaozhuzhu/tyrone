/*��ѡ��ģ��*/
$(function(){
	$(".r_radio").click(function(){
		$(this).toggleClass("r_selected").siblings(".r_radio").removeClass("r_selected");
		$(this).parent().siblings().find(".r_radio").removeClass("r_selected");
	});	
		
	//��ѡ���Ż�
		$(".m_checkbox").click(function(){
			if($(this).attr("data-click")=="false"){
				return;
		  }else{
		  	$(this).toggleClass("m_checkbox_in");	
		  }
		});


//��ѡ���Ż�
		$(".m_checkboxx").click(function(){
			if($(this).attr("data-click")=="false"){
				return;
		  }else{
		  	$(this).toggleClass("m_checkbox_in");	
		  }
		});
});

//�ղ�
		$(function(){
			$(".item .h_like").click(function(){
		  	$(this).toggleClass("h_likein");
	    });
		})