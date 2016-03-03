<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {

require_once('../init.php');
require_once('load.php');

if(isset($_GET['id'])) {

	$id = $_GET['id'];
	
	if($stmt = $con->prepare('SELECT title, body, status FROM post WHERE id = ?')) {
		$stmt->bind_param('i', $id);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($title, $body, $status);
		$stmt->fetch();
		$stmt->free_result();
		$stmt->close();
	}

if(isset($_POST['save'])) {
	
	$title = $_POST['title'];
	$body = $_POST['body'];
	$modified = time();
	
	$author = $_SESSION['user'];
	
	$errors = array();
	
	if(empty($title)) {
		array_push($errors, "Je bent vergeten om een titel toe te voegen");
	} elseif(empty($body)) {
		array_push($errors, "Je bent vergeten om het nieuws bericht in te vullen");
	}
	else
	{
		if($stmt = $con->prepare('UPDATE post
						SET title = ?, body = ?, modified = ?, author = ?
						WHERE id = ?')) {
			$stmt->bind_param('ssisi', $title, $body, $modified, $author, $id);
			$stmt->execute();
			
			$stmt->close();
			
			$id = mysqli_insert_id($con);
			
			header("location: manage.php?pages ");
			$con->close();		
		} else {
			echo $con->error;
		}
	}
}
} else {
	header("location: dashboard.php");
}
?>

<div id="wrapper">
	<div class="page-title">
		<h1>Nieuws bericht aanpassen</h1>
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
		<h2>Pagina</h2>
			<label>Titel (verplicht)</label>
			<input type="text" name="title" placeholder="Vul hier de titel van de pagina in" value="<?php echo $title; ?>">
			<label>Pagina body (verplicht)</label>
			<textarea name="body"><?php echo $body; ?></textarea>
			<script>
                // Replace the <textarea id="newscontent"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'body' );
            </script>
			<hr>
			<input type="submit" name="save" value="Pagina wijzigen">
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