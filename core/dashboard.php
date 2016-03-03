<?php
session_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {

	require_once('../init.php');
	require_once('load.php');

?>
<section id="page">
<section id="wrapper">
	<h1>Overzicht</h1>
		<div class="block">
			<h2>Nieuws</h2>
			<div class="item">
				<div class="stats">
					<h3>nieuws items: <?php echo $nrow; ?></h3>
				</div>
				<div class="additem">
					<a href="addnews.php">Voeg nieuwsbericht toe</a>
				</div>
				<div class="manageitem">
					<a href="manage.php?news">Beheer nieuwsberichten</a>
				</div>
			</div>
		</div>
		<div class="block">
			<h2>Artiesten</h2>
			<div class="item">
				<div class="stats">
					<h3>artiesten: <?php echo $arow; ?>, Optredens: <?php echo $prow; ?></h3>
				</div>
				<div class="additem">
					<a href="addartist.php">Voeg artiest / band toe</a>
				</div>
				<div class="additem">
					<a href="addperformance.php">Voeg Optreden toe</a>
				</div>
				<div class="additem">
					<a href="manage.php?performances">Beheer Optredens</a>
				</div>
				<div class="manageitem">
					<a href="manage.php?artists">Beheer artiesten</a>
				</div>
			</div>
		</div>
		<div class="block">
			<h2>Evenementen</h2>
			<div class="item">
				<div class="stats">
					<h3>evenementen: <?php echo $erow; ?></h3>
				</div>
				<div class="additem">
					<a href="addevent.php">Voeg evenement toe</a>
				</div>
				<div class="manageitem">
					<a href="manage.php?events">Beheer evenementen</a>
				</div>
			</div>
		</div>
		<div class="block">
			<h2>Sponsors</h2>
			<div class="item">
				<div class="stats">
					<h3>sponsors: <?php echo $srow; ?></h3>
				</div>
				<div class="additem">
					<a href="addsponsor.php">Voeg sponsor toe</a>
				</div>
				<div class="manageitem">
					<a href="manage.php?sponsors">Beheer sponsors</a>
				</div>
			</div>
		</div>
		<div class="block">
			<h2>Genre's, Podiums</h2>
			<div class="item">
				<div class="stats">
					<h3></h3><br>
				</div>
				<div class="additem">
					<a href="addgenre.php">Voeg Genre toe</a>
				</div>
				<div class="manageitem">
					<a href="manage.php?genres">Beheer genres</a>
				</div>
				<div class="additem">
					<a href="addstage.php">Voeg Stage toe</a>
				</div>
				<div class="manageitem">
					<a href="manage.php?stages">Beheer stages</a>
				</div>
			</div>
		</div>
		<div class="block">
			<h2>Pagina's</h2>
			<div class="item">
				<div class="stats">
					<h3></h3><br>
				</div>
				<div class="manageitem">
					<a href="manage.php?pages">Beheer pagina's</a>
				</div>
			</div>
		</div>
</section>
</section>
</body>
</html>
<?php
} else {
	header("location: ../login.php");
}
?>