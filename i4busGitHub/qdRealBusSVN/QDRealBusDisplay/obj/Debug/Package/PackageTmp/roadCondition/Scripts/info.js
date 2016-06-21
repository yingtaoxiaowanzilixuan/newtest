$(function() 
{
	 $("#infoBox")
	.css( 
	{
	   "background":"rgba(255,255,255,1)"
	  
	})
	.dialog({ autoOpen: false, 
		show: { effect: 'fade', duration: 500 },
		hide: { effect: 'fade', duration: 500 } 
	});
	
	 $("#infoButton")
       .text("") // sets text to empty
	.css(
	{ "z-index":"10000",
	  "background": "#002847", "opacity": "0.9", 
	  "position":"absolute", "top":"4px", "right":"4px",
      "border":"none"
	}) // adds CSS
    .append("<img width='28' height='28' src='../../roadCondition/images/icon-info.png'/>")
    .button()
	.click( 
		function() 
		{ 
			$("#infoBox").dialog("open");
		});
});