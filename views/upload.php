<?php
$message = false;

// patikriname ar useris prisijunges
$user = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : 0;

if (isset($_POST['link']) && isset($_POST['thumbnail']) && isset($_POST['title']) && isset($_POST['description']) && isset($_POST['category'])) {
    if (strlen($_POST['link']) > 10 && strlen($_POST['thumbnail']) > 10) {


        $link = $db->real_escape_string($_POST['link']);
        $thumbnail = $db->real_escape_string($_POST['thumbnail']);
        $title = $db->real_escape_string($_POST['title']);
        $description = $db->real_escape_string($_POST['description']);
        $category = intval($_POST['category']); // Ensure it's an integer

        // insertiname video detales i lentele
        $query = "INSERT INTO videos (url, thumbnail_url, name, description, category_id, user_id) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $db->prepare($query);
        $stmt->bind_param("ssssii", $link, $thumbnail, $title, $description, $category, $user);

        if ($stmt->execute()) {
            header('Location: index.php');
            $_SESSION['success_message'] = "Video successfully posted!";
            exit;
        } else {
            $message = 'Wrong data';
        }
    } else {
        $message = 'Please fill all fields!';
    }
}
?>

<div class="d-flex justify-content-center">
    <form class="signUp" method="POST">
        <h1 class="h3 mb-3 mt-3 text-center">Upload a video</h1>

        <label for="floatingInput">Video link</label>
        <input type="text" class="form-control plc mb-4" id="floatingInput" placeholder="Enter video link" name="link" required>

        <label for="floatingInput">Thumbnail link</label>
        <input type="text" class="form-control plc mb-4" id="floatingInput" placeholder="Enter thumbnail link" name="thumbnail" required>

        <label for="floatingInput">Title</label>
        <input type="text" class="form-control plc mb-4" id="floatingInput" placeholder="Enter video title" name="title" required>

        <label for="floatingInput">Description</label>
        <input type="text" class="form-control plc mb-4" id="floatingInput" placeholder="Enter video description" name="description" required>

        <label for="floatingInput">Category</label>
        <select class="form-control mb-4" name="category" id="floatingInput" required>
            <option value="" disabled selected>Choose a category</option>
            <?php foreach ($categories as $category) : ?>
                <option value="<?= $category['id'] ?>"><?= $category['name'] ?></option>
            <?php endforeach ?>
        </select>

        <?php if ($message) : ?>
            <div class="alert alert-danger">
                <?= $message ?>
            </div>
        <?php endif; ?>

        <button class="btn btn-primary w-100 py-2" type="submit">Upload</button>
    </form>
</div>