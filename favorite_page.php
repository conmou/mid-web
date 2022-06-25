<?php
session_start();
if (!empty($_COOKIE["acc"]) and !empty($_SESSION["acc"])) {
    $_SESSION["acc"] = $_COOKIE["acc"];
    $acc = $_SESSION['acc'];
} else {
    if (!empty($_SESSION["acc"])) {
        $acc = $_SESSION['acc'];
    } else {
        $acc = "";
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,shrink-to-fit=no">
    <title>收藏清單</title>
    <link rel="stylesheet" href="forum.css">
    <!-- FONT LINK -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;500&display=swap" rel="stylesheet">
    <!-- FONT LINK -->

    <!-- ICON LINK -->
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- ICON LINK -->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_2226582_dki77h4juap.css">
    <link rel="stylesheet" href="user_page.css">

    <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js'></script>
</head>

<body>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <?php require 'forum_header.php' ?>

    <div class="container-fluid p-0" style="margin-top:4%;">
        <div class="row m-0 p-0" style="height:1000px; margin:0;">
            <div class="col-12 p-5">
                <br>
                <h1 id="titlefont" style="padding-left:10%;">我的收藏</h1>
                <hr>
                <?php
                $link = @mysqli_connect('localhost', 'root', '', 'laptop');
                $link->query("SET NAMES utf8");
                $link->set_charset("utf8mb4");
                $sql =
                    "SELECT t1.*,t2.* FROM favorite as t1 
                INNER join specifics as t2 
                on t1.nb_id=t2.nb_id
                WHERE t1.m_Id='$acc' and t2.platform=t1.platform;";
                $result = mysqli_query($link, $sql);
                $counter = 1;
                while ($rows = mysqli_fetch_assoc($result)) {
                    $fav_id = $rows['fav_id'];
                    $urlLink = "http://localhost:8080/mid-web/delete_favorite.php?nb_id=" . $rows['nb_id'] . '&platform=' . $rows['platform'] . '&fav_id=' . $rows['fav_id'];
                    //if ($counter % 2 == 1) {
                    echo '<div class="d-flex" style="margin-top: 50px;">'; //最外圍div
                    echo
                    '
                        <div class="col-9 alert alert-secondary d-flex mx-auto" onclick="window.open(' . "'" . $rows['url'] . "'" . ');" id="imgshow" role="alert">
                           <div class="col-4 p-3" id="middleimg">
                              <img id="middleimg" class="rounded p-3 img-fluid" src="' . $rows['img_url'] . '" style="background-color: #fff; " />
                           </div>
                           <div class="col-6">
                              <p id="middleimg" style="font-size: 22px;line-height:150%;">' . '<span class="p-2" id="brand" style="font-size: 25px;line-height:250%;">' . $rows['brand'] . '</span><br>' .
                        '<span style="font-weight:bold;font-size: 25px;">' . $rows['nb_id'] . '</span><span style="font-size: 15px;">———————————————————————————————————————</span><br>' .
                        '        CPU：' . $rows['cpu'] . '<br>
                                 GPU：' . $rows['gpu'] . '<br>
                                 RAM：' . $rows['ram'] . '<br>
                                 SSD：' . $rows['SSD'] . '<br>
                                 HDD：' . $rows['HDD'] . '
                              </p>
                           </div>
                           <div class="col-1 align-self-end d-flex" style="background-color:#F8F9F9;opacity: 0.7;">';
                    if ($rows['platform'] == 'yahoo') {
                        echo   '<img src="img/Yahoo-Logo.png" class="img-fluid" style="width:70%;">';
                    } elseif ($rows['platform'] == 'sinya') {
                        echo   '<img src="img/sinya-square.png" class="img-fluid" style="width:70%;height:55px;position: relative;top: 50%;transform: translateY(5%);">';
                    } elseif ($rows['platform'] == 'pchome') {
                        echo   '<img src="https://fs-a.ecimg.tw/img/sites/fastag/assets/img/logo_app_2.svg?20210830153436" class="img-fluid" style="width:70%;">';
                    } elseif ($rows['platform'] == 'sinya_stu') {
                        echo   '<img src="img/sinya-stu-square.png" class="img-fluid" style="width:70%;height:55px;position: relative;top: 50%;transform: translateY(5%);">';
                    }
                    echo  '
                        <span class="pt-2 pb-2 pl-3 pr-3" style="font-weight:bold;font-size:30px;color:rgb(227, 65, 92);background-color:#F8F9F9;border-radius: 0 1em 1em 0;">$' .
                        $rows['price'] .
                        '</span>
                            </div>
                        </div>
                        <div class="mt-3" id="star">
                              <a href="' . $urlLink . '">
                                 <i class="bi bi-star-fill" style="color:#F8C83D ;font-size:30px;"></i>
                              </a>
                        </div>
                    </div>
                    ';
                }
                ?>
            </div>
        </div>
    </div>
</body>



</html>