<?php

$servername = "localhost:3307";
$username = "root";
$password = "";
$dbName = "stern";

$dbc = mysqli_connect($servername, $username, $password, $dbName) or die("Error connecting to MySQL server " . mysqli_connect_error());
mysqli_set_charset($dbc,"utf8");

#if($dbc) echo "Connected successfully";

?>