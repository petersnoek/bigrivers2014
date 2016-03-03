<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
require_once('../init.php');
require_once('load.php');

if($stmt = $con->prepare('SELECT id, name FROM artist')) {
	$stmt->execute();
	$stmt->store_result();
	$stmt->bind_result($id, $name);
} else {
	echo $con->error;
}

if($stmtStage = $con->prepare('SELECT id, name FROM stage')) {
	$stmtStage->execute();
	$stmtStage->store_result();
	$stmtStage->bind_result($stage_id, $stage_name);
} else {
	echo $con->error;
}

if(isset($_POST['save'])) {

	function validateDate($date, $format = 'd-m-Y') {
		$d = DateTime::createFromFormat($format, $date);
		return $d && $d->format($format) == $date;
	}

	
	if(isset($_POST['artist'])) {
		$artist = $_POST['artist'];
	}
	
	if(isset($_POST['stage'])) {
		$stage = $_POST['stage'];
	}
	
	$description = $_POST['description'];
	$performance_date = validateDate($_POST['date']);
	$start = $_POST['start'];
	$end = $_POST['end'];
	$created = time();
	$modified = time();
	$author = $_SESSION['user'];
	
	$errors = array();
	
	if(empty($artist)) {
		array_push($errors, "Je bent de artiest vergeten");
	} elseif(empty($description)) {
		array_push($errors, "Je bent de optreden omschrijving vergeten in te vullen");
	} elseif(empty($stage)) {
		array_push($errors, "Je bent de podium vergeten te selecteren");
	}  elseif($performance_date == false) {
		array_push($errors, "Vul de datum correct in dd-mm-yyyy");
	} elseif(!preg_match("/(2[0-3]|[01][0-9]):[0-5][0-9]/", $start)) {
		array_push($errors, 'De tijd format klop niet vul in HH:MM');
	} else {
		if($stmt = $con->prepare('INSERT INTO performance (description, start, end, stage_id, performance_date, artist_id, created, modified, author) VALUES (?,?,?,?,?,?,?,?,?)')) {
			$stmt->bind_param('sssisiiis', $description, $start, $end, $stage, $_POST['date'], $artist, $created, $modified, $author);
			$stmt->execute();
			$stmt->close();
		} else {
			echo $con->error;
		}
	
		if($stmt) {
			header("location: manage.php?performances");
			$con->close();
		}
	}
}

?>

<div id="wrapper">
	<div class="page-title">
		<h1>Optreden toevoegen</h1>
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
			<label>Artiest (verplicht)</label>
			<select name="artist" value="<?php if(isset($artist)) { echo $artist; }?>">
				<option value="" disabled selected>Selecteer artiest</option>
				<?php
					while($stmt->fetch()) {
						?>
						<option value="<?php echo $id; ?>"><?php echo $name; ?></option>
						<?php
					}
					$stmt->free_result();
					$stmt->close();
				?>
			</select>
			<label>Performance omschrijving (verplicht)</label>
			<textarea name="description"><?php if(isset($description)) { echo $description;}?></textarea>
			<script>
                CKEDITOR.replace( 'description' );
            </script>	
			<label>Podium (verplicht)</label>			
			<select name="stage" value="<?php if(isset($stage)) { echo $stage; }?>">
				<option value="" disabled selected>Selecteer Podium</option>
				<?php
					while($stmtStage->fetch()) {
						?>
						<option value="<?php echo $stage_id; ?>"><?php echo $stage_name; ?></option>
						<?php
					}
					$stmtStage->free_result();
					$stmtStage->close();
				?>
			</select>
			<label>Datum (verplicht)</label>
			<input type="text" name="date" value="<?php if(isset($_POST['date'])) { echo $_POST['date'];}?>" placeholder="dd-mm-yyyy">
			<label>Tijd</label>
			<input class="time" type="text" name="start" placeholder="0:00" value="<?php if(isset($start)) { echo $start;}?>">
			<input class="time" type="text" name="end" placeholder="0:00" value="<?php if(isset($end)) { echo $end;}?>">
			<hr>
			<input type="submit" name="save" value="Optreden opslaan">
		</form>
		</div>
</section>
</body>
</html>
<?php
} else {
	header("location: ../login.php");
	$con->close();
}
ob_flush();
?>