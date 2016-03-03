<?php
	require_once('inc/cxn.php');
	
	$status = '1';
	
	if($stmt = $con->prepare('SELECT id, title, body, created, image FROM news WHERE status = ? ORDER BY created DESC LIMIT 10')) {
		$stmt->bind_param('i', $status);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($id, $title, $body, $created, $image);
	} else {
		echo $con->error;
	}

	function word_limiter($string, $word_limit) {
		$body = strip_tags($string, '<p><a>');
		$words = explode(" ",$body);
		return implode(" ",array_splice($words,0,$word_limit));
	}
 
?>
<?php require('inc/html.php'); ?>
<body>
	<?php include('inc/menu.php'); ?>
<div id="wrapper">
<!-- Mobile Menu -->
<div id="navbarhead">
	<a class="nav-toggler toggle-push-left" id="nav-icon"></a>
	<a class="logo" href="index.php">
	</a>
</div>
	<div id="container">
		<div id="content">
			<div id="title">
				<h1>Laatste nieuws berichten</h1>
			</div>
		<div class="listview">
			<?php
				while($stmt->fetch()) {
					?>
					<div class="item">
						<div class="title">
						<h3><a href="news-item.php?id=<?php echo $id; ?>"><?php echo $title; ?></a></h3>
						</div>
								<?php
								if($image == "") {
								?>
								
								<?php
								} else {
								?>
								<div class="thumbnail">
									<img src="upload/news/thumb/<?php echo $image; ?>"/>
								</div>
								<?php
								}
								?>
						<div class="date">
							<label><?php echo date('d-m-Y', $created); ?></label>
						</div>
						<div class="list-description">
							<?php echo word_limiter($body, 25);?>
							<a href="news-item.php?id=<?php echo $id; ?>">Lees meer</a>
						</div>
						<div class="footer"></div>
					</div>
					<?php
				}
				$stmt->free_result();
				$stmt->close();
			?>
		</div>
	</div>
</div>
</div>
</body>
</html>