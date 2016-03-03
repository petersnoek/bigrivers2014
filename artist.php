<?php 
	require_once('inc/cxn.php');
	if(isset($_GET['id'])) {
		$id = $_GET['id'];
		
		if($stmt = $con->prepare('SELECT artist.id, artist.name, artist.description, artist.image, artist.youtube, artist.url, artist.ytchannel, artist.facebook, artist.twitter, performance.start, performance.end, performance_date, stage.name FROM artist
			LEFT JOIN performance ON artist.id = performance.artist_id
			LEFT JOIN stage ON performance.stage_id = stage.id
			WHERE artist.id = ?')) {
			$stmt->bind_param('i', $id);
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($id, $name, $description, $image, $youtube, $url, $ytchannel, $facebook, $twitter, $start, $end, $performance_date, $stage);
			$stmt->fetch();
			$stmt->free_result();
			$stmt->close();
		} else {
			echo $con->error;
		}
	} else {
		header('location: index.php');
		$con->close();
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
			<h1>Big Rivers Muziek 2014</h1>
			<h2>18, 19 en 20 Juli</h2>
		</div>
		<div class="info">
			<p>3 dagen lang genieten van Big Rivers Muziek: 9 binnen- en buiten podia in het centrum van Dordrecht. Een biertje drinken bij één van de barretjes en lekker snacken op het foodplein, maar daarna snel weer naar een bandje kijken: dat is het gevoel van Big Rivers!
			</p>	
		</div>
		<div id="navcon">
			<ul class="navigation">
				<li><a href="lineup.php">Line Up</a></li>
				<li><a href="stages.php">Stages</a></li>
				<li><a href="map.php">Plattegrond</a></li>
			</ul>
		</div>
		<div class="content">
			<div class="head">
				<h1><?php echo $name; ?></h1>
			</div>
			<div class="promo">
			<?php 
				if(isset($youtube)) {?>
				<iframe width="560" height="315" src="//www.youtube.com/embed/<?php echo $youtube; ?>?showinfo=0" frameborder="0" allowfullscreen ></iframe>
				<?php } else { ?>
					<div class="promo-image">
						<img src="<?php if($image == ''){ echo 'img/videoplaceholder.png';} else { echo'upload/artist/'.$image;}?>" width="560" height="315"/>
					</div>
				<?php }?>
			</div>
			<div class="socialmedia">
				<?php if($url != '') {?><a href="<?php echo $url; ?>" target="_blank"><img src="img/web_icon_medium.png" width="40" height="40"/></a><?php }?>
				<?php if($ytchannel != '') {?><a href="<?php echo $ytchannel; ?>" target="_blank"><img src="img/yt_icon_medium.png" width="40" height="40"/></a><?php }?>
				<?php if($facebook != '') {?><a href="<?php echo $facebook; ?>" target="_blank"><img src="img/fb_icon_medium.png" width="40" height="40"/></a><?php }?>
				<?php if($twitter != '') {?><a href="<?php echo $twitter; ?>" target="_blank"><img src="img/tw_icon_medium.png" width="40" height="40"/></a><?php }?>
			</div>
			<div class="performances-artist">
				<h2>Optreden</h2>
				<?php if(isset($performance_date)) {?>
					<div class="performance">
						<span><?php echo $performance_date; ?></span>
						<span><?php echo $stage; ?></span>
						<span><?php echo $start; if(isset($end)) { echo ' - '.$end; }?></span>
					</div>
				<?php
				}?>
			</div>
			<div class="small-description">
				<h2>Bio</h2>
					<?php echo $description; ?>
			</div>
		</div>
	</div>
</div>
</div>

</body>
</html>