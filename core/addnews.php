<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {

require_once('../init.php');
require_once('load.php');

if(isset($_POST['save'])) {
	
	$title = $_POST['title'];
	$body = $_POST['body'];
	$created = time();
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
		if($stmt = $con->prepare('INSERT INTO news
						(title, body, created, modified, status, author)
						VALUES
						(?,?,?,?,?,?)')) {
						
			$stmt->bind_param('ssiiis', $title, $body, $created, $modified, $status,$author);
			$stmt->execute();
			$stmt->close();
			
			$id = mysqli_insert_id($con);
			
				if(isset($_FILES['pic']['name']) != '') {
					imageUpload($_FILES['pic'], $id, 'news');
				}
			
				header("location: manage.php?news ");
				$con->close();		
				
		} else {
			$con->error;
		}
	}
}
?>

<div id="wrapper">
	<div class="page-title">
		<h1>Nieuws toevoegen</h1>
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
			<input type="text" name="title" maxlength="255" placeholder="Vul hier de nieuws titel in" value="<?php if(isset($title)) { echo $title; }?>">
			<label>Nieuws bericht (verplicht)</label>
			<textarea name="body"><?php if(isset($body)) { echo $body; }?></textarea>
			<script>
                CKEDITOR.replace( 'body' );
            </script>
			<div class="imageUpload">
				<label>Nieuws Thumbnail</label>
				<p>Upload een foto voor het nieuws item (.jpg, .png, .gif)</p>
				<input type="file" name="pic">
			</div>
			<hr>
			<div class="form-item-radius">
				<input type="checkbox" id="status-check" name="status" value="1" checked="checked">
				<label class="option" for="status-check">Publiceer</label>
			</div>
			<hr>
			<input type="submit" name="save" value="Nieuws bericht opslaan">
		</form>
		</div>
</div>
</body>
</html>
<?php
} else {
	header("../login.php");
	$con->close();
}
ob_flush();
?>