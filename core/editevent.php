<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
require_once('../init.php');
require_once('load.php');

if(isset($_GET['id'])) {

	$id = $_GET['id'];
	
	if($stmt = $con->prepare('SELECT id, title, short_description, description, event_date, display_date, start, end, price, ticket, location, status, author FROM event WHERE id = ?')) {
		$stmt->bind_param('i', $id);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($id, $title, $short_description, $description, $event_date, $display_date, $start, $end, $price, $ticket, $location, $status, $author);
		$stmt->fetch();
		$stmt->free_result();
		$stmt->close();
		} else {
			echo $con->error;
		}

if(isset($_POST['save'])) {

	$errors = array();

	function validateDate($date, $format = 'd-m-Y') {
		$d = DateTime::createFromFormat($format, $date);
		return $d && $d->format($format) == $date;
	}
	
	$title = $_POST['title'];
	$description = $_POST['description'];
	$short_description = $_POST['shortdescription'];
	$location = $_POST['location'];
	$price = $_POST['price'];
	
	if(isset($_POST['ticket'])) {
		$ticket = '1';
	} else {
		$ticket = '0';
	}
	
	if(isset($_POST['status'])) {
		$status = '1';
	} else {
		$status = '0';
	}
	
	$event_date = validateDate($_POST['date']);
	$date = strtotime($_POST['date']); 
	$display_date = $_POST['displaydate'];
	$start = $_POST['start'];
	$end = $_POST['end'];
	$modified = time();
	$author = $_SESSION['user'];
	
	if($event_date == false) {
		array_push($errors, "Vul de datum correct in dd-mm-yyyy");
	}
	
	if(empty($title)) {
		array_push($errors, "Je bent vergeten om het evenement een naam te geven");
	} elseif(empty($description)) {
		array_push($errors, "Je bent vergeten om een omschrijving van het evenement te geven");
	} else {
		$modified = time();
		
		if($stmt = $con->prepare('UPDATE event SET title = ?, short_description = ?, description = ?, date = ?, event_date = ?, display_date = ?, start = ?, end = ?, price = ?, ticket = ?, location = ?, status = ?, modified = ?, author = ? WHERE id = ?')) {
			$stmt->bind_param('sssisssssisiisi', $title, $short_description, $description, $date, $_POST['date'], $display_date, $start, $end, $price, $ticket, $location, $status, $modified, $author, $id);
			$stmt->execute();
			$stmt->close();
			
			if(isset($_FILES['pic']['name']) != '') {
				imageUpload($_FILES['pic'], $id, 'event');
			}
			
			if($stmt) {
				header("location: manage.php?events ");
				$con->close();
			}
		} else {
			echo $con->error;
		}
	}
}
}
else {
	header("location: dashboard.php");
	$con->close();
}
?>

<div id="wrapper">
	<div class="page-title">
		<h1>Evenement aanpassen</h1>
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
		<h2>Evenement</h2>
			<label>Evenement naam (verplicht)</label>
			<input type="text" name="title" placeholder="Vul hier het evenement naam in" value="<?php echo $title; ?>">
			<label>Evenement omschrijving (verplicht)</label>
			<textarea name="description"><?php echo $description; ?></textarea>
			<script>
                CKEDITOR.replace( 'description' );
            </script>
			<label>Korte omschrijving</label>
			<textarea name="shortdescription"><?php if(isset($short_description)){ echo $short_description; } ?></textarea>
			<script>
                CKEDITOR.replace( 'shortdescription' );
            </script>
			<div class="imageUpload">
				<label>Evenement Logo</label>
				<p>Upload een logo voor het evenement (.jpg, .png, .gif)</p>
				<input type="file" name="pic">
			</div>
			<hr>
			<label>Evenement locatie</label>
			<input type="text" name="location" placeholder="Vul hier in waar het evenement plaats vind" value="<?php echo $location; ?>">
			<label>Evenement Entree prijs</label>
			<input type="text" name="price" placeholder="Vul hier in als er moet worden betaald voor het evenement" value="<?php echo $price; ?>">
			<div class="form-item-radius">
				<input type="checkbox" id="status-check" name="ticket" value="1" <?php if($ticket == '1'){ echo 'checked="checked"';}?>>
				<label class="option" for="status-check">Ticket button (verwijst naar ticket pagina)</label>
			</div>
			<label>Datum evenement (verplicht)</label>
			<input type="text" name="date" value="<?php if(isset($_POST['date'])) { echo $_POST['date']; } else { echo $event_date; } ?>" placeholder="dd-mm-yyyy">
			<label>Datum weergave</label>
			<input type="text" name="displaydate" value="<?php if(isset($_POST['displaydate'])) { echo $_POST['displaydate'];} else { echo $display_date;}?>" placeholder="Mag van alles zijn om de datum aan te duiden">
			<label>Tijd</label>
			<input class="time" type="text" name="start" placeholder="0:00" value="<?php echo $start; ?>">
			<input class="time" type="text" name="end" placeholder="0:00" value="<?php echo $end; ?>">
			<hr>
			<div class="form-item-radius">
				<input type="checkbox" id="status-check" name="status" value="1" <?php if($status == '1'){ echo 'checked="checked"';}?>>
				<label class="option" for="status-check">Publiceer</label>
			</div>
			<hr>
			<input type="submit" name="save" value="Evenement wijzigen">
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