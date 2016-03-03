<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
	require_once('../init.php');
	require_once('load.php');

	if(isset($_GET['id'])) {

		$id = $_GET['id'];
		
		$stmt = $con->prepare('SELECT id, title, body, modified, image, author FROM news
					WHERE id = ?');
		$stmt->bind_param('i', $id);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($id, $title, $body, $modified, $image, $author);
		$stmt->fetch();
		$stmt->free_result();
		$stmt->close();
	}
	else
	{
		header("Location: dashboard.php");
		$con->close();
	}

?>

<div id="wrapper">
	<h1>Nieuws Bericht</h1>
		<div id="actionbar">
			<div class="action-block">
				<a href="editnews.php?id=<?php echo $id; ?>">Aanpassen</a>
			</div>
		</div>
		<div id="artist-block">
			<div class="creation">
				<label>Auteur: <?php echo $author;?>, <?php echo date('d-m-Y H:i:s', $modified); ?></label>
			</div>
			<h3><?php echo $title; ?></h3>
			<div class="description">
				<?php echo $body; ?>
			</div>
		</div>
</div>
</body>
</html>
<?php
} else {
	header("location: ../login.php");
	$con->close();
}
ob_flush();
?>