$(document).ready(function () {
    // Goes through all the checkboxes on the page and makes sure
    // none are checked. 
    $(".done").each(function (){
        if (this.checked == true) {
            this.checked = false;
        }
    });
    
   $(".done").click(function (){
       if (this.checked == true) {
      $(this).next("span").fadeTo("slow", 0.4);
       } else {
           $(this).next("span").fadeTo("slow", 1);
       }
   });

});



// Changes the size of the page's fontSize based on the param being "up" or "down"
function changeFont(direction) {
	// Grabs all the P tags on the page
	var p = document.getElementsByTagName("p");
	// A loop to cycle through all the P tags and change the fontSize
	for(var i = 0; i<p.length; i++) {
		if(p[i].style.fontSize) {
			// Chops off the "px" of the fontSize and turns it into an Integer
			var s = parseInt(p[i].style.fontSize.replace("px",""));
			} else {
				var s = 16;
				}
			if(direction == "up") {
				// Additional "if" statements to give limits to the font size
				if(s < 46) {
					s += 2;
				}
			} else {
				if(s > 8) {
					s -= 2;
				}
			}
			// Puts the "px" back on and attaches it to fontSize
			p[i].style.fontSize = s + "px";
		}
            }

