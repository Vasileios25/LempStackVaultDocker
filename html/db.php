<?php
$servername = "source_sql";
$username = "root";
$password = "bill";
$dbname = "app";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>