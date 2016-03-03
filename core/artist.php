<?php
session_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
	require_once('../init.php');
	require_once('load.php');

if(isset($_GET['id'])) {
	$id = $_GET['id'];

	if($stmtPerformance = $con->prepare('SELECT performance.description, performance.start, performance.end, performance.performance_date, stage.name
	FROM performance
	LEFT JOIN stage ON performance.stage_id = stage.id
	WHERE artist_id = ?')) {
		$stmtPerformance->bind_param('i', $id);
		$stmtPerformance->execute();
		$stmtPerformance->store_result();
		$stmtPerformance->bind_result($performance_description, $start, $end, $performance_date, $stage);
		
		$stmtPerformance_row = $stmtPerformance->num_rows();
		
	} else {
		echo $con->error;
	}

// Artist general information

if($stmt = $con->prepare('SELECT id, name, description, image, url, ytchannel, facebook, twitter FROM artist WHERE id = ?')) {
	$stmt->bind_param('i', $id);
	$stmt->execute();

	$stmt->store_result();
	$stmt->bind_result($id, $name, $description, $image, $url, $youtube, $facebook, $twitter);
	$stmt->fetch();
	$stmt->free_result();
	$stmt->close();
} else {
	echo $con->error;
}

// Artist Genres

	if($stmtGenre = $con->prepare('SELECT genre_cat.name as genre
		FROM artist
		LEFT JOIN genre ON artist.id = genre.artist_id
		LEFT JOIN genre_cat ON genre.genre_id = genre_cat.id
		WHERE artist.id = ?')) {
	$stmtGenre->bind_param('i', $id);
	$stmtGenre->execute();

	$stmtGenre->store_result();
	$stmtGenre->bind_result($genre);
	} else {
		echo $con->error;
	}
} else {
	header("location: manage.php?artists");
	$con->close();
}
?>

<section id="wrapper">
	<h1>Artiest</h1>
		<div id="actionbar">
			<div class="action-block">
				<a href="editartist.php?id=<?php echo $id; ?>">Aanpassen</a>
			</div>
			<div class="action-block">
				<a href="addperformance.php?">Optreden toevoegen</a>
			</div>
		</div>
		<div id="artist-block">

			<div class="profile-pic">
				<?php if($image != "") {?><img src="../upload/artist/thumb/<?php echo $image; ?>" width="225" height="170"/><?php }?>
			</div>
			<h3><?php echo $name; ?></h3>
			<div class="description">
				<?php echo $description; ?>
			</div>
			<hr>
			<div class="stats">
				<table>
					<tr>
						<td>Website:</td>
						<td><a href="<?php echo $url; ?>"><?php echo $url; ?></a></td>
					</tr>
					<tr>
						<td>Youtube:</td>
						<td><a href="<?php echo $youtube; ?>"><?php echo $youtube; ?></a></td>
					</tr>
					<tr>
						<td>Facebook:</td>
						<td><a href="<?php echo $facebook; ?>"><?php echo $facebook; ?></a></td>
					</tr>
					<tr>
						<td>Twitter:</td>
						<td><a href="<?php echo $twitter; ?>"><?php echo $twitter; ?></a></td>
					</tr>
				</table>
			</div>
			<hr>
			<div class="performances">
				<h3>Optredens</h3>
				<table>
				<?php
				if($stmtPerformance_row > 0)
				{
					while($stmtPerformance->fetch()) {
					?>
					<tr>
						<td colspan="2"><?php echo $performance_description; ?></td>
					</tr>
					<tr>
						<td>Stage:</td>
						<td><?php echo $stage;?> </td>
					</tr>
					<tr>
						<td>Datum:</td>
						<td><?php echo $performance_date; ?></td>
					</tr>
					<tr>
						<td>Tijd:</td>
						<td><?php echo $start." - ".$end; ?></td>
					</tr>	
					<?php
					}
						$stmtPerformance->free_result();
						$stmtPerformance->close();
				} else {
						?>
							<p>Er zijn nog geen optredens gepland</p>
						<?php
					}
					?>
				</table>
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
?>