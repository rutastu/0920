<?php
// tikriname ar url yra nurodytas video id
if (isset($_GET['id'])) {
    $videoId = intval($_GET['id']);

    // prisijungiame prie duombazes
    $db = new mysqli('localhost', 'root', '', 'youtube');

    // tikriname ar pavyko prisijungti
    if ($db->connect_error) {
        die("Connection failed: " . $db->connect_error);
    }

    // paimame video pagal jo id
    $query = "SELECT * FROM videos WHERE id = $videoId";
    $result = $db->query($query);

    // tikriname ar video buvo rastas duombazeje
    if ($result->num_rows > 0) {
        $video = $result->fetch_assoc();
?>
        <div class="container mt-5">
            <iframe width="840" height="472.5" src="<?= $video['url'] ?>" frameborder="0" allow="autoplay" allowfullscreen></iframe>
            <div class="container mt-5"></div>
            <h1 class="text-right"><?= $video['name'] ?></h1>
            <div class="col-6 text-justify mt-5">
                <h5>Description:</h5>
                <p><?= nl2br($video['description']) ?></p>
                <h5>Uploaded by:</h5>
                <?php
                $user = $db->query('SELECT * FROM users WHERE id=' . $video['user_id'])->fetch_all(MYSQLI_ASSOC)[0];
                ?>
                <p><?= $user['username'] ?></p>
            </div>
        </div>
<?php
    } else {
        // jeigu nepavyko rasti video
        echo "<p>Video not found.</p>";
    }

    // uzdarome database connection
    $db->close();
} else {
    // Jeigu id nera nurodytas
    echo "<p>Video ID not provided.</p>";
}
?>