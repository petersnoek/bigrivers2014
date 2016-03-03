<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
	
	require_once('../init.php');
	require_once('load.php');

if(isset($_POST['save'])) {
	
	// Array with Errors
	
	$errors = array();
	
	// Variables fields
	
	$genre = $_POST['name'];
	
	// Check Fields
	
	if(empty($genre)) {
		array_push($errors, "Je bent de genre naam vergeten");
	} else {
	// Prepare statement
	
	if($stmt = $con->prepare('SELECT `name` FROM genre_cat WHERE `name` = ? LIMIT 1')) {
	
		$stmt->bind_param('s', $genre);
		$stmt->execute();
		$row = $stmt->num_rows();
		$stmt->close();
		
		if($row == 0) {
			if($stmtGenre = $con->prepare('INSERT INTO `genre_cat` (name) VALUES (?)')) {
				$stmtGenre->bind_param('s', $genre);
				$stmtGenre->execute();
				$stmtGenre->close();
				header("location: manage.php?genres");
			} else {
				echo $con->error;
			}
		} else {
			array_push($errors, "Genre bestaat al");
		}
	}
}	
	$con->close();
}

?>

<div id="wrapper">
	<div class="page-title">
		<h1>Genre toevoegen</h1>
	</div>
		<?php
				if(isset($errors)) {
					if($errors > 0) {
						foreach($errors as $error) {
							?>
								<div class="error">
									<label><?php echo $error; ?></label>
								</div>
							<?php
						}
					}
				}
			?>
<div id="content">
	<form method="POST">
		<h2>Genre</h2>
			<label>Genre naam</label>
			<input type="text" name="name" placeholder="Vul hier het genre in" value="">
			<hr>
			<input type="submit" name="save" value="Genre aanmaken">
		</form>
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

