<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {

require_once('../init.php');
require_once('load.php');

if(isset($_POST['save'])) {

	function validateDate($date, $format = 'd-m-Y') {
		$d = DateTime::createFromFormat($format, $date);
		return $d && $d->format($format) == $date;
	}
	
	$title = $_POST['name'];
	$description = $_POST['description'];
	$short_description = $_POST['shortdescription'];
	$location = $_POST['location'];
	$price = $_POST['price'];
	if(isset($_POST['ticket'])) {
		$ticket = '1';
	} else {
		$ticket = '0';
	}
	$start = $_POST['start'];
	$end = $_POST['end'];
	$event_date = validateDate($_POST['date']);
	$date = strtotime($_POST['date']);
	$display_date = $_POST['displaydate'];
	$created = time();
	$modified = time();
	if(isset($_POST['status'])) {
		$status = '1';
	} else {
		$status = '0';
	}
	$author = $_SESSION['user'];
	
	$errors = array();
	
	if($event_date == false) {
		array_push($errors, "Vul de datum correct in dd-mm-yyyy");
	}
	
	if(empty($title)) {
		array_push($errors, "Je bent vergeten om het evenement een naam te geven");
	} elseif(empty($description)) {
		array_push($errors, "Je bent vergeten om een omschrijving van het evenement te geven");
	} else {
		if($stmt = $con->prepare('INSERT INTO event (title, short_description, description, start, end, date,event_date, display_date, price, ticket, location, status, created, modified, author) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)')){
			$stmt->bind_param('sssssisssisiiis', $title, $short_description, $description, $start, $end, $date, $_POST['date'], $display_date, $price, $ticket, $location, $status, $created, $modified, $author);
			$stmt->execute();
			$stmt->close();
			
			$id = mysqli_insert_id($con);
			
				if(isset($_FILES['pic']['name']) != '') {
					imageUpload($_FILES['pic'], $id, 'event');
				}
			
				header("location: manage.php?events");
				$con->close();
				
		} else {
			echo $con->error;
		}
	}
}
?>

<div id="wrapper">
	<div class="page-title">
		<h1>Evenement toevoegen</h1>
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
		<form method="POST"  enctype="multipart/form-data">
		<h2>Evenement</h2>
			<label>Evenement naam (verplicht)</label>
			<input type="text" name="name" placeholder="Vul hier het evenement naam in" value="<?php if(isset($title)){ echo $title; } ?>">
			<label>Evenement omschrijving (verplicht)</label>
			<textarea name="description"><?php if(isset($description)){ echo $description; } ?></textarea>
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
			<input type="text" name="location" placeholder="Vul hier in waar het evenement plaats vind" value="<?php if(isset($title)){ echo $location; } ?>">
			<label>Evenement Entree prijs</label>
			<input type="text" name="price" placeholder="Vul hier in als er moet worden betaald voor het evenement kan ook gratis zijn" value="<?php if(isset($price)){ echo $price; } ?>">
			<hr>
			<div class="form-item-radius">
				<input type="checkbox" id="status-check" name="ticket" value="1">
				<label class="option" for="status-check">Ticket button (verwijst naar ticket pagina)</label>
			</div>
			<label>Datum evenement (verplicht)</label>
			<input type="text" name="date" value="<?php if(isset($_POST['date'])) { echo $_POST['date'];}?>" placeholder="dd-mm-yyyy">
			<label>Datum weergave</label>
			<input type="text" name="displaydate" value="<?php if(isset($_POST['displaydate'])) { echo $_POST['displaydate'];}?>" placeholder="Mag van alles zijn om de datum aan te duiden">
			<label>Tijd</label>
			<input class="time" type="text" name="start" placeholder="0:00" value="<?php if(isset($start)){ echo $start; } ?>">
			<input class="time" type="text" name="end" placeholder="0:00" value="<?php if(isset($end)){ echo $end; } ?>">
			<hr>
			<div class="form-item-radius">
				<input type="checkbox" id="status-check" name="status" value="1" checked="checked">
				<label class="option" for="status-check">Publiceer</label>
			</div>
			<hr>
			<input type="submit" name="save" value="Evenement opslaan">
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