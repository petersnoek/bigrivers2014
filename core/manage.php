<?php
session_start();
ob_start();
if(isset($_SESSION['auth']) AND ($_SESSION['user'])) {
	require_once('../init.php');
	require_once('load.php');
	
	if(isset($_GET['news'])) {
		if($stmt = $con->prepare('SELECT id, title, body, created, modified, status, image, author 
		FROM news ORDER BY id DESC')) {
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($id, $title, $body, $created, $modified, $status, $image, $author);
			$row = $stmt->num_rows();
		} else {
			echo $con->error;
		}
	}
	elseif(isset($_GET['artists'])) {
		if($stmt = $con->prepare('SELECT id, name, modified, author FROM artist ORDER BY id DESC')) {
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($id, $name, $modified, $author);
			$row = $stmt->num_rows();
		}
	}
	elseif(isset($_GET['performances'])) {
		if($stmt = $con->prepare('SELECT performance.id as performance_id, performance.modified, performance.author, artist.id as artist_id, artist.name as artist
			FROM performance
			LEFT JOIN artist ON performance.artist_id = artist.id ORDER BY performance.id DESC')) {
				$stmt->execute();
				$stmt->store_result();
				$stmt->bind_result($performance_id, $modified, $author, $artist_id, $artist);
				$row = $stmt->num_rows();
			} else {
				echo $con->error;
			}
	}
	elseif(isset($_GET['events'])) {
		if($stmt = $con->prepare('SELECT id, title, description, event_date, display_date, start, end, price, location, status, created, modified, author FROM event ORDER by id DESC')) {
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($id, $title, $description, $event_date, $display_date, $start, $end, $price, $location, $status, $created, $modified, $author);
			$row = $stmt->num_rows();
		} else {
			echo $con->error;
		}
	}
	elseif(isset($_GET['sponsors'])) {
	
		if($stmt = $con->prepare('SELECT id, title, image, url, priority, modified, author FROM sponsor ORDER BY id DESC')) {
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($id, $title, $image, $url, $priority, $modified, $author);
			$row = $stmt->num_rows();
		} else {
			echo $con->error;
		}
	}
	elseif(isset($_GET['genres'])) {
		if($stmt = $con->prepare('SELECT id, name FROM genre_cat')) {
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($id, $genre);
			$row = $stmt->num_rows();
		} else {
			echo $con->error;
		}
	} elseif(isset($_GET['stages'])) {
		if($stmt = $con->prepare('SELECT id, name, modified, author FROM stage')) {
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($id, $stage, $modified, $author);
			$row = $stmt->num_rows();
		} else {
			echo $con->error;
		}
	} elseif(isset($_GET['accounts'])) {
		if($stmt = $con->prepare('SELECT id, username, status, created FROM user ORDER BY id DESC')) {
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($id, $username, $status, $created);
			$row = $stmt->num_rows();
		} else {
			echo $con->error;
		}
	} elseif(isset($_GET['pages'])) {
		if($stmt = $con->prepare('SELECT id, title, status, modified, author FROM post ORDER BY id DESC')) {
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($id, $page, $status, $modified, $author);
			$row = $stmt->num_rows();
		} else {
			echo $con->error;
		}
	} else {
		header("Location: dashboard.php");
	}
	?>
<div id="wrapper">
	<h1>Beheer</h1>
	<div id="content">
			<?php if(isset($_GET['news'])) {
				?>
				<div id="actionbar">
					<div class="action-block">
						<a href="addnews.php">Nieuws toevoegen</a>
					</div>
				</div>
				<table>
				<?php
				if($row > 0) {			
				?>
					<tr class="thead">
						<th>Nieuws bericht</th>
						<th>Auteur</th>
						<th>Updated</th>
						<th>Status</th>
						<th>Acties</th>
					</tr>
				<?php
					while($stmt->fetch()) {
				?>
					<tr>
						<td><a href="news.php?id=<?php echo $id; ?>"><?php echo $title; ?></a></td>
						<td><?php echo $author; ?></td>
						<td><?php echo date('d-m-Y H:i:s', $modified); ?></th>
						<td><?php if($status == 1) { echo "gepubliceerd"; } else { echo "niet gepubliceerd"; } ?></td>
						<td><a href="editnews.php?id=<?php echo $id; ?>">edit</a><a href="delete.php?news&id=<?php echo $id; ?>">delete</a></td>
					</tr>
				<?php
					}
				} else {
				?>
					<p>Er zijn nog geen nieuwsberichten toegevoegd</p>
				<?php
				}
				?>
			</table>
			<?php
			}
	
				if(isset($_GET['artists'])) {
				?>
				<div id="actionbar">
					<div class="action-block">
						<a href="addartist.php">Artiest toevoegen</a>
					</div>
					<div class="action-block">
						<a href="addperformance.php">Optreden toevoegen</a>
					</div>
					<div class="action-block">
						<a href="manage.php?performances">Optreden beheren</a>
					</div>
				</div>
				<table>
				<?php
					if($row > 0) {			
				?>
					<tr class="thead">
						<th>Artiest</th>
						<th>Auteur</th>
						<th>Updated</th>
						<th>Acties</th>
					</tr>
				<?php
					while($stmt->fetch()) {
				?>
					<tr>
						<td><a href="artist.php?id=<?php echo $id; ?>"><?php echo $name; ?></a></td>
						<td><?php echo $author; ?></td>
						<td><?php echo date('d-m-Y H:i:s', $modified); ?></td>
						<td class="edit"><a href="editartist.php?id=<?php echo $id; ?>">edit</a><a href="delete.php?artist&id=<?php echo $id; ?>">delete</a></td>
					</tr>
				<?php
					}
				} else {
				?>
					<p>Er zijn nog geen artiesten toegevoegd</p>
				<?php
				}
				?>
			</table>
			<?php
				$stmt->free_result();
				$stmt->close();
			}
			
			if(isset($_GET['performances'])) {
			?>
				<div id="actionbar">
					<div class="action-block">
						<a href="addartist.php">Artiest toevoegen</a>
					</div>
					<div class="action-block">
						<a href="manage.php?artists">Artiest beheren</a>
					</div>
					<div class="action-block">
						<a href="addperformance.php">Optreden toevoegen</a>
					</div>
				</div>
				<table>
			<?php
				if($row > 0) {
				?>
					<tr class="thead">
						<th>Optreden Artiest</th>
						<th>Auteur</th>
						<th>Updated</th>
						<th>Acties</th>
					</tr>
				<?php
				while($stmt->fetch()) {
			?>
				<tr>
					<td><?php echo $artist; ?></td>
					<td><?php echo $author; ?></td>
					<td><?php echo date('d-m-Y H:i:s', $modified); ?></td>
					<td class="edit"><a href="editperformance.php?id=<?php echo $performance_id; ?>">edit</a><a href="delete.php?performance&id=<?php echo $performance_id; ?>">delete</a></td>
				</tr>
			<?php
					}
				} else {
				?>
					<p>Er zijn nog geen optredens toegevoegd</p>
				<?php
				}
				?>
				</table>
				<?php
			}
			
			if(isset($_GET['events'])) {
			?>
			<div id="actionbar">
					<div class="action-block">
						<a href="addevent.php">Evenement toevoegen</a>
					</div>
				</div>
			<div id="manage-block">
			<table>
			<?php
				if($row > 0) {
				?>
					<tr class="thead">
						<th>Evenement</th>
						<th> Evenement datum</th>
						<th>Auteur</th>
						<th>Updated</th>
						<th>Status</th>
						<th>Acties</th>
					</tr>
				<?php
				while($stmt->fetch()) {
			?>
				<tr>
					<td><?php echo $title; ?></td>
					<td><?php echo $display_date; ?></td>
					<td><?php echo $author; ?></td>
					<td><?php echo date('d-m-Y H:i:s', $modified); ?></td>
					<td><?php if($status == 1) { echo "gepubliceerd"; } else { echo "niet gepubliceerd"; } ?></td>
					<td><a href="editevent.php?id=<?php echo $id; ?>">edit</a><a href="delete.php?event&id=<?php echo $id; ?>">delete</a></td>
				</tr>
			<?php
					}
				} else {
				?>
					<p>Er zijn nog geen evenementen toegevoegd</p>
				<?php
				}
				?>
				</div>
				</table>
				<?php
				$stmt->free_result();
				$stmt->close();
			}
			
			if(isset($_GET['sponsors'])) {
			?>
			<div id="actionbar">
					<div class="action-block">
						<a href="addsponsor.php">Sponsor toevoegen</a>
					</div>
				</div>
			<table>
			<?php
				if($row > 0) {
				?>
					<tr class="thead">
						<th>Sponsor</th>
						<th>Prioriteit</th>
						<th>Auteur</th>
						<th>Updated</th>
						<th>Acties</th>
					</tr>
				<?php
			while($stmt->fetch()) {
			?>
				<tr>
					<td><?php echo $title; ?></td>
					<td><?php echo $priority; ?></td>
					<td><?php echo $author; ?></td>
					<td><?php echo date('d-m-Y H:i:s', $modified); ?></td>
					<td><a href="editsponsor.php?id=<?php echo $id; ?>">edit</a><a href="delete.php?sponsor&id=<?php echo $id; ?>">delete</a></td>
				</tr>
			<?php
					}
				} else {
				?>
					<p>Er zijn nog geen sponsors toegevoegd</p>
				<?php
				}
				?>
				</table>
				<?php
				$stmt->free_result();
				$stmt->close();
			}
			
			if(isset($_GET['genres'])) {
			?>
			<div id="actionbar">
					<div class="action-block">
						<a href="addgenre.php">Genre toevoegen</a>
					</div>
				</div>
			<div id="manage-block">
			<table>
			<?php
				if($row > 0) {
				?>
					<tr class="thead">
						<th>Genre</th>
						<th>Acties</th>
					</tr>
				<?php
				while($stmt->fetch()) {
			?>
				<tr>
					<td><?php echo $genre; ?></td>
					<td class="delete"><a href="delete.php?genre&gid=<?php echo $id; ?>">delete</a></td>
				</tr>
			<?php
					}
				} else {
				?>
					<p>Er zijn nog geen Genres toegevoegd</p>
				<?php
				}
				?>
				</div>
				</table>
				<?php
				$stmt->free_result();
				$stmt->close();
			}	
			
			if(isset($_GET['stages'])) {
			?>
			<div id="actionbar">
					<div class="action-block">
						<a href="addstage.php">Stage toevoegen</a>
					</div>
				</div>
			<div id="manage-block">
			<table>
			<?php
				if($row > 0) {
				?>
					<tr class="thead">
						<th>Stage</th>
						<th>Auteur</th>
						<th>Updated</th>
						<th>Acties</th>
					</tr>
				<?php
				while($stmt->fetch()) {
			?>
				<tr>
					<td><?php echo $stage; ?></td>
					<td><?php echo $author;?></td>
					<td><?php echo date('d-m-Y H:i:s', $modified); ?></td>
					<td class="delete"><a href="editstage.php?id=<?php echo $id; ?>">edit</a><a href="delete.php?stage&id=<?php echo $id; ?>">delete</a></td>
				</tr>
			<?php
					}
				} else {
				?>
					<p>Er zijn nog geen Stages toegevoegd</p>
				<?php
				}
				?>
				</div>
				</table>
				<?php
				$stmt->free_result();
				$stmt->close();
			}		
			
			if(isset($_GET['accounts'])) {
			?>
			<div id="actionbar">
				<a href="new-account.php">Account toevoegen</a>
			</div>
			<table>
			<?php
				if($row > 0) {
				?>
				<thead>
					<tr>
						<th>Username</th>
						<th>Status</th>
						<th>Created</th>
						<th>Acties</th>
					</tr>
				</thead>
				<tbody>
				<?php
				while($stmt->fetch()) {
			?>
				<tr>
					<td><?php echo $username; ?></td>
					<td><?php if($status == 1){ echo 'active';} else { echo 'blocked'; }?></td>
					<td><?php echo date('d-m-Y H:i:s', $created); ?></td>
					<td><a href="editaccount.php?id=<?php echo $id; ?>">edit</a><a href="delete.php?account&id=<?php echo $id; ?>">delete</a></td>
				</tr>
			<?php
					}
				} else {
				?>
					<p>Er zijn accounts toegevoegd</p>
				<?php
				}
				?>
				</tbody>
				</table>
				<?php
				$stmt->free_result();
				$stmt->close();
			}		
			
			if(isset($_GET['pages'])) {
			?>
			<table>
			<?php
				if($row > 0) {
				?>
				<thead>
					<tr>
						<th>Pagina</th>
						<th>Auteur</th>
						<th>Status</th>
						<th>Updated</th>
						<th>Acties</th>
					</tr>
				</thead>
				<tbody>
				<?php
				while($stmt->fetch()) {
			?>
				<tr>
					<td><?php echo $page; ?></td>
					<td><?php echo $author; ?></td>
					<td><?php if($status == 1){ echo 'Gepubliceerd';} else { echo 'Niet gepubliceerd'; }?></td>
					<td><?php echo date('d-m-Y H:i:s', $modified); ?></td>
					<td><a href="editpage.php?id=<?php echo $id; ?>">edit</td>
				</tr>
			<?php
					}
				} else {
				?>
					<p>Er zijn geen pagina's toegevoegd</p>
				<?php
				}
				?>
				</tbody>
				</table>
				<?php
				$stmt->free_result();
				$stmt->close();
			}		
			
			?>
			
		</div>	
	</div>
</div>
</body>
</html>
<?php
} else {
	header("location: ../login.php");
	$con->close();
}
ob_flush();
?>