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
    <!--edit-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
</head>

<body>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://use.fontawesome.com/a31a3f8384.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <?php require 'forum_header.php' ?>
    <div class="container-fluid p-0" style="margin-top:4%;" id="small-size">
        <div class="row m-0 p-0" style="height:1000px; margin:0;">
            <div class="col text-dark m-0 p-0" style="background-color: #cccccc;">
                <div class="btn-group-vertical float-right h-200" role="group" style="padding-top: 100%!important;" aria-label="Button group with nested dropdown">
                    <div>
                        <a href="http://localhost:8080/mid-web/forumques.php"><button type="button" id="vertical" class="btn btn-secondary" style="background-color: rgb(227, 227, 227);">選購請益</button></a>
                    </div>
                    <div>
                        <a href="http://localhost:8080/mid-web/forumexper.php"><button type="button" id="vertical" class="btn btn-secondary" style="background-color: rgb(227, 227, 227);">使用心得</button></a>
                    </div>
                    <?php
                    if (!empty($_SESSION['acc'])) {
                        echo '<div>
                            <a href="http://localhost:8080/mid-web/forumwrite.php"><button type="button" id="vertical" id="demo1" class="btn btn-secondary" style="background-color: #fff;">撰寫貼文</button></a>
                            </div>';
                    }
                    ?>
                </div>
            </div>
            <div class="col-11 pt-5 pl-5 pr-5 m-0">
                <form action="forumwrite.php" method="post">
                    <div class="mb-3">
                        <select name="forum_type" class="select pt-2 pb-2 ml-5" id="typesize">
                            <option class="pt-2 pb-2">— 請選擇文章版版 —</option>
                            <option class="pt-2 pb-2">選購請益</option>
                            <option class="pt-2 pb-2">使用心得</option>
                        </select>
                    </div>
                    <div class="ml-5 mr-5 p-5 rounded" style="background-color: rgb(239, 239, 239);border-radius: 15px !important;box-shadow: 1px 2px 2px 1px #ccc, 0 7px 6px 0 #ccc;">
                        <div class="d-flex">
                            <div style="display:block; padding-left:-30px;">
                                <?php
                                if (!empty($img_name)) {
                                    echo "<img class='user_info_img_btn' src='uploads/$img_name'>";
                                } else {
                                    echo '<i class="bi bi-person-circle" style="color:#6c757d;font-size:3vw!important;margin-right:0.3vw!important;"></i>';
                                }
                                ?>
                            </div>
                            <h3 class="p-3" style="color: #44546A;font-weight: bold;"><?php echo $acc; ?></h3>
                        </div>
                        <?php
                        if (isset($_POST["forum_type"])) {
                            $type = $_POST["forum_type"];
                            switch ($type) {
                                case '選購請益':
                                    $type_id = 1;
                                    break;
                                case '使用心得':
                                    $type_id = 2;
                                    break;
                            }
                        } ?>
                        <?php if (!isset($_POST["post"])) { ?>
                            <div class="input-group mt-2 mb-3">
                                <textarea id="titlesize" name="title" class="form-control rounded" aria-label="With textarea" placeholder="標題"></textarea>
                            </div>
                            <div class="input-group mb-3">
                                <textarea id="contentsize" name="content" class="form-control rounded" aria-label="With textarea" placeholder="內文"></textarea>
                            </div>
                            <input class="float-right" type="submit" id="postbtn" name="post" value="發 佈" />
                            <small>
                                <?php
                                date_default_timezone_set("Asia/Taipei");
                                echo date('Y-m-d H：i：s', time());
                                ?>
                            </small>

                            <?php } elseif (isset($_POST["post"])) {
                            $title = $_POST["title"];
                            $content = $_POST["content"];
                            if ($title != "" and $content != "") {
                                $link = mysqli_connect("localhost", "root", "", "laptop");
                                $link->query("SET NAMES utf8");
                                $link->set_charset("utf8mb4");

                                if ($type == '選購請益' or $type == '使用心得') {
                                    $content = $_POST["content"];
                                    $s = array("\n", "\r\n");
                                    $r = array("<br>", "<br>");
                                    $content = str_replace($s, $r, $content);
                                    $sql = "insert into article(m_Id,title,content,type_id) values ('" . $acc . "','" . $_POST["title"] . "','" . $content . "','" . $type_id . "');";
                                    if (mysqli_query($link, $sql)) {
                                        if($type_id == 1){
                                            echo "<script>alert('發文成功！'); location.href = 'http://localhost:8080/mid-web/forumques.php';</script>";
                                        }elseif($type_id == 2){
                                            echo "<script>alert('發文成功！'); location.href = 'http://localhost:8080/mid-web/forumexper.php';</script>";
                                        }
                                        
                            ?>
                                        <div class="input-group mt-2 mb-3">
                                            <textarea id="titlesize" name="title" class="form-control rounded" aria-label="With textarea" placeholder="標題"></textarea>
                                        </div>
                                        <div class="input-group mb-3">
                                            <textarea id="contentsize" name="content" class="form-control rounded" aria-label="With textarea" placeholder="內文"></textarea>
                                        </div>
                                        <input class="float-right" type="submit" id="postbtn" name="post" value="發佈" />
                                        <small>
                                            <?php
                                            date_default_timezone_set("Asia/Taipei");
                                            echo date('Y-m-d H：i：s', time());
                                            ?>
                                        </small>
                                    <?php }
                                } else {
                                    echo "<script>alert('請選擇板板')</script>";
                                    //echo "<p>請選擇版版才能發文喔</p>";
                                    ?>
                                    <div class="input-group mt-2 mb-3">
                                        <textarea id="titlesize" name="title" class="form-control rounded" aria-label="With textarea" placeholder="標題"><?php echo $title; ?></textarea>
                                    </div>
                                    <div class="input-group mb-3">
                                        <textarea id="contentsize" name="content" class="form-control rounded" aria-label="With textarea" placeholder="內文"><?php echo $content; ?></textarea>
                                    </div>
                                    <input class="float-right" type="submit" id="postbtn" name="post" value="發佈" />
                                    <small>
                                        <?php
                                        date_default_timezone_set("Asia/Taipei");
                                        echo date('Y-m-d H：i：s', time());
                                        ?>
                                    </small>
                                <?php }
                            } else {
                                echo "<script>alert('請輸入標題及內文')</script>"; ?>
                                <div class="input-group mt-2 mb-3">
                                    <textarea id="titlesize" name="title" class="form-control rounded" aria-label="With textarea" placeholder="標題"><?php echo $title; ?></textarea>
                                </div>
                                <div class="input-group mb-3">
                                    <textarea id="contentsize" name="content" class="form-control rounded" aria-label="With textarea" placeholder="內文"><?php echo $content; ?></textarea>
                                </div>
                                <input class="float-right" type="submit" id="postbtn" name="post" value="發佈" />
                                <small>
                                    <?php
                                    date_default_timezone_set("Asia/Taipei");
                                    echo date('Y-m-d H：i：s', time());
                                    ?>
                                </small>
                            <?php }
                            }
                        ?>
                    </div>
                </form>
                <div class="d-flex mt-4 mr-5 justify-content-end">
                    <span class="mr-3" style="color:#E41B17;position: relative;top: 50%;transform: translateY(15%);">※請詳細閱讀版規</span>
                    <button class="rule" id="demo1">版規</button>
                </div>
            </div>
        </div>
        <script>
            document.getElementById("demo1").addEventListener("click",function(){
                swal('請遵守板規', '1.禁止發表與筆電無關之內容。\n\n2.禁止人身攻擊言論。\n\n3.鼓勵使用者之間良性互動，但請避免在公開版面上離題、私聊、發表無意義內容。\n\n4.禁止公佈個人行程之文章。\n\n※若違反以上，將移除您的文章', 'warning');
            });
        </script>
</body>



</html>