<?php
    error_reporting(E_ALL);

	$host = 'localhost';
	$user = 'bigrivers2014';
	$pass = 'Studentje1';
	$db = 'bigrivers2014';
	
	$con = mysqli_connect($host, $user, $pass, $db);


    if (mysqli_errno($con)) {
        echo "Error: Unable to connect to MySQL." . PHP_EOL;
        echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
        echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
        exit;
    }

    echo "Success: A proper connection to MySQL was made! The bigrivers2014 database is great." . PHP_EOL;
    echo "Host information: " . mysqli_get_host_info($con) . PHP_EOL;
?>