<?php
session_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
	session_destroy();
	header("location: ../login.php");
}
else
{
	header("location: ../login.php");
}
?>