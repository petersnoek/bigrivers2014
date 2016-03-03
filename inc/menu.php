<?php
	require_once('cxn.php');
?>	
	<div class="menu push-menu-left">
		<a href="index.php" class="logo">
		</a>
		<div class="site-title">
			<h1>Menu</h1>
		</div>
		<div id="menu-wrapper">
		<ul>
			<li class='has-sub'><a class="sub" href='#' class="program"><span>Evenementen 2015</span></a>
					  <ul>
					  <li><a href='guide.php'><span>Overzicht evenementen 2015</span></a></li>
					  <li><a href='lineup.php' class="festival"><span>Big Rivers Muziek 2015</span></a></li>
					</ul>
				   </li>
			<li><a href='news.php'><span>Nieuws</span></a> </li>
			<li class='has-sub'><a class="sub" ><span>Foto's / Video's</span></a>
				<ul>
					<li><a href='fotos2013.php'><span>Foto's 2013</span></a></li>
					<li><a href='videos2013.php'><span>Video's 2013</span></a></li>
					<li><a href='fotos2014.php'><span>Foto's 2014</span></a></li>
					<li><a href='videos2014.php'><span>Video's 2014</span></a></li>
				</ul>
			</li>
			 <li><a href='supporter.php'><span>Crowdfunding succesvol!</span></a></li>
			 <li><a href='steun.php' class="supp"><span>Blijf ons steunen</span></a></li>
<!-- SNP 17-7-14  
			<li><a href='tickets.php' class="tickets"><span>Tickets</span></a></li>
-->
			 <li class='has-sub'><a class="sub" href='#' class="jobs"><span>Doe mee</span></a> 
				<ul>
					<li><a href='jobs.php'>Met ons</a></li>
					<li><a href='volunteer.php'>Vrijwilligersfuncties</a></li>
					<li><a href='internship.php'>Stageplaatsen</a></li>
				</ul>
			 </li>
				<li><a href='merchandise.php'><span>Merchandise</span></a></li>
					</li>
				   <li class='has-sub last'><a class="sub" href='#'>Contact</a>
						<ul>
							<li><a href='contact.php'><span>Neem Contact Op</span></a></li>
							<li><a href='organization.php'><span>Organisatie</span></a></li>
							<li><a href='pvo.php'><span>Parkeren, Overnachten en vervoer</span></a></li>
						 </ul>
				   </li>
				</ul>
			</div>
				<div id="carousel">
					<div id="buttons">
						<a href="#" id="prev">prev</a>
						<a href="#" id="next">next</a>
					<div class="clear"></div>
					</div>
					<div id="slides"> 
						<script type="text/javascript">
						if($(window).width() > 768) {
							$('#slides').load('inc/sponsors.php');
						}
						</script>
						<div class="clear"></div>
					</div>
				</div>
					<div id="social">
						<ul>
							<li><a href="https://www.facebook.com/bigriversdordrecht" target="_blank"><img src="img/fb_icon.png" width="30" height="30"/></a></li>
							<li><a href="https://twitter.com/BigRivers14" target="_blank"><img src="img/tw_icon.png" width="30" height="30"/></a></li>
							<li><a href="http://www.youtube.com/BigRiversDordrecht" target="_blank"><img src="img/yt_icon.png" width="30" height="30"/></a></li>
						</ul>
					</div>
</div>
