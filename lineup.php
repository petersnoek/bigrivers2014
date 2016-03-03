<?php 
	require_once('inc/cxn.php');
	if(isset($_GET['day'])) {
	
		$day = $_GET['day'];
		
		if($day == "friday") 
		{
			$date = '18-07-2014';
		
			if($stmt = $con->prepare("SELECT artist.id as artist_id, artist.name, artist.image, performance.id as performance_id, performance.performance_date, performance.start, performance.end, stage.name FROM artist
			LEFT JOIN performance ON artist.id = performance.artist_id
			LEFT JOIN stage ON performance.stage_id = stage.id
			WHERE performance.performance_date = ?")) {
				$stmt->bind_param('s', $date);
				$stmt->execute();
				$stmt->store_result();
				$stmt->bind_result($artist_id, $artist_name, $artist_image, $performance_id, $performance_date, $performance_start, $performance_end, $performance_stage);
			} else {
				echo $con->error;
			}
		}
		elseif($day == "saturday") {
			$date = '19-07-2014';
		
			if($stmt = $con->prepare("SELECT artist.id as artist_id, artist.name, artist.image, performance.id as performance_id, performance.performance_date, performance.start, performance.end, stage.name FROM artist
			LEFT JOIN performance ON artist.id = performance.artist_id
			LEFT JOIN stage ON performance.stage_id = stage.id
			WHERE performance.performance_date = ?")) {
				$stmt->bind_param('s', $date);
				$stmt->execute();
				$stmt->store_result();
				$stmt->bind_result($artist_id, $artist_name, $artist_image, $performance_id, $performance_date, $performance_start, $performance_end, $performance_stage);
			} else {
				echo $con->error;
			}
		}
		elseif($day == "sunday") {
			$date = '20-07-2014';
			
			if($stmt = $con->prepare("SELECT artist.id as artist_id, artist.name, artist.image, performance.id as performance_id, performance.performance_date, performance.start, performance.end, stage.name FROM artist
			LEFT JOIN performance ON artist.id = performance.artist_id
			LEFT JOIN stage ON performance.stage_id = stage.id
			WHERE performance.performance_date = ? ")) {
				$stmt->bind_param('s', $date);
				$stmt->execute();
				$stmt->store_result();
				$stmt->bind_result($artist_id, $artist_name, $artist_image, $performance_id, $performance_date, $performance_start, $performance_end, $performance_stage);
			} else {
				echo $con->error;
			}
		}
	}
	else
	{
		$dateOne = '18-07-2014';
		$dateTwo = '19-07-2014';
		$dateThree = '20-07-2014';
	
	
		if($stmt = $con->prepare("SELECT artist.id as artist_id, artist.name, artist.image, performance.id as performance_id, performance.performance_date, performance.start, performance.end, stage.name FROM artist
			LEFT JOIN performance ON artist.id = performance.artist_id
			LEFT JOIN stage ON performance.stage_id = stage.id
			WHERE performance.performance_date = ? OR ? OR ? ORDER BY RAND()")) {
				$stmt->bind_param('sss', $dateOne, $dateTwo, $dateThree);
				$stmt->execute();
				$stmt->store_result();
				$stmt->bind_result($artist_id, $artist_name, $artist_image, $performance_id, $performance_date, $performance_start, $performance_end, $performance_stage);
		} else {
			echo $con->error;
		}
	}

require('inc/html.php'); ?>
<body>
	<?php include('inc/menu.php'); ?>
<div id="wrapper">
<div id="navbarhead">
	<a class="nav-toggler toggle-push-left" id="nav-icon"></a>
	<a class="logo" href="index.php">
	</a>
</div>
<div id="container">
	<div id="content">
		<div id="title">
			<h1>Big Rivers Muziek 2015</h1>
			<h2>10 t/m 12 juli 2015</h2>
		</div>
		<div class="info">
			<p>3 dagen lang genieten van Big Rivers Muziek: 9 binnen- en buiten podia in het centrum van Dordrecht. Een biertje drinken bij één van de barretjes en lekker snacken op het foodplein, maar daarna snel weer naar een bandje kijken: dat is het gevoel van Big Rivers!
			</p>	
		</div>
		<div id="navcon">
			<ul class="navigation">
				<li><a href="lineup.php">Line Up</a></li>
				<li><a href="stages.php">Stages</a></li>
				<!-- SNP, 23-09-2014    
				<li><a href="map.php">Plattegrond</a></li>
				<li><a href="../upload/BR14folder-small.pdf">Download (pdf)</a></li>
				-->
			</ul>
		</div>
	<div class="nav">
		<ul class="days">
				<li><a <?php if(isset($_GET['day'])) {if($_GET['day'] == "friday") { echo 'class="active"';}}?> href="lineup.php?day=friday">Vrijdag</a></li>
				<li><a <?php if(isset($_GET['day'])) {if($_GET['day'] == "saturday") { echo 'class="active"';}}?> href="lineup.php?day=saturday">Zaterdag</a></li>
				<li><a <?php if(isset($_GET['day'])) {if($_GET['day'] == "sunday") { echo 'class="active"';}}?> href="lineup.php?day=sunday">Zondag</a></li>
			</ul>
	</div>
		<div id="lineup">
		<?php
			while($stmt->fetch()) 
			{ 
			if($performance_date != '') {
			?>
			<a class="artist-block" href="artist.php?id=<?php echo $artist_id; ?>">
				<div class="pic">
					<img src=<?php if($artist_image == '') { echo 'img/imageplaceholder-medium.png';} else { echo'upload/artist/thumb/'.$artist_image;}?> width="225" height="170">
				</div>
				<div class="date">
					<label><?php echo $artist_name; ?></label>
					<h3><?php echo $performance_date. " ".$performance_stage; ?></h3>
					<h4><?php echo $performance_start." - ".$performance_end; ?></h4>
				</div>
			</a>
			<?php
			}
			}
			$stmt->free_result();
			$stmt->close();
			?>
		</div>
		<script type="text/javascript">		
			

		
		var i = 1;
		$('.artist-block').each(function()
		{
			var isEvenRow = Math.ceil(i / 3) % 2 == 0; // 4 is number of columns
			var isCellAlternate = i % 2 == isEvenRow ? 0 : 1;

			if ( isCellAlternate ) {
				$(this).css("transform", "rotate(-3deg)");
			} else {
				$(this).css("transform", "rotate(3deg)");
			}
			i++;
		});
		</script>
	</div>
</div>
</div>
</body>
</html>