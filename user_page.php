<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
   <link rel="stylesheet" href="slider.css">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>使用者頁面</title>

</head>

<body>
   <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
   <div class="wrapper">
      <!-- 回到頂端按鈕 start -->
      <!-- 回到頂端按鈕 end, Design by WFU BLOG -->
</body>
<?php
//點擊率更新
$link = @mysqli_connect('localhost', 'root', '', 'laptop');
$link->query("SET NAMES utf8");
$link->set_charset("utf8mb4");
$today = date('Y-m-d');

$count_sql = "select * from `performance` WHERE date='$today'";
$result = mysqli_query($link, $count_sql);
$count = $result->num_rows;
if ($count == 0) {
   $sql = "insert into performance(date,reach) values('$today',1)";
} else {
   $sql = "UPDATE `performance` set reach=reach+1 WHERE date='$today'";
}
mysqli_query($link, $sql);
?>
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

//取得compare1_nb_id資料
if (isset($_GET['compare1_nb_id'])) {
   $compare1_nb_id = $_GET["compare1_nb_id"];
} else {
   $compare1_nb_id = '';
}
$_SESSION["compare1_nb_id"] = $compare1_nb_id;

if (isset($_GET['compare1_platform'])) {
   $compare1_platform = $_GET['compare1_platform'];
} else {
   $compare1_platform = '';
}
$_SESSION["compare1_platform"] = $compare1_platform;

//取得compare2_nb_id資料
if (isset($_GET['compare2_nb_id'])) {
   $compare2_nb_id = $_GET['compare2_nb_id'];
} else {
   $compare2_nb_id = '';
}
$_SESSION["compare2_nb_id"] = $compare2_nb_id;

if (isset($_GET['compare2_platform'])) {
   $compare2_platform = $_GET['compare2_platform'];
} else {
   $compare2_platform = '';
}
$_SESSION["compare2_platform"] = $compare2_platform;

if ($_GET) {
   //判斷nb_id是否有GET傳入
   if (isset($_GET["nb_id"])) {
      $nb_id = trim($_GET["nb_id"]);
   } else {
      $nb_id = "";
   }
   $_SESSION["nb_id"] = $nb_id;

   //判斷platform是否有GET傳入
   if (isset($_GET["platform"])) {
      $platform = $_GET["platform"];
   } else {
      $platform = "";
   }
   $_SESSION["platform"] = $platform;

   //判斷brand是否有GET傳入
   if (isset($_GET["brand"])) {
      $brand = $_GET["brand"];
   } else {
      $brand = "";
   }
   $_SESSION["brand"] = $brand;

   //判斷cpu是否有GET傳入
   if (isset($_GET["cpu"])) {
      $cpu = $_GET["cpu"];
   } else {
      $cpu = "";
   }
   $_SESSION["cpu"] = $cpu;

   //判斷gpu是否有GET傳入
   if (isset($_GET["gpu"])) {
      $gpu = $_GET["gpu"];
   } else {
      $gpu = "";
   }
   $_SESSION["gpu"] = $gpu;

   //判斷ram是否有GET傳入
   if (isset($_GET["ram"])) {
      $ram = $_GET["ram"];
   } else {
      $ram = "";
   }
   $_SESSION["ram"] = $ram;

   //判斷SSD是否有GET傳入
   if (isset($_GET["SSD"])) {
      $SSD = $_GET["SSD"];
   } else {
      $SSD = "";
   }
   $_SESSION["SSD"] = $SSD;

   //判斷HDD是否有GET傳入
   if (isset($_GET["HDD"])) {
      $HDD = $_GET["HDD"];
   } else {
      $HDD = "";
   }
   $_SESSION["HDD"] = $HDD;

   //判斷weight是否有GET傳入
   if (isset($_GET["weight"])) {
      $weight = $_GET["weight"];
   } else {
      $weight = "";
   }
   $_SESSION["weight"] = $weight;

   //判斷inch是否有GET傳入
   if (isset($_GET["inch"])) {
      $inch = $_GET["inch"];
   } else {
      $inch = "";
   }
   $_SESSION["inch"] = $inch;


   //判斷價格排序是否有GET傳入
   if (isset($_GET["minPrice"])) {
      $minPrice =  $_GET["minPrice"];
   } else {
      $minPrice = '0';
   }

   if (isset($_GET["maxPrice"])) {
      $maxPrice =  $_GET["maxPrice"];
   } else {
      $maxPrice = '0';
   }
   if ($minPrice >= $maxPrice) {
      $temp = $maxPrice;
      $maxPrice = $minPrice;
      $minPrice = $temp;
   }
   $_SESSION["minPrice"] = $minPrice;
   $_SESSION["maxPrice"] = $maxPrice;

   //判斷價格排序是否有GET傳入
   if (isset($_GET["orderByPrice"])) {
      $orderByPrice = $_GET["orderByPrice"];
   } else {
      $orderByPrice = "";
   }
   $_SESSION["orderByPrice"] = $orderByPrice;

   //判斷重量排序是否有GET傳入
   if (isset($_GET["orderByWeight"])) {
      $orderByWeight = $_GET["orderByWeight"];
   } else {
      $orderByWeight = "";
   }
   $_SESSION["orderByWeight"] = $orderByWeight;
} else {
   $_SESSION['nb_id'] = "";
   $_SESSION["platform"] = "";
   $_SESSION["brand"] = "";
   $_SESSION["cpu"] = '';
   $_SESSION["gpu"] = '';
   $_SESSION["ram"] = '';
   $_SESSION["SSD"] = '';
   $_SESSION["HDD"] = '';
   $_SESSION["weight"] = '';
   $_SESSION["inch"] = '';
   $_SESSION["price"] = '0';
   $_SESSION["minPrice"] = '0';
   $_SESSION["maxPrice"] = '0';
   $_SESSION['orderByPrice'] = '';
   $_SESSION['orderByWeight'] = '';
}
?>

<?php
//判斷要get哪些value
if ($_SESSION["compare1_nb_id"] != '') {
   if ($_SESSION["compare2_nb_id"] != '') {
      echo '<form name="search_form form-inline my-2 my-lg-0" action="user_page.php?compare1_nb_id=' . $_SESSION["compare1_nb_id"] . '&compare2_nb_id=' . $_SESSION["compare2_nb_id"] . '" method="get">';
   } else {
      echo '<form name="search_form form-inline my-2 my-lg-0" action="user_page.php?compare1_nb_id=' . $_SESSION["compare1_nb_id"] . '" method="get">';
   }
} else {
   echo '<form name="search_form form-inline my-2 my-lg-0" action="user_page.php" method="get">';
}
?>
<br>
<?php
if (!empty($nb_id)) {
   echo '<input class="form-control mr-sm-2 id_search_bar" type="text" name="nb_id" value="' . $nb_id . '" placeholder="  以型號搜尋" style="border-radius:10vw;font-size:1.4vw;">';
} else {
   echo '<input class="form-control mr-sm-2 id_search_bar" type="text" name="nb_id" placeholder="  以型號搜尋" style="border-radius:10vw;font-size:1.4vw;">';
}
?>
<div style="display: flex; align-items: center; ">
   <div id="more_option" style="margin: 2vw 0vw 1vw 0vw;">篩選條件 <i class="bi bi-chevron-down"></i></div>
   <?php
   if (!empty($platform) or !empty($brand) or !empty($cpu) or !empty($gpu) or !empty($ram) or !empty($SSD) or !empty($HDD) or !empty($inch) or !empty($weight)) {
      echo '   <input type="submit" id="reset_button" style="border:none;border-radius:10px;" value="清空篩選" Onclick="resetLabels()">';
   }
   ?>
</div>
<div id="radio" style="font-size:1vw;">
   <div class="option">
      以平台搜尋：
      <label><input type="radio" name="platform" value="yahoo" <?php echo ($_SESSION["platform"] == "yahoo") ? "checked" : ""; ?>><span class="round button">yahoo</span></label>
      <label><input type="radio" name="platform" value="pchome" <?php echo ($_SESSION["platform"] == "pchome") ? "checked" : ""; ?>><span class="round button">pchome</span></label>
      <label><input type="radio" name="platform" value="sinya" <?php echo ($_SESSION["platform"] == "sinya") ? "checked" : ""; ?>><span class="round button">sinya</span></label>
      <label><input type="radio" name="platform" value="sinya_stu" <?php echo ($_SESSION["platform"] == "sinya_stu") ? "checked" : ""; ?>><span class="round button">sinya學生價</span></label>
   </div>
   <div class="option">
      以品牌搜尋：
      <label><input type="radio" name="brand" value="acer" <?php echo ($_SESSION["brand"] == "acer") ? "checked" : ""; ?>><span class="round button">Acer宏碁</span></label>
      <label><input type="radio" name="brand" value="ASUS" <?php echo ($_SESSION["brand"] == "ASUS") ? "checked" : ""; ?>><span class="round button">ASUS華碩</span></label>
      <label><input type="radio" name="brand" value="AVITA" <?php echo ($_SESSION["brand"] == "AVITA") ? "checked" : ""; ?>><span class="round button">AVITA</span></label>
      <label><input type="radio" name="brand" value="Dell" <?php echo ($_SESSION["brand"] == "Dell") ? "checked" : ""; ?>><span class="round button">Dell戴爾</span></label>
      <label><input type="radio" name="brand" value="Dynabook" <?php echo ($_SESSION["brand"] == "Dynabook") ? "checked" : ""; ?>><span class="round button">Dynabook</span></label>
      <label><input type="radio" name="brand" value="Genuine" <?php echo ($_SESSION["brand"] == "Genuine") ? "checked" : ""; ?>><span class="round button">Genuine</span></label>
      <label><input type="radio" name="brand" value="GIGABYTE" <?php echo ($_SESSION["brand"] == "GIGABYTE") ? "checked" : ""; ?>><span class="round button">GIGABYTE技嘉</span></label>
      <label><input type="radio" name="brand" value="HP" <?php echo ($_SESSION["brand"] == "HP") ? "checked" : ""; ?>><span class="round button">HP惠普</span></label>
   </div>
   <div class="option">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <label><input type="radio" name="brand" value="HUAWEI" <?php echo ($_SESSION["brand"] == "HUAWEI") ? "checked" : ""; ?>><span class="round button">HUAWEI華為</span></label>
      <label><input type="radio" name="brand" value="Lenovo" <?php echo ($_SESSION["brand"] == "Lenovo") ? "checked" : ""; ?>><span class="round button">Lenovo聯想</span></label>
      <label><input type="radio" name="brand" value="LG" <?php echo ($_SESSION["brand"] == "LG") ? "checked" : ""; ?>><span class="round button">LG</span></label>
      <label><input type="radio" name="brand" value="Microsoft" <?php echo ($_SESSION["brand"] == "Microsoft") ? "checked" : ""; ?>><span class="round button">Microsoft微軟</span></label>
      <label><input type="radio" name="brand" value="MSI" <?php echo ($_SESSION["brand"] == "MSI") ? "checked" : ""; ?>><span class="round button">MSI微星</span></label>
      <label><input type="radio" name="brand" value="Razer" <?php echo ($_SESSION["brand"] == "Razer") ? "checked" : ""; ?>><span class="round button">Razer雷蛇</span></label>
      <label><input type="radio" name="brand" value="VAIO" <?php echo ($_SESSION["brand"] == "VAIO") ? "checked" : ""; ?>><span class="round button">VAIO</span></label>
      <label><input type="radio" name="brand" value="XPG" <?php echo ($_SESSION["brand"] == "XPG") ? "checked" : ""; ?>><span class="round button">XPG</span></label>
   </div>

   <div class="option">
      以CPU搜尋：
      <label><input type="radio" name="cpu" value="i3" <?php echo ($_SESSION["cpu"] == "i3") ? "checked" : ""; ?>><span class="round button">i3</span></label>
      <label><input type="radio" name="cpu" value="i5" <?php echo ($_SESSION["cpu"] == "i5") ? "checked" : ""; ?>><span class="round button">i5</span></label>
      <label><input type="radio" name="cpu" value="i7" <?php echo ($_SESSION["cpu"] == "i7") ? "checked" : ""; ?>><span class="round button">i7</span></label>
      <label><input type="radio" name="cpu" value="i9" <?php echo ($_SESSION["cpu"] == "i9") ? "checked" : ""; ?>><span class="round button">i9</span></label>
      <label><input type="radio" name="cpu" value="Ryzen 3" <?php echo ($_SESSION["cpu"] == "Ryzen 3") ? "checked" : ""; ?>><span class="round button">R3</span></label>
      <label><input type="radio" name="cpu" value="Ryzen 5" <?php echo ($_SESSION["cpu"] == "Ryzen 5") ? "checked" : ""; ?>><span class="round button">R5</span></label>
      <label><input type="radio" name="cpu" value="Ryzen 7" <?php echo ($_SESSION["cpu"] == "Ryzen 7") ? "checked" : ""; ?>><span class="round button">R7</span></label>
      <label><input type="radio" name="cpu" value="Ryzen 9" <?php echo ($_SESSION["cpu"] == "Ryzen 9") ? "checked" : ""; ?>><span class="round button">R9</span></label>
   </div>
   <div class="option">
      以GPU搜尋：
      <label><input type="radio" name="gpu" value="330" <?php echo ($_SESSION["gpu"] == "330") ? "checked" : ""; ?>><span class="round button">MX 330</span></label>
      <label><input type="radio" name="gpu" value="350" <?php echo ($_SESSION["gpu"] == "350") ? "checked" : ""; ?>><span class="round button">MX 350</span></label>
      <label><input type="radio" name="gpu" value="450" <?php echo ($_SESSION["gpu"] == "450") ? "checked" : ""; ?>><span class="round button">MX 450</span></label>
      <label><input type="radio" name="gpu" value="1650" <?php echo ($_SESSION["gpu"] == "1650") ? "checked" : ""; ?>><span class="round button">GTX 1650</span></label>
      <label><input type="radio" name="gpu" value="1660Ti" <?php echo ($_SESSION["gpu"] == "1660Ti") ? "checked" : ""; ?>><span class="round button">GTX 1660Ti</span></label>
   </div>
   <div class="option">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <label><input type="radio" name="gpu" value="3050" <?php echo ($_SESSION["gpu"] == "3050") ? "checked" : ""; ?>><span class="round button">RTX 3050</span></label>
      <label><input type="radio" name="gpu" value="3060" <?php echo ($_SESSION["gpu"] == "3060") ? "checked" : ""; ?>><span class="round button">RTX 3060</span></label>
      <label><input type="radio" name="gpu" value="3070" <?php echo ($_SESSION["gpu"] == "3070") ? "checked" : ""; ?>><span class="round button">RTX 3070</span></label>
      <label><input type="radio" name="gpu" value="3080" <?php echo ($_SESSION["gpu"] == "3080") ? "checked" : ""; ?>><span class="round button">RTX 3080</span></label>
   </div>
   <div class="option">
      以記憶體大小搜尋：
      <label><input type="radio" name="ram" value="8G" <?php echo ($_SESSION["ram"] == "8G") ? "checked" : ""; ?>><span class="round button">8G</span></label>
      <label><input type="radio" name="ram" value="16G" <?php echo ($_SESSION["ram"] == "16G") ? "checked" : ""; ?>><span class="round button">16G</span></label>
      <label><input type="radio" name="ram" value="32G" <?php echo ($_SESSION["ram"] == "32G") ? "checked" : ""; ?>><span class="round button">32G</span></label>
   </div>
   <div class="option">
      以SSD大小搜尋：
      <label><input type="radio" name="SSD" value="256G" <?php echo ($_SESSION["SSD"] == "256G") ? "checked" : ""; ?>><span class="round button">256GB</span></label>
      <label><input type="radio" name="SSD" value="512G" <?php echo ($_SESSION["SSD"] == "512G") ? "checked" : ""; ?>><span class="round button">512GB</span></label>
      <label><input type="radio" name="SSD" value="1T" <?php echo ($_SESSION["SSD"] == "1T") ? "checked" : ""; ?>><span class="round button">1TB</span></label>
      <label><input type="radio" name="SSD" value="2T" <?php echo ($_SESSION["SSD"] == "2T") ? "checked" : ""; ?>><span class="round button">2TB</span></label><br>
   </div>
   <div class="option">
      以HDD大小搜尋：
      <label><input type="radio" name="HDD" value="512G" <?php echo ($_SESSION["HDD"] == "512G") ? "checked" : ""; ?>><span class="round button">512GB</span></label>
      <label><input type="radio" name="HDD" value="1T" <?php echo ($_SESSION["HDD"] == "1T") ? "checked" : ""; ?>><span class="round button">1TB</span></label><br>
   </div>
   <div class="option">
      以螢幕尺寸搜尋：
      <label><input type="radio" name="inch" value="13" <?php echo ($_SESSION["inch"] == "13") ? "checked" : ""; ?>><span class="round button">13吋 ▼</span></label>
      <label><input type="radio" name="inch" value="14" <?php echo ($_SESSION["inch"] == "14") ? "checked" : ""; ?>><span class="round button">14吋</span></label>
      <label><input type="radio" name="inch" value="15" <?php echo ($_SESSION["inch"] == "15") ? "checked" : ""; ?>><span class="round button">15吋</span></label>
      <label><input type="radio" name="inch" value="16" <?php echo ($_SESSION["inch"] == "16") ? "checked" : ""; ?>><span class="round button">16吋</span></label>
      <label><input type="radio" name="inch" value="17" <?php echo ($_SESSION["inch"] == "17") ? "checked" : ""; ?>><span class="round button">17吋</span></label><br>
   </div>
   <div class="option">
      以重量搜尋：
      <label><input type="radio" name="weight" value="1" <?php echo ($_SESSION["weight"] == "1") ? "checked" : ""; ?>><span class="round button">1kg ▼</span></label>
      <label><input type="radio" name="weight" value="1.5" <?php echo ($_SESSION["weight"] == "1.5") ? "checked" : ""; ?>><span class="round button">1.5kg ▼</span></label>
      <label><input type="radio" name="weight" value="2" <?php echo ($_SESSION["weight"] == "2") ? "checked" : ""; ?>><span class="round button">2kg ▼</span></label>
      <label><input type="radio" name="weight" value="2.5" <?php echo ($_SESSION["weight"] == "2.5") ? "checked" : ""; ?>><span class="round button">2.5kg ▼</span></label>
      <label><input type="radio" name="weight" value="3" <?php echo ($_SESSION["weight"] == "3") ? "checked" : ""; ?>><span class="round button">3kg ▼</span></label>
      <br>
   </div>
   <div class="price-input option">
      <div class="leftField">
         <span style="width: 4vw;">最低價格</span>
         <input type="number" class="input-min" value="0" name='minPrice'>
      </div>
      <div class="separator">-</div>
      <div class="rightField">
         <span style="width: 4vw;">最高價格</span>
         <input type="number" class="input-max" value="0" name='maxPrice'>
      </div>
   </div>
   <div class="slider">
      <div class="progress"></div>
   </div>
   <div class="range-input" style="margin-bottom: 20px;">
      <input type="range" class="range-min" min="0" max="150000" value="0" step="1000">
      <input type="range" class="range-max" min="0" max="150000" value="0" step="1000">
   </div>
   <div class="option">
      排序方式：
      <label><input type="radio" name="orderByPrice" value="DESC" <?php echo ($_SESSION["orderByPrice"] == "DESC") ? "checked" : ""; ?>><span class="round button">價格由高到低</span></label>
      <label><input type="radio" name="orderByPrice" value="ASC" <?php echo ($_SESSION["orderByPrice"] == "ASC") ? "checked" : ""; ?>><span class="round button">價格由低到高</span></label>
      <label><input type="radio" name="orderByWeight" value="DESC" <?php echo ($_SESSION["orderByWeight"] == "DESC") ? "checked" : ""; ?>><span class="round button">重量由高到低</span></label>
      <label><input type="radio" name="orderByWeight" value="ASC" <?php echo ($_SESSION["orderByWeight"] == "ASC") ? "checked" : ""; ?>><span class="round button">重量由低到高</span></label>
   </div>
</div>
<input type="submit" name="btn_submit" value="搜尋" class="search_button" style="border-radius:10vw;">
<hr>
<div class="container-fluid">
</div>
</form>
<div>
   <?php
   if (!empty($platform) or !empty($brand) or !empty($cpu) or !empty($gpu) or !empty($ram) or !empty($SSD) or !empty($HDD) or !empty($inch) or !empty($weight)) {
      echo '<div style="display: flex; align-items: center; ">
               <br>
            <div id="radio_result" style="font-size:1.5vw;">
      ';
   }
   if (!empty($platform)) {
      echo '<label><input type="radio"  value="' . $platform . '"><span class=" round button" style="border:none;border-radius:10px;cursor: auto;"> ' . $platform . '</span></label>';
   }
   if (!empty($brand)) {
      echo '<label><input type="radio"  value="' . $brand . '"><span class=" round button" style="border:none;border-radius:10px;cursor: auto;">' . $brand . '</span></label>';
   }
   if (!empty($cpu)) {
      echo '<label><input type="radio"  value="' . $cpu . '"><span class=" round button" style="border:none;border-radius:10pxcursor: auto;;">' . $cpu . '</span></label>';
   }
   if (!empty($gpu)) {
      echo '<label><input type="radio"  value="' . $gpu . '"><span class=" round button" style="border:none;border-radius:10px;cursor: auto;">' . $gpu . '</span></label>';
   }
   if (!empty($ram)) {
      echo '<label><input type="radio"  value="' . $ram . '"><span class=" round button" style="border:none;border-radius:10px;cursor: auto;">' . $ram . '</span></label>';
   }
   if (!empty($SSD)) {
      echo '<label><input type="radio" value="' . $SSD . '"><span class=" round button" style="border:none;border-radius:10px;cursor: auto;">' . $SSD . '</span></label>';
   }
   if (!empty($HDD)) {
      echo '<label><input type="radio" value="' . $HDD . '"><span class=" round button" style="border:none;border-radius:10px;cursor: auto;">' . $HDD . '</span></label>';
   }
   if (!empty($inch)) {
      echo '<label><input type="radio" value="' . $inch . '"><span class=" round button" style="border:none;border-radius:10px;cursor: auto;">' . $inch . '吋</span></label>';
   }
   if (!empty($weight)) {
      echo '<label><input type="radio" value="' . $weight . '"><span class=" round button" style="border:none;border-radius:10px;cursor: auto;">' . $weight . 'kg以下</span></label>';
   }
   if (!empty($platform) or !empty($brand) or !empty($cpu) or !empty($gpu) or !empty($ram) or !empty($SSD) or !empty($HDD) or !empty($inch) or !empty($weight)) {
      echo '</div>
      ';
   }

   ?>

   <?php
   $link = @mysqli_connect('localhost', 'root', '', 'laptop');
   if ($_GET) {
      // if (isset($_GET['compare1_nb_id'])) {
      //    $compare1_nb_id = $_GET['compare1_nb_id'];
      // } else {
      //    $compare1_nb_id = '';
      // }

      // if (isset($_GET['compare2_nb_id'])) {
      //    $compare2_nb_id = $_GET['compare2_nb_id'];
      // } else {
      //    $compare2_nb_id = '';
      // }

      if (empty($platform) and empty($brand) and empty($nb_id) and empty($cpu) and empty($gpu) and empty($ram) and empty($SSD) and empty($HDD) and empty($weight) and empty($inch) and $maxPrice == '0' and empty($orderByPrice) and empty($orderByWeight)) {
         $sql = "SELECT distinct nb_id,img_url,brand,cpu,gpu,ram,SSD,HDD,weight,inch,price,platform,url FROM specifics ORDER by price DESC;";
         show_data($sql, $acc);
      } else {
         $sql = "SELECT distinct nb_id,img_url,brand,cpu,gpu,ram,SSD,HDD,weight,inch,price,platform,url FROM specifics where " . ((empty($nb_id)) ? "" : " nb_id like'%$nb_id%' ");
         $sql .= (substr($sql, -6) == "where " or empty($platform)) ? "" : " and ";
         $sql .= (empty($platform)) ? '' : " platform like '%$platform%' ";
         $sql .= (substr($sql, -6) == "where " or empty($brand)) ? "" : " and ";
         $sql .= (empty($brand)) ? '' : " brand like '%$brand%' ";
         $sql .= (substr($sql, -6) == "where " or empty($cpu)) ? "" : " and ";
         $sql .= (empty($cpu)) ? '' : " cpu like '%$cpu%' ";
         $sql .= (substr($sql, -6) == "where " or empty($gpu)) ? "" : " and ";
         $sql .= (empty($gpu)) ? '' : " gpu like '%$gpu%' ";
         $sql .= (substr($sql, -6) == "where " or empty($ram)) ? "" : " and ";
         $sql .= (empty($ram)) ? '' : " ram like '%$ram%' ";
         $sql .= (substr($sql, -6) == "where " or empty($SSD)) ? "" : " and ";
         $sql .= (empty($SSD)) ? '' : " SSD like '%$SSD%' ";
         $sql .= (substr($sql, -6) == "where " or empty($HDD)) ? "" : " and ";
         $sql .= (empty($HDD)) ? '' : " HDD like '%$HDD%' ";
         $sql .= (substr($sql, -6) == "where " or empty($weight)) ? "" : " and ";
         $sql .= (empty($weight)) ? '' : " weight < $weight and weight <> '-'";
         if ($inch == 13) {
            $sql .= (substr($sql, -6) == "where " or empty($inch)) ? "" : " and ";
            $sql .= (empty($inch)) ? '' : " inch <= '$inch";
         } else {
            $sql .= (substr($sql, -6) == "where " or empty($inch)) ? "" : " and ";
            $sql .= (empty($inch)) ? '' : " inch like '%$inch%' ";
         }
         $sql .= (substr($sql, -6) == "where " or  $maxPrice == '0') ? "" : " and ";
         $sql .= $maxPrice == '0' ? '' : " price between $minPrice and $maxPrice ";
         if (!empty($orderByPrice) xor !empty($orderByWeight)) {
            if (substr($sql, -6) == "where ") {
               $sql = str_replace('where ', '', $sql);
            }
            if (!empty($orderByPrice)) {
               $sql .= "order by price $orderByPrice";
            } elseif (!empty($orderByWeight)) {
               $sql .= "order by weight $orderByWeight";
            }
         } else if (!empty($orderByPrice) and !empty($orderByWeight)) {
            if (substr($sql, -6) == "where ") {
               $sql = str_replace('where ', '', $sql);
            }
            $sql .= "order by price $orderByPrice ,weight $orderByWeight";
         }
         show_data($sql, $acc);
      }
   } else {
      $sql = "SELECT distinct nb_id,img_url,brand,cpu,gpu,ram,SSD,HDD,weight,inch,price,platform,url FROM specifics ORDER by price DESC;";
      show_data($sql, $acc);
   }
   ?>
</div>

</div>
</div>
</div>
</div>

<div class="two_column">
   <div class="card mb-2" style="max-width: 540px;">
      <?php
      show_compare_data($_SESSION["compare1_nb_id"], $_SESSION["compare1_platform"]);
      show_compare_data($_SESSION["compare2_nb_id"], $_SESSION["compare2_platform"]);
      ?>
   </div>
   <a href=http://localhost:8080/mid-web/compare.php>
      <button type="button" class="button btn btn-secondary btn-lg btn-block" style="position:absolute;bottom:10%;right:5%;width:90%;font-size:1em;">比較</button>
   </a>
</div>
<div class="title container-fluid">
   <?php
   require("header.php")
   ?>
</div>

</html>

<?php
function show_data($sql, $acc)
{
   $link = @mysqli_connect('localhost', 'root', '', 'laptop');
   $link->query("SET NAMES utf8");
   $link->set_charset("utf8mb4");
   $count = 0;
   $result = mysqli_query($link, $sql);
   $count = $result->num_rows;
   $total_fields = mysqli_num_fields($result);
   echo "</div>查詢結果 共{$count}筆資料";
   echo "<div class='row row-cols-1 row-cols-md-4 pt-2 container-fluid'>";
   while ($rows = mysqli_fetch_array($result, MYSQLI_NUM)) {
      for ($i = 0; $i <= $total_fields - 1; $i += 13) {
         echo "
         <div class='col-4 mb-4' id='$rows[$i]'>
            <div class='card overflow-hidden text-break'>
            <img src='" . $rows[$i + 1] . "' class='card-img-top' alt='computer'>
               <div class='card-body'>
                     <p class='card-title' style='font-size:1.5vw;margin-bottom:1.5vw; width: 250px; height: 129px;'>[" . $rows[$i + 2] . "]" . ((mb_strlen($rows[$i], 'utf8') > 20) ? mb_substr($rows[$i], 0, 20, 'utf8') : $rows[$i]) . ' ' . ((mb_strlen($rows[$i], 'utf8') > 20) ? " ..." : "") . "</p>";
         // <p class='card-title' style='color:#E85D75;font-size: 2em;line-height: 50%;'>$" . $rows[$i + 10] . "</p>
         if ($rows[$i + 11] == "yahoo") {
            echo "
            <a href={$rows[$i + 12]} target='_blank'>
               <button  class='btn btn-secondary btn-lg p-0'// dropdown-toggle
                  style='width: 100%;background-color:#ffffff;color:darkgray;font-size: 2.5vw;line-height:2vw; height: 70px !important;'
                  type='button' aria-haspopup='true' aria-expanded='false'>
                     <img src='img/Yahoo-Logo.png' class='img-fluid' style='position: relative; max-width:20%; height:auto;'>";
            echo "<font color='#E85D75' class='col-9'style='font-weight: bolder;font-size:1.5vw;margin-left:0.2vw;'>"; //style='right:1vw;'
            echo "$" . $rows[$i + 10];
            echo "</font>";
            echo '   </button>
            </a>';
         } elseif ($rows[$i + 11] == "sinya") {
            echo "
            <a href={$rows[$i + 12]} target='_blank'>
               <button class='btn btn-secondary btn-lg p-0'// dropdown-toggle
                  style='width: 100%;background-color:#ffffff;color:darkgray; height:70px;padding-top: 10px !important;'
                  type='button' aria-haspopup='true' aria-expanded='false'>
                     <img src='img/sinya-square.png' class='img-fluid mb-2' style='position: relative; max-width:20%; height:auto;'>";
            echo "<font color='#E85D75' class='col-9'style='font-weight: bolder;font-size:1.5vw;margin-left:0.9vw;'>"; //style='right:1vw;'
            echo "$" . $rows[$i + 10];
            echo "</font>";
            echo '   </button>
            </a>';
         } elseif ($rows[$i + 11] == "pchome") {
            echo "
            <a href={$rows[$i + 12]} target='_blank'>
               <button class='btn btn-secondary btn-lg p-0'// dropdown-toggle
                  style='width: 100%;background-color:#ffffff;color:darkgray; height:70px;padding-top: 10px !important;'
                  type='button' aria-haspopup='true' aria-expanded='false'>
                     <img src='https://fs-a.ecimg.tw/img/sites/fastag/assets/img/logo_app_2.svg?20210830153436' class='img-fluid mb-2' style='position: relative; max-width:20%; height:auto;'>";
            echo "<font color='#E85D75' class='col-9'style='font-weight: bolder;font-size:1.5vw;margin-left:0.9vw;'>"; //style='right:1vw;'
            echo "$" . $rows[$i + 10];
            echo "</font>";
            echo '   </button>
            </a>';
         } elseif ($rows[$i + 11] == "sinya_stu") {
            echo "
            <a href={$rows[$i + 12]} target='_blank'>
               <button class='btn btn-secondary btn-lg p-0'// dropdown-toggle
                  style='width: 100%;background-color:#ffffff;color:darkgray; height:70px;padding-top: 10px !important;'
                  type='button' aria-haspopup='true' aria-expanded='false'>
                     <img src='img/sinya-stu-square.png' class='img-fluid mb-2' style='position: relative; max-width:20%; height:auto;'>";
            echo "<font color='#E85D75' class='col-9'style='font-weight: bolder;font-size:1.5vw;margin-left:0.9vw;'>"; //style='right:1vw;'
            echo "$" . $rows[$i + 10];
            echo "</font>";
            echo '   </button>
            </a>';
         }

         echo "   <div style='margin-bottom: 20px;'>
                     <p class='card-text contentScrollBar' style='font-size:1.2vw;line-height:1.5vw;margin-top:1.5vw; width:248px !important; height:201px !important; overflow: auto;'>CPU   ：" . $rows[$i + 3] . "<br>
                     GPU   ：" . $rows[$i + 4] . "<br>
                     RAM：" . $rows[$i + 5] . "<br>
                     SSD   ：" . $rows[$i + 6] . "<br>
                     HDD：" . $rows[$i + 7] . "<br>
                     重量   ：" . $rows[$i + 8] . "kg<br>
                     螢幕   ：" . $rows[$i + 9] . "</p>
                  </div>
                     <div class='heart-box'>
                     ";
         if (!empty($acc)) {
            echo "
            <a href='http://localhost:8080/mid-web/favorite.php?nb_id=$rows[$i]&platform={$rows[$i + 11]}'>
            <!-- 设置一个复选框，默认状态被复选 -->
            <input type='checkbox' checked class='heart-input'>
            ";
            $checkSql = "SELECT * FROM `favorite` WHERE m_Id='$acc' and nb_id='$rows[$i]' and platform='{$rows[$i + 11]}';";
            $checkResult = mysqli_query($link, $checkSql);
            if ($checkRows = mysqli_fetch_array($checkResult, MYSQLI_NUM)) {
               //full heart
               echo "<i class='bi bi-star-fill' style='color:#F8C83D ;margin-right:1vw;'></i>";
            } else {
               //empty heart
               echo "<i class='bi bi-star' style='color:#F8C83D ;margin-right:1vw;'></i></a>";
            }
         }
         if ($_SESSION["compare1_nb_id"] != '') {
            echo '<td><a style="text-align:right;font-size:1vw;" href="user_page.php?' . 'nb_id=' . $_SESSION['nb_id'] . '&platform=' . $_SESSION['platform'] . '&brand=' . $_SESSION['brand'] . '&cpu=' . $_SESSION['cpu'] . '&gpu=' . $_SESSION['gpu'] . '&ram=' . $_SESSION['ram'] . '&SSD=' . $_SESSION['SSD'] . '&HDD=' . $_SESSION['HDD'] . '&weight=' . $_SESSION['weight'] . '&inch=' . $_SESSION['inch'] .  '&minPrice=' . $_SESSION['minPrice'] . '&maxPrice=' . $_SESSION['maxPrice'] . '&orderByPrice=' . $_SESSION['orderByPrice'] . '&orderByWeight=' . $_SESSION['orderByWeight'] . '&compare1_nb_id=' . $_SESSION['compare1_nb_id'] . '&compare1_platform=' . $_SESSION['compare1_platform'] . '&compare2_nb_id=' . $rows[0] . '&compare2_platform=' . $rows[11] . '&#' . $rows[0] . '">    加入比較</a></td>';
         } else {
            echo '<td><a style="text-align:right;font-size:1vw;" href="user_page.php?' . 'nb_id=' . $_SESSION['nb_id'] . '&platform=' . $_SESSION['platform'] . '&brand=' . $_SESSION['brand'] . '&cpu=' . $_SESSION['cpu'] . '&gpu=' . $_SESSION['gpu'] . '&ram=' . $_SESSION['ram'] . '&SSD=' . $_SESSION['SSD'] . '&HDD=' . $_SESSION['HDD'] . '&weight=' . $_SESSION['weight'] . '&inch=' . $_SESSION['inch'] . '&minPrice=' . $_SESSION['minPrice'] . '&maxPrice=' . $_SESSION['maxPrice'] . '&orderByPrice=' . $_SESSION['orderByPrice'] . '&orderByWeight=' . $_SESSION['orderByWeight'] . '&compare1_nb_id=' . $rows[0] . '&compare1_platform=' . $rows[11] . '&#' . $rows[0] . '">加入比較</a></td>';
         }

         echo "
                     </div>
                  </div>
               </div>
            </div>";
      }
   }
}
function show_compare_data($compare_nb_id, $compare_platform)
{
   $link = @mysqli_connect('localhost', 'root', '', 'laptop');
   $link->query("SET NAMES utf8");
   $link->set_charset("utf8mb4");
   $sql = "SELECT img_url,nb_id,brand,cpu,gpu,ram,SSD,HDD,weight,inch FROM specifics where nb_id='$compare_nb_id' and platform='$compare_platform';";
   $result = mysqli_query($link, $sql);
   if ($compare_nb_id != '') {
      while ($rows = mysqli_fetch_array($result, MYSQLI_NUM)) {
         if ($_SESSION['compare1_nb_id'] == $rows[1]) {
            $urlLink = "http://localhost:8080/mid-web/user_page.php?compare1_nb_id=$_SESSION[compare2_nb_id]&compare1_platform=$_SESSION[compare2_platform]&compare2_nb_id=&compare2_platform=&platform=$_SESSION[platform]&brand=$_SESSION[brand]&cpu=$_SESSION[cpu]&gpu=$_SESSION[gpu]&ram=$_SESSION[ram]&SSD=$_SESSION[SSD]&HDD=$_SESSION[HDD]&weight=$_SESSION[weight]&inch=$_SESSION[inch]&minPrice=$_SESSION[minPrice]&maxPrice=$_SESSION[maxPrice]&orderByPrice=$_SESSION[orderByPrice]&orderByWeight=$_SESSION[orderByWeight]";
         }
         if ($_SESSION['compare2_nb_id'] == $rows[1]) {
            $urlLink = "http://localhost:8080/mid-web/user_page.php?compare1_nb_id=$_SESSION[compare1_nb_id]&compare1_platform=$_SESSION[compare1_platform]&compare2_nb_id=&compare2_platform=&platform=$_SESSION[platform]&brand=$_SESSION[brand]&cpu=$_SESSION[cpu]&gpu=$_SESSION[gpu]&ram=$_SESSION[ram]&SSD=$_SESSION[SSD]&HDD=$_SESSION[HDD]&weight=$_SESSION[weight]&inch=$_SESSION[inch]&minPrice=$_SESSION[minPrice]&maxPrice=$_SESSION[maxPrice]&orderByPrice=$_SESSION[orderByPrice]&orderByWeight=$_SESSION[orderByWeight]";
         }
         echo "<div class='row no-gutters' style='overflow: scroll;height:15vw;'>" .
            "<a href='$urlLink'><i class='bi bi-x-circle-fill shake' style='position: fixed;margin:0.6vw 0vw 0vw 1vw;z-index:1;color:#B54434;'></i></a>" .
            "<div class='col-6' style='position: relative; top: 50%; height: 200px;'>
                     <img src=$rows[0] alt='computer' class='img-fluid' style='position: relative; top: 0%; transform: translateY(-50%);padding-left:10%;'>
                  </div>
                  <div class='col-md-6'>
                     <div class='card-body'>
                        <p class='card-title' style='font-size:1vw;font-weight:bolder;'>$rows[1]</p>
                        <p class='card-text' style='font-size:0.5vw;'>CPU：<br>$rows[3]<br>GPU：$rows[4]<br>RAM：$rows[5]<br>SSD：$rows[6]<br>HDD：$rows[7]<br>weight：$rows[8]<br>inch$rows[9]</p>
                     </div>
                  </div>
               </div>";
      }
   }
}
?>
<script src="resetLabels.js"></script>
<script src="radio_button_clicked.js"></script>
<script src="slideDown.js"></script>
<script src="script.js"></script>
<script src="GoToTop.js"></script>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="jquery.cookie.js"></script>
<script src="jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="jquery.cookie.js"></script>
<script src="jquery-1.6.2.min.js"></script>
<script>
   $(document).ready(function() {
      $(".level1 > a").click(function() {
         $(this).addClass("current") //給當前元素新增"current"樣式
            .next().show() //下一個元素顯示
            .parent().siblings().children("a").removeClass("current")
            //父元素的兄弟元素的子元素<a>移除"current"樣式
            .next().hide(); //它們的下一個元素隱藏
         return false;
      });
   });
</script>