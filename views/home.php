<?php

$videosPerPage = 20;
$totalVideos = count($videos);

//kiek is viso bus puslapiu
$totalPages = ceil($totalVideos / $videosPerPage);

$currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;
$category = isset($_GET['category']) ? $_GET['category'] : '';

//offsetas
//kur prasideda sarasas, kuri norima atvaizduoti
$offset = ($currentPage - 1) * $videosPerPage;

//visas sarasas, nuo kur pradeti, kiek per puslapi
$videos = array_slice($videos, $offset, $videosPerPage);
?>

<div class="d-flex justify-content-center gap-3 mt-3">
    <?php foreach ($categories as $row) : ?>
        <a href="?category=<?= $row['id'] ?>" class="btn btn-sm orange"><?= $row['name'] ?></a>
    <?php endforeach; ?>
</div>
<form class="input-group mt-3" method='POST' action="./">
    <input type="text" class="form-control" name="search">
    <button class="btn orange">Search</button>
</form>
<div class="row mt-5">
    <?php
    if (isset($videos)) {
        foreach ($videos as $row) : ?>
            <div class="col-4 mb-5">
                <a href="?page=player&id=<?= $row['id'] ?>">
                    <img src=<?= $row['thumbnail_url'] ?> alt=<?= $row['name'] ?> style="max-width: 100%">
                </a>
                <a href="?page=player&id=<?= $row['id'] ?>" class="text-decoration-none text-reset"><?= $row['name'] ?></a>
            </div>
    <?php endforeach;
    } else {
        echo "<h5 class='text-center'>No videos available</h5>";
    }
    ?>
</div>

<!-- puslapiavimas -->
<div class="d-flex justify-content-center mt-3 mb-2">
    <ul class="pagination">
        <?php if ($currentPage > 1) : ?>
            <!-- jei kategorijos viduje einama per puslapius -->
            <?php if ($category === '') : ?>
                <li class="page-item"><a class="page-link" href="?page=<?= $currentPage - 1 ?>">Previous</a></li>
            <?php else : ?>
                <li class="page-item"><a class="page-link" href="?page=<?= $currentPage - 1 ?>&category=<?= $category ?>">Previous</a></li>
            <?php endif; ?>
        <?php endif; ?>

        <?php for ($i = 1; $i <= $totalPages; $i++) : ?>
            <?php if ($category === '') : ?>
                <li class="page-item <?= ($i === $currentPage) ? 'active' : '' ?>"><a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a></li>
            <?php else : ?>
                <li class="page-item <?= ($i === $currentPage) ? 'active' : '' ?>"><a class="page-link" href="?page=<?= $i ?>&category=<?= $category ?>"><?= $i ?></a></li>
            <?php endif; ?>
        <?php endfor; ?>

        <?php if ($currentPage < $totalPages) : ?>
            <?php if ($category === '') : ?>
                <li class="page-item"><a class="page-link" href="?page=<?= $currentPage + 1 ?>">Next</a></li>
            <?php else : ?>
                <li class="page-item"><a class="page-link" href="?page=<?= $currentPage + 1 ?>&category=<?= $category ?>">Next</a></li>
            <?php endif; ?>
        <?php endif; ?>
    </ul>
</div>