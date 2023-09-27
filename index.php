<?php
session_start();
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>
    <header>
        <div class="container mt-5 d-flex justify-content-end gap-3">
            <!-- Jeigu vartotojas prisijungęs, atvaizduojami šie mygtukai: -->
            <?php if (isset($_SESSION['user_id'])) : ?>
                <a href="?page=upload" class="btn orange">Upload a video</a>
                <a href="?page=logout" class="btn orange">Log Out</a>
                <!-- Jeigu vartotojas neprisijungęs, atvaizduojami šie mygtukai: -->
            <?php else : ?>
                <a href="?page=login" class="btn orange">Log In</a>
                <a href="?page=register" class="btn orange">Register</a>
            <?php endif; ?>
        </div>
    </header>
    <div class="container mt-5">
        <?php
        $page = isset($_GET['page']) ? $_GET['page'] : false;
        switch ($page) {
            case "login":
                include './views/login.php';
                break;
            case "register":
                include './views/register.php';
                break;
            case "player":
                include './views/player.php';
                break;
            case "upload":
                include './views/upload.php';
                break;
            case "logout":
                session_destroy();
                header('Location: ./');
                break;
            default:
                include './views/home.php';
        }
        ?>
    </div>
</body>

</html>