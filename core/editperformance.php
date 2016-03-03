<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
require_once('../init.php');
require_once('load.php');

if(isset($_GET['id'])) {

	if($stmtStage = $con->prepare('SELECT id, name FROM stage')) {
	$stmtStage->execute();
	$stmtStage->store_result();
	$stmtStage->bind_result($stageid, $stage_name);
	} else {
		echo $con->error;
	}

	$id = $_GET['id'];

	if($stmt = $con->prepare('SELECT artist.name as artist_name, performance.description as description, performance.start, performance.end, performance.performance_date, stage.id as stage_id, stage.name as stage 
	FROM performance 
	LEFT JOIN artist ON performance.artist_id = artist.id
	LEFT JOIN stage ON performance.stage_id = stage.id
	WHERE performance.id = ?')) {
		$stmt->bind_param('i', $id);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($artist_name, $description, $start, $end, $performance_date, $stage_id, $stage);
		$stmt->fetch();
		$stmt->free_result();
		$stmt->close();
	}

	if(isset($_POST['save'])) {

		$errors = array();
	
	$description = $_POST['description'];
	$stage = $_POST['stage'];
	$performance_date = $_POST['date'];
	$start = $_POST['start'];
	$end = $_POST['end'];
	$modified = time();
	$author = $_SESSION['user'];
	
	if(empty($description)) {
		array_push($errors, "U bent de performance omschrijving vergeten");
	} else {
	
		if($stmt = $con->prepare('UPDATE `performance` SET description = ?, start = ?, end = ?, stage_id = ?, performance_date = ?, modified = ?, author = ? WHERE id = ?')) {
			$stmt->bind_param('sssisisi', $description, $start, $end, $stage, $performance_date, $modified, $author, $id);
			$stmt->execute();
			
				if($stmt) {
					$stmt->close();
					header("location: manage.php?performances");
					$con->close();
				}
			
			} else {
				echo $con->error;
			}
		

		}
	}
}

?>

<div id="wrapper">
	<div class="page-title">
		<h1>Optreden wijzigen</h1>
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
		<h2>Optreden</h2>
			<label>Artiest</label>
			<input type="text" name="artist" value="<?php echo $artist_name; ?>" disabled>
			<label>Performance omschrijving (verplicht)</label>
			<textarea name="description"><?php echo $description; ?></textarea>
			<script>
                CKEDITOR.replace( 'description' );
            </script>
			<label>Stage (verplicht)</label>		
			<select name="stage" value="">
				<option value="<?php if(isset($stage)) { echo $stage_id;} ?>" disabled selected><?php if(isset($stage)) { echo $stage;} ?></option>
				<?php
					while($stmtStage->fetch()) {
						?>
						<option value="<?php echo $stageid; ?>"><?php echo $stage_name; ?></option>
						<?php
					}
					$stmtStage->free_result();
					$stmtStage->close();
				?>
			</select>
			<label>Datum (verplicht)</label>
			<input type="text" name="date" value="<?php if(isset($performance_date)) { echo $performance_date;}?>" placeholder="dd-mm-yyyy">
			<label>Tijd (verplicht)</label>
			<input class="time" type="text" name="start" placeholder="0:00" value="<?php echo $start; ?>">
			<input class="time" type="text" name="end" placeholder="0:00" value="<?php echo $end; ?>">
			<hr>
			<input type="submit" name="save" value="Artiest opslaan">
		</form>
		</div>
</section>
</body>
</html>
<?php
} else {
	header("location: ../login.php");
	$con-close();
}
ob_flush();
?>