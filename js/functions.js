var ua = navigator.userAgent.toLowerCase(); 
  if (ua.indexOf('safari') != -1) { 
    if (ua.indexOf('chrome') > -1) {
       var chrome = true;// Chrome
    } else {
      var safari = true; // Safari
    }
  } else {
	var browser = true;
  }

$(document).ready(function() {

// hide the mobile header on the front page

if($(window).width() < 640) {
	$('.mobile-alternative').show();
} else {
	$('.mobile-alternative').hide();
}

// Load videoplayer

if(chrome === true){
	$('.controls').hide();
	$('.alternative').hide();
if($(window).width() > 768) {
	
	$.okvideo({
      'source': 'Vfx759x_g1k',
      'adproof': true
  });
  
  // YT player Controls
  
  var playerMuted = 0;
  var playerPaused = 0;

	$('.controls').show();
  
  if(playerPaused === 0) {
		$('.play').hide();
	
	$('.pause').click(function() {
		player.pauseVideo();
		$('.pause').hide();
		$('.play').show();
		playerPaused = 1;
	});
  }
  
  $('.play').click(function() {
		player.playVideo();
		$('.play').hide();
		$('.pause').show();
		playerPaused = 0;
  });
  
  
  if(playerMuted === 0) {
		
		$('.unmute').hide();
  
	  $('.mute').click(function() {
			player.setVolume(70);
			$('.mute').hide();
			$('.unmute').show();
			playerMuted = 1;
	  });
	} 
	
	$('.unmute').click(function() {
		player.setVolume(0);
		playerMuted = 0;
		$('.unmute').hide();
		$('.mute').show();
	});
	}
	else
	{
		$('.controls').hide();
	}
} else {
	if(safari === true){
	
	$('.controls').hide();
	
	$('.play-alternative').click(function() {
	  
	  if($(window).width() > 768) { // Check window width
	  
		$('.alternative').hide();
		$('.controls').show();
	  
		  $.okvideo({	// Load the youtube video
			  'source': 'Vfx759x_g1k',
			  'adproof': true
			});
			
			// YT player Controls
  
  var playerMuted = 0;
  var playerPaused = 0;

  
  if(playerPaused === 0) {
		$('.play').hide();
	
	$('.pause').click(function() {
		player.pauseVideo();
		$('.pause').hide();
		$('.play').show();
		playerPaused = 1;
	});
  }
  
  $('.play').click(function() {
		player.playVideo();
		$('.play').hide();
		$('.pause').show();
		playerPaused = 0;
  });
  
  
  if(playerMuted === 0) {
		
		$('.unmute').hide();
  
	  $('.mute').click(function() {
			player.setVolume(70);
			$('.mute').hide();
			$('.unmute').show();
			playerMuted = 1;
	  });
	} 
	
	$('.unmute').click(function() {
		player.setVolume(0);
		playerMuted = 0;
		$('.unmute').hide();
		$('.mute').show();
	});
	}
	});
	}
	
	if(browser === true){
	$('.controls').hide();
	$('.alternative').hide();
	if($(window).width() > 768) {
	
	$.okvideo({
      'source': '-1ciHstipjE',
      'adproof': true
	});
	  
		$('.alternative').hide();
		$('.controls').show();
	  
		  $.okvideo({	// Load the youtube video
			  'source': 'Vfx759x_g1k',
			  'adproof': true
			});
			
			// YT player Controls
  
  var playerMuted = 0;
  var playerPaused = 0;

  
  if(playerPaused === 0) {
		$('.play').hide();
	
	$('.pause').click(function() {
		player.pauseVideo();
		$('.pause').hide();
		$('.play').show();
		playerPaused = 1;
	});
  }
  
  $('.play').click(function() {
		player.playVideo();
		$('.play').hide();
		$('.pause').show();
		playerPaused = 0;
  });
  
  
  if(playerMuted === 0) {
		
		$('.unmute').hide();
  
	  $('.mute').click(function() {
			player.setVolume(70);
			$('.mute').hide();
			$('.unmute').show();
			playerMuted = 1;
	  });
	} 
	
	$('.unmute').click(function() {
		player.setVolume(0);
		playerMuted = 0;
		$('.unmute').hide();
		$('.mute').show();
	});
	}
	}
}

// Slide the content

$('.index, .news, .contact').click(function(e) {
	
	var page = $(this).attr('class');
	
	// Clear DIVS
	$(".container").html("");
	
	// Load page into div
	$(".container").load("pages/" + page + ".php");
	
	
	
	
	$( ".content" ).hide( "drop", { direction: "down"}, "fast" );
	setTimeout(function() {
		  // Do something after 5 seconds

		if ($this.data("content")) {
			$($this.data("content")).toggle(
				"slide", 
				{
					direction: 'down',
					duration: 'slow',
					easing: 'easeOutQuart'
				});
		}
	}, 500);
	
});
	
	
$(".home").click(function(e) {
		$( ".content" ).hide( "drop", { direction: "down" }, "fast" );
});

// Navigation for the mobile Menu

	$menuLeft = $('.menu-left');
	$navButton = $('#nav-icon');
	
	$navButton.click(function() {
		$(this).toggleClass('active');
		$('.menu-push').toggleClass('menu-push-toright');
		$menuLeft.toggleClass('menu-open');
	
	});
	
//rotation speed and timer
	var speed = 1500;
	var run = setInterval('rotate()', speed);	
	
	//grab the width and calculate left value
	var item_width = $('#slides li').outerWidth(); 
	var left_value = item_width * (-1); 
        
    //move the last item before first item, just in case user click prev button
	$('#slides li:first').before($('#slides li:last'));
	
	//set the default item to the correct position 
	$('#slides ul').css({'left' : left_value});

    //if user clicked on prev button
	$('#prev').click(function() {

		//get the right position            
		var left_indent = parseInt($('#slides ul').css('left')) + item_width;

		//slide the item            
		$('#slides ul').animate({'left' : left_indent}, 200,function(){    

            //move the last item and put it as first item            	
			$('#slides li:first').before($('#slides li:last'));           

			//set the default item to correct position
			$('#slides ul').css({'left' : left_value});
		
		});

		//cancel the link behavior            
		return false;
            
	});

 
    //if user clicked on next button
	$('#next').click(function() {
		
		//get the right position
		var left_indent = parseInt($('#slides ul').css('left')) - item_width;
		
		//slide the item
		$('#slides ul').animate({'left' : left_indent}, 200, function () {
            
            //move the first item and put it as last item
			$('#slides li:last').after($('#slides li:first'));                 	
			
			//set the default item to correct position
			$('#slides ul').css({'left' : left_value});
		
		});
		         
		//cancel the link behavior
		return false;
		
	});        
	
	//if mouse hover, pause the auto rotation, otherwise rotate it
	$('#slides').hover(
		
		function() {
			clearInterval(run);
		}, 
		function() {
			run = setInterval('rotate()', speed);	
		}
	); 	
	
});

//a simple function to click next link
//a timer will call this function, and the rotation will begin :)  
function rotate() {
	$('#next').click();
}

// Menu dropdown scroll

var maxHeight = 100;

$(function(){

    $(" ").hover(function() {
    
         var $container = $(this),
             $list = $container.find("ul"),
             $anchor = $container.find("a"),
             height = $list.height() * 1.1,       // make sure there is enough room at the bottom
             multiplier = height / maxHeight;     // needs to move faster if list is taller
     
		
        // need to save height here so it can revert on mouseout            
        $container.data("origHeight", $container.height());
        
        // so it can retain it's rollover color all the while the dropdown is open
        $anchor.addClass("hover");
        

        
        // don't do any animation if list shorter than max
        if (multiplier > 1) {
            $container
                .css({
                    height: maxHeight,
                    overflow: "hidden"
                })
                .mousemove(function(e) {
                    var offset = $container.offset();
                    var relativeY = ((e.pageY - offset.top) * multiplier) - ($container.data("origHeight") * multiplier);
                    if (relativeY > $container.data("origHeight")) {
                        $list.css("top", -relativeY + $container.data("origHeight"));
                    };
                });
        }
        
    }, function() {
    
        var $el = $(this);
        
        // put things back to normal
        $el
            .height($(this).data("origHeight"))
            .find("ul")
            .css({ top: 0 })
            .hide()
            .end()
            .find("a")
            .removeClass("hover");
    
    });
    
    // Add down arrow only to menu items with submenus
    $("#menu-wrapper > ul ul li:has('ul')").each(function() {
        $(this).find("a:first").append("<img src='images/down-arrow.png' />");
    });
    
}); 





