<?php
session_start();

// Check if the user is logged in, if not, redirect to the login page
if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit();
}

// Include database configuration
include('db_config.php');

// Handle form submission for creating a new post
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['create_post'])) {
    $title = $_POST['title'];
    $content = $_POST['content'];

    // Validate non-empty fields
    if (empty($title) || empty($content)) {
        $error_message = "Title and content are required.";
    } else {
        // Insert into the database using prepared statement
        try {
            $user_id = $_SESSION['user_id'];
            $stmt = $conn->prepare("INSERT INTO posts (user_id, title, content) VALUES (:user_id, :title, :content)");
            $stmt->bindParam(':user_id', $user_id);
            $stmt->bindParam(':title', $title);
            $stmt->bindParam(':content', $content);
            $stmt->execute();

            // Redirect to the view posts page after successful post creation
            header("Location: view.php");
            exit();
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="add.css">
    <title>Create a New Post</title>
</head>
<body>

    <div class="container">
        <h1>Create a New Post</h1>

        <?php
        // Display error message if validation fails
        if (isset($error_message)) {
            echo '<p class="error-message">' . $error_message . '</p>';
        }
        ?>

        <form id="createPostForm" action="add.php" method="post" onsubmit="return validatePostForm()">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>

            <label for="content">Content:</label>
            <textarea id="content" name="content" rows="5" required></textarea>

            <button type="submit" name="create_post">Create Post</button>
        </form>
    </div>

    <script src="add.js"></script>
</body>
</html>