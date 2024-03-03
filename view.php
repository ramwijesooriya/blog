<?php
session_start();

// Include database configuration
include('db_config.php');

// Fetch and display posts
try {
    $stmt = $conn->prepare("SELECT posts.*, users.username FROM posts JOIN users ON posts.user_id = users.id ORDER BY posts.created_at DESC");
    $stmt->execute();
    $posts = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Error: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="view.css">
    <title>View Posts</title>
</head>
<body>

    <div class="container">
        <h1>View Posts</h1>

        <?php foreach ($posts as $post): ?>
            <div class="post">
                <h2><?= htmlspecialchars($post['title']) ?></h2>
                <p class="username">By <?= htmlspecialchars($post['username']) ?></p>
                <div class="content">
                    <?= nl2br(htmlspecialchars($post['content'])) ?>
                </div>
            </div>
        <?php endforeach; ?>
    </div>

    <script src="view.js"></script>

</body>
</html>