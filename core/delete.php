<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
require_once('../init.php');

	if(isset($_GET['news'])) {
		
		$id = $_GET['id'];
		
		if($stmt = $con->prepare('SELECT image FROM news WHERE id = ?')) {
		$stmt->bind_param('i', $id);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($image);
		$stmt->fetch();

		unlink("../upload/news/".$image);
		unlink("../upload/news/thumb/".$image);
		$stmt->free_result();
		$stmt->close();

			if($stmt = $con->prepare('DELETE FROM news WHERE id = ?')) {
				$stmt->bind_param('i', $id);
				$stmt->execute();
			
				header("location: manage.php?news");
				$con->close();
			} else {
				echo $con->error;
			}
		} else {
			echo $con->error;
		}
	}
	elseif(isset($_GET['performance'])) {
		
		$id = $_GET['id'];
		
		if($stmt = $con->prepare('DELETE FROM performance WHERE id = ?')) {
			$stmt->bind_param('i', $id);
			$stmt->execute();
			
			if($stmt) {
				$stmt->close();
				header("location: manage.php?performances");
				$con->close();
			}	
		} else {
			echo $con->error;
		}
	}
	elseif(isset($_GET['artist'])) {
		
		$id = $_GET['id'];
		
		if($stmt = $con->prepare('SELECT image FROM artist WHERE id = ?')) {
			$stmt->bind_param('i', $id);
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($image);
			$stmt->fetch();
			
			unlink('../upload/artist/'.$image);
			unlink('../upload/artist/thumb/'.$image);
				
			if($stmt) {
				$del = $con->prepare('DELETE FROM artist WHERE id = ?');
				$del->bind_param('i', $id);
				$del->execute();
				$del->close();
			}
				
			$stmt->free_result();
			$stmt->close();
				
		} else {
			echo $con->error;
		}
		
		header("location: manage.php?artists");
	}
	elseif(isset($_GET['event'])) {
	
		$id = $_GET['id'];
		
		if($stmt = $con->prepare('SELECT image FROM event WHERE id = ?')) {
			$stmt->bind_param('i', $id);
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($image);
			$stmt->fetch();
			
			unlink('../upload/event/'.$image);
			unlink('../upload/event/thumb/'.$image);
				
			if($stmt) {
				$del = $con->prepare('DELETE FROM event WHERE id = ?');
				$del->bind_param('i', $id);
				$del->execute();
				$del->close();
			}
				
			$stmt->free_result();
			$stmt->close();
				
			header("location: manage.php?events");
			$con->close();
			
		} else {
			echo $con->error;
		}
	}
	elseif(isset($_GET['sponsor'])) {

		$id = $_GET['id'];
		
		if($stmt = $con->prepare('SELECT image FROM sponsor WHERE id = ?')) {
			$stmt->bind_param('i', $id);
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($image);
			$stmt->fetch();
			
			unlink('../upload/sponsor/'.$image);
			unlink('../upload/sponsor/thumb/'.$image);
			
			$stmt->free_result();
			$stmt->close();
			
			if($stmtDel = $con->prepare('DELETE FROM sponsor WHERE id = ?')) {
				$stmtDel->bind_param('i', $id);
				$stmtDel->execute();
				$stmtDel->close();
				if($stmtDel) {
					header("location: manage.php?sponsors");
					$con->close();
				}
			} else {
				echo $con->error;
			}
			
		} else {
			echo $con->error;
		}
		
		
	}
	elseif(isset($_GET['genre'])) {
		$gid = $_GET['gid'];
		
		if($stmt = $con->prepare('DELETE FROM genre_cat WHERE id = ?')) {
			$stmt->bind_param('i', $gid);
			$stmt->execute();
			$stmt->close();
			header('location: manage.php?genres');
		} else {
			echo $stmt->error;
		}
		$con->close();
	} elseif(isset($_GET['stage'])) {
		
		$id = $_GET['id'];
	
		if($stmt = $con->prepare('DELETE FROM stage WHERE id = ?')) {
			$stmt->bind_param('i', $id);
			$stmt->execute();
			$stmt->close();
			header('location: manage.php?stages');	
		} else {
			$con->error;
		}
	} elseif(isset($_GET['account'])) {
		
		$id = $_GET['id'];
	
		if($stmt = $con->prepare('DELETE FROM user WHERE id = ?')) {
			$stmt->bind_param('i', $id);
			$stmt->execute();
			$stmt->close();
			header('location: manage.php?accounts');	
		} else {
			$con->error;
		}
	}
} else {
		header("location: ../login.php");
		$con->close();
}
ob_flush();

?>