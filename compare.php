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
if ($_SESSION["compare1_nb_id"] != '') {
    $compare1_nb_id = $_SESSION["compare1_nb_id"];
    $link = @mysqli_connect('localhost', 'root', '', 'laptop');
    $link->query("SET NAMES utf8");
    $link->set_charset("utf8mb4");
    //compare1
    $sql1 = "SELECT * FROM specifics where nb_id='$compare1_nb_id';";
    $result1 = mysqli_query($link, $sql1);
    if (mysqli_num_rows($result1) > 0) {
        while ($row = mysqli_fetch_assoc($result1)) {
            $platform1 = $row['platform'];
            $url1 = $row['url'];
            $nb_id1 = $row['nb_id'];
            $brand1 = $row['brand'];
            $title1 = '[' . $brand1 . ']<br>' . $nb_id1;
            $price1 = $row['price'];
            $img_url1 = $row['img_url'];
            $cpu1 = $row['cpu'];
            $gpu1 = $row['gpu'];
            $ram1 = $row['ram'];
            $slot_max1 = $row['slot_max'];
            $SSD1 = $row['SSD'];
            $HDD1 = $row['HDD'];
            $weight1 = $row['weight'] . 'kg';
            $inch1 = $row['inch'];
            $resolution1 = $row['resolution'];
            $internet_device1 = $row['internet_device'];
            $battery1 = $row['battery'];
            $windows_version1 = $row['windows_version'];
        }
    }
} else {
    $platform1 = '';
    $url1 = '';
    $title1 = '';
    $nb_id1 = '';
    $price1 = '';
    $img_url1 = '';
    $brand1 = '';
    $cpu1 = '';
    $gpu1 = '';
    $ram1 = '';
    $slot_max1 = '';
    $SSD1 = '';
    $HDD1 = '';
    $weight1 = '';
    $inch1 = '';
    $resolution1 = '';
    $internet_device1 = '';
    $battery1 = '';
    $windows_version1 = '';
}
if ($_SESSION["compare2_nb_id"] != '') {
    $compare2_nb_id = $_SESSION["compare2_nb_id"];
    $link = @mysqli_connect('localhost', 'root', '', 'laptop');
    $link->query("SET NAMES utf8");
    $link->set_charset("utf8mb4");
    //compare2
    $sql2 = "SELECT * FROM specifics where nb_id='$compare2_nb_id';";
    $result2 = mysqli_query($link, $sql2);
    if (mysqli_num_rows($result1) > 0) {
        while ($row = mysqli_fetch_assoc($result2)) {
            $platform2 = $row['platform'];
            $url2 = $row['url'];
            $brand2 = $row['brand'];
            $nb_id2 = $row['nb_id'];
            $title2 = '[' . $brand2 . ']<br>' . $nb_id2;
            $price2 = $row['price'];
            $img_url2 = $row['img_url'];
            $cpu2 = $row['cpu'];
            $gpu2 = $row['gpu'];
            $ram2 = $row['ram'];
            $slot_max2 = $row['slot_max'];
            $SSD2 = $row['SSD'];
            $HDD2 = $row['HDD'];
            $weight2 = $row['weight'] . 'kg';
            $inch2 = $row['inch'];
            $resolution2 = $row['resolution'];
            $internet_device2 = $row['internet_device'];
            $battery2 = $row['battery'];
            $windows_version2 = $row['windows_version'];
        }
    }
} else {
    $platform2 = '';
    $url2 = '';
    $title2 = '';
    $nb_id2 = '';
    $price2 = '';
    $img_url2 = '';
    $brand2 = '';
    $cpu2 = '';
    $gpu2 = '';
    $ram2 = '';
    $slot_max2 = '';
    $SSD2 = '';
    $HDD2 = '';
    $weight2 = '';
    $inch2 = '';
    $resolution2 = '';
    $internet_device2 = '';
    $battery2 = '';
    $windows_version2 = '';
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
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

    <!-- <title>Document</title> -->
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_2226582_dki77h4juap.css">
    <link rel="stylesheet" src="compare.css">
    <link rel="stylesheet" href="user_page.css">

    <style>
        /* body {
            font-size: 100%;
        } */

        .outside_wrapper {
            position: relative;
            width: 30vw;
            height: 30vw;
            border-radius: 20px;
            margin: 20px;
        }

        .inside_wrapper {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 25vw;
            height: 25vw;
            border-radius: 20px;
            margin: 2.5vw;
            top: -5vw;
            /* text-align: center; */
        }

        .list_name_bg_wrapper {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 30vw;
            height: 8vw;
            border-radius: 0px 0px 20px 20px;
            bottom: 12vw;
        }

        .list_name_top_wrapper {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 20vw;
            height: 5vw;
            border-radius: 20px 10px 50px 10px;
            z-index: 1;
            /* top: 0vw; */
        }

        .list_name_wrapper {
            position: relative;
            display: flex;
            color: white;
            font-size: 2em;
            font-weight: 900;
            text-align: center;
        }

        .img_location {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .title {
            position: fixed;
            max-width: 100%;
            height: 0%;
            top: 0%;
            text-align: center;
            padding: 0%;
        }

        @font-face {
            font-family: 'cwTeXYen';
            font-style: normal;
            /* src: local("GenJyuuGothic-Bold.ttf"); */
            /* src: url("/fonts/GenJyuuGothic-Bold.ttf"); */
            src: url(https://justfont.com/huninn/);
            src: url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.eot);
            src: url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.eot?#iefix) format('embedded-opentype'),
                url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.woff2) format('woff2'),
                url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.woff) format('woff'),
                url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.ttf) format('truetype');
        }
    </style>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>比較頁面</title>
</head>

<body>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <?php
    require("header.php")
    ?>
    <div class="container-fluid">
        <div class="row" style="margin-top:5vw;">
            <div class="col-1">
            </div>
            <div class="col-4">
                <div class="outside_wrapper" style="background-color:#D9D9D9;margin:0px auto;">
                    <div class='list_name_top_wrapper' style="background-color:#44546A;">
                        <span class='list_name_wrapper' style="font-size:1.8vw;">
                            <?php echo $brand2; ?>
                        </span>
                    </div>
                    <div class="inside_wrapper" style="background-color:white">
                        <img src=<?php echo $img_url1; ?> class='rounded mx-auto d-block img-fluid'>
                    </div>
                    <div class='list_name_bg_wrapper' style="background-color:#44546A;">
                        <span class='list_name_wrapper' style="font-size:1.8vw;">
                            <?php echo $nb_id1; ?>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <a style="color: #800000;font-size:2.25vw;font-weight:bolder;font-size:5em;">VS.</a>
            </div>
            <div class="col-4">
                <div class="outside_wrapper" style="background-color:#D9D9D9;margin:0px auto;">
                    <div class='list_name_top_wrapper' style="background-color:#44546A;">
                        <span class='list_name_wrapper' style="font-size:1.8vw;">
                            <?php echo $brand2; ?>
                        </span>
                    </div>
                    <div class="inside_wrapper" style="background-color:white">
                        <img src=<?php echo $img_url2; ?> class='rounded mx-auto d-block img-fluid'>
                    </div>
                    <div class='list_name_bg_wrapper' style="background-color:#44546A;">
                        <span class='list_name_wrapper' style="font-size:1.8vw;">
                            <?php echo $nb_id2; ?>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-1">
            </div>
        </div>
        <!-- <hr> -->
        <div class="row" style="margin-top:5vw;">
            <div class="col-1">
            </div>
            <div class="col-4" style="text-align: center;">
                <?php
                if ($platform1 == "yahoo") {
                    echo "
                        <a href={$url1} target='_blank'>
                        <button  class='btn btn-secondary btn-lg p-0'// dropdown-toggle
                            style='width: 70%;background-color:#ffffff;color:darkgray;font-size: 2.5vw;line-height:2vw; height: 100px;'
                            type='button' aria-haspopup='true' aria-expanded='false'>
                                <img src='img/Yahoo-Logo.png' class='img-fluid' style='position: relative; max-width:20%; height: 70px;'>";
                    echo "<font color='#E85D75' class='col-9'style='font-weight: bolder;font-size:1.8vw;margin-left:0.2vw;'>"; //style='right:1vw;'
                    echo "$" . $price1;
                    echo "</font>";
                    echo '   </button>
                        </a>';
                } elseif ($platform1 == "sinya") {
                    echo "
                        <a href={$url1} target='_blank'>
                        <button class='btn btn-secondary btn-lg p-0'// dropdown-toggle
                            style='width: 70%;background-color:#ffffff;color:darkgray; height:100px;padding-top: 10px !important;'
                            type='button' aria-haspopup='true' aria-expanded='false'>
                                <img src='img/sinya-square.png' class='img-fluid mb-2' style='position: relative; max-width:20%; height:auto;'>";
                    echo "<font color='#E85D75' class='col-9'style='font-weight: bolder;font-size:1.8vw;margin-left:0.9vw;'>"; //style='right:1vw;'
                    echo "$" . $price1;
                    echo "</font>";
                    echo '   </button>
                        </a>';
                } elseif ($platform1 == "pchome") {
                    echo "
                        <a href={$url1} target='_blank'>
                        <button class='btn btn-secondary btn-lg p-0'// dropdown-toggle
                            style='width: 70%;background-color:#ffffff;color:darkgray; height:100px;padding-top: 10px !important;'
                            type='button' aria-haspopup='true' aria-expanded='false'>
                                <img src='https://fs-a.ecimg.tw/img/sites/fastag/assets/img/logo_app_2.svg?20210830153436' class='img-fluid mb-2' style='position: relative; max-width:20%; height:auto;'>";
                    echo "<font color='#E85D75' class='col-9'style='font-weight: bolder;font-size:1.8vw;margin-left:0.9vw;'>"; //style='right:1vw;'
                    echo "$" . $price1;
                    echo "</font>";
                    echo '   </button>
                        </a>';
                } elseif ($platform1 == "sinya_stu") {
                    echo "
                        <a href={$url1} target='_blank'>
                        <button class='btn btn-secondary btn-lg p-0'// dropdown-toggle
                            style='width: 70%;background-color:#ffffff;color:darkgray; height:100px;padding-top: 10px !important;'
                            type='button' aria-haspopup='true' aria-expanded='false'>
                                <img src='img/sinya-stu-square.png' class='img-fluid mb-2' style='position: relative; max-width:20%; height:auto; width: 80px;'>";
                    echo "<font color='#E85D75' class='col-9'style='font-weight: bolder;font-size:1.8vw;margin-left:0.9vw;'>"; //style='right:1vw;'
                    echo "$" . $price1;
                    echo "</font>";
                    echo '   </button>
                        </a>';
                }
                ?>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <h1 style="color: #800000;font-size:2.25vw;font-weight:bolder;">價格</h1><br><br>
            </div>
            <div class="col-4" style="text-align: center;">
                <?php
                if ($platform2 == "yahoo") {
                    echo "
                        <a href={$url2} target='_blank'>
                        <button  class='btn btn-secondary btn-lg p-0'// dropdown-toggle
                            style='width:70%;background-color:#ffffff;color:darkgray;font-size: 2.5vw;line-height:2vw; height: 100px;'
                            type='button' aria-haspopup='true' aria-expanded='false'>
                                <img src='img/Yahoo-Logo.png' class='img-fluid' style='position: relative; max-width:20%; height:auto;'>";
                    echo "<font color='#E85D75' class='col-9'style='font-weight: bolder;font-size:1.8vw;margin-left:0.2vw;'>"; //style='right:1vw;'
                    echo "$" . $price2;
                    echo "</font>";
                    echo '   </button>
                        </a>';
                } elseif ($platform2 == "sinya") {
                    echo "
                        <a href={$url2} target='_blank'>
                        <button class='btn btn-secondary btn-lg p-0'// dropdown-toggle
                            style='width: 70%;background-color:#ffffff;color:darkgray; height:100px;padding-top: 10px !important;'
                            type='button' aria-haspopup='true' aria-expanded='false'>
                                <img src='img/sinya-square.png' class='img-fluid mb-2' style='position: relative; max-width:20%; height:auto;'>";
                    echo "<font color='#E85D75' class='col-9'style='font-weight: bolder;font-size:1.8vw;margin-left:0.9vw;'>"; //style='right:1vw;'
                    echo "$" . $price2;
                    echo "</font>";
                    echo '   </button>
                        </a>';
                } elseif ($platform2 == "pchome") {
                    echo "
                        <a href={$url2} target='_blank'>
                        <button class='btn btn-secondary btn-lg p-0'// dropdown-toggle
                            style='width: 70%;background-color:#ffffff;color:darkgray; height:100px;padding-top: 10px !important;'
                            type='button' aria-haspopup='true' aria-expanded='false'>
                                <img src='https://fs-a.ecimg.tw/img/sites/fastag/assets/img/logo_app_2.svg?20210830153436' class='img-fluid mb-2' style='position: relative; max-width:20%; height:auto;'>";
                    echo "<font color='#E85D75' class='col-9'style='font-weight: bolder;font-size:1.8vw;margin-left:0.9vw;'>"; //style='right:1vw;'
                    echo "$" . $price2;
                    echo "</font>";
                    echo '   </button>
                        </a>';
                } elseif ($platform2 == "sinya_stu") {
                    echo "
                        <a href={$url2} target='_blank'>
                        <button class='btn btn-secondary btn-lg p-0'// dropdown-toggle
                            style='width: 70%;background-color:#ffffff;color:darkgray; height:100px;padding-top: 10px !important;'
                            type='button' aria-haspopup='true' aria-expanded='false'>
                                <img src='img/sinya-stu-square.png' class='img-fluid mb-2' style='position: relative; max-width:20%; height:auto; width: 80px;'>";
                    echo "<font color='#E85D75' class='col-9'style='font-weight: bolder;font-size:1.8vw;margin-left:0.9vw;'>"; //style='right:1vw;'
                    echo "$" . $price2;
                    echo "</font>";
                    echo '   </button>
                        </a>';
                }
                ?>
            </div>
            <div class="col-1">
            </div>
        </div>
        <!-- <hr> -->
        <div class="row" style="margin-top:3vw;">
            <div class="col-1">
            </div>
            <div class="col-4" style="font-size:1.8vw;text-align:right;">
                <?php echo $cpu1; ?>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <h1 style="color: #800000;font-size:2.25vw;font-weight:bolder;">CPU</h1><br><br>
            </div>
            <div class="col-4" style="font-size:1.8vw;">
                <?php echo $cpu2; ?>
            </div>
            <div class="col-1">
            </div>
        </div>

        <hr>
        <div class="row" style="margin-top:1vw;">
            <div class="col-1">
            </div>
            <div class="col-4" style="font-size:1.8vw;text-align:right;">
                <?php echo $gpu1; ?>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <h1 style="color: #800000;font-size:2.25vw;font-weight:bolder;">GPU</h1><br><br>
            </div>
            <div class="col-4" style="font-size:1.8vw;">
                <?php echo $gpu2; ?>
            </div>
            <div class="col-1">
            </div>
        </div>
        <hr>
        <div class="row" style="margin-top:1vw;">
            <div class="col-1">
            </div>
            <div class="col-4" style="font-size:1.8vw;text-align:right;">
                <?php echo $ram1; ?>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <h1 style="color: #800000;font-size:2.25vw;font-weight:bolder;">RAM</h1><br><br>
            </div>
            <div class="col-4" style="font-size:1.8vw;">
                <?php echo $ram2; ?>
            </div>
            <div class="col-1">
            </div>
        </div>
        <hr>
        <div class="row" style="margin-top:1vw;">
            <div class="col-1">
            </div>
            <div class="col-4" style="font-size:1.8vw;text-align:right;">
                <?php echo $slot_max1; ?>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <h1 style="color: #800000;font-size:2.25vw;font-weight:bolder;">記憶體插槽&<br>最高支援容量</h1><br><br>
            </div>
            <div class="col-4" style="font-size:1.8vw;">
                <?php echo $slot_max2; ?>
            </div>
            <div class="col-1">
            </div>
        </div>
        <hr>
        <div class="row" style="margin-top:1vw;">
            <div class="col-1">
            </div>
            <div class="col-4" style="font-size:1.8vw;text-align:right;">
                <?php echo $SSD1; ?>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <h1 style="color: #800000;font-size:2.25vw;font-weight:bolder;">SSD</h1><br><br>
            </div>
            <div class="col-4" style="font-size:1.8vw;">
                <?php echo $SSD2; ?>
            </div>
            <div class="col-1">
            </div>
        </div>
        <hr>
        <div class="row" style="margin-top:1vw;">
            <div class="col-1">
            </div>
            <div class="col-4" style="font-size:1.8vw;text-align:right;">
                <?php echo $HDD1; ?>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <h1 style="color: #800000;font-size:2.25vw;font-weight:bolder;">HDD</h1><br><br>
            </div>
            <div class="col-4" style="font-size:1.8vw;">
                <?php echo $HDD2; ?>
            </div>
            <div class="col-1">
            </div>
        </div>
        <hr>
        <div class="row" style="margin-top:1vw;">
            <div class="col-1">
            </div>
            <div class="col-4" style="font-size:1.8vw;text-align:right;">
                <?php echo $inch1; ?>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <h1 style="color: #800000;font-size:2.25vw;font-weight:bolder;">螢幕尺寸</h1><br><br>
            </div>
            <div class="col-4" style="font-size:1.8vw;">
                <?php echo $inch2; ?>
            </div>
            <div class="col-1">
            </div>
        </div>
        <hr>
        <div class="row" style="margin-top:1vw;">
            <div class="col-1">
            </div>
            <div class="col-4" style="font-size:1.8vw;text-align:right;">
                <?php echo $weight1; ?>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <h1 style="color: #800000;font-size:2.25vw;font-weight:bolder;">重量</h1><br><br>
            </div>
            <div class="col-4" style="font-size:1.8vw;">
                <?php echo $weight2; ?>
            </div>
            <div class="col-1">
            </div>
        </div>
        <hr>
        <div class="row" style="margin-top:1vw;">
            <div class="col-1">
            </div>
            <div class="col-4" style="font-size:1.8vw;text-align:right;">
                <?php echo $resolution1; ?>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <h1 style="color: #800000;font-size:2.25vw;font-weight:bolder;">螢幕解析度</h1><br><br>
            </div>
            <div class="col-4" style="font-size:1.8vw;">
                <?php echo $resolution2; ?>
            </div>
            <div class="col-1">
            </div>
        </div>
        <hr>
        <div class="row" style="margin-top:1vw;">
            <div class="col-1">
            </div>
            <div class="col-4" style="font-size:1.8vw;text-align:right;">
                <?php echo $internet_device1; ?>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <h1 style="color: #800000;font-size:2.25vw;font-weight:bolder;">無線連接裝置</h1><br><br>
            </div>
            <div class="col-4" style="font-size:1.8vw;">
                <?php echo $internet_device2; ?>
            </div>
            <div class="col-1">
            </div>
        </div>
        <hr>
        <div class="row" style="margin-top:1vw;">
            <div class="col-1">
            </div>
            <div class="col-4" style="font-size:1.8vw;text-align:right;">
                <?php echo $battery1; ?>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <h1 style="color: #800000;font-size:2.25vw;font-weight:bolder;">電池</h1><br><br>
            </div>
            <div class="col-4" style="font-size:1.8vw;">
                <?php echo $battery2; ?>
            </div>
            <div class="col-1">
            </div>
        </div>
        <hr>
        <div class="row" style="margin-top:1vw;">
            <div class="col-1">
            </div>
            <div class="col-4" style="font-size:1.8vw;text-align:right;">
                <?php echo $windows_version1; ?>
            </div>
            <div class="col-2" style="display:flex;justify-content: center; align-items:center;">
                <h1 style="color: #800000;font-size:2.25vw;font-weight:bolder;">windows版本</h1><br><br>
            </div>
            <div class="col-4" style="font-size:1.8vw;">
                <?php echo $windows_version2; ?>
            </div>
            <div class="col-1">
            </div>
        </div>
        <!-- <hr> -->

    </div>
    </div>
    </div>
    </div>
    </div>
</body>

</html>