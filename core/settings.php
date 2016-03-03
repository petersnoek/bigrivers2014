<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
require_once('../init.php');
require_once('load.php');

?>
<section id="wrapper">
<h1>Settings</h1>
		<div class="block">
			<h2>Accounts</h2>
			<div class="item">
				<div class="stats">
					<h3></h3><br>
				</div>
				<div class="additem">
					<a href="new-account.php">Voeg account toe</a>
				</div>
				<div class="manageitem">
					<a href="manage.php?accounts">Beheer accounts</a>
				</div>
			</div>
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