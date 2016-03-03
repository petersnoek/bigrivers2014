<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {

require_once('../init.php');
require_once('load.php');

if(isset($_GET['id'])) {

	$id = $_GET['id'];
	
	if($stmt = $con->prepare('SELECT title, body, status FROM news WHERE id = ?')) {
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
	
	if(isset($_POST['status'])) {
		$status = '1';
	} else {
		$status = '0';
	}
	
	$author = $_SESSION['user'];
	
	$errors = array();
	
	if(empty($title)) {
		array_push($errors, "Je bent vergeten om een titel toe te voegen");
	} elseif(empty($body)) {
		array_push($errors, "Je bent vergeten om het nieuws bericht in te vullen");
	}
	else
	{
		if($stmt = $con->prepare('UPDATE news
						SET title = ?, body = ?, modified = ?, status = ?, author = ?
						WHERE id = ?')) {
			$stmt->bind_param('ssiisi', $title, $body, $modified, $status, $author, $id);
			$stmt->execute();
			
			$stmt->close();
			
			if(isset($_FILES['pic']['name']) != '') {
				imageUpload($_FILES['pic'], $id, 'news');
			}
			
			header("location: manage.php?news ");
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
		<form method="POST" enctype="multipart/form-data">
		<h2>Nieuws</h2>
			<label>Titel (verplicht)</label>
			<input type="text" name="title" placeholder="Vul hier de nieuws titel in" value="<?php echo $title; ?>">
			<label>Nieuws bericht (verplicht)</label>
			<textarea name="body"><?php echo $body; ?></textarea>
			<script>
                // Replace the <textarea id="newscontent"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'body' );
            </script>
			<div class="imageUpload">
				<label>Nieuws Thumbnail</label>
				<p>Upload een foto voor het nieuws item</p>
				<input type="file" name="pic">
			</div>
			<hr>
				<div class="form-item-radius">
				<input type="checkbox" id="status-check" name="status" value="1"<?php if($status == '1'){ echo 'checked="checked"';}?>>
				<label class="option" for="status-check">Publiceer</label>
				</div>
			<hr>
			<input type="submit" name="save" value="Nieuws item wijzigen">
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