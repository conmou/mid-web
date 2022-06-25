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
    <title>討論區</title>
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

    <style>
        #editBtn {
            float: right;
            margin-right: 10px;
            color: #BFBFBF;
            text-align: right;
            font-size: 14px;
            border: none;
        }

        #editBtn:hover {
            color: #7F7F7F;
        }
    </style>

</head>

<body>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <?php require 'forum_header.php'?>

    <?php
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
    if (isset($_SESSION["title"])) {
        $title = $_SESSION["title"];
        $search_title = $conn->query("SELECT article.*,member.* FROM article,member WHERE member.m_Id=article.m_Id and type_id=2 and title LIKE '%$title%'");
        $row = $search_title->fetch();
        //var_dump($row);
    }
    ?>

    <div class="container-fluid p-0" style="margin-top:4%;" id="small-size">
        <div class="row m-0 p-0" style="height:1000px; margin:0;">
            <div class="col text-dark m-0 p-0" style="background-color: #cccccc;">
                <div class="btn-group-vertical float-right h-200" role="group" style="padding-top: 100%!important;" aria-label="Button group with nested dropdown">
                    <div>
                        <a href="http://localhost:8080/mid-web/forumques.php"><button type="button" id="vertical" class="btn btn-secondary" style="background-color: rgb(227, 227, 227);">選購請益</button></a>
                    </div>
                    <div>
                        <a href="http://localhost:8080/mid-web/forumexper.php"><button type="button" id="vertical" class="btn btn-secondary" style="background-color: #fff;">使用心得</button></a>
                    </div>
                    <?php
                    if (!empty($_SESSION['acc'])) {
                        echo '<div>
                            <a href="http://localhost:8080/mid-web/forumwrite.php"><button type="button" id="vertical" class="btn btn-secondary" style="background-color: rgb(227, 227, 227);">撰寫貼文</button></a>
                            </div>';
                    }
                    ?>
                </div>
            </div>

            <div class="col-11 pt-5 pl-5 pr-5 m-0">
                <div class="col-11 d-flex">
                    <h1 class="m-0 col-8" style="font-size: 50px; color:#44546A; font-weight:bold;">使用心得</h1>
                    <div class="col-5 mt-3">
                        <form action="forum_app/exper_search.php" method="POST" autocomplete="off">
                            <!-- <form action="forumques.php" method="POST" autocomplete="off"> -->
                            <?php if (isset($_GET['seach']) && $_GET['seach'] == 'error') { ?>
                                <input type="text" name="title" class="rounded-pill" id="search" placeholder="填了才能查阿!" />
                                <button type="submit" id="searchbtn"><img src="img/圖片1.png" width="40px" /></button>
                            <?php } else { ?>
                                <input type="text" name="title" class="rounded-pill" id="search" placeholder="阿你要查啥 要先say阿?" />
                                <button type="submit" id="searchbtn"><img src="img/圖片1.png" width="40px" /></button>
                            <?php } ?>
                        </form>
                    </div>
                </div>
                <hr>
                <?php
                    if(isset($_GET['seach']) and $_GET['seach']=='success'){
                        $title=$_SESSION["title"];
                        $carti = $conn->prepare("SELECT * FROM `article` WHERE title like '%$title%' and type_id=2");
                        $carti->execute();
                        $rowcount=$carti->rowCount(); ?>
                        <p>共查詢出<?php echo $rowcount; ?>則文章</p>
                <?php }?>
                <?php  
                    while (!empty($row)) { 
                    if ((!empty($_SESSION['acc']) and $_SESSION['acc']!=$row['m_Id'] and isset($_GET['seach']) and $_GET['seach'] == 'success')) {
                ?>
                        <div class="p-3 rounded" id="showforum" onclick="location.href='forumexper.php?msg=edit&id=<?php echo $row['arti_Id']; ?>';" style="background-color: rgb(239, 239, 239);">
                            <p class="muted"><a class="shake" data-bs-toggle="tooltip" title="檢舉文章" href="article_alert.php?id=<?php echo $todo['arti_Id']; ?>" id="alertBtn"><i class="bi bi-exclamation-octagon-fill" style="font-size: 40px ; color:#b22222;"></i></a></p>
                            <div class="d-flex">
                                <div style="display:block; padding-left:-30px;">
                                    <?php 
                                        $search_img=$row['img_name'];
                                        if (!empty($search_img)) {
                                            echo "<img class='user_info_img_btn' src='uploads/$search_img'>";
                                        } else {
                                            echo '<i class="bi bi-person-circle" style="color:#6c757d;font-size:3vw!important;margin-right:0.3vw!important;"></i>';
                                        }
                                    ?>
                                </div>
                                <h3 class="p-3" style="color: #44546A;font-weight: bold;"><?php echo $row['m_Id']; ?></h3>
                            </div>
                            <div class="p-2" id="content-size">
                                <h3 style="color: #44546A;font-weight: bold;"><?php echo $row['title']; ?></h3>
                                <div id="content-size">
                                    <?php echo ((mb_strlen($row['content'],'utf8')>30) ? mb_substr($row['content'],0,30,'utf8') : $row['content']).' '.((mb_strlen($row['content'],'utf8')>30) ? " ..." : ""); ?>
                                </div>
                                <small class="float-right"><?php echo $row['post_time']; ?></small>
                            </div>
                            <?php
                                $row = $search_title->fetch(PDO::FETCH_ASSOC);
                            ?>
                        </div>
                        <br>
                    <?php
                    
                } elseif ((!empty($_SESSION['acc']) and $_SESSION['acc']==$row['m_Id'] and isset($_GET['seach']) and $_GET['seach'] == 'success')) { 
                    
                ?>
                        <div class="p-3 rounded" id="showforum" onclick="location.href='forumexper.php?msg=edit&id=<?php echo $row['arti_Id']; ?>';" style="background-color: rgb(239, 239, 239);">
                            <a href="forumexper.php?action=edit&id=<?php echo $todo['arti_Id']; ?>" id="editBtn" style="width: 50px; font-size: 0.1px;">●&nbsp&nbsp●&nbsp&nbsp●</a>
                            <div class="d-flex">
                                <div style="display:block; padding-left:-30px;">
                                    <?php 
                                        $search_img=$row['img_name'];
                                        if (!empty($search_img)) {
                                            echo "<img class='user_info_img_btn' src='uploads/$search_img'>";
                                        } else {
                                            echo '<i class="bi bi-person-circle" style="color:#6c757d;font-size:3vw!important;margin-right:0.3vw!important;"></i>';
                                        }
                                    ?>
                                </div>
                                <h3 class="p-3" style="color: #44546A;font-weight: bold;"><?php echo $row['m_Id']; ?></h3>
                            </div>
                            <div class="p-2" id="content-size">
                                <h3 style="color: #44546A;font-weight: bold;"><?php echo $row['title']; ?></h3>
                                <div id="content-size">
                                    <?php echo ((mb_strlen($row['content'],'utf8')>30) ? mb_substr($row['content'],0,30,'utf8') : $row['content']).' '.((mb_strlen($row['content'],'utf8')>30) ? " ..." : ""); ?>
                                </div>
                                <small class="float-right"><?php echo $row['post_time']; ?></small>
                            </div>
                            <?php
                                $row = $search_title->fetch(PDO::FETCH_ASSOC);
                            ?>
                        </div>
                        <br>
                    <?php
                } else { 
                ?>
                        <div class="p-3 rounded" id="showforum" onclick="location.href='forumexper.php?msg=edit&id=<?php echo $row['arti_Id']; ?>';" style="background-color: rgb(239, 239, 239);">
                            <div class="d-flex">
                                <div style="display:block; padding-left:-30px;">
                                    <?php 
                                        $search_img=$row['img_name'];
                                        if (!empty($search_img)) {
                                            echo "<img class='user_info_img_btn' src='uploads/$search_img'>";
                                        } else {
                                            echo '<i class="bi bi-person-circle" style="color:#6c757d;font-size:3vw!important;margin-right:0.3vw!important;"></i>';
                                        }
                                    ?>
                                </div>
                                <h3 class="p-3" style="color: #44546A;font-weight: bold;"><?php echo $row['m_Id']; ?></h3>
                            </div>
                            <div class="p-2" id="content-size">
                                <h3 style="color: #44546A;font-weight: bold;"><?php echo $row['title']; ?></h3>
                                <div id="content-size">
                                    <?php echo ((mb_strlen($row['content'],'utf8')>30) ? mb_substr($row['content'],0,30,'utf8') : $row['content']).' '.((mb_strlen($row['content'],'utf8')>30) ? " ..." : ""); ?>
                                </div>
                                <small class="float-right"><?php echo $row['post_time']; ?></small>
                            </div>
                            <?php
                                $row = $search_title->fetch(PDO::FETCH_ASSOC);
                            ?>
                        </div>
                        <br>
                    <?php
                    }
                } 
                ?>
            </div>
        </div>
    </div>
</body>


</html>