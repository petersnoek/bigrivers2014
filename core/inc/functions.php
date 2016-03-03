<?php
// Image Upload

function createThumbnail($src, $filename, $thumbPath,$thumbWidth, $thumbHeight) {

	$allowedExts = array("gif", "jpeg", "jpg", "png");
	$temp = explode(".", $src);
	$ext = end($temp);
	$fparts = pathinfo($src);
	
	if($ext == 'gif') {
		$resource = imagecreatefromgif($src);
	} elseif($ext == 'png') {
		$resource = imagecreatefrompng($src);
	} elseif($ext == 'jpg' || $ext == 'jpeg') {
		$resource = imagecreatefromjpeg($src);
	}	
	
	$width = imagesx($resource);
	$height = imagesy($resource);
	
	$new_width = $thumbWidth;
	$new_height = $thumbHeight;
	
	$tmp_img = imagecreatetruecolor($new_width, $new_height);
	
	switch($ext) {
		
		case "png":
			// integer representation of the color black (rgb: 0,0,0)
			$background = imagecolorallocate($tmp_img, 0, 0, 0);
			// removing the black from the placeholder
			imagecolortransparent($tmp_img, $background);

			// turning off alpha blending (to ensure alpha channel information 
			// is preserved, rather than removed (blending with the rest of the 
			// image in the form of black))
			imagealphablending($tmp_img, false);

			// turning on alpha channel information saving (to ensure the full range 
			// of transparency is preserved)
			imagesavealpha($tmp_img, true);
		break;
		
		case "gif":
			// integer representation of the color black (rgb: 0,0,0)
			$background = imagecolorallocate($tmp_img, 0, 0, 0);
			// removing the black from the placeholder
			imagecolortransparent($tmp_img, $background);
		break;
	}
	
	ImageCopyResampled($tmp_img, $resource, 0, 0, 0, 0, $new_width, $new_height, $width, $height);

	$fparts = pathinfo($thumbPath);
	$dest = $fparts['dirname'].'/thumb/'.$filename.'.'.$ext;
	
	if($ext == 'gif') {
		imagegif($tmp_img, $dest);
	} elseif($ext == 'png') {
		imagepng($tmp_img, $dest, 1);
	} elseif($ext == 'jpg' || $ext == 'jpeg') {
		imagejpeg($tmp_img, $dest, 100);
	}

}

function imageUpload($image, $id, $cat) {
	require('cxn.php');
	
	global $errors;
	
	$item = $id;
	
	$allowedExts = array("gif", "jpeg", "jpg", "png");
	$temp = explode(".", $image["name"]);
	$extension = end($temp);
		
		if ((($image["type"] == "image/gif")
			|| ($image["type"] == "image/jpeg")
			|| ($image["type"] == "image/jpg")
			|| ($image["type"] == "image/pjpeg")
			|| ($image["type"] == "image/x-png")
			|| ($image["type"] == "image/png"))
			&& ($image["size"] < 20000000)
			&& in_array($extension, $allowedExts)) {
			
				if ($image["error"] > 0) {
					array_push($errors, "Return Code: " . $image["name"]["error"] . "<br>");
				} else {
				
						$new = explode(".", $image["name"]);
						$extension = end($new);
						$newfilename = $item.".".$extension;
						
						if($cat == "news") {
							$directory = '../upload/news/';
							$thumbPath = '../upload/news/thumb';
						
							move_uploaded_file($image["tmp_name"],
							$directory . $newfilename);
							$pic = $directory . $newfilename;	
							
							createThumbnail($pic, $item, $thumbPath, 170, 120);
							$stmt = $con->prepare('UPDATE news SET image = ? WHERE id = ?');
							$stmt->bind_param('si', $newfilename, $item);
							$stmt->execute();
							$stmt->close();
						} elseif($cat == "sponsor") {
							$directory = '../upload/sponsor/';
							$thumbPath = '../upload/sponsor/thumb';
						
							move_uploaded_file($image["tmp_name"],
							$directory . $newfilename);
							$pic = $directory . $newfilename;	
							
							createThumbnail($pic, $item, $thumbPath, 200, 200);
							$stmt = $con->prepare('UPDATE sponsor SET image = ? WHERE id = ?');
							$stmt->bind_param('si', $newfilename, $item);
							$stmt->execute();
							$stmt->close();
						} elseif($cat == "artist") {
							$directory = '../upload/artist/';
							$thumbPath = '../upload/artist/thumb';
						
							move_uploaded_file($image["tmp_name"],
							$directory . $newfilename);
							$pic = $directory . $newfilename;	
							
							createThumbnail($pic, $item, $thumbPath, 225, 170);
							$stmt = $con->prepare('UPDATE artist SET image = ? WHERE id = ?');
							$stmt->bind_param('si', $newfilename, $item);
							$stmt->execute();
							$stmt->close();
						} elseif($cat == "event") {
							$directory = '../upload/event/';
							$thumbPath = '../upload/event/thumb';
						
							move_uploaded_file($image["tmp_name"],
							$directory . $newfilename);
							$pic = $directory . $newfilename;	
							
							createThumbnail($pic, $item, $thumbPath, 130, 170);
							$stmt = $con->prepare('UPDATE event SET image = ? WHERE id = ?');
							$stmt->bind_param('si', $newfilename, $item);
							$stmt->execute();
							$stmt->close();
						}
				}
			} else {
				array_push($errors, "Dit is geen correct bestand gebruik (.jpg, .png, .gif) als bestand");
			}
	
}


?>