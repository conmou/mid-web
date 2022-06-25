<?php
$msg_id = $_GET["id"];
$action = $_GET["action"];
$link = @mysqli_connect('localhost', 'root', '', 'laptop');
if ($action == "pass") {
    $sql = "update `message_board` set alert=0 WHERE msg_Id='$msg_id';";
    $result = mysqli_query($link, $sql);
    echo "<script>alert('審核通過成功！'); location.href = 'http://localhost:8080/mid-web/manager_page1.php';</script>";
} else if ($action == "cover") {
    $sql = "update `message_board` set state=1 WHERE msg_Id='$msg_id';";
    $result = mysqli_query($link, $sql);
    echo "<script>alert('隱藏成功！'); location.href = 'http://localhost:8080/mid-web/manager_page1.php';</script>";
}
