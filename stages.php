<?php 
	require_once('inc/cxn.php');

	/* THE QUERIES OF QUERIES */
	
	if($stmtDayOne = $con->prepare('SELECT stage.id,stage.name as stage_name, stage.location as stage_location, stage.color_code
		FROM stage')) {
		$stmtDayOne->execute();
		$stmtDayOne->store_result();
		$stmtDayOne->bind_result($stage_id, $stage_name, $stage_location, $color);
	} else {
		echo $con->error;
	}
	
	if($stmtDayTwo = $con->prepare('SELECT stage.id,stage.name as stage_name, stage.location as stage_location, stage.color_code
		FROM stage')) {
		$stmtDayTwo->execute();
		$stmtDayTwo->store_result();
		$stmtDayTwo->bind_result($stage_id, $stage_name, $stage_location, $color);
	} else {
		echo $con->error;
	}
	
	if($stmtDayThree = $con->prepare('SELECT stage.id,stage.name as stage_name, stage.location as stage_location, stage.color_code
		FROM stage')) {
		$stmtDayThree->execute();
		$stmtDayThree->store_result();
		$stmtDayThree->bind_result($stage_id, $stage_name, $stage_location, $color);
	} else {
		echo $con->error;
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
			<!-- SNP, 23-09-2014
			<h2>&nbsp;</h2>
			-->
		</div>
		<div class="info">
			<p>Big Rivers 2014 was wederom een groot succes. 10 dagen muziek, film en poëzie  in de stad. Iedereen kon iets van zijn of haar gading vinden. Wij willen iedereen die op wat voor manier dan ook heeft meegewerkt aan het tot stand komen van het festival, onwijs bedanken. We gaan nu met vakantie. O ja, pak je agenda: Big Rivers 2015 vind plaats van 3 tot en met 12 juli en plan je nog verder vooruit dan kun je voor 2016 alvast van 1 tot en met 10 juli noteren. Tot volgend jaar!
			</p>	
		</div>
		<div id="navcon">
			<ul class="navigation">
				<li><a href="lineup.php">Line Up</a></li>
				<li><a href="stages.php">Stages</a></li>
		<!-- 23-09-2014 
				<li><a href="map.php">Plattegrond</a></li>
				<li><a href="../upload/BR14folder-small.pdf">Download (pdf)</a></li>
		-->
			</ul>
		</div>
		<div id="stages">
		<div class="row">
		<div class="day">
				<h1 class="title">Vrijdag</h1>
			</div>
		<?php

		while($stmtDayOne->fetch()) {
			$date = '18-07-2014';
			if($stmt = $con->prepare('SELECT performance.start, performance.end, stage.id as stage_id, artist.id as artist_id, artist.name
				FROM performance
				LEFT JOIN stage ON performance.stage_id = stage.id
				LEFT JOIN artist ON performance.artist_id = artist.id
				WHERE stage.id = ? AND performance.performance_date = ?  ORDER BY performance.start ASC')) {
					$stmt->bind_param('is', $stage_id, $date);
					$stmt->execute();
					$stmt->store_result();
					$stmt->bind_result($start, $end, $stage_id, $artist_id, $artist_name);
					$row = $stmt->num_rows();
				} else {
					echo $con->error;
				}
				
			if($row != 0) {
			?>
			<div class="col">
				<div class="inner-col" <?php if($color != ''){?>style="background-color: <?php echo $color; ?>"<?php }?>>
					<h2 class="stage"><?php echo $stage_name; ?></h2>
					<h3 class="stage-location"><?php echo $stage_location; ?></h3>
					<ul class="line-up">
					<?php 
						while($stmt->fetch()) {?>
						<li class="performance">
							<span class="time"><?php echo $start." - ".$end;?></span>
							<a href="artist.php?id=<?php echo $artist_id; ?>" title="<?php echo $artist_name; ?>"><?php echo $artist_name; ?></a>
						</li>
					<?php
						}
						$stmt->free_result();
						$stmt->close();
					?>
					</ul>
				</div>
			</div>
			<?php
			}
		}
		$stmtDayOne->free_result();
		$stmtDayOne->close();
		?>
		</div>
		<div class="row">
		<div class="day">
				<h1 class="title">Zaterdag</h1>
			</div>
		<?php

		while($stmtDayTwo->fetch()) {
			$date = '19-07-2014';
			if($stmt = $con->prepare('SELECT performance.start, performance.end, stage.id as stage_id, artist.id as artist_id, artist.name
				FROM performance
				LEFT JOIN stage ON performance.stage_id = stage.id
				LEFT JOIN artist ON performance.artist_id = artist.id
				WHERE stage.id = ? AND performance.performance_date = ? ORDER BY performance.start ASC')) {
					$stmt->bind_param('is', $stage_id, $date);
					$stmt->execute();
					$stmt->store_result();
					$stmt->bind_result($start, $end, $stage_id, $artist_id, $artist_name);
					$row = $stmt->num_rows();
				} else {
					echo $con->error;
				}
				
			if($row != 0) {
			?>
			<div class="col">
				<div class="inner-col" <?php if($color != ''){?>style="background-color: <?php echo $color; ?>"<?php }?>>
					<h2 class="stage"><?php echo $stage_name; ?></h2>
					<h3 class="stage-location"><?php echo $stage_location; ?></h3>
					<ul class="line-up">
					<?php 
						while($stmt->fetch()) {?>
						<li class="performance">
							<span class="time"><?php echo $start." - ".$end;?></span>
							<a href="artist.php?id=<?php echo $artist_id; ?>" title="<?php echo $artist_name; ?>"><?php echo $artist_name; ?></a>
						</li>
					<?php
						}
						$stmt->free_result();
						$stmt->close();
					?>
					</ul>
				</div>
			</div>
			<?php
			}
		}
		$stmtDayTwo->free_result();
		$stmtDayTwo->close();
		?>
		</div>
		<div class="row">
		<div class="day">
				<h1 class="title">Zondag</h1>
			</div>
		<?php

		while($stmtDayThree->fetch()) {
			$date = '20-07-2014';
			if($stmt = $con->prepare('SELECT performance.start, performance.end, stage.id as stage_id, artist.id as artist_id, artist.name
				FROM performance
				LEFT JOIN stage ON performance.stage_id = stage.id
				LEFT JOIN artist ON performance.artist_id = artist.id
				WHERE stage.id = ? AND performance.performance_date = ? ORDER BY performance.start ASC')) {
					$stmt->bind_param('is', $stage_id, $date);
					$stmt->execute();
					$stmt->store_result();
					$stmt->bind_result($start, $end, $stage_id, $artist_id, $artist_name);
					$row = $stmt->num_rows();
				} else {
					echo $con->error;
				}
				
			if($row != 0) {
			?>
			<div class="col">
				<div class="inner-col" <?php if($color != ''){?>style="background-color: <?php echo $color; ?>"<?php }?>>
					<h2 class="stage"><?php echo $stage_name; ?></h2>
					<h3 class="stage-location"><?php echo $stage_location; ?></h3>
					<ul class="line-up">
					<?php 
						while($stmt->fetch()) {?>
						<li class="performance">
							<span class="time"><?php echo $start." - ".$end;?></span>
							<a href="artist.php?id=<?php echo $artist_id; ?>" title="<?php echo $artist_name; ?>"><?php echo $artist_name; ?></a>
						</li>
					<?php
						}
						$stmt->free_result();
						$stmt->close();
					?>
					</ul>
				</div>
			</div>
			<?php
			}
		}
		$stmtDayThree->free_result();
		$stmtDayThree->close();
		?>
		</div>
</div>
</div>
</body>
</html>