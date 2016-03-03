<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
	
	require_once('../init.php');
	require_once('load.php');
	
if(isset($_GET['id'])) {
	$id = $_GET['id'];
	if($stmt = $con->prepare('SELECT username, email, status FROM user WHERE id = ?')) {
		$stmt->bind_param('i', $id);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($username, $email, $status);
		$stmt->fetch();
		$stmt->free_result();
		$stmt->close();
	} else {
		echo $con->error;
	}
	
	if(isset($_POST['save'])) {
		
		// Array with Errors	
		$errors = array();
		
		// Variables fields
		$username = $_POST['username'];
		$email = $_POST['email'];
		$status = '1';
		$created = time();
		
		$passOne = $_POST['passOne'];
		$passTwo = $_POST['passTwo'];
		
		// Check Fields
		
		if(empty($username)) {
			array_push($errors, "Je bent de gebruikersnaam vergeten");
		}
		elseif(empty($email)) {
			array_push($errors, "Je bent het emailadres vergeten");
		}
		elseif($passOne != $passTwo)
		{
			array_push($errors,"Wachtwoorden zijn niet gelijk");
		}
		elseif(strlen($passOne) < 6)
		{
			array_push($errors,"Wachtwoord moet minimaal 6 tekens");
		} else {
			// Check if email already exists
			if($stmt = $con->prepare('SELECT email FROM user WHERE email = ?')) {
				$stmt->bind_param('s', $email);
				$stmt->execute();
				$stmt->store_result();
				$row = $stmt->num_rows();
				$stmt->free_result();
				$stmt->close();
				
				if($row > 0) {
					array_push($errors,"Bij dit emailadres bestaat al een account");
				} else {
					// Hash Password
					
					$salt = uniqid(mt_rand());
					$password = hash('sha512', $passOne.$salt);
					
					// Prepare statement
					
					if($stmt = $con->prepare('UPDATE user SET username = ?, email = ?, password = ?, salt = ?, status =? WHERE id = ?')) {
					
						$stmt->bind_param('ssssii', $username, $email, $password, $salt, $status, $id);
						$stmt->execute();
						
						$stmt->close();	
						
						if($stmt) {
							header('location: manage.php?accounts');
							$con->close();
						}			
					} else {
						echo $con->error;
					}
				}
			} else {
				echo $con->error;
			}
		}
		$con->close();
	}
} else {
	header('location: dashboard.php');
	$con->close();
}
?>

<div id="wrapper">
	<div class="page-title">
		<h1>Account toevoegen</h1>
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
			<h2>Account</h2>
				<div class="form-item">
					<label for="form-username">Gebruikersnaam (verplicht)</label>
					<input type="text" id="form-username" name="username" placeholder="Vul hier de gebruikersnaam in" value="<?php if(isset($username)) { echo $username; } else { echo $username;}?>" maxlength="128">
				</div>
				<div class="form-item">
					<label for="form-email">Emailaddres (verplicht)</label>
					<input type="email" id="form-email" name="email" placeholder="Vul hier het emailaddress in" value="<?php if(isset($email)) { echo $email; } else { echo $email;}?>">
				</div>
			<div class="form-item">
				<div class="description">Je wachtwoord moet uit minimaal 6 tekens bestaan gebruik een hoofdletter en cijfers om je wachtwoord sterker te maken</div>
				<label>Wachtwoord (verplicht)</label>
				<input type="password" name="passOne" placeholder="Vul hier de gebruikers wachtwoord in" value="">
				<label>Herhaal wachtwoord (verplicht)</label>
				<input type="password" name="passTwo" placeholder="Herhaal het wachtwoord" value="">
				<hr>
				<div class="form-actions">
					<input type="submit" name="save" value="Account wijzigen">
				</div>
			</div>
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

