<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
require_once('../init.php');
require_once('load.php');

if(isset($_GET['id']))
{
	$id = $_GET['id'];
	
	if($stmt = $con->prepare('SELECT name, description, youtube, url, ytchannel, facebook, twitter
	FROM artist
	WHERE id = ?')) {
		$stmt->bind_param('i', $id);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($name, $description, $youtube, $url, $ytchannel, $facebook, $twitter);
		$stmt->fetch();
		$stmt->free_result();
		$stmt->close();
	} else {
		echo $con->error;
	}
	
	if(isset($_POST['save'])) {

	$errors = array();
	
	$artist = $_POST['artistname'];
	$description = $_POST['description'];
	$url = $_POST['url'];
	$ytchannel = $_POST['ytchannel'];
	$facebook = $_POST['facebook'];
	$twitter = $_POST['twitter'];
	$modified = time();
	$author = $_SESSION['user'];

		// Youtube ID 
	
	if(isset($_POST['youtube'])) {
		$youtube_url = $_POST['youtube'];
	
		if (preg_match('%(?:youtube(?:-nocookie)?\.com/(?:[^/]+/.+/|(?:v|e(?:mbed)?)/|.*[?&]v=)|youtu\.be/)([^"&?/ ]{11})%i', $youtube_url, $match)) {
			$youtube_id = $match[1];		
		} else {
			array_push($errors, "Youtube video klopt niet");
		}
	}
	
	if(empty($artist)) {
		array_push($errors, "Je bent de naam van de artiest vergeten");
	}
	elseif(empty($description)) {
		array_push($errors, "Je bent de omschrijving van de artiest vergeten");
	}
	else
	{
		if($stmt = $con->prepare('UPDATE artist SET name = ?, description = ?, youtube = ?, url = ?, ytchannel = ?, facebook = ?, twitter = ?, modified = ?, author = ? WHERE id = ?')) {
			$stmt->bind_param('sssssssisi', $artist, $description, $youtube_id, $url, $ytchannel, $facebook, $twitter, $modified, $author, $id);
			$stmt->execute();
			
			if(isset($_FILES['pic']['name']) != '') {
				imageUpload($_FILES['pic'], $id, 'artist');
			}
		
			if($stmt)
			{
				$stmt->close();
				header("location: manage.php?artists ");
				$con->close();
			}	
		} else {
			echo $con->error;
		}
	}
}
	
}
else
{
	header("dashboard.php");
}

?>

<div id="wrapper">
	<div class="page-title">
		<h1>Artiest toevoegen</h1>
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
		<h2>Artiest</h2>
			<label>Artiest naam (verplicht)</label>
			<input type="text" name="artistname" placeholder="Vul hier de artiest naam in" value="<?php echo $name; ?>">
			<label>Artiest omschrijving (verplicht)</label>
			<textarea name="description"><?php echo $description;?></textarea>
			<script>
                // Replace the <textarea id="newscontent"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'description' );
            </script>
			<div class="imageUpload">
				<label>Artiest Thumbnail</label>
				<p>Upload een foto voor de artiest</p>
				<input type="file" name="pic">
			</div>
			<hr>
			<label>Youtube video van de artiest</label>
			<input type="text" name="youtube" placeholder="Vul hier de link in van de youtube video" value="<?php echo "https://www.youtube.com/watch?v=".$youtube; ?>">
			<hr>
			<label>Website van de artiest</label>
			<input type="text" name="url" placeholder="Vul hier in als de artiest ook een eigen website heeft" value="<?php echo $url; ?>">
			<label>Youtube kanaal van de artiest</label>
			<input type="text" name="ytchannel" placeholder="Vul hier in als de artiest ook een youtube kanaal heeft" value="<?php echo $ytchannel; ?>">
			<label>Facebook pagina van de artiest</label>
			<input type="text" name="facebook" placeholder="Vul hier in als de artiest ook een facebook pagina heeft" value="<?php echo $facebook; ?>">
			<label>Twitter pagina van de artiest</label>
			<input type="text" name="twitter" placeholder="Vul hier in als de artiest ook een twitter pagina heeft" value="<?php echo $twitter; ?>">
			<hr>
			<input type="submit" name="save" value="Wijzigingen opslaan">
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