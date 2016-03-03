<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
require_once('../init.php');
require_once('load.php');

if(isset($_GET['id'])) {

$id = $_GET['id'];

	if($stmt = $con->prepare('SELECT title, url, priority FROM sponsor WHERE id = ?')) {
		$stmt->bind_param('i', $id);
		$stmt->execute();
		$stmt->bind_result($title, $url, $priority);
		$stmt->fetch();
		$stmt->close();
	} else {
		echo $con->error;
	}

if(isset($_POST['save'])) {
	
	$title = $_POST['sponsorname'];
	$url = $_POST['url'];
	$priority = $_POST['priority'];
	$modified = time();
	$author = $_SESSION['user'];
	
	$errors = array();
	
		if(empty($title)) {
			array_push($errors, "Je bent de sponsor naam vergeten");
		} elseif(empty($priority)) {
			array_push($errors, "Je bent de prioriteit voor de sponsor gegeven");
		}
		else
		{
			if($stmt = $con->prepare('UPDATE sponsor SET title = ?, url = ?, priority = ?, modified = ?, author = ? WHERE id = ?')) {
				$stmt->bind_param('ssiisi', $title, $url, $priority, $modified, $author,$id);
				$stmt->execute();
				
				if($stmt)
				{
					$id = mysqli_insert_id($con);
				
					if(isset($_FILES['pic']['name']) != '') {
						imageUpload($_FILES['pic'], $id, 'sponsor');
					}
				}
				$stmt->close();
				header('location: manage.php?sponsors');
				$con->close();
			} else {
				echo $con->error;
			}
		
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
			<input type="text" name="sponsorname" placeholder="Vul hier de sponsor naam in" value="<?php if(isset($title)) { echo $title; }?>">
			<hr>
			<label>Sponsor Website</label>
			<input type="url" name="url" placeholder="Vul hier in als de sponsor ook een website heeft" value="<?php if(isset($url)) { echo $url; }?>">
			<div class="imageUpload">
				<label>Sponsor Thumbnail</label>
				<p>Upload een foto voor de sponsor</p>
				<input type="file" name="pic">
			</div>
			<label>Prioriteit (verplicht)</label>
			<input type="text" name="priority" placeholder="Vul prioriteit in cijfers 0 is hoogst" value="<?php if(isset($priority)) { echo $priority; }?>">
			<hr>
			<input type="submit" name="save" value="Sponsor wijzigen">
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