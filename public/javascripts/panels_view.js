/**
 * @author Charlie
 */
jQuery.ajaxSetup({
	'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

 $(document).ready(function () {
 	$(".filling").hide();
        $('.sent_content').fadeTo('slow', 0.33);
        
		$(".title").click(function() {
                                var panel = $(this).parent(".panel");
                                var panel_id = panel.attr("id");
				var $nextSpan = $(this).next("span");
				var $spanVisible = $(this).next("span:visible");
				
				if ($spanVisible.length) {
					$spanVisible.hide("slow");
					} else {
						$("span:visible").hide("slow");
						$nextSpan.show("slow");
						}
				var $greenDot = $(this).siblings(".greendot");
				if ($($greenDot).is(':visible')) {
					$($greenDot).fadeTo("slow",0).hide();
                                        panel_id = panel_id.substr(5);
                                        $.ajax({dataType:'script', type:'post', url:'panels/add_visuals?panel_id='+panel_id});
					} 
			});
		

	$(".add_dot").click(function (){
                var $theParent = $(this).closest("div");
		$($theParent).fadeTo("slow",0.33);
		$(this).css('visibility', 'hidden');
                var $showFrame = top.frames["showFrame"];
                var $updateLink = $showFrame.document.getElementById('update_link');
                if ($($updateLink).is(':hidden')){
                    $($updateLink).effect("highlight", {}, 3000);
                }
	});

        $('#titles').change(function(){
           var title_field = document.getElementById('panel_title');
           title_field.value = this[this.selectedIndex].text;
        });

 });
