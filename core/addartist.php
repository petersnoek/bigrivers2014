<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
require_once('../init.php');
require_once('load.php');

// Prepare statement get genres

$stmtCat = $con->prepare('SELECT id, name FROM `genre_cat`');
$stmtCat->execute();

$stmtCat->store_result();
$stmtCat->bind_result($id, $name);

if(isset($_POST['save'])) {

	// Field variables

	$name = $_POST['name'];
	$description = $_POST['description'];
	$url = $_POST['url'];
	$ytchannel = $_POST['ytchannel'];
	$facebook = $_POST['facebook'];
	$twitter = $_POST['twitter'];
	$created = time();
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
	
	$errors = array();
	
	if(empty($name)) {
		array_push($errors, "Je bent de artiest naam vergeten in te vullen");
	}
	elseif(empty($description)) {
		array_push($errors, "Je bent vergeten de artiest omschrijving in te vullen");
	} else {
	
		if($stmt = $con->prepare('INSERT INTO artist (name, description, youtube, url, ytchannel, facebook, twitter, created, modified, author) VALUES (?,?,?,?,?,?,?,?,?,?)')) {
			$stmt->bind_param('sssssssiis', $name, $description, $youtube_id, $url, $ytchannel, $facebook, $twitter, $created, $modified, $author);
			$stmt->execute();
		
			$artist_id = mysqli_insert_id($con);
			
			if(isset($_FILES['pic']['name']) != '') {
				imageUpload($_FILES['pic'], $artist_id, 'artist');
			}
			
		
			if($stmt) {
				$stmt->close();
				header("location: artist.php?id=$artist_id");
				$con->close();
			}
		} else {
			echo $con->error;
		}
	}
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
			<input type="text" name="name" maxlength="255" placeholder="Vul hier de artiest naam in" value="<?php if(isset($name)){ echo $name; } ?>">
			<label>Artiest omschrijving / Biografie (verplicht)</label>
			<textarea name="description"><?php if(isset($description)){ echo $description; } ?></textarea>
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
			<input type="url" name="youtube" placeholder="Vul hier de link in van de youtube video" value="<?php if(isset($youtube_id)){ echo $youtube_id; } ?>">
			<hr>
			<div class="url">
			<label>Website van de artiest</label>
			<input type="url" name="url" placeholder="Vul hier in als de artiest ook een eigen website heeft" value="<?php if(isset($url)){ echo $url; } ?>">
			<label>Youtube kanaal van de artiest</label>
			<input type="url" name="ytchannel" placeholder="Vul hier in als de artiest ook een youtube kanaal heeft" value="<?php if(isset($ytchannel)){ echo $ytchannel; } ?>">
			<label>Facebook pagina van de artiest</label>
			<input type="url" name="facebook" placeholder="Vul hier in als de artiest ook een facebook pagina heeft" value="<?php if(isset($facebook)){ echo $facebook; } ?>">
			<label>Twitter pagina van de artiest</label>
			<input type="url" name="twitter" placeholder="Vul hier in als de artiest ook een twitter pagina heeft" value="<?php if(isset($twitter)){ echo $twitter; } ?>">
			</div>
			<div class="footer">
			<hr>
			<input type="submit" name="save" value="Artiest opslaan">
			</div>
		</form>
		</div>
</div>
</body>
</html>
<?php
} else {
	header("location: ../login.php");
	$con->close;
}
ob_flush();
?>