<?php 
	require_once('inc/cxn.php');
	$page = '8';

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
	<div class="content">
		<?php echo $body; ?>
	</div>
	</div>
</div>

</body>
</html>