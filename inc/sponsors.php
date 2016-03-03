<ul>
	<?php 
		require_once('cxn.php');		
		if($stmtMenu = $con->prepare('SELECT image, url FROM sponsor ORDER BY priority  ASC')) {
				$stmtMenu->execute();
				$stmtMenu->store_result();
				$stmtMenu->bind_result($sponsor_image, $sponsor_url);
				} else {
					echo $con->error;
				}
					
				while($stmtMenu->fetch()) {
				?>
					<li><a href="<?php echo $sponsor_url; ?>" target="_blank"><img src="upload/sponsor/thumb/<?php echo $sponsor_image; ?>" width="150" height="150"/></a></li>
						<?php
						 }
							$stmtMenu->free_result();
							$stmtMenu->close();
						 ?>
</ul>
