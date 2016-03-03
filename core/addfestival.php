<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {

require_once('../init.php');
require_once('load.php');

if(isset($_POST['save'])) {
	
	$title = $_POST['name'];
	$description = $_POST['description'];
	$location = $_POST['location'];
	$price = $_POST['price'];
	$start = $_POST['start'];
	$end = $_POST['end'];
	$event_date = $_POST['date'];
	$date = date('d-m-Y');
	$author = $_SESSION['user'];
	
	$errors = array();
	
	if(empty($title)) {
		array_push($errors, "U bent vergeten om het evenement een naam te geven");
	}
	elseif(empty($description)) {
		array_push($errors, "U bent vergeten om een omschrijving van het evenement te geven");
	}
	elseif(empty($date)) {
		array_push($errors, "U bent vergeten om een datum van het evenement op  te geven");
	} else {
		if($stmt = $con->prepare('INSERT INTO event (title, description, start, end,  event_date, price, location, date, author) VALUES (?,?,?,?,?,?,?,?,?)')){
			$stmt->bind_param('sssssssss', $title, $description, $start, $end, $event_date, $price, $location, $date, $author);
			$stmt->execute();
			$stmt->close();
			
			if($stmt) {
				header("location: manage.php?events");
				$con->close();
			}
		} else {
			echo $con->error;
		}
	}
}
?>

<section id="wrapper">
	<h1>Festival aanmaken</h1>
		<?php
			if(isset($msg)) {
				?>
				<div class="msg">
					<label><?php echo $msg; ?></label>
				</div>
				<?php
			}
			
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
		<div id="add-block">
			<h2>Festival</h2>
		<form method="POST" enctype="multipart/form-data">
			<label>Festival naam (verplicht)</label>
			<input type="text" name="name" placeholder="Vul hier het evenement naam in" value="<?php if(isset($title)){ echo $title; } ?>">
			<label>omschrijving (verplicht)</label>
			<textarea name="description"><?php if(isset($description)){ echo $description; } ?></textarea>
			<script>
                CKEDITOR.replace( 'description' );
            </script>	
			<hr>
			<label>Start Datum (verplicht)</label>
			<input type="text" name="start_date" value="<?php if(isset($date)){ echo $date; } ?>">
			<label>Eind Datum (verplicht)</label>
			<input type="text" name="start_date" value="<?php if(isset($date)){ echo $date; } ?>">
			<hr>
			<input type="submit" name="save" value="Festival aanmaken">
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