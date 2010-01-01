$(document).ready(function (){
    $(".delete").click(deleteDiv);
    $('#update_link').hide();
    
    // This is to handle the Delete Button on the Panels.
    function deleteDiv() {
        //Grabs the whole div and hides it. 
        $(this).parents(".content").animate({ opacity: "hide" }, 500);
        var prepFrame = top.frames['prepFrame'];
        var content = $(this).closest('.content');
        content = $(content).attr('id');
        content_id = content.substr(8);
        //The Span added around the content.body in panels.index
        //was causing the $content to not return to fadeTo(1).
        //If statement added to create effect on both if the
        //Span is present.
        if (prepFrame.document.getElementById("span"+content_id)) {
            var $span = prepFrame.document.getElementById("span"+content_id);
            $($span).fadeTo('slow', 1);
        }
        var $content = prepFrame.document.getElementById('content_'+content_id);
        $($content).fadeTo('slow', 1);
        var $addDot = prepFrame.document.getElementById('dot_content_'+content_id);
        $($addDot).css('visibility', 'visible');
    }

    $('#update_link').click(function(){
        var showFrame = top.frames["showFrame"];
        showFrame.location.reload();
        return false;

    });
});
