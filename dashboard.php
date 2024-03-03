<?php
session_start();

// Check if the user is logged in, if not, redirect to the login page
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Include database configuration
include('db_config.php');

// Fetch user details for further customization
$user_id = $_SESSION['user_id'];
$stmt = $conn->prepare("SELECT username FROM users WHERE id = :user_id");
$stmt->bindParam(':user_id', $user_id);
$stmt->execute();
$user = $stmt->fetch(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="dashboard.css">
    <title>User Dashboard</title>
</head>
<body>

    <div class="container">
        <h1 id="welcome-message" >Welcome<br>To Your Blog Dashboard<br> <?php echo htmlspecialchars($user['username']); ?>!</h1><br>

        <p>This is your personalized dashboard,<br> where you can manage and explore various aspects of your blog.</p><br>

        <div class="dashboard-links">
            <a href="add.php">Create a New Post</a>
            <a href="view.php">View Posts</a>
        </div><br>

        <form action="login.php" method="post">
            <button type="submit" name="logout">Logout</button>
        </form>
    </div>

    <script src="dashboard.js"></script>
</body>
</html>