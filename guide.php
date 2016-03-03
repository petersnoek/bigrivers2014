<?php 
	require_once('inc/cxn.php');
	
	$status = '1';
	if($stmt = $con->prepare('SELECT id, title, short_description, image, display_date, price FROM event WHERE status = ? ORDER BY date ASC LIMIT 0, 100')) {
		$stmt->bind_param('i', $status);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($id, $title, $short_description, $event_image, $display_date, $price);
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
		<h1>Evenementen overzicht 2015</h1>
		<h2>3 t/m 12 juli 2015</h2>
	</div>
	<div class="content">
		<div class="guide">
		<?php
			while($stmt->fetch()) {
			?>
			<div class="event">
				<div class="event-logo">
					<a href="event.php?eid=<?php echo $id; ?>"><img src="<?php if($event_image == '') { echo 'img/nar-icon.png';}else{ echo 'upload/event/thumb/'.$event_image; }?>" width="130" height="170"/></a>
				</div>
				<div class="event-title">
					<h3><a href="event.php?eid=<?php echo $id; ?>"><?php echo $title; ?></a></h3>
				</div>
				<div class="event-info">
					<h4><?php echo $display_date; ?></h4>
				</div>
				<div class="event-description">
					<p><?php echo $short_description;?><a href="event.php?eid=<?php echo $id; ?>">Lees meer</a></p>
				</div>
			</div>
			<?php
			}
			
			$stmt->close();
			?>
		</div>

		</div>
	</div>
</div>
</body>
</html>