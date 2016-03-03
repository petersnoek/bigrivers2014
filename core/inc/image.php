<?php
	require('functions.php');
	
if(isset($_POST['save'])) {
	
	$errors = array();
	
		if(isset($_FILES['pic']['name']) != '') {
			imageUpload($_FILES['pic']);
		}
	
	}
?>
<html>
<head>
	
</head>
<body>

	

	<?php
		if(isset($_POST['save'])) {
		
			if(isset($_FILES['pic']['name']) != '') {
		
			if ($_FILES["pic"]["error"] > 0) {
			  echo "Error: " . $_FILES["pic"]["error"] . "<br>";
			} else {
			  echo "Upload: " . $_FILES["pic"]["name"] . "<br>";
			  echo "Type: " . $_FILES["pic"]["type"] . "<br>";
			  echo "Size: " . ($_FILES["pic"]["size"] / 1024) . " kB<br>";
			  echo "Stored in: " . $_FILES["pic"]["tmp_name"];
		}

				if(isset($errors)) {
					foreach($errors as $error) {
						echo $error;
					}
				}
			}
		}
		?>
	<form method="POST" enctype="multipart/form-data">
		<input type="file" name="pic">
		<br>
		<input type="submit" name="save" value="opslaan">
	</form>
</body>
</html>