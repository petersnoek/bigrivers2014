<?php

$nsql = "SELECT * FROM news";
$nq = mysqli_query($con, $nsql) or die (mysqli_error($con));
$nrow = mysqli_num_rows($nq);

$asql = "SELECT * FROM artist";
$aq = mysqli_query($con, $asql) or die (mysqli_error($con));
$arow = mysqli_num_rows($aq);

$psql = "SELECT * FROM performance";
$pq = mysqli_query($con, $psql) or die (mysqli_error($con));
$prow = mysqli_num_rows($pq);

$esql = "SELECT * FROM event";
$eq = mysqli_query($con, $esql) or die (mysqli_error($con));
$erow = mysqli_num_rows($eq);

$ssql = "SELECT * FROM sponsor";
$sq = mysqli_query($con, $ssql) or die (mysqli_error($con));
$srow = mysqli_num_rows($sq);

?>