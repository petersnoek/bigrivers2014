<?php
/**
	// login page for the admin section 
**/
session_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
	header("location: core/dashboard.php");
} 

require('init.php');

if(isset($_POST['login'])) {

	$errors = array();
	$username = $_POST['username'];
	$password = $_POST['password'];
	
	// Check first on empty fields
	if(empty($username)) {
		array_push($errors, "Je bent je gebruikersnaam vergeten");
	}
	elseif(empty($password)) {
		array_push($errors, "Je bent je wachtwoord vergeten");
	}
	else
	{
		// Check fields on length
		
		if(strlen($username) < 3) {
			array_push($errors, "Je gebruikersnaam moet minimaal uit 3 tekens bestaan");
		}
		elseif(strlen($password) < 6) {
			array_push($errors, "Je wachtwoord moet minimaal uit 6 tekens bestaan");
		}
	}

	if(!$errors) {

		echo 'no errors. looking up user in db<br>';
		// Prepare statement to salt

		$res = $con->query('select * from user');
		while ($row = $res->fetch_assoc())
		{
			echo $row[0];
		}

		if($stmtSalt = $con->prepare("SELECT salt FROM user WHERE username = ? "))
		{
			echo 'prepare ok';
			$stmtSalt->bind_param('s', $username);
			$stmtSalt->execute();
			
			$stmtSalt->store_result();
			
			$stmtSalt->bind_result($salt);
			$stmtSalt->fetch();
			
			$pass = hash('sha512', $password.$salt);

			// Prepare statement to fetch user
		
			if($stmtUser = $con->prepare("SELECT username, email, password, status FROM user WHERE username = ? AND password = ?")) 
			{
				$stmtUser->bind_param('ss', $username, $pass);
				$stmtUser->execute();
			
				$stmtUser->store_result();
				$row = $stmtUser->num_rows();
				$stmtUser->bind_result($username, $email, $pwd, $status);
				$stmtUser->fetch();
			}
			else {
				echo $stmtUser->error;
			}

			if($row > 0) {
				echo 'user found';
				// Gebruikersnaam and wachtwoord is correct
				if($status == 0) {
					array_push($errors, "Dit accounts is geblokkeerd neem contact op met de admin");
				} else {
					echo 'loggin in...';
					session_start();
					$_SESSION['auth'] = "yes";
					$_SESSION['user'] = $username;

					header("location: core/dashboard.php");
				}
			} else {
				array_push($errors, "Gebruikersnaam of wachtwoord is incorrect");
				echo 'error';
			}
			$stmtSalt->free_result();
			$stmtSalt->close();	
		} else {
			echo 'Error: ' . $stmtSalt->error;
		}
	}
}

?>
<!DOCTYPE html>
<head>
	<title>Login</title>
	<link href="core/css/admin.css" type="text/css" rel="stylesheet">
</head>
<body class="login">
	<div id="login-form">
		<h1><img src="core/img/logo.png"/></h1>
		<h2>Big Rivers</h2>
		<?php
			if(isset($errors)) {
				
				if($errors > 0) {
				?>
				<div class="errormsg">
				<ul>
				<?php
					foreach($errors as $error) {
						?>
						<li><?php echo $error; ?></li>
						<?php
					}
				?>
				</ul>
				</div>
				<?php
				}
			}
		
		?>
		<form method="post">
			<p>
				<input type="text" name="username" placeholder="Gebruikersnaam">
			</p>
			<p>
				<input type="password" name="password" placeholder="Wachtwoord">
			</p>
			<p class="forgot">
				<a href="#">Wachtwoord vergeten? (not ready yet)</a>
			</p>
			<p class="submit">
				<input type="submit" name="login" value="Inloggen">
			</p>
		
		</form>
	</div>
</body>
</html>
