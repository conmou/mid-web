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

    <?php require 'forum_header.php' ?>

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
    $todos = $conn->query("SELECT article.*,member.* FROM article,member WHERE member.m_Id=article.m_Id ORDER BY post_time DESC");
    //$msg = $conn->query("SELECT * FROM message_board WHERE arti_id= ORDER BY post_time ASC");
    $state = $conn->query("SELECT * FROM article");
    $sta=$state->fetch();
    
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
                    if(!isset($_GET['msg']) and !isset($_GET['action'])){
                        $carti = $conn->prepare("SELECT * FROM `article` WHERE type_id=2");
                        $carti->execute();
                        $rowcount=$carti->rowCount(); ?>
                        <p>共<?php echo $rowcount; ?>則文章</p>
                <?php }
                if (isset($_GET['msg'])) {
                    require 'forum_app/exper_msg.php';
                    if (!empty($_SESSION['acc']) and $todo['m_Id']!=$_SESSION['acc']){
                ?>
                    <div class="p-3 rounded" style="background-color: rgb(239, 239, 239);border-radius: 15px !important;box-shadow: 0 2px 2px 1px #ccc, 0 2px 2px 1px #ccc;">
                        <p class="muted "><a class="shake" data-bs-toggle="tooltip" title="檢舉文章" href="article_alert.php?id=<?php echo $todo['arti_Id']; ?>" id="alertBtn"><i class="bi bi-exclamation-octagon-fill" style="font-size: 40px ; color:#b22222;"></i></a></p>
                        <div class="d-flex">
                            <div style="display:block; padding-left:-30px;">
                                <?php
                                if (!empty($m_img)) {
                                    echo "<img class='user_info_img_btn' src='uploads/$m_img'>";
                                } else {
                                    echo '<i class="bi bi-person-circle" style="color:#6c757d;font-size:3vw!important;margin-right:0.3vw!important;"></i>';
                                }
                                ?>
                            </div>
                            <h3 class="p-3" style="color: #44546A;font-weight: bold;"><?php echo $todo['m_Id']; ?></h3>
                        </div>
                        <div class="p-2" id="content-size">
                            <h3 style="color: #44546A;font-weight: bold;"><?php echo $todo['title']; ?></h3>
                            <div id="content-size">
                                <?php echo $todo['content']; ?>
                            </div>
                            <small class="float-right"><?php echo $todo['post_time']; ?></small>
                        </div>
                    </div>
                    <br>
                    <?php }elseif(!empty($_SESSION['acc']) and $todo['m_Id']==$_SESSION['acc']){ ?>
                        <div class="p-3 rounded" style="background-color: rgb(239, 239, 239);border-radius: 15px !important;box-shadow: 0 2px 2px 1px #ccc, 0 2px 2px 1px #ccc;">
                            <a href="forumexper.php?action=edit&id=<?php echo $todo['arti_Id']; ?>" id="editBtn" style="width: 50px; font-size: 0.1px;">●&nbsp&nbsp●&nbsp&nbsp●</a>
                            <div class="d-flex">
                                <div style="display:block; padding-left:-30px;">
                                    <?php
                                    if (!empty($m_img)) {
                                        echo "<img class='user_info_img_btn' src='uploads/$m_img'>";
                                    } else {
                                        echo '<i class="bi bi-person-circle" style="color:#6c757d;font-size:3vw!important;margin-right:0.3vw!important;"></i>';
                                    }
                                    ?>
                                </div>
                                <h3 class="p-3" style="color: #44546A;font-weight: bold;"><?php echo $todo['m_Id']; ?></h3>
                            </div>
                            <div class="p-2" id="content-size">
                                <h3 style="color: #44546A;font-weight: bold;"><?php echo $todo['title']; ?></h3>
                                <div id="content-size">
                                    <?php echo $todo['content']; ?>
                                </div>
                                <small class="float-right"><?php echo $todo['post_time']; ?></small>
                            </div>
                        </div>
                        <br>
                    <?php }else{ ?>
                        <div class="p-3 rounded" style="background-color: rgb(239, 239, 239);border-radius: 15px !important;box-shadow: 0 2px 2px 1px #ccc, 0 2px 2px 1px #ccc;">
                            <div class="d-flex">
                                <div style="display:block; padding-left:-30px;">
                                    <?php
                                    if (!empty($m_img)) {
                                        echo "<img class='user_info_img_btn' src='uploads/$m_img'>";
                                    } else {
                                        echo '<i class="bi bi-person-circle" style="color:#6c757d;font-size:3vw!important;margin-right:0.3vw!important;"></i>';
                                    }
                                    ?>
                                </div>
                                <h3 class="p-3" style="color: #44546A;font-weight: bold;"><?php echo $todo['m_Id']; ?></h3>
                            </div>
                            <div class="p-2" id="content-size">
                                <h3 style="color: #44546A;font-weight: bold;"><?php echo $todo['title']; ?></h3>
                                <div id="content-size">
                                    <?php echo $todo['content']; ?>
                                </div>
                                <small class="float-right"><?php echo $todo['post_time']; ?></small>
                            </div>
                        </div>
                        <br>
                    <?php } ?>
                    <?php if (isset($_SESSION['acc'])) { ?>
                        <div class="p-3" id="msg" style="background-color: rgb(255, 255, 255);border-top:2px solid #44546A">

                            <div class="d-flex">
                                <div style="display:block; padding-left:-30px;">
                                    <?php
                                    if (!empty($com_img)) {
                                        echo "<img class='user_info_img_btn' src='uploads/$com_img'>";
                                    } else {
                                        echo '<i class="bi bi-person-circle" style="color:#6c757d;font-size:3vw!important;margin-right:0.3vw!important;"></i>';
                                    }
                                    ?>
                                </div>
                                <h3 class="p-3" style="color: #44546A;font-weight: bold;"><?php echo $_SESSION['acc']; ?></h3>
                                <small class="pt-5">
                                    <?php date_default_timezone_set("Asia/Taipei");
                                    echo date('Y-m-d H：i：s', time());
                                    ?>
                                </small>
                            </div>
                            <form action="forum_app/exper_msg.php?msg=insert&id=<?php echo $id ?>&member=<?php echo $_SESSION['acc']; ?>" method="POST" autocomplete="off">
                                <textarea class="pl-2" id="titletxt" name="msg_content" placeholder="我要留言"></textarea>
                                <button class="float-right" type="submit" id="update">送出</button>
                            </form>
                        </div>
                <?php
                    }
                }
                ?>
                <?php
                    if(isset($_GET['msg']) and isset($_GET['id'])){
                        $id=$_GET['id'];
                        $cmsg = $conn->prepare("SELECT * FROM `message_board` WHERE arti_id=:id");
                        $cmsg->execute(["id" => $id]);
                        $rowcount=$cmsg->rowCount(); ?>
                        <p>共<?php echo $rowcount;?>則留言</p>
                <?php }?>
                <?php
                if (isset($_GET['msg']) and isset($_GET['id'])) {
                    $artid = $_GET['id'];
                    $msg = $conn->query("SELECT message_board.*,member.* FROM message_board,member WHERE member.m_Id=message_board.m_Id and arti_id=$artid ORDER BY post_time ASC"); ?>
                    <div id="msg_bottom">
                    <?php while ($todo = $msg->fetch(PDO::FETCH_ASSOC)) {
                            $showmsg = $todo['img_name'];
                            if(!empty($acc) and $acc!=$todo['m_Id']){
                        ?>
                            <div class="ml-5 mr-5 p-3" id="showmsg">
                                <div class="d-flex">
                                    <div style="display:block; padding-left:-30px;">
                                        <?php
                                        if (!empty($showmsg)) {
                                            echo "<img class='user_info_img_btn' src='uploads/$showmsg'>";
                                        } else {
                                            echo '<i class="bi bi-person-circle" style="color:#6c757d;font-size:3vw!important;margin-right:0.3vw!important;"></i>';
                                        }
                                        ?>
                                    </div>
                                    <h3 style="color: #44546A;font-weight: bold;" class="p-3" style="color: #44546A;"><?php echo $todo['m_id']; ?></h3>
                                    <p class="muted ml-auto"><a class="shake" data-bs-toggle="tooltip" title="檢舉文章" href="msg_alert.php?id=<?php echo $todo['msg_Id']; ?>"><i class="bi bi-exclamation-octagon-fill" style="font-size: 40px ; color:#b22222;"></i></a></p>
                                </div>
                                <div class="p-2" id="content-size">
                                    <div id="content-size">
                                        <?php echo $todo['content']; ?>
                                    </div>
                                    <div class="pb-3">
                                        <small class="float-right"><?php echo $todo['post_time']; ?></small>
                                    </div>
                                </div>
                                <hr>
                            </div>
                        <?php }else{ ?>
                            <div class="ml-5 mr-5 p-3" id="showmsg">
                                <div class="d-flex">
                                    <div style="display:block; padding-left:-30px;">
                                        <?php
                                        if (!empty($showmsg)) {
                                            echo "<img class='user_info_img_btn' src='uploads/$showmsg'>";
                                        } else {
                                            echo '<i class="bi bi-person-circle" style="color:#6c757d;font-size:3vw!important;margin-right:0.3vw!important;"></i>';
                                        }
                                        ?>
                                    </div>
                                    <h3 style="color: #44546A;font-weight: bold;" class="p-3" style="color: #44546A;"><?php echo $todo['m_id']; ?></h3>
                                </div>
                                <div class="p-2" id="content-size">
                                    <div id="content-size">
                                        <?php echo $todo['content']; ?>
                                    </div>
                                    <div class="pb-3">
                                        <small class="float-right"><?php echo $todo['post_time']; ?></small>
                                    </div>
                                </div>
                                <hr>
                            </div>
                    <?php 
                        }
                     } 
                    ?>
                    </div>
                <?php } ?>
                <?php while ($todo = $todos->fetch(PDO::FETCH_ASSOC)) {
                if($todo['state']==0){
                    if ($todo['type_id'] == 2) {
                ?>
                        <?php
                        if (isset($_GET['action'])) {
                            require 'forum_app/exper_edit.php';
                        ?>
                            <div class="p-3 rounded" style="background-color: rgb(239, 239, 239);border-radius: 15px !important;box-shadow: 0 2px 2px 0 #ccc, 0 7px 6px 0 #ccc;">
                                <div class="d-flex">
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
                                <div class="p-2" id="content-size">
                                    <span>
                                        <div class="edit-to-do">
                                            <form action="forum_app/exper_edit.php?action=update&id=<?php echo $id ?>" method="POST" autocomplete="off">
                                                <textarea class="pl-2" id="titletxt" name="title" placeholder="更新餒"><?php echo $title ?></textarea>
                                                <br>
                                                <textarea class="pl-2 mr-5 mt-1 pb-2" id="contenttxt" name="content" placeholder="更新餒"><?php echo $content ?></textarea>
                                                <button type="submit" id="update">Update</button>
                                            </form>
                                        </div>
                                    </span>
                                    <small class="float-right pb-5"><?php echo $todo['post_time']; ?></small>
                                </div>
                            </div>
                            <br>
                        <?php } else if (!empty($_SESSION['acc']) and $_SESSION['acc'] == $todo['m_Id']) { ?>
                            <div class="p-3 rounded" id="showforum" onclick="location.href='forumexper.php?msg=edit&id=<?php echo $todo['arti_Id']; ?>';" style="background-color: rgb(239, 239, 239);">
                                <a href="forumexper.php?action=edit&id=<?php echo $todo['arti_Id']; ?>" id="editBtn" style="width: 50px; font-size: 0.1px;">●&nbsp&nbsp●&nbsp&nbsp●</a>
                                <div class="d-flex">
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
                                <div class="p-2" id="">
                                    <h3 style="color: #44546A;font-weight: bold;"><?php echo $todo['title']; ?></h3>
                                    <div id="content-size">
                                        <?php echo ((mb_strlen($todo['content'], 'utf8') > 35) ? mb_substr($todo['content'], 0, 35, 'utf8') : $todo['content']) . ' ' . ((mb_strlen($todo['content'], 'utf8') > 35) ? " ..." : ""); ?>
                                    </div>
                                    <div>
                                        <small class="float-right"><?php echo $todo['post_time']; ?></small>
                                    </div>
                                </div>
                            </div>
                            <br>
                        <?php } else if (!empty($_SESSION['acc'])) { ?>
                            <div class="p-3 rounded" id="showforum" onclick="location.href='forumexper.php?msg=edit&id=<?php echo $todo['arti_Id']; ?>';" style="background-color: rgb(239, 239, 239);">
                                <div class="d-flex">
                                    <p class="muted "><a class="shake" data-bs-toggle="tooltip" title="檢舉文章" href="article_alert.php?id=<?php echo $todo['arti_Id']; ?>" id="alertBtn"><i class="bi bi-exclamation-octagon-fill" style="font-size: 40px ; color:#b22222;"></i></a></p>

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
                                <div class="p-2">
                                    <h3 style="color: #44546A;font-weight: bold;"><?php echo $todo['title']; ?></h3>
                                    <div id="content-size">
                                        <?php echo ((mb_strlen($todo['content'], 'utf8') > 31) ? mb_substr($todo['content'], 0, 31, 'utf8') : $todo['content']) . ' ' . ((mb_strlen($todo['content'], 'utf8') > 31) ? " ..." : ""); ?>
                                    </div>
                                    <small class="float-right"><?php echo $todo['post_time']; ?></small>
                                </div>
                            </div>
                            <br>
                        <?php } else { ?>
                            <div class="p-3 rounded" id="showforum" onclick="location.href='forumexper.php?msg=edit&id=<?php echo $todo['arti_Id']; ?>';" style="background-color: rgb(239, 239, 239);">
                                <div class="d-flex">
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
                                <div class="p-2" id="content-size">
                                    <h3 style="color: #44546A;font-weight: bold;"><?php echo $todo['title']; ?></h3>
                                    <div id="content-size">
                                        <?php echo ((mb_strlen($todo['content'], 'utf8') > 31) ? mb_substr($todo['content'], 0, 31, 'utf8') : $todo['content']) . ' ' . ((mb_strlen($todo['content'], 'utf8') > 31) ? " ..." : ""); ?>
                                    </div>
                                    <small class="float-right"><?php echo $todo['post_time']; ?></small>
                                </div>
                            </div>
                            <br>
                    <?php
                        }
                    }
                    ?>

                <?php  }
            }
                ?>
            </div>
        </div>
    </div>
</body>


</html>