<?php
ob_start();
require_once('inc/cxn.php');

if(isset($_GET['eid'])) {
	$eid = $_GET['eid'];
	
	if($stmt = $con->prepare('SELECT id, title, description, display_date, start, end, price, ticket, location 
		FROM event 
		WHERE id = ?')) {
		$stmt->bind_param('i', $eid);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($id, $title, $description, $date, $start, $end, $price, $ticket, $location);
		$stmt->fetch();
		$stmt->free_result();
		$stmt->close();
	} else {
		echo $con->error;
	}
	
}
else
{
	header("location: index.php");
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
		<?php if($date != ''){?><h2><?php echo $date; ?></h2><?php } ?>
	</div>
	<div class="content">
		<div id="info">
		<?php if($location != '') {?>
				<span class="tag"><?php echo $location; ?></span>
		<?php }?>
		<?php if($start != '') {?>
				<span class="tag"><?php echo $start; if($end != '') { echo " tot ".$end;} ?></span>
		<?php }?>
		</div>
		<div class="description">
		<?php echo $description; ?>
		</div>
		<?php if($ticket != '') {?>
		<div class="ticket-btn">
			<a href="tickets.php">Ticket kopen</a>
		</div>
		<?php }?>
		<?php if(isset($_GET['eid'])){ if($_GET['eid'] == "38") { ?>
			<img style="margin-top: 30px" src="img/gecombineerd logo rcoak slvloo vsb.png" />
		<?php }}?>
	</div>

		</div>
	</div>
</div>

</body>
</html>
<?php
ob_flush();
$con->close();
?>