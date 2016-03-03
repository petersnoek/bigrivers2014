<?php
ob_start();
require_once('inc/cxn.php');

if(isset($_GET['id'])) {
	$id = $_GET['id'];
	
	if($stmt = $con->prepare('SELECT id, title, body, image, modified, author FROM news WHERE id = ? ')) {
	$stmt->bind_param('i', $id);
	$stmt->execute();
	$stmt->store_result();
	$stmt->bind_result($id, $title, $body, $image, $date, $author);
	$stmt->fetch();
	} else {
		echo $con->error;
	}
}
else
{
	header("location: index.php");
	$con->close();
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
</div>
</body>
</html>
<?php
$stmt->free_result();
$stmt->close();
ob_flush();
?>