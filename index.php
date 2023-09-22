<?php

// Prisijungimo tikrinimas try/catch bloku pagalba
try {
    $db = new mysqli('localhost', 'root', '', 'youtube');
} catch (Exception $klaida) {
    echo 'Nepavyko prisijungti';
    exit;
}
//per post tikriname, ar kas nors buvo paduota i paieskos laukeli
if (isset($_POST['search'])) {
    $enteredName = $_POST['search'];
    //pasiimame video is database pagal tai kas buvo ivesta
    $resultFromVideos = $db->query("SELECT * FROM videos WHERE name LIKE '%$enteredName%'");
    //pasiimame video pagal kategorija, jei tokia buvo nurodyta
} elseif (isset($_GET['category'])) {
    $id = $_GET['category'];
    $resultFromVideos = $db->query("SELECT * FROM videos WHERE category_id = $id");
} else {
    //jei nieko nenurodyta tiesiog pasiimame visus video
    $resultFromVideos = $db->query("SELECT * FROM videos");
}

//paimame video, pagal tai kokia reiksme gavome aukstesniame ife.
if ($resultFromVideos->num_rows > 0) {
    $videos = $resultFromVideos->fetch_all(MYSQLI_ASSOC);
}

//Paimame visas kategorijas
$resultFromCategories = $db->query('SELECT * FROM categories');
if ($resultFromCategories->num_rows > 0) {
    $categories = $resultFromCategories->fetch_all(MYSQLI_ASSOC);
}



?>

</html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <div class="container">
        <?php
        switch ($page) {
            default:
                include './views/home.php';
        }
        ?>
    </div>
</body>

</html>