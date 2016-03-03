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
	
	$stage = $_POST['name'];
	$location = $_POST['location'];
	$color= $_POST['color'];
	$created = time();
	$modified = time();
	$author = $_SESSION['user'];
	
	// Check Fields
	
	if(empty($stage)) {
		array_push($errors, "Je bent de stage naam vergeten");
	} else {
	// Prepare statement
	
		if($stmt = $con->prepare('INSERT INTO `stage` (name, location, color_code, created, modified, author) VALUES (?,?,?,?,?,?)')) {
			$stmt->bind_param('sssiis', $stage, $location, $color, $created, $modified, $author);
			$stmt->execute();
			$stmt->close();
			
			if($stmt) {
				header("location: manage.php?stages");
				$con->close();
			}
		} else {
			echo $con->error;
		}
	}	
	$con->close();
}

?>

<div id="wrapper">
	<div class="page-title">
		<h1>Account toevoegen</h1>
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
		<h2>Stage</h2>
			<label>Stage naam</label>
			<input type="text" name="name" placeholder="Vul hier de naam in van de stage" value="<?php if(isset($stage)) { echo $stage; }?>">
			<label>Locatie</label>
			<input type="text" name="location" placeholder="Vul hier de locatie van de stage in" value="<?php if(isset($location)) { echo $location; }?>">
			<label>Kleur van de column</label>
			<input type="text" name="color" placeholder="Vul hier de kleur in format #000000" value="<?php if(isset($color)) { echo $color; }?>">
			<hr>
			<input type="submit" name="save" value="Stage aanmaken">
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

