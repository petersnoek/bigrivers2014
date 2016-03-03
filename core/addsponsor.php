<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
require_once('../init.php');
require_once('load.php');

if(isset($_POST['save'])) {
	
	$title = $_POST['title'];
	$url = $_POST['url'];
	$created = time();
	$modified = time();
	$author = $_SESSION['user'];
	$priority = $_POST['priority'];
	
	$errors = array();
	
	if(empty($title)) {
		array_push($errors, "Je bent de sponsor naam vergeten in te vullen");
	}
	elseif(empty($priority)) {
		array_push($errors, "Je bent vergeten om de sponsor een prioriteit te geven");
	}
	else
	{
		if($stmt = $con->prepare('INSERT INTO sponsor (title, url, priority, created, modified, author) VALUES (?,?,?,?,?,?)')){
			$stmt->bind_param('ssiiis', $title, $url, $priority, $created, $modified, $author);
			$stmt->execute();
		
			if($stmt)
			{
				$id = mysqli_insert_id($con);
			
				if(isset($_FILES['pic']['name']) != '') {
					imageUpload($_FILES['pic'], $id, 'sponsor');
				}
				$stmt->close();
				header("location: manage.php?sponsors ");
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
		<h2>Sponsor</h2>
			<label>Sponsor naam (verplicht)</label>
			<input type="text" name="title" placeholder="Vul hier de sponsor naam in" value="<?php if(isset($title)) { echo $title; }?>">
			<label>Sponsor Website</label>
			<input type="url" name="url" placeholder="Vul hier de website link van de sponsor in" value="<?php if(isset($url)) { echo $url; }?>">
			<div class="imageUpload">
				<label>Sponsor Thumbnail</label>
				<p>Upload een foto voor de sponsor</p>
				<input type="file" name="pic">
			</div>
			<label>Prioriteit (verplicht)</label>
			<input type="text" name="priority" placeholder="Vul prioriteit in cijfers 0 is hoogst" value="<?php if(isset($priority)) { echo $priority; }?>">
			<hr>
			<input type="submit" name="save" value="Sponsor opslaan">
		</form>
		</div>
</div>
</body>
</html>
<?php
} else {
	header("location: ../login.php");
}
ob_flush();
?>