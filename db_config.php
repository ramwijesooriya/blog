<?php
// Database configuration
$host = "localhost"; // Database host (usually "localhost")
$db_name = "blog_system"; // Database name
$username = "root"; // Database username
$password = ""; // Database password

try {
    $conn = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>