/**
 * @author Charlie
 */
function newWindow(url) {
	window.open(url,"prepPrint","width=700, height=1000, menubar = no, titlebar = no, toolbar = no, location = no");
}

$(document).ready(function() {
       $("#calendar").datepicker({ dateFormat: 'MM d, yy', onSelect: function(dateText, inst) {
            $("#calendar").slideUp();
            document.getElementById("showDate").innerHTML = dateText;
            parent.document.getElementById("headerSet").rows = "115,*";
            $.ajax({
                dataType:'script',
                type:'post',
                url:'users/update_showdate?showdate='+dateText,
                success: function(){
                    // Reload Users/Index so it shows the new date's contents
                    var showFrame = top.frames["showFrame"];
                    showFrame.location.reload(true);
                }});
            }}).hide();
       $("#calImg").click(function(){
                    $("#calendar").slideDown();
                    parent.document.getElementById("headerSet").rows = "200px,*";
                    });

});
