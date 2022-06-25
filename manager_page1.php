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
    <link rel="stylesheet" href="forum.css">
    <link rel="stylesheet" href="manager_page.css">
    <link rel="stylesheet" href="slider.css">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>管理員頁面</title>
</head>
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

<body>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

    <div class="wrapper" style="height:auto;">
        <div style="width: 880px;">
            <h1 id="titlefont" style="padding-top:4%; padding-left:4%;">留言審核<a data-bs-toggle="tooltip" title="文章審核" href="manager_page.php"><i class="bi bi-toggle-on ml-3" style="font-size: 40px; color:#df8200;"></i></a>
            </h1>
            <hr>
        </div>
        <?php
        //和資料庫溝通
        $sName = "localhost";
        $uName = "root";
        $pass = "";
        $db_name = "laptop";
        try {
            $conn = new PDO("mysql:host=$sName;dbname=$db_name", $uName, $pass);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $conn->query("SET NAMES utf8");
            //echo "成功";
        } catch (PDOException $e) {
            echo "連結失敗 : " . $e->getMessage();
        }
        $msg = $conn->query("SELECT message_board.*,member.* FROM message_board,member WHERE member.m_Id=message_board.m_Id ORDER BY post_time ASC");
        ?>

        <div class="container-fluid p-0" style="margin-top:4%;" id="small-size">
            <div class="row m-0 p-0">
                <div class="col-8 pl-5 pr-5 m-0">
                    <div class="col-11 d-flex">
                        <div class="col-5 mt-3">
                        </div>
                    </div>
                    <?php while ($todo = $msg->fetch(PDO::FETCH_ASSOC)) {
                        if ($todo['alert'] == 1 and $todo['state'] == 0) {
                    ?>
                            <div class="p-3 rounded" id="showforum" onclick="location.href='forumques.php?msg=edit&id=<?php echo $todo['arti_Id']; ?>';" style="background-color: rgb(239, 239, 239);">
                                <div class="d-flex">
                                    <p class="muted "><a class="shake" data-bs-toggle="tooltip" title="通過審核" href="cover_msg.php?id=<?php echo $todo['msg_Id']; ?>&action=pass" id="passBtn"><i class="bi bi-shield-check" style="font-size: 35px ; color:green;"></i></a></p>
                                    <p class="muted "><a class="shake" data-bs-toggle="tooltip" title="隱藏留言" href="cover_msg.php?id=<?php echo $todo['msg_Id']; ?>&action=cover" id="coverBtn"><i class="bi bi-x-circle" style="font-size: 35px ; color:#D7443E;"></i></a></p>
                                    <div style="display:block; padding-left:-30px;">
                                        <?php
                                        $a_img = $todo['img_name'];
                                        if (!empty($a_img)) {
                                            echo "<img class='user_info_img_btn' src='uploads/$a_img'>";
                                        } else {
                                            echo '<i class="bi bi-person-circle" style="color:#6c757d;font-size:3vw!important;margin-right:0.3vw!important;"></i>';
                                        }
                                        ?>
                                    </div>
                                    <h3 class="p-3" style="color: #44546A;font-weight: bold;"><?php echo $todo['m_Id']; ?></h3>

                                </div>
                                <div class="p-2 pt-3" id="">
                                    <div id="content-size">
                                        <?php echo ((mb_strlen($todo['content'], 'utf8') > 35) ? mb_substr($todo['content'], 0, 35, 'utf8') : $todo['content']) . ' ' . ((mb_strlen($todo['content'], 'utf8') > 35) ? " ..." : ""); ?>
                                    </div>
                                    <div>
                                        <small class="float-right"><?php echo $todo['post_time']; ?></small>
                                    </div>
                                </div>
                            </div>
                            <br>
                    <?php
                        }
                    }
                    ?>

                </div>
            </div>
        </div>

    </div>
</body>
<?php
//處理前五名圖表
$link = @mysqli_connect('localhost', 'root', '', 'laptop');
$link->query("SET NAMES utf8");
$link->set_charset("utf8mb4");
$sql = "SELECT * FROM `top5_nb_id`";
$result = mysqli_query($link, $sql);
$total_fields = mysqli_num_fields($result);
while ($rows = mysqli_fetch_array($result, MYSQLI_NUM)) {
    for ($i = 0; $i <= $total_fields - 1; $i += 2) {
        $top5label[] = $rows[$i];
        $top5dataList[] = $rows[$i + 1];
    }
}
$top5labels = '[' . "'$top5label[0]'" . ', ' .  "'$top5label[1]'" . ', ' .  "'$top5label[2]'" . ', ' .  "'$top5label[3]'" . ', ' . "'$top5label[4]'" . ']';
$top5data = '[' . "'$top5dataList[0]'" . ', ' .  "'$top5dataList[1]'" . ', ' .  "'$top5dataList[2]'" . ', ' .  "'$top5dataList[3]'" . ', ' . "'$top5dataList[4]'" . ']';
?>

<?php
//處理點擊率圖表
$link = @mysqli_connect('localhost', 'root', '', 'laptop');
$link->query("SET NAMES utf8");
$link->set_charset("utf8mb4");
$sql = "SELECT * FROM `performance` ORDER by date DESC LIMIT 7;";
$result = mysqli_query($link, $sql);
$total_fields = mysqli_num_fields($result);
while ($rows = mysqli_fetch_array($result, MYSQLI_NUM)) {
    for ($i = 0; $i <= $total_fields - 1; $i += 2) {
        $reachLabel[] = $rows[$i];
        $reachDataList[] = $rows[$i + 1];
    }
}
$reachLabels = '[' . "'$reachLabel[6]'" . ', ' .  "'$reachLabel[5]'" . ', ' .  "'$reachLabel[4]'" . ', ' .  "'$reachLabel[3]'" . ', ' .  "'$reachLabel[2]'" . ', ' . "'$reachLabel[1]'" . ', ' . "'$reachLabel[0]'" . ']';
$reachData = '[' . $reachDataList[6] . ', ' .  $reachDataList[5] . ', ' . $reachDataList[4] . ', ' .  $reachDataList[3] . ', ' .  $reachDataList[2] . ', ' .  $reachDataList[1] . ', ' .  $reachDataList[0] . ']';
?>

<div class="arti_edit_wrapper">
    <div class="canvas">
        <canvas id="myChart1"></canvas>
    </div>
    <hr>
    <div class="canvas">
        <canvas id="myChart3"></canvas>
    </div>
    <!-- <div class="canvas">
        <canvas id="myChart2"></canvas>
    </div> -->
</div>
<div class="title container-fluid">
    <?php
    require("header.php")
    ?>
</div>

</html>

<script>
    //最多人收藏 Bar Chart
    var chartData = {
        type: 'horizontalBar',
        data: {
            labels: <?php echo $top5labels ?>,
            datasets: [{
                label: '最多人收藏筆電',
                data: <?php echo $top5data ?>,
                backgroundColor: [
                    '#B4C6D2',
                    '#84898C',
                    '#A58D80',
                    '#F4B894',
                    '#F2D6AE',
                ],
            }]
        },
        options: {
            scales: {
                xAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    }

    var ctx = document.getElementById("myChart1").getContext('2d');
    var myChart = new Chart(ctx, chartData);
</script>

<script>
    //網站點擊率 Line Chart
    var chartData = {
        type: 'line',
        data: {
            labels: <?php echo $reachLabels ?>,
            datasets: [{
                label: '網站點擊率狀況',
                data: <?php echo $reachData ?>,
                backgroundColor: [
                    '#b8cc1c5f'
                ],
                borderColor: [
                    '#b8cc1c9f'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    }

    var ctx = document.getElementById("myChart3").getContext('2d');
    var myChart = new Chart(ctx, chartData);
</script>