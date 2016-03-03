<?php 
require_once('inc/cxn.php');
require('inc/html.php'); 
?>

	<link href="http://cdnjs.cloudflare.com/ajax/libs/nanogallery/4.4.2/css/nanogallery.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/nanogallery/4.4.2/jquery.nanogallery.min.js"></script>

<body>
	<?php include('inc/menu.php'); ?>
	
	<link rel="stylesheet" type="text/css" href="main.css">
	
	
    <!--[if lte IE 9]>
      <link rel="stylesheet" type="text/css" href="ie-only.css">
    <![endif]-->
	
	
	
<div id="wrapper">
<div id="navbarhead">
	<a class="nav-toggler toggle-push-left" id="nav-icon"></a>
	<a class="logo" href="index.php">
	</a>
</div>
<div id="container">

		<div id="content">
		
		
		
			<div id="old">
				<div id="title">
					<h1>Uw Browser Ondersteund Onze Foto Gallerij Niet</h1>
					<h2><a href="https://www.flickr.com/photos/125362812@N07/sets"> Klik Hier Om Naar Flickr Toe Te Gaan</a></h2>
				</div>
			</div>
			<div id="new">
			<script>
			$(document).ready(function () {
				$("#nanoGallery1").nanoGallery({
				kind : 'flickr',
				userID : '125362812@N07',
				colorScheme : 'dark'
				});
			});
			</script>
			<div id="nanoGallery1">
			</div>
			</div>
				
		
		</div>
		
		
</div>
</div>
<!-- js -->
<script src="js/classie.js"></script>
<script src="js/nav.js"></script>

</body>
</html>