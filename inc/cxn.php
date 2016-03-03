<?php
	$host = 'localhost';
	$user = 'bigrivers2014';
	$pass = 'Studentje1';
	$db = 'bigrivers2014';
	
	$con = mysqli_connect($host, $user, $pass, $db);
	
	if(mysqli_errno($con)) {
		echo mysqli_error($con);
	}
?>
