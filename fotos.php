<?php require('inc/html.php'); ?>

	<link href="http://cdnjs.cloudflare.com/ajax/libs/nanogallery/4.4.2/css/nanogallery.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/nanogallery/4.4.2/jquery.nanogallery.min.js"></script>

<body>
	<?php include('inc/menu.php'); ?>



<div id="wrapper">
<div id="navbarhead">
	<a class="nav-toggler toggle-push-left" id="nav-icon"></a>
	<a class="logo" href="index.php">
	</a>
</div>
<div id="container">

		<div id="content">
			<script>
			$(document).ready(function () {
				$("#nanoGallery1").nanoGallery({
				kind : 'flickr',
				userID : '98530561@N03',
				colorScheme : 'dark'
				});
			});
		</script>
			<div id="nanoGallery1">
			</div>
				
		
		</div>
</div>
</div>
<!-- js -->
<script src="js/classie.js"></script>
<script src="js/nav.js"></script>

</body>
</html>