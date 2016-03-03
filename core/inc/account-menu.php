<?php
	$user = $_SESSION['user'];
?>
<div id="account-menu">
	<ul id="accountContainer">
		<li class="dropdown"><?php echo $user; ?><img class="icon" src="img/dropdown.png" width="15" height="15"/>
			<ul class="sub_navigation">
				<li><a href="logout.php">Uitloggen</a></li>
			</ul>
		</li>
	</ul>
</div>