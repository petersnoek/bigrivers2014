<?php 
	require_once('inc/cxn.php');
	$page = '3';

	if($stmt = $con->prepare('SELECT title, body
		FROM post
		WHERE id = ?')) {
		$stmt->bind_param('i', $page);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($title, $body);
		$stmt->fetch();
		$stmt->free_result();
		$stmt->close();
	} else {
		echo $con->error;
	}

require('inc/html.php'); ?>
<body>
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<?php include('inc/menu.php'); ?>
<div id="wrapper">
<div id="navbarhead">
	<a class="nav-toggler toggle-push-left" id="nav-icon"></a>
	<a class="logo" href="index.php">
	</a>
</div>
<div id="container">
	<div id="content">
	<div id="title">
				<h1><?php echo $title; ?></h1>
			</div>
		<div id="map-canvas">
		</div>
		<div class="content">
			<?php echo $body; ?>
		</div>
	</div>
</div>
</div>
			<script>
				function initialize() {
				  var myLatlng = new google.maps.LatLng(51.8127673,4.6592936);
				  var mapOptions = {
					zoom: 14,
					center: myLatlng
				  }
				  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

				  var marker = new google.maps.Marker({
					  position: myLatlng,
					  map: map,
					  title: 'Hello World!'
				  });
				}

				google.maps.event.addDomListener(window, 'load', initialize);

    </script>

</body>
</html>