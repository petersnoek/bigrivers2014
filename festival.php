<?php require('inc/html.php'); ?>
<body>
	<?php include('inc/menu.php'); ?>
<div id="wrapper">
<div id="navbarhead">
	<a class="nav-toggler toggle-push-left" id="nav-icon"></a>
	<div class="logo">
	</div>
</div>
<div class="container">
	<section class="content2">
		<div class="title">
			<h1>Big Rivers Muziek</h1>
			<h2>13, 14 en 15 Juli</h2>
		</div>
		<article class="info">
			<p>3 dagen lang genieten van Big Rivers Muziek: 9 binnen- en buiten podia in het centrum van Dordrecht. Een biertje drinken bij één van de barretjes en lekker snacken op het foodplein, maar daarna snel weer naar een bandje kijken: dat is het gevoel van Big Rivers!
			</p>	
		</article>
		<nav class="navcon">
			<ul>
				<li><a href="lineup.php">Line Up</a></li>
				<li><a href="#">Podiums</a></li>
			</ul>
		</nav>
		<section class="stages">
		<?php
			for($i = 1; $i < 9; $i++)
			{?>
			<div class="stage">	
			</div>
		<?php
		}
		?>
		</section>
		<div id="map-canvas">
		</div>	
	</section>
</div>
</div>
	<script>
		var LocationData = [
			[51.8135808,4.6571196, "Dolderman Stage" ], 
			[51.8145758,4.6610192, "Jonkheer Stage" ], 
			[51.8148772,4.6625226, "Walter's Stage" ], 
			[51.8140944,4.6616651, "Jazzpodium DJS" ], 
			[51.813929,4.664303, "Senna Summerjazz Stage" ], 
			[51.8152328,4.6675015, "Boogerman Stage" ], 
			[51.8157401,4.6669093, "'t Zottekot Stage" ], 
			[51.8142606,4.6683209, "Stadsherberg Stage" ], 
			[51.8142767,4.669531, "Mol Stage" ], 
			[51.815366,4.680074, "Bibelot Stage" ], 
			[51.8133384,4.6600675, "Dolhuis Stage" ], 
		];
 
function initialize()
{
    var map = 
        new google.maps.Map(document.getElementById('map-canvas'));
    var bounds = new google.maps.LatLngBounds();
    var infowindow = new google.maps.InfoWindow();
     
    for (var i in LocationData)
    {
        var p = LocationData[i];
        var latlng = new google.maps.LatLng(p[0], p[1]);
        bounds.extend(latlng);
         
        var marker = new google.maps.Marker({
            position: latlng,
            map: map,
            title: p[2]
        });
     
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.setContent(this.title);
            infowindow.open(map, this);
        });
    }
     
    map.fitBounds(bounds);
}
 
google.maps.event.addDomListener(window, 'load', initialize);

    </script>

			<!-- js -->
		<script src="js/classie.js"></script>
		<script src="js/nav.js"></script>
</body>
</html>